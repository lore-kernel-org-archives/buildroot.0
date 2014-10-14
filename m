From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Oct 2014 22:24:39 +0200
Subject: [Buildroot] [PATCH] libva-intel-driver: indirectly depends on
	XORG7
References: <1413138815-23276-1-git-send-email-arnout@mind.be>
Message-ID: <XnsA3C6E3F9817B5berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> 
wrote in news:1413138815-23276-1-git-send-email-arnout at mind.be:

> +     depends on BR2_PACKAGE_XORG7 # libdrm intel

Hi,

NACK, the intel driver of libdrm depends on xlib_libpciaccess, so this patch 
is basically correct. But by moving xlib_libpciaccess outside 
packages/x11r7/, like it was done with libpthreads-stubs[1], we can avoid 
that dependency. I will send a patch in a few minutes.

Regards, Bernd

[1] http://git.buildroot.net/buildroot/commit/?id=
5562be136c4d67be4f12875f01d24e26e069d3e9
