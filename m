Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEEBC48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24AED60D7F;
	Tue, 20 Feb 2024 21:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WD_chidXLKTm; Tue, 20 Feb 2024 21:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E50060D90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E50060D90;
	Tue, 20 Feb 2024 21:00:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A11D1BF33E
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E44E60C20
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 20:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPrqBG8yLOxz for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 20:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA20E605FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA20E605FE
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 20:59:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BECF879A2; Tue, 20 Feb 2024 20:59:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 21:51:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9af20d6e1e1139e59ed3dd9aaf015e72f1e2db8e
X-Git-Newrev: 213cfb34358d86a65deecdb9f5b11a20ad0895d1
X-Patchwork-Hint: ignore
Message-Id: <20240220205958.5BECF879A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: security bump version to
 2.90
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=213cfb34358d86a65deecdb9f5b11a20ad0895d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG

Release notes:
https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2024q1/017430.html

Fixes CVE 2023-50387 and CVE 2023-50868.

Removed patch which is included in this release.
Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-set-default-maximum-dns-udp-package-size.patch | 64 ----------------------
 package/dnsmasq/dnsmasq.hash                       |  4 +-
 package/dnsmasq/dnsmasq.mk                         |  4 +-
 3 files changed, 4 insertions(+), 68 deletions(-)

diff --git a/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch b/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch
deleted file mode 100644
index 4dd17ec069..0000000000
--- a/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5 Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Tue, 7 Mar 2023 22:07:46 +0000
-Subject: [PATCH] Set the default maximum DNS UDP packet size to 1232.
-Upstream: https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5
-
-http://www.dnsflagday.net/2020/ refers.
-
-Thanks to Xiang Li for the prompt.
-
-[dalang@gmx.at: backport from upstream]
-Signed-off-by: Daniel Lang <dalang@gmx.at>
----
- CHANGELOG     | 9 ++++++++
- man/dnsmasq.8 | 3 ++-
- src/config.h  | 2 +-
- 3 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 3af20cf..52d8678 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -1,3 +1,12 @@ version 2.90
-+version 2.90
-+	Set the default maximum DNS UDP packet sice to 1232. This
-+	has been the recommended value since 2020 because it's the
-+	largest value that avoid fragmentation, and fragmentation
-+	is just not reliable on the modern internet, especially
-+	for IPv6. It's still possible to override this with
-+	--edns-packet-max for special circumstances.
-+
-+
- version 2.89
-         Fix bug introduced in 2.88 (commit fe91134b) which can result
- 	in corruption of the DNS cache internal data structures and
-diff --git a/man/dnsmasq.8 b/man/dnsmasq.8
-index 41e2e04..5acb935 100644
---- a/man/dnsmasq.8
-+++ b/man/dnsmasq.8
-@@ -183,7 +183,8 @@ to zero completely disables DNS function, leaving only DHCP and/or TFTP.
- .TP
- .B \-P, --edns-packet-max=<size>
- Specify the largest EDNS.0 UDP packet which is supported by the DNS
--forwarder. Defaults to 4096, which is the RFC5625-recommended size.
-+forwarder. Defaults to 1232, which is the recommended size following the
-+DNS flag day in 2020. Only increase if you know what you are doing.
- .TP
- .B \-Q, --query-port=<query_port>
- Send outbound DNS queries from, and listen for their replies on, the
-diff --git a/src/config.h b/src/config.h
-index 1e7b30f..37b374e 100644
---- a/src/config.h
-+++ b/src/config.h
-@@ -19,7 +19,7 @@
- #define CHILD_LIFETIME 150 /* secs 'till terminated (RFC1035 suggests > 120s) */
- #define TCP_MAX_QUERIES 100 /* Maximum number of queries per incoming TCP connection */
- #define TCP_BACKLOG 32  /* kernel backlog limit for TCP connections */
--#define EDNS_PKTSZ 4096 /* default max EDNS.0 UDP packet from RFC5625 */
-+#define EDNS_PKTSZ 1232 /* default max EDNS.0 UDP packet from from  /dnsflagday.net/2020 */
- #define SAFE_PKTSZ 1232 /* "go anywhere" UDP packet size, see https://dnsflagday.net/2020/ */
- #define KEYBLOCK_LEN 40 /* choose to minimise fragmentation when storing DNSSEC keys */
- #define DNSSEC_WORK 50 /* Max number of queries to validate one question */
---
-2.20.1
diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 02ffb2656b..d11e8af590 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.89.tar.xz.asc
-sha256  02bd230346cf0b9d5909f5e151df168b2707103785eb616b56685855adebb609  dnsmasq-2.89.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.90.tar.xz.asc
+sha256  8e50309bd837bfec9649a812e066c09b6988b73d749b7d293c06c57d46a109e4  dnsmasq-2.90.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 9c05857f22..9f342cb049 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.89
+DNSMASQ_VERSION = 2.90
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
-DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
+DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPTS = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
 DNSMASQ_MAKE_OPTS += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
