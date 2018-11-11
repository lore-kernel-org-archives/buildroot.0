From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Nov 2018 23:48:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/android-tools: add ext4_utils
 to host
In-Reply-To: <1541914714-17359-1-git-send-email-kaplan2539@gmail.com>
References: <1541914714-17359-1-git-send-email-kaplan2539@gmail.com>
Message-ID: <f403ed70-b8c0-5f67-46a7-e65b0dc52284@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alex,

On 11/11/2018 06:38, kaplan2539 at gmail.com wrote:
> From: Alex Kaplan <kaplan2539@gmail.com>
> 
> This patch adds an option to build and install the ext4_utils for the host,
> i.e. make_ext4fs, ext4fixup, ext2simg, img2simg, simg2img and simg2simg.
> As a default building of ext4_utils is disabled.

 This patch does two things that I said shouldn't be done in my review of
sunxi-tools:

- separate Config.in options for the tools of a host package - but this is
already the case for android-tools, so better follow that convention;

- build the different tools in a single run of make - but this time, there is a
good reason not to: every tool is built in a separate build directory.

 In other words, the comments I made on sunxi-tools don't apply here.

 Therefore:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> Signed-off-by: Alex Kaplan <kaplan2539@gmail.com>
> ---
>  ...akefiles-for-out-of-tree-ext4_utils-build.patch | 48 ++++++++++++++++++++++
>  package/android-tools/Config.in.host               |  8 ++++
>  package/android-tools/android-tools.mk             | 18 ++++++--
>  3 files changed, 70 insertions(+), 4 deletions(-)
>  create mode 100644 package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
> 
> diff --git a/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch b/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
> new file mode 100644
> index 0000000..80ea1ec
> --- /dev/null
> +++ b/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
> @@ -0,0 +1,48 @@
> +From d24abbec201975a5eb7f8589614cfb424b8c80b6 Mon Sep 17 00:00:00 2001
> +From: Alex Kaplan <kaplan2539@gmail.com>
> +Date: Sat, 10 Nov 2018 19:50:51 -0800
> +Subject: [PATCH] Fix makefiles for out-of-tree ext4_utils build
> +
> +Signed-off-by: Alex Kaplan <kaplan2539@gmail.com>

 I was going to ask: did you send the patch upstream? However, android-tools
doesn't really have an upstream that accepts contributions I think.

 Regards,
 Arnout


[snip]
