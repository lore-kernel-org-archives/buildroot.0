From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Nov 2019 08:56:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/{python,
 python3}: add mechanism to exclude .py files from removal
In-Reply-To: <87blsvf7bx.fsf@dell.be.48ers.dk>
References: <20191127203404.291090-1-thomas.petazzoni@bootlin.com>
 <20191127203404.291090-2-thomas.petazzoni@bootlin.com>
 <87blsvf7bx.fsf@dell.be.48ers.dk>
Message-ID: <20191129085623.67aee606@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Nov 2019 08:52:02 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > Due to this only being needed by OpenCV for now, I didn't think it was
>  > really needed to have a per-package variable, which then gets
>  > collected by the generic-package infrastructure into a global
>  > variable. We can always revisit if this gets more widely.  
> 
> I agree, but this does cause a check-package warning from opencv3.mk:
> 
> package/opencv3/opencv3.mk:331: possible typo: PYTHON_KEEP_PY_FILES -> *OPENCV3*
> package/opencv3/opencv3.mk:343: possible typo: PYTHON3_KEEP_PY_FILES -> *OPENCV3*

Gaah, check-package doesn't allow us from doing these nice hacks. We
could exclude this variable from the check-package check, but that's
really getting into doing a hack within the hack.

So I guess this really means we have to go with a per-package variable,
and a bit of logic in pkg-generic to collect these per-package
variables into a global one. Agreed?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
