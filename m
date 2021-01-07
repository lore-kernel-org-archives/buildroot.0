From: Matthew Weber <matthew.weber@collins.com>
Date: Thu, 7 Jan 2021 15:26:43 -0600
Subject: [Buildroot] [PATCH] linux: indicate proper CPE prefix
In-Reply-To: <20210107211336.3030397-1-thomas.petazzoni@bootlin.com>
References: <20210107211336.3030397-1-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpZ6Z_YGkCUWLT+gHz9=LRFKD8L+cvJcWQMp53v1KA3smg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Thu, Jan 7, 2021 at 3:14 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> The CPE type of the Linux kernel is special, it should be "o", unlike
> all other packages that use "a". We therefore need to override
> <pkg>_CPE_ID_PREFIX, so that the CPE ID of the linux package matches
> with the CPE dictionary.
>
> Reported-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  linux/linux.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 648f6ea2a5..50d2ae3ff8 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -14,6 +14,7 @@ LINUX_LICENSE_FILES = \
>  endif
>  LINUX_CPE_ID_VENDOR = $(LINUX_NAME)
>  LINUX_CPE_ID_NAME = $(LINUX_NAME)_kernel
> +LINUX_CPE_ID_PREFIX = cpe:2.3:o
>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
