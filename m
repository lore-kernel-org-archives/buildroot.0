From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Nov 2020 14:13:35 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-11-05
In-Reply-To: <CAOMZO5DtJ-d4fxKE8DZYS_CcByA8my=MpA43+AF8fvxN=dUwcA@mail.gmail.com>
References: <5fa504f3.1c69fb81.d8c61.c370SMTPIN_ADDED_MISSING@mx.google.com>
 <CAOMZO5DtJ-d4fxKE8DZYS_CcByA8my=MpA43+AF8fvxN=dUwcA@mail.gmail.com>
Message-ID: <20201106141335.192224f8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

On Fri, 6 Nov 2020 09:40:00 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> >                         defconfig |                        link to the job
> > ----------------------------------+--------------------------------------------------------------
> >                    mx6sx_udoo_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421063
> >                           mx6udoo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421064  
> 
> Does anyone have any suggestions about these failures?

You need to download the full build log to get the actual error. To do
that, once you're at
https://gitlab.com/buildroot.org/buildroot/-/jobs/831421063, on the
right side there is a Job artifacts panel. Click "Browse". From there,
you can download build.log, which is the full build log.

For the first build, the issue is that host-openssl is missing for the
kernel build:

scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 #include <openssl/bio.h>
                         ^
compilation terminated.
scripts/Makefile.host:103: recipe for target 'scripts/extract-cert' failed
make[2]: *** [scripts/extract-cert] Error 1
make[2]: *** Waiting for unfinished jobs....

I haven't checked the second link, but I would suspect it's the same.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
