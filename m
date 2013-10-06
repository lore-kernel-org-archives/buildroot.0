From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 6 Oct 2013 20:27:12 +0200
Subject: [Buildroot] [PATCH 2/2] media-ctl: fix build with old kernel
	headers
In-Reply-To: <1381073285-30058-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381073285-30058-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381073285-30058-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LV3ft7pEkZaSGsr0_uJ5nbc6w3hm5GQmjoNDiPyrHDZDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 6, 2013 at 5:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Add a patch to fix the recurrent media-ctl build problems with
> toolchains based on relatively old (< 2.6.39) kernel headers.
>
> Finally fixes:
>
>   http://autobuild.buildroot.org/results/54a/54afc80d4b58a4064a49226bcd4a28f32e3cf814/build-end.log
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...ers-for-compatibility-with-old-toolchains.patch | 303 +++++++++++++++++++++
>  1 file changed, 303 insertions(+)
>  create mode 100644 package/media-ctl/media-ctl-0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch
>
> diff --git a/package/media-ctl/media-ctl-0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch b/package/media-ctl/media-ctl-0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch
> new file mode 100644
> index 0000000..17b52ce
> --- /dev/null
> +++ b/package/media-ctl/media-ctl-0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch
> @@ -0,0 +1,303 @@
> +From 480b9effa08541b5df369dd6516013282cf28bd8 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Sun, 6 Oct 2013 17:24:04 +0200
> +Subject: [PATCH] Add kernel headers for compatibility with old toolchains
> +
> +The media controller mechanism is relatively new in the Linux kernel,
> +and therefore all toolchains don't yet have the necessary
> +headers. This patch makes sure that media-ctl provides such headers,
> +as was already the case with v4l2-common.h, v4l2-subdev.h and
> +videodev2.h.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


I would add the kernel version from which you took the headers in the
patch commit message.

Other than that:
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
