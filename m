Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356BEFCC067
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03D0D6140B;
	Fri,  6 Mar 2026 19:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6Gt4fjFemLL; Fri,  6 Mar 2026 19:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ACA9613F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826667;
	bh=1dXkdMnSDlfZCjfQf9PTtjgZnEchFVhS3FnKXuRl8BI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aIlVCYAdQaJQhTHQ0PfCaqiJYwMM3lT+wBxBIcnwjQP968v5DEa8zNiCYwu7I1bLv
	 0u91tJN7eyFW7RwzamLbp9E4KskH7L9OHFJOip+Tn0g6C70oBsIR9/634l32N0NpgK
	 YtSM728+kIo/LIYHcvTuPHV0dJ+Lah2JmIUCrC2XVxqVhTgBB/XJBE+gNopwC1QvpO
	 ygDfFKqPvjiDzNgfY+mu/XVQIGXMXh+BFrM6ESGsP8rzQ7aVWB6ZGGYTLLT5O4FLaE
	 V1BkAVOwQBIRIz+5K8pOeBERXGoTumjk4eCqpZ6SvTsywvilZtawjdpMRUJHNGHKpN
	 su5mkAoviDacQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ACA9613F3;
	Fri,  6 Mar 2026 19:51:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF8C25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4FB1613D4
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sxf9SGUuZAV for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC2F613D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BC2F613D1
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60FA4841E4; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:48:24 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 250fed1fd4f8ac50c0eb8e28839cd9813b711355
X-Git-Newrev: 0900d725c4e45f47902bedb6ef2cf2b06c141d4f
X-Patchwork-Hint: ignore
Message-Id: <20260306195050.60FA4841E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/igmpproxy: add
 patch for CVE-2025-50681
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0900d725c4e45f47902bedb6ef2cf2b06c141d4f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
(cherry picked from commit 3c305f32baebb0addb85bbc9aad4df05456566d9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
