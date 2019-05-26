From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 15:24:57 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/openzwave: fix strncat
 build failure
In-Reply-To: <20190524141410.26475-1-fontaine.fabrice@gmail.com>
References: <20190524141410.26475-1-fontaine.fabrice@gmail.com>
Message-ID: <20190526152457.12abe4dd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Thanks for this patch.

On Fri, 24 May 2019 16:14:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Retrieve upstream patch that fix build strncat build failure.

"that fix build strncat build failure" is not really a great wording.

> This patch also allow to disable the use of the embedded tinyxml library
> so use this new option and add a tinyxml dependency

It took me a bit of time to parse this. Instead of "embedded", I think
we usually use "bundled", which is a bit clearer;

I fixed up the commit log and applied to next.

> diff --git a/package/openzwave/0002-update-spec-files.patch b/package/openzwave/0002-update-spec-files.patch
> new file mode 100644
> index 0000000000..0ba74ab108
> --- /dev/null
> +++ b/package/openzwave/0002-update-spec-files.patch
> @@ -0,0 +1,445 @@
> +From 601e5fb16232a7984885e67fdddaf5b9c9dd8105 Mon Sep 17 00:00:00 2001
> +From: Justin Hammond <justin@dynam.ac>
> +Date: Mon, 6 May 2019 17:05:17 +0800
> +Subject: [PATCH] update spec files
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/OpenZWave/open-zwave/commit/601e5fb16232a7984885e67fdddaf5b9c9dd8105]
> +---
> + cpp/build/Makefile                          |  22 ++-
> + cpp/build/support.mk                        |   7 +-
> + cpp/src/command_classes/DoorLockLogging.cpp |   4 +-
> + cpp/src/command_classes/UserCode.cpp        |   4 +-
> + dist/libopenzwave.spec                      | 152 --------------------
> + dist/openzwave.spec.in                      | 145 +++++++++++++++++++
> + distfiles.mk                                |   2 +-

Not your fault, but it is "interesting" from upstream to mix those
strncat build fixes with reworking the spec files, and allowing to
build without the bundled tinyxml...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
