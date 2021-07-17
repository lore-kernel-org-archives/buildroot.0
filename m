From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Jul 2021 13:18:29 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add missing dependency to
 host-pkgconf
In-Reply-To: <20210715212917.484349-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 15 Jul 2021 23:29:17 +0200")
References: <20210715212917.484349-1-yann.morin.1998@free.fr>
Message-ID: <87sg0dtchm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 2eaa6d0f3629 (boot/uboot: fix uboot building host tools on x86
 > architecture) added use of $(PKG_CONFIG_HOST_BINARY), but forgot to add
 > the corresponding build-ordr dependency.

 > Add this missing depenency now.

 > Additionally, the associated test had an explicit host pkgconf enbled in
 > its configuration. This is superfluous now that uboot properly depends
 > on host-pkgconf, so drop that from the test.

 > Note: it hapenned to work, because host-pkgconf, when explicitly enabled
 > in the configuration, and without per-package directories, would build
 > before uboot and thus be available. This would fail with PPD, though,
 > and thus would break for TLPB.

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Kory Maincent <kory.maincent@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
