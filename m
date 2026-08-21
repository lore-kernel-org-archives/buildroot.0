Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE0EC5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B638117B;
	Fri, 21 Aug 2026 15:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qdaGLAT7QqN; Fri, 21 Aug 2026 15:07:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324836;
	bh=1kMRQy2mFtLFFSxW0thH1ZZxMV4+9y/g5zsnJsFh7/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hv5Vk9xidlohmvId/VQRUBNEVrVNLNN4uC7cLOUsR/YBZmun9hR61adx8fQ2hV2Cr
	 +fzV+fwhQQbMI6yZ5HL5pB1jg83cw+y1RIISqaa3mQq60KJLliqHcYpxEy6CI1RrKc
	 25MPYhkNuMWtDzEoW5IAlGFXHsZkaDcBUvrZlrxjsfESsdAzb5ifLz26BG/qPF3scY
	 fZUp2YIfB7QmzRjZfZ3WDgSG8g2ex6FNF+PosbsJVhG9HUa8hywEn5mdbRizuzKJqL
	 KXQEuA0c7ggMpoMxArzMCdcU6q1SGroj1yqI9omzbvrkArZOXHjIiqeGW0ZqQfboQy
	 /Nz6mMj6HszNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF02F81199;
	Fri, 21 Aug 2026 15:07:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6824E29B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5913C81193
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eR4PTXBEZvI for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92F5F8117C
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 056738E0EC; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ceb6f2d2346ababdf4ee6e204e8bdf4f295bbd1f
X-Git-Newrev: 3a5af1b3c0ac801887deeef0d0247f4537df8eff
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.056738E0EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/busybox: patch
 CVE-2026-29004
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a5af1b3c0ac801887deeef0d0247f4537df8eff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Thanks to the OpenEmbedded community for the patches. This fixes the
following vulnerability:

- CVE-2026-29004:
    BusyBox before commit 42202bf contains a heap buffer overflow
    vulnerability in the DHCPv6 client (udhcpc6) DNS_SERVERS option
    handler in networking/udhcp/d6_dhcpc.c that allows network-adjacent
    attackers to trigger memory corruption by sending a crafted DHCPv6
    response with a malformed D6_OPT_DNS_SERVERS option. Attackers can
    exploit incorrect heap buffer allocation calculations in the
    option_to_env() function to cause denial of service or achieve
    arbitrary code execution on embedded systems without heap hardening.
    https://www.cve.org/CVERecord?id=CVE-2026-29004

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
(alternative to commit 5a27004cffb6bb034ff80cfac42a87bbd208755d)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/busybox/0019-CVE-2026-29004-01.patch | 39 ++++++++++++++++++++++++
 package/busybox/0020-CVE-2026-29004-02.patch | 45 ++++++++++++++++++++++++++++
 package/busybox/busybox.mk                   |  4 +++
 3 files changed, 88 insertions(+)

diff --git a/package/busybox/0019-CVE-2026-29004-01.patch b/package/busybox/0019-CVE-2026-29004-01.patch
new file mode 100644
index 0000000000..77ffd5f617
--- /dev/null
+++ b/package/busybox/0019-CVE-2026-29004-01.patch
@@ -0,0 +1,39 @@
+From d9a718cc17535c31d38f31fccb904a30e823166d Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 07:25:38 +0100
+Subject: [PATCH] udhcpc6: fix buffer overflow
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream: https://github.com/vda-linux/busybox_mirror/commit/42202bfb1e6ac51fa995beda8be4d7b654aeee2a
+CVE: CVE-2026-29004
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ networking/udhcp/d6_dhcpc.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index 79cef1999..d13b05829 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -351,15 +351,15 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+ 			addrs = option[3] >> 4;
+ 
+ 			/* Setup environment variable */
+-			*new_env() = dlist = xmalloc(4 + addrs * 40 - 1);
++			*new_env() = dlist = xmalloc(4 + addrs * 40 + 1);
+ 			dlist = stpcpy(dlist, "dns=");
+ 			option_offset = 0;
+ 
+-			while (addrs--) {
++			while (addrs-- != 0) {
+ 				sprint_nip6(dlist, option + 4 + option_offset);
+ 				dlist += 39;
+ 				option_offset += 16;
+-				if (addrs)
++				if (addrs != 0)
+ 					*dlist++ = ' ';
+ 			}
+ 
+-- 
+2.34.1
diff --git a/package/busybox/0020-CVE-2026-29004-02.patch b/package/busybox/0020-CVE-2026-29004-02.patch
new file mode 100644
index 0000000000..c7e28abd0f
--- /dev/null
+++ b/package/busybox/0020-CVE-2026-29004-02.patch
@@ -0,0 +1,45 @@
+From 1e14c5c577a7bd46f42315e9bc445419770041a7 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 13:23:48 +0100
+Subject: [PATCH] udhcpc6: check the size of D6_OPT_IAPREFIX option
+
+function                                             old     new   delta
+option_to_env                                        694     711     +17
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Upstream: https://github.com/vda-linux/busybox_mirror/commit/d368f3f7836d1c2484c8f839316e5c93e76d4409
+CVE: CVE-2026-29004
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ networking/udhcp/d6_dhcpc.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index d13b05829..1851cee2a 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -287,8 +287,8 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |                        valid-lifetime                         |
+  * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+  */
+-			/* Make sure payload contains an address */
+-			if (option[3] < 24)
++			/* Make sure payload exists */
++			if (option[3] < (16 + 4 + 4))
+ 				break;
+ 
+ 			sprint_nip6(ipv6str, option + 4);
+@@ -332,6 +332,9 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |               |
+  * +-+-+-+-+-+-+-+-+
+  */
++			/* Make sure payload exists */
++			if (option[3] < (4 + 4 + 1 + 16))
++				break;
+ 			move_from_unaligned32(v32, option + 4 + 4);
+ 			v32 = ntohl(v32);
+ 			*new_env() = xasprintf("ipv6prefix_lease=%u", (unsigned)v32);
+-- 
+2.34.1
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d3e0678200..35dc3a52ba 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -36,6 +36,10 @@ BUSYBOX_IGNORE_CVES += CVE-2025-60876
 # 0018-only-strip-unsafe-components-from-hardlinks.patch
 BUSYBOX_IGNORE_CVES += CVE-2026-26157 CVE-2026-26158
 
+# 0019-CVE-2026-29004-01.patch
+# 0020-CVE-2026-29004-02.patch
+BUSYBOX_IGNORE_CVES += CVE-2026-29004
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
