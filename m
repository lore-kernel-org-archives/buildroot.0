From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 08:48:23 +0100
Subject: [Buildroot] [PATCH] alsa-lib: FLAT: Disable alsa lib when
	FLAT	bianry is selected.
In-Reply-To: <1384146177-6020-1-git-send-email-Sonic.adi@gmail.com>
References: <1384146177-6020-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <407de4ef-b785-4cac-a661-f90b2b8556f4@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sonic.adi at gmail.com wrote:
>From: Sonic Zhang <sonic.zhang@analog.com>
>
>Alsa lib depends on the runtime library loader.
>
>Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>---
> package/alsa-lib/Config.in | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
>index df05240..1e148cc 100644
>--- a/package/alsa-lib/Config.in
>+++ b/package/alsa-lib/Config.in
>@@ -9,6 +9,7 @@ config BR2_PACKAGE_ALSA_LIB
> 	# the usage of alsa-lib on no-thread systems is pretty
> 	# unlikely, just require thread support globally for alsa-lib.
> 	depends on BR2_TOOLCHAIN_HAS_THREADS
>+	depends on !BR2_BINFMT_FLAT
> 	help
> 	  The Advanced Linux Sound Architecture (ALSA) provides audio and MIDI
> 	  functionality to the Linux operating system.

This dependency should also be added to the comment that checks for threads. It's txt should not be changed, we should only make sure that the comment is only visible when relevant (!flat).

Best regards,
Thomas
