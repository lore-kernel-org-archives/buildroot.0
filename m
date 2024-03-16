Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E290C54E68
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E38A1415C3;
	Sat, 16 Mar 2024 22:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8twF5ppYV407; Sat, 16 Mar 2024 22:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AEFB415E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AEFB415E2;
	Sat, 16 Mar 2024 22:23:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2761BF3D5
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1664B81EDE
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6xra_lzpXLj for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17BE181ED3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17BE181ED3
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:22:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0558281F72; Sat, 16 Mar 2024 22:22:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 23:18:53 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 247f4f218edc38ca81301a4c4967ea56392758e6
X-Git-Newrev: f05fe8a73430e6e1aeb0a473b76117ba99d72393
X-Patchwork-Hint: ignore
Message-Id: <20240316222259.0558281F72@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/dnsmasq: security
 bump version to 2.90
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

commit: https://git.buildroot.net/buildroot/commit/?id=f05fe8a73430e6e1aeb0a473b76117ba99d72393
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG

Release notes:
https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2024q1/017430.html

Fixes CVE 2023-50387 and CVE 2023-50868.

Removed patch which is included in this release.
Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 213cfb34358d86a65deecdb9f5b11a20ad0895d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
