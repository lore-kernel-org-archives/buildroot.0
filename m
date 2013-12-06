From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Dec 2013 19:08:36 +0100
Subject: [Buildroot] [PATCH] sawman: Link using gcc instead of ld
In-Reply-To: <1386347428-4142-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1386347428-4142-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20131206190836.637fc9f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 6 Dec 2013 16:30:28 +0000, Vicente Olivert Riera wrote:

> +--- SaWMan-1.6.3/wm/sawman/Makefile.in.orig	2013-12-06 14:22:22.675409826 +0000
> ++++ SaWMan-1.6.3/wm/sawman/Makefile.in	2013-12-06 16:04:03.383752843 +0000

Makefile.in is generated from Makefile.am. So we shouldn't be fixing
Makefile.in, but instead Makefile.am or the process that generates
Makefile.in from Makefile.am.

What happens if you simply add:

SAWMAN_AUTORECONF = YES

 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
