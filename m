From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 08 Apr 2018 04:34:46 -0300
Subject: [Buildroot] [PATCH] download/git: fix trasnform-name
References: <20180407212614.15639-1-yann.morin.1998@free.fr>
Message-ID: <5ac9c6165105e_7b0e2af9278483201172d@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> download/git: fix trasnform-name

trasnform -> transform

On Sat, Apr 07, 2018 at 06:26 PM, Yann E. MORIN wrote:

> When a package contains a relative symlink which first component is '..'
> (thus pointing one directory higher), for example package 'meh' contains
> this symlink:
> 
>     foo/bar -> ../buz
> 
> then it would be stored as 'meh-version./buz' because of the
> transform-name pattern replacement.
> 
> Fix it to only match the leading './'.
> 
> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

With the typo in the subject fixed:
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[tarball generation fixed for 18xx-ti-utils and linux-firmware, see the test
 script at http://patchwork.ozlabs.org/patch/896012/ ]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

2 packages are fixed by this patch:
18xx-ti-utils
before: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769469
after: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769909
linux-firmware
before: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769511
after: https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/61769952

All failures with this patch:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20146714/failures
at91bootstrap3 v3.8.6, gummiboot, kvm-unit-tests, kvmtool, mcelog, trace-cmd,
uemacs, xloader
also occured for 2018.02:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/20146633/failures

Regards,
Ricardo
