Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAC0C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 06:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26BBB4F1C6;
	Fri, 28 Mar 2025 06:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqxZ3QI0OvUl; Fri, 28 Mar 2025 06:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19CAE4EF19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19CAE4EF19;
	Fri, 28 Mar 2025 06:49:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE4791B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 06:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEF6B4EEC2
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 06:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6k0eqy5iPXe for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 06:49:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 550364EF19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 550364EF19
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 550364EF19
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 06:49:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D292443CB;
 Fri, 28 Mar 2025 06:49:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1ty3Wr-002FXY-2X;
 Fri, 28 Mar 2025 07:49:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 07:49:18 +0100
Message-Id: <20250328064920.536373-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedtieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeejkeefgeetffekgedtjeduudefudfgvdevfefgkeefudetfeeftdekgeffgeekjeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpgidrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 1/2] package/xserver_xorg-server: security bump
 to version 21.1.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

21.1.14 fixes the following security issues:

1) CVE-2024-9632: Heap-based buffer overflow privilege escalation in
_XkbSetCompatMap

Introduced in: xorg-server-1.1.1 (2006)
Fixed in: xorg-server-21.1.14 and xwayland-24.1.4
Fix:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/85b776571487f52e756f68a069c768757369bfe3
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The _XkbSetCompatMap() function attempts to resize the `sym_interpret`
buffer.

However, It didn't update its size properly. It updated `num_si` only,
without updating `size_si`.

This may lead to local privilege escalation if the server is run as root
or remote code execution (e.g. x11 over ssh).

xorg-server-21.1.14 and xwayland-24.1.4 have been patched to fix this issue.

https://lists.x.org/archives/xorg-announce/2024-October/003545.html
https://lists.x.org/archives/xorg-announce/2024-October/003546.html

21.1.16 fixes the following security issues:

1) CVE-2025-26594: Use-after-free of the root cursor

Introduced in: Unknown - Prior to X11R6.6 Xorg baseline
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/01642f26
      https://gitlab.freedesktop.org/xorg/xserver/-/commit/b0a09ba6
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The root cursor is referenced in the xserver as a global variable. If
a client manages to free the root cursor, the internal reference points
to freed memory and causes a use-after-free.

xorg-server-21.1.16 and xwayland-24.1.6 have been patched to fix this issue.

2) CVE-2025-26595: Buffer overflow in XkbVModMaskText()

Introduced in: Prior to X11R6.1
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/11fcda87
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The code in XkbVModMaskText() allocates a fixed sized buffer on the
stack and copies the names of the virtual modifiers to that buffer.

The code however fails to check the bounds of the buffer correctly and
would copy the data regardless of the size, which may lead to a buffer
overflow.

xorg-server-21.1.16 and xwayland-24.1.6 have been patched to fix this issue.

3) CVE-2025-26596: Heap overflow in XkbWriteKeySyms()

Introduced in: initial version of xc/programs/Xserver/xkb/xkb.c in X11R6
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/80d69f01
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The computation of the length in XkbSizeKeySyms() differs from what is
actually written in XkbWriteKeySyms(), which may lead to a heap based
buffer overflow.

xorg-server-21.1.16 and xwayland-24.1.6 have been patched to fix this issue.

4) CVE-2025-26597: Buffer overflow in XkbChangeTypesOfKey()

Introduced in: X11R6.1
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

If XkbChangeTypesOfKey() is called with 0 group, it will resize the key
symbols table to 0 but leave the key actions unchanged.

If later, the same function is called with a non-zero value of groups,
this will cause a buffer overflow because the key actions are of the wrong
size.

5) CVE-2025-26598: Out-of-bounds write in CreatePointerBarrierClient()

Introduced in: xorg-server-1.14.0
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/bba9df1a
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The function GetBarrierDevice() searches for the pointer device based on
its device id and returns the matching value, or supposedly NULL if no
match was found.

However the code will return the last element of the list if no matching
device id was found which can lead to out of bounds memory access.

6) CVE-2025-26599: Use of uninitialized pointer in compRedirectWindow()

Introduced in: Xorg 6.8.0.
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/c1ff84be
      https://gitlab.freedesktop.org/xorg/xserver/-/commit/b07192a8
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

The function compCheckRedirect() may fail if it cannot allocate the backing
pixmap. In that case, compRedirectWindow() will return a BadAlloc error
without the validation of the window tree marked just before, which leaves
the validate data partly initialized, and the use of an uninitialized pointer
later.

7) CVE-2025-26600: Use-after-free in PlayReleasedEvents()

Introduced in: X11R5
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/6e0f332b
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

When a device is removed while still frozen, the events queued for that
device remain while the device itself is freed and replaying the events
will cause a use after free.

8) CVE-2025-26601: Use-after-free in SyncInitTrigger()

Introduced in: X11R6
Fixed in: xorg-server-21.1.16 and xwayland-24.1.6
Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/16a1242d
      https://gitlab.freedesktop.org/xorg/xserver/-/commit/f52cea2f
      https://gitlab.freedesktop.org/xorg/xserver/-/commit/8cbc90c8
      https://gitlab.freedesktop.org/xorg/xserver/-/commit/c2857989
Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative

When changing an alarm, the values of the change mask are evaluated one
after the other, changing the trigger values as requested and eventually,
SyncInitTrigger() is called.
If one of the changes triggers an error, the function will return early,
not adding the new sync object.
This can be used to cause a use after free when the alarm eventually
triggers.

https://lists.x.org/archives/xorg-announce/2025-February/003584.html
https://lists.x.org/archives/xorg-announce/2025-February/003585.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 3520de242f..abf1c83c75 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-April/003504.html
-sha256  2864b6a5359ab41c5a6132c69b5d0c9af6eb85ad26d433edb012c914029de752  xorg-server-21.1.13.tar.gz
-sha512  9bf5617d577dd3526a9578daedc1f2e3527da6913841f8fc78a2bda311ebf1560e84e31942cb8133a2a2ac99487c13b9153db6fb2d00859fc24d053f6b91fe34  xorg-server-21.1.13.tar.gz
+# From https://lists.x.org/archives/xorg-announce/2025-February/003585.html
+sha256  59fa52b63f6f8747ee2c4716decb29ced249c4c574e2a18c96b7d3b1420f7fd9  xorg-server-21.1.16.tar.gz
+sha512  d0cd176e4c7273b6870999a3d008ed282fd5609acb2e0919c16447af3a5b2228d8592424388a8ace67acf216cdfae3a2d52f7a7ba81f6071467c61d57f32f314  xorg-server-21.1.16.tar.gz
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 05ba938c30..afb79b223e 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.13
+XSERVER_XORG_SERVER_VERSION = 21.1.16
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
