From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Nov 2018 08:49:34 +0100
Subject: [Buildroot] [PATCH] qt5: use ccache for building host code
In-Reply-To: <20181104224638.1385e69f@gmx.net>
References: <20181020132535.24508-1-thomas.petazzoni@bootlin.com>
 <20181104221220.5805582b@gmx.net>
 <20181104222501.28e36390@windsurf>
 <20181104224638.1385e69f@gmx.net>
Message-ID: <20181105084934.0044782e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sun, 4 Nov 2018 22:46:38 +0100, Peter Seiderer wrote:

> Thanks for the answer (you got it right)...., so in case I use the
> buildroot-generated qmake I will always use ccache (if configured),
> even if used outside of the buildroot build system, right?

Well, in the context of Buildroot, qmake is essentially used to build
code for the target, using the cross-compiler. In this case, ccache was
already used, because invoking ccache is hidden inside the toolchain
wrapper, so there's no way around it :-)

However, I guess with the right qmake invocations, you can make it
build code for the host as well. And then yes, in this case, I assume
it would now start using ccache.

> The $(HOSTCC) is expanded at the sed command running time,
> g++-base.conf will contain 'QMAKE_COMPILER=gcc' or
> 'QMAKE_COMPILER=ccache gcc'...
> 
> Not sure if this matters for some use cases...

What are you worried about? The fact that there is a space in the
QMAKE_COMPILER variable value ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
