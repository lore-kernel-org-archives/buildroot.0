From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 13 Feb 2014 12:34:43 +0100
Subject: [Buildroot] [PATCH 0 of 2] busybox/uclibc: copy config file from
	configure step
Message-ID: <patchbomb.1392291283@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This patch series changes busybox and uclibc to copy the .config file from
the configure step, and not earlier (patch or extract step). This fixes the
usage of OVERRIDE_SRCDIR with these packages.

This was reported for busybox in bug #5030.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/busybox/busybox.mk |  4 +---
 package/uclibc/uclibc.mk   |  3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)
