From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed, 5 Apr 2017 21:26:16 +0530
Subject: [Buildroot] [PATCH v3] board: Add support for Engicam i.CoreM6
 Quad/Dual boards
In-Reply-To: <20170404221750.41125e2e@free-electrons.com>
References: <1491329412-5660-1-git-send-email-jagan@openedev.com>
 <20170404221750.41125e2e@free-electrons.com>
Message-ID: <CAD6G_RQ-ouaXSUkK-On+WkbmY2kVBz_EPXDfyZJTk6DGpB-Aew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 5, 2017 at 1:47 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue,  4 Apr 2017 23:40:12 +0530, Jagan Teki wrote:
>> From: Jagan Teki <jagan@amarulasolutions.com>
>>
>> Add initial support for Engicam i.CoreM6 Quad/Dual board
>> with below features:
>> - U-Boot 2017.01
>> - Linux 4.10
>> - Default packages from buildroot
>>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Matteo Lisi <matteo.lisi@engicam.com>
>> Cc: Michael Trimarchi <michael@amarulasolutions.com>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Thanks, looking better.
>
>> diff --git a/board/engicam/common/post-image.sh b/board/engicam/common/post-image.sh
>
> Why do we have this 'common' folder, and this very flexible script? Do
> you intend to submit the support for other boards?

I would like to add more boards in couple of days, the main intention
of adding common is to place file for common if any specific board
have any specific changes I will create board name file.

>
> This script is exactly the same as the one in
> board/freescale/common/imx/post-image.sh, I definitely would like to
> avoid duplication.

Same, but calling genimage.cfg is different in engicam vs freescale common.

>
> For now, if you're trying to submit the support for a single board, I
> would suggest that you:
>
>  1. Use a "fixed" genimage.cfg, i.e without %FILES% or %DTBS%
>
>  2. Use support/scripts/genimage.sh

I will submit remaining boards soon, so I will keep the genimage.cfg as it is.

>
>> +# Kernel
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10"
>
> Since you're using a 4.10 kernel, you also need to set:
>
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y

Will add.

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
