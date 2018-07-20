From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jul 2018 13:47:21 +0200
Subject: [Buildroot] [PATCH 1/1] imx-gpu-viv: add a missing backslash
In-Reply-To: <20180720131639.373130b0@windsurf> (Thomas Petazzoni's message of
 "Fri, 20 Jul 2018 13:16:39 +0200")
References: <20180720091629.5723-1-laurent.hartanerot@gmail.com>
 <87effy8cqw.fsf@dell.be.48ers.dk> <20180720131639.373130b0@windsurf>
Message-ID: <87a7qm86ye.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> A semicolon is also missing. I've changed it to do  '|| exit 1; \' like
 >> we do elsewhere to catch failures and committed, thanks.

 > Actually, in this sort of case, I would prefer to use a make for loop:

 > 	$(foreach lib,egl gbm glesv1_cm glesv2 vg, \
 > 		ln -sf $(lib)_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$(lib).pc
 > 	)

 > make automatically aborts the loop if there's an error, and $(lib) is
 > more readable than $${lib}.

Correct. I left it like this as the file has several other shell loops.

-- 
Bye, Peter Korsgaard
