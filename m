Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67839C83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 18:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C94C4065E;
	Wed,  9 Jul 2025 18:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDkUrKatA04t; Wed,  9 Jul 2025 18:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BF0C40591
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BF0C40591;
	Wed,  9 Jul 2025 18:50:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4817112E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 18:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36ABF813F5
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 18:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nwzl1x4P6WtJ for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 18:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 558B6813F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 558B6813F1
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 18:50:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E69E86091; Wed,  9 Jul 2025 18:50:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Jul 2025 20:48:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09880508cb26260f30608137f697b6bdf11483fa
X-Git-Newrev: f52e17596dc81a7ae12afbe7a699afdf0ae8e6b2
X-Patchwork-Hint: ignore
Message-Id: <20250709185000.3E69E86091@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sngrep: security bump to v1.8.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4384589938917982162=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4384589938917982162==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f52e17596dc81a7ae12afbe7a699afdf0ae8e6b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release notes:

- https://github.com/irontec/sngrep/releases/tag/v1.7.0
- https://github.com/irontec/sngrep/releases/tag/v1.8.0
- https://github.com/irontec/sngrep/releases/tag/v1.8.1
- https://github.com/irontec/sngrep/releases/tag/v1.8.2

This fixes the following vulnerabilities:

- CVE-2024-3119:
    A buffer overflow vulnerability exists in all versions of sngrep since
    v0.4.2, due to improper handling of 'Call-ID' and 'X-Call-ID' SIP
    headers. The functions sip_get_callid and sip_get_xcallid in sip.c use
    the strncpy function to copy header contents into fixed-size buffers
    without checking the data length. This flaw allows remote attackers to
    execute arbitrary code or cause a denial of service (DoS) through
    specially crafted SIP messages.
    https://www.cve.org/CVERecord?id=CVE-2024-3119

- CVE-2024-3120:
    A stack-buffer overflow vulnerability exists in all versions of sngrep
    since v1.4.1. The flaw is due to inadequate bounds checking when
    copying 'Content-Length' and 'Warning' headers into fixed-size buffers
    in the sip_validate_packet and sip_parse_extra_headers functions
    within src/sip.c. This vulnerability allows remote attackers to
    execute arbitrary code or cause a denial of service (DoS) via crafted
    SIP messages.
    https://www.cve.org/CVERecord?id=CVE-2024-3120

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sngrep/sngrep.hash | 6 +++---
 package/sngrep/sngrep.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index c9b9c8be8d..aea9d95770 100644
--- a/package/sngrep/sngrep.hash
+++ b/package/sngrep/sngrep.hash
@@ -1,6 +1,6 @@
-# From https://github.com/irontec/sngrep/releases/download/v1.7.0/sngrep-1.7.0.tar.gz.md5sum
-md5  ee3cc7bd75adeb713411aa678e45ae4c  sngrep-1.7.0.tar.gz
+# From https://github.com/irontec/sngrep/releases/download/v1.8.2/sngrep-1.8.2.tar.gz.md5sum
+md5  eb2a398e2e98993ee2a19a3afddfc282  sngrep-1.8.2.tar.gz
 
 # Locally computed
-sha256  2e5ba3a4d6486ea00bd73d2cceff383ba162dcd6d0170ae74cfa3b1c206e2cb1  sngrep-1.7.0.tar.gz
+sha256  1cd05bddd531b353e3069c5243e7076b60a3ee907dbbc3c9c2834676ed8c4bac  sngrep-1.8.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index b86d7e83f0..5399d041b5 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNGREP_VERSION = 1.7.0
+SNGREP_VERSION = 1.8.2
 SNGREP_SITE = \
 	https://github.com/irontec/sngrep/releases/download/v$(SNGREP_VERSION)
 SNGREP_LICENSE = GPL-3.0+

--===============4384589938917982162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4384589938917982162==--
