Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186BC606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FH/6iALB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E27DD8128A;
	Thu, 22 Oct 2026 21:17:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bO-9yvqP3GI; Thu, 22 Oct 2026 21:17:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2626A81255
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703871;
	b=WTsutnMNZxiu9wWEDyG3xsuw/1z/uqVesEMLzHkqZ02bIvpsfh0UA5RZCOnir4O5ONMT
	 tK2XD4cs+AMvzC6LfCffF5YmBAziXLFwA2hE0c5Px+VQVogL7VZLd1mtOswmbTys54tvn
	 GY/EFMhdhe91Q9ulfV617dJ3EL3QzCbSpwbCn1Rfgmg44ZqRsNlF3QirGV5Prc1FaueJh
	 Rof9zNj99cYIB5uT5YsEGfjq2grGow/UYzafDkbB+alBkoGJc9ciBvV+vncJSoHcs2MP0
	 fgMGLo8rUArVSOy52crPfJ+4Hsp2wy3Byb9DSA8Mj/f8k4C7Hsm9tj8B8iMreC3kOwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703871;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TJ62BTpMFeJl8ZfcWlG5EZquX2KekIqm2/xMXrzRFa8=;
	b=CBMgUFTBBf3vfGDok4L2S/nHEoIQv2KGI9y7qH6HFuGLu0gDKYbuLVvevoIJBOnUQ3U3
	 9xnbx+K6ZhgXO7Ja4D7X4kIgqoa6q7XkzhFidXl/7VvD/Zpbrytu8oVHUkHe1dam11kgw
	 2NGYF9oCsnIX/LrkaEfOy1qfN15TqH82GRvuHVwJDxsxI0TcZb2NviEix0DcAxp94STya
	 Zvs6tYeriRU5QenfKwzqVjq6ciZbCzzJJ8fUcGxxfXeE2p3GeH1TPNh8Z21yeBdtB8B+1
	 PYWZhIvk2RAF2t/mg7NQu6JiXmQpqnVw7VgWe/2uM4gNjL5/KN8eJe2WBDJwBZLM2oA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703871;
	bh=TJ62BTpMFeJl8ZfcWlG5EZquX2KekIqm2/xMXrzRFa8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FH/6iALBLYZtqGF3L66NhcKi316ysErQaSRHhn7O36IwSXumuaWxl1jo8v5hG1div
	 i0t1X7h/VvnrqzA4V4hjSD2EkOgzcZLYpBI5EqzKpVG75eMpIiuCLDrzh+BV+6kv0H
	 Qa7R7rYvXrUo6a9gOINnte6ubYBOzLyEs8hKPP88pUre0AKEt84ujzW+m9K2plIp3q
	 C93luIHiGLRUlUMT+sGetibgwlylf+Msvo5lvcg7MoVNKVR54/ToFTxoNz54JkhV2/
	 vbjn6WvuitblN2lqEDZjtVs1tIXREpk/bhxNwllp3aJnBdY+ohRLA4HZ8/wjv5NlpL
	 wNix3EF4q4rBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2626A81255;
	Thu, 22 Oct 2026 21:17:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38F243C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EF0340270
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5tQBzC2G_oV for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:17:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6BB69401D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703868;
 b=DhUKiz5TqDkLjZ7UH809/psHsneGkrvf54yane1YEfZA5WZ/1pyupli0gc2VZN6EKZ9F
 Q8oLB3+prUYk6GLs57kJBMxPWCaVrJju0vNz9QMJeHAclofl6juaqUTl6D1CoxkSCGfTN
 JeGcNvWpIznMrvUGZZceN2QKMKgGYTRvx0yjWtjFzHtatHfKxwm/SirFS+NItELyFUVll
 33xPGh3y7J3OkMLzLFGw8GAbFOIeoGcLPKVgYcn4njnwAvEmU4VctjN79y9bs9A7izI1S
 7jXwDJafqxn5QupV033PmGGpmOr8ECrPoW799AKLjnsw9IE3fG20SCpCsOcfPJwKv2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703868;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GNLFFwZoHrGM2Yv4qqsglNXbw6BUFvb+vtvvR0S8Xp8=;
 b=fMeOIOWnWCFs0Fdm3lt/V0LWsSekQHGzHkMUKfdIuDXbXXkFBtEQvJlYSKGcz1FEloH9
 JjVz6Hm1k1Bk7LrI4S2zE6LkdmDPrrFeP0aGT7rFFTiDxlEL3M8mUuzGP0gCI9qDov1H6
 UW03es5TCN/iZTAX7lv1mv/ytrY18bghwlb3GpsRp9Ih/sndTvffMA0V0Padl73Xph/eS
 zxOS1nD4jR/5ZP3H8/4YJUfk09olWGe90EvWwLz0olWBTqKhKHacQWUfu4hajPacAEBdS
 D80kVhBhfx8u2BYklZcg7+2tKZLLEmoPpruJjYjSCJH+5eSpJpLa2rg7LE9Rjg+P+sA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BB69401D0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:17:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BF869C009; Thu, 22 Oct 2026 21:16:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:17:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 948491cbfcc08a3d541ab273e5f2c6be0b3b5777
X-Git-Newrev: 656caf6e50a51823d0b54fc2bf62a94f87ed978d
X-Patchwork-Hint: ignore
Message-Id: <20261022211624.3BF869C009@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunibreak: bump version to 8.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/656caf6e50a51823d0b54fc2bf62a94f87ed978d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/adah1972/libunibreak/blob/libunibreak_8_0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libunibreak/libunibreak.hash | 4 ++--
 package/libunibreak/libunibreak.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunibreak/libunibreak.hash b/package/libunibreak/libunibreak.hash
index ce3cdfd8a5..75f0c6a3e1 100644
--- a/package/libunibreak/libunibreak.hash
+++ b/package/libunibreak/libunibreak.hash
@@ -1,4 +1,4 @@
-# From https://github.com/adah1972/libunibreak/releases/tag/libunibreak_7_0
-sha256  8c9a6e121736cd0d5c890ae3ae96f3f4010a19aa040f1dbded833a62a87717d3  libunibreak-7.0.tar.gz
+# From https://github.com/adah1972/libunibreak/releases/tag/libunibreak_8_0
+sha256  9c4fad6e517338a098373acc9f35579ae2c325e6446666fb9ac2666ba15ceba4  libunibreak-8.0.tar.gz
 # Locally computed
 sha256  0c57e2ec42ece17791a75d2f9b2f8e0663181be008667a507f765b3ef22522db  LICENCE
diff --git a/package/libunibreak/libunibreak.mk b/package/libunibreak/libunibreak.mk
index d508f19eec..427f3e6d89 100644
--- a/package/libunibreak/libunibreak.mk
+++ b/package/libunibreak/libunibreak.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNIBREAK_VERSION = 7.0
+LIBUNIBREAK_VERSION = 8.0
 LIBUNIBREAK_SITE = https://github.com/adah1972/libunibreak/releases/download/libunibreak_$(subst .,_,$(LIBUNIBREAK_VERSION))
 LIBUNIBREAK_INSTALL_STAGING = YES
 LIBUNIBREAK_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
