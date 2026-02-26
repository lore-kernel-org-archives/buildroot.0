Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B9AFD9E07
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF3966071D;
	Thu, 26 Feb 2026 20:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aL5WCDqJGtKu; Thu, 26 Feb 2026 20:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C1C76070D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772136524;
	bh=kDcbRIxvpfkKEdHrOjXZGbsWTpABldxh6cYpRRoyDs0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bIlCeSjIug8Hr59zfBxpvSpjARmyN/qD7dEYFz2akHeF85nMxOMpqVCtbEuNSmaXL
	 vuztqr9PAJo+Qi9/crhlIsX5/MqNGbyghaqaP0t//WeQ2VCi29mh4aru07ArC5Wr7S
	 I0TR25bEJb7fz5DnqrVRxN5xNjLYknukI722fl0EHbywQxVCrm2SuundQOOHi1iou+
	 cUTDR9LVZZWGPwQfpDvpIbzz3yrLfQRBU6eXLJ3oqphkxFoEh1BVO77Z+JuDHR2MVf
	 iYZXJrM0dJ/1q/w4fLBaZDTHPy1BP8jr35UWF7SIYut4MvsLGUwelcQWU0gUdG1uaa
	 vTsRyz/GvYkaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C1C76070D;
	Thu, 26 Feb 2026 20:08:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D12C023D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2B8540743
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYni85KQnzdF for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:08:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1414070D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF1414070D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:08:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9383684767; Thu, 26 Feb 2026 20:08:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:04:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea79b66ab2bc62a8e2e02b510dbf56c6aecb8725
X-Git-Newrev: 3c305f32baebb0addb85bbc9aad4df05456566d9
X-Patchwork-Hint: ignore
Message-Id: <20260226200841.9383684767@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igmpproxy: add patch for
 CVE-2025-50681
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3c305f32baebb0addb85bbc9aad4df05456566d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerability:

- CVE-2025-50681:
    igmpproxy 0.4 before commit 2b30c36 allows remote attackers to cause a
    denial of service (application crash) via a crafted IGMPv3 membership
    report packet with a malicious source address. Due to insufficient
    validation in the `recv_igmp()` function in src/igmpproxy.c, an
    invalid group record type can trigger a NULL pointer dereference when
    logging the address using `inet_fmtsrc()`. This vulnerability can be
    exploited by sending malformed multicast traffic to a host running
    igmpproxy, leading to a crash. igmpproxy is used in various embedded
    networking environments and consumer-grade IoT devices (such as home
    routers and media gateways) to handle multicast traffic for IPTV and
    other streaming services. Affected devices that rely on unpatched
    versions of igmpproxy may be vulnerable to remote denial-of-service
    attacks across a LAN .

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-50681
  - https://github.com/younix/igmpproxy/commit/2b30c36e6ab5b21defb76ec6458ab7687984484c

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/igmpproxy/0001-Fix-Buffer-Overflow.patch | 25 ++++++++++++++++++++++++
 package/igmpproxy/igmpproxy.mk                   |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/package/igmpproxy/0001-Fix-Buffer-Overflow.patch b/package/igmpproxy/0001-Fix-Buffer-Overflow.patch
new file mode 100644
index 0000000000..b9f03386a8
--- /dev/null
+++ b/package/igmpproxy/0001-Fix-Buffer-Overflow.patch
@@ -0,0 +1,25 @@
+From 2b30c36e6ab5b21defb76ec6458ab7687984484c Mon Sep 17 00:00:00 2001
+From: Jan Klemkow <j.klemkow@wemelug.de>
+Date: Thu, 17 Apr 2025 19:02:16 +0200
+Subject: [PATCH] Fix Buffer Overflow #97
+
+CVE: CVE-2025-50681
+Upstream: https://github.com/younix/igmpproxy/commit/2b30c36e6ab5b21defb76ec6458ab7687984484c
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/igmp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/igmp.c b/src/igmp.c
+index a80c4e58..838694ce 100644
+--- a/src/igmp.c
++++ b/src/igmp.c
+@@ -94,7 +94,7 @@ static const char *igmpPacketKind(unsigned int type, unsigned int code) {
+     case IGMP_V2_LEAVE_GROUP:        return "Leave message     ";
+ 
+     default:
+-        sprintf(unknown, "unk: 0x%02x/0x%02x    ", type, code);
++        snprintf(unknown, sizeof unknown, "unk: 0x%02x/0x%02x    ", type, code);
+         return unknown;
+     }
+ }
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index f2c32939ff..d7d7691c8f 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -13,4 +13,7 @@ IGMPPROXY_LICENSE_FILES = COPYING GPL.txt Stanford.txt
 
 IGMPPROXY_CPE_ID_VENDOR = pali
 
+# 0001-Fix-Buffer-Overflow.patch
+IGMPPROXY_IGNORE_CVES += CVE-2025-50681
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
