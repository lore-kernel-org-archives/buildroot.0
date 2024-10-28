Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9606D3399E
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 16:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7180040182;
	Mon, 28 Oct 2024 16:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frr79ExY4nYZ; Mon, 28 Oct 2024 16:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3734E401A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3734E401A0;
	Mon, 28 Oct 2024 16:31:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61853112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42BDE80D6C
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhUKKvuliT1H for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 16:31:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 577DC80D50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 577DC80D50
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 577DC80D50
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:31:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.46]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KTo-1u4PGE2Olm-017qyc; Mon, 28
 Oct 2024 17:31:44 +0100
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon, 28 Oct 2024 17:31:37 +0100
Message-ID: <20241028163137.2136109-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:LiuDebpix+rasgG09BNaU5IDn6fO2CPmKk9CI0eky7YhvW/12ug
 k9vTS86r4brjA3/rF0DFSrOhTH9VnWIACTASZIrJW7rBcDFkxAwzEK3AeUOgNMqCOIClBdE
 RrOMVtYXVxu0I+qaIgbBJHFt23MLPLhPSWqmQzLEq4GkKOW59vJ75QTlB5icyqnbF0bqd6d
 +XtMLxwm1iAKzUbxBfz0Q==
UI-OutboundReport: notjunk:1;M01:P0:UL4drt3kgK8=;Y3OWsSlC05Gpd0yF8NUuV6yucvU
 6pl1CeAYqYl7PmlP3JjGdX8f5AKaE+zyw/XmOdM3076xv8wWOTs2n8njeZzQO0DHqKBjDn5Px
 SASICVgls+b7wmiz85DhybL1kRb8bwk9n/aWYqKfeCzbBbxj+sXzM6+tLslp5h7W6Jg8lMoDh
 c0tynZsqaea8LCcDNpOQR11ZEwF2CHrWOUyJ9RWNQXqXRw9Gmb3ZtnG2ZhR6CiXsDqyIx2mpP
 dJXo8BYiXucfPnPIEZ52WKjDM2t4/KrltBBY/E2ljt9G28t6Z74KPjAhihum8wRz60WZwFNFA
 BEGppTn6kARO/2E37tWJPESUiDOnTlmnyxwmbgsagu/mqZdjK9dL4VDmg7HO7mNcpYAVJiPAi
 vCajL/F6E65fjfVJ6O8cTor1AhqzuUHkSRGXWujQf8rUkbGJyvK33EDiLA3T9bcL3iaV6khDN
 agX4T43Mnv463ESW36CDjCMOYN74gfHT3iO3/p0W6qSC/p2kPBs5D+IKaNR0cYIhAoSh2DRtt
 V4UWaJzwbcZNzlQFY9XzvbxT9Q13VZK5DXkmiZZAh9a7cnyxlpmKC7bHym7ChQ1HaGRO0AUCg
 L8KwWfXNnymz5WqS0t9G8Jk/tAOzqWRDd5XoXnEs956tFFucHQldV9NDstbj0+w7YfWDiOe1L
 CEuT3teH1n8s/3P8M/cc3TEJOOr4pn3bURRGdTy5ToxcVfsVgjVDTH2HR6tFVx45yfna1yXC8
 NjCgDZfiU8iV+utc///khEhJo1hQIuI/gEUQVAOLG5e1BWlkd8r0NREuKioM+zuQHbb4w/aHX
 Ud1z/1B95qa18ihCEG4QXX8w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730133104; x=1730737904; i=fiona.klute@gmx.de;
 bh=I/7OTxzMGZ9wtjdIy6qtSV0zD5klc7n7AQVslZYcwg4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KUbDTyGsVGFeFdml09sPTbOcKJAFto+k7hV/NqobGMI/XqzsmD4WwK7rT7j9at9C
 XiOJVpkEZ1Byu06ACUA5pkntY7/BIy0HBQWk9p5CSROF5oaPB3sg11ApEukrSz0M7
 RpgHpr7RA5h6ZQCX7Bvg3fc6qo7ieE5hCG66CIwuiF6b4EDdNZtAh1KHjFCYxvDNQ
 ttlLJnKCXAUyzCPBY0cmHYYBBaAMgVMK/Dcg3v97M2KbGlT+/n0jnxe2EAehlR3YC
 2HPVCqfO9XzbKSHtDBHLjBumh12uMKNlSt8IP1Xa2aO/Nkzn9oxfuli3z0qXkuMbB
 Ovz50nN0dwS14hcmYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=KUbDTyGs
Subject: [Buildroot] [PATCH 1/1] package/openssh: fix musl compile issue
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Building package/openssh 9.9p1 with musl failed during linking because
construct_utmp() was referenced due to "use construct_utmp to
construct btmp records" [1], but not built as utmp is disabled in the
Buildroot package. The fix comes from upstream and ensures the
construct_utmp function actually gets built when USE_BTMP is set [2].

[1] https://anongit.mindrot.org/openssh.git/commit/?id=671c440786a5a66216922f15d0007b60f1e6733f
[2] https://anongit.mindrot.org/openssh.git/commit/?id=76a618d2842c34c16cd21a4efc7230e2f459008d

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 ...-construct_utmp-when-USE_BTMP-is-set.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch

diff --git a/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch b/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch
new file mode 100644
index 0000000000..0805bcdacb
--- /dev/null
+++ b/package/openssh/0001-build-construct_utmp-when-USE_BTMP-is-set.patch
@@ -0,0 +1,35 @@
+From 76a618d2842c34c16cd21a4efc7230e2f459008d Mon Sep 17 00:00:00 2001
+From: Damien Miller <djm@mindrot.org>
+Date: Wed, 25 Sep 2024 11:13:05 +1000
+Subject: [PATCH] build construct_utmp() when USE_BTMP is set
+
+Fixes compile error on Void Linux/Musl
+
+Upstream: https://anongit.mindrot.org/openssh.git/commit/?id=76a618d2842c34c16cd21a4efc7230e2f459008d
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ loginrec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/loginrec.c b/loginrec.c
+index 45f13dee8b1f..7b1818b86753 100644
+--- a/loginrec.c
++++ b/loginrec.c
+@@ -614,7 +614,7 @@ line_abbrevname(char *dst, const char *src, int dstsize)
+  ** into account.
+  **/
+
+-#if defined(USE_UTMP) || defined (USE_WTMP) || defined (USE_LOGIN)
++#if defined(USE_BTMP) || defined(USE_UTMP) || defined (USE_WTMP) || defined (USE_LOGIN)
+
+ /* build the utmp structure */
+ void
+@@ -698,7 +698,7 @@ construct_utmp(struct logininfo *li,
+ 	}
+ # endif
+ }
+-#endif /* USE_UTMP || USE_WTMP || USE_LOGIN */
++#endif /* USE_BTMP || USE_UTMP || USE_WTMP || USE_LOGIN */
+
+ /**
+  ** utmpx utility functions
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
