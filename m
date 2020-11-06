From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 6 Nov 2020 10:28:01 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-11-05
In-Reply-To: <20201106141335.192224f8@windsurf.home>
References: <5fa504f3.1c69fb81.d8c61.c370SMTPIN_ADDED_MISSING@mx.google.com>
 <CAOMZO5DtJ-d4fxKE8DZYS_CcByA8my=MpA43+AF8fvxN=dUwcA@mail.gmail.com>
 <20201106141335.192224f8@windsurf.home>
Message-ID: <CAOMZO5A+mMOGLQ94Hk+VxUDHR3RViPsdOik8ovw1uFYeF_neSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Nov 6, 2020 at 10:13 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> You need to download the full build log to get the actual error. To do
> that, once you're at
> https://gitlab.com/buildroot.org/buildroot/-/jobs/831421063, on the
> right side there is a Job artifacts panel. Click "Browse". From there,
> you can download build.log, which is the full build log.

Thanks for the hint. I wasn't aware of the Browse button.

> For the first build, the issue is that host-openssl is missing for the
> kernel build:
>
> scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
>  #include <openssl/bio.h>
>                          ^
> compilation terminated.
> scripts/Makefile.host:103: recipe for target 'scripts/extract-cert' failed
> make[2]: *** [scripts/extract-cert] Error 1
> make[2]: *** Waiting for unfinished jobs....
>
> I haven't checked the second link, but I would suspect it's the same.

Yes, I will send patches to fix these failures.

Thanks,

Fabio Estevam
