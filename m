Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC73606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G+qt5HX3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A7AF8110D;
	Sat, 24 Oct 2026 20:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8Fwv9HIWWbg; Sat, 24 Oct 2026 20:56:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6697E80F0C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875367;
	b=ggEuxMv3dwmChONMyyZt2gL+szIE4zNwRbJLY3NmX94MrmlL7XH/qbObDL5SQlOoHwoN
	 zxBpAIR4OVABXXSuMkZa5ED+VohgtuOnv5Na9cqtA4L9Am34PyADiBwIFg9HSa0zIZJ+u
	 8HfItv8ZL7wusgGryYVhpxlRAaaFFj2Zmw80pLjBrmworKjSIaTjeAS/J8TNwsgKrEa6b
	 MyltvZ0HZv9ATx/ORbREvY0n8Rm5KrRosqkEXSBLGV8e0pEY6ZPNLpSJT7UxGEkyWEeS+
	 VH66G4YSDiVR/cpFxcjtzI7Xvw6rW/GUwH+25kiVuvsXwh8vDfX97/uxPNNjJcAr9KA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875367;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=C0nmIzVmx2X3eR5noMXxRSUEc7k21pgBPZIYdSZTnpM=;
	b=jUpChqCzuJOmeouU+j9J6N4+MnqEXuq19BJ38+iz99U7/4wNVzu6KjFO7laEsgYVrgVf
	 h+sWYg3ge+fau/Oq1Z14BscoOeFfprUN30ZlaHplow0jHQDupA12vxdTUXpx6MfI85yuZ
	 C0rYo37Y8uV3a5f+vGkCDfjqDqQuQOmh5UWl0pvgVUaC+K7q6/RzYyQQQ0cPOg6Ja0qg0
	 +KZk6nJlHs1zOJmClNVicv0AdAytMbEPvOw9EannmQhTZYG2p1+aE6oDmvYWqHhPmayQs
	 TyzopZNUTFPxv6Qrh4BTKWgoQeYwOWdrg5wK7rf6aCR3t4TgW+vxEnj0jadJCyNnQ8w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875367;
	bh=C0nmIzVmx2X3eR5noMXxRSUEc7k21pgBPZIYdSZTnpM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G+qt5HX3McvZtSXC4avdmjq7csU6jNfVnhCqlVuvt/d39kusYBfb+tN6kbyxdYHwF
	 3i4Cjwglyk/plGh5YU4Rdr6Q36Uwq0ym1+tbo+EFd1cqoSEd1/U7wJwF9Ta6n5ULxc
	 m+TYdOHTWlPETUay2+rK7Ut/ooYWW7C9NAGZq/GkLGzNjzQxsDZ6OXeRFLW6mx+Hh7
	 JYCyULwPMazWBsxytW/enYjzbICTeTgoFiQMoqeW2zKmMtlMOTnxLhSo71tyrumX4j
	 JF6kH75kXflpEmJeuxiOiWcX9XD0FSXxi7nJGrQaRUtdp/aPhjMRjiLh/JAJELgRtp
	 FVagw0Oj4t2WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6697E80F0C;
	Sat, 24 Oct 2026 20:56:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F15D35
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E1DA40079
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EigUovKQfb7Q for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:56:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CC0654009F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875363;
 b=JdWpv1LSpj4Xbgd7o3XHXXU62EZDR7hANvu3ad2NBTGTUtBWOGjz8jon4/b5RmSsyumx
 lxAY7pYmKH58x374YhiA6Zfc2vMfNX3PB4DkywahJ6Zzem6UpP1jqzmTYs7cg4Lq51SnF
 mjNK4w49tjPPLE0yjsQtRn178wgmWy4N83lP/j/TWZJkcziQ0bpYR5RSqIWtV6wjBsvOr
 E3nNSKk94ZIos/ckFwRfvi5wiR/rQ+To8uTmppj08i7l0wguXeEJbszXdpvnE4hZZaWf3
 QPeFo4wv/ouqlY5J0CAbf5M0GsvZnzGaV1006FqWXiH/Wm88KBdOToDcvzu5FVYDkKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875363;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=68HaHn0G+J7/ORJCpl0GpqMrm7d0xCcuSBrKn+HZfKw=;
 b=WDB3Tg/9HXo5iHjjXP7T1H4nR4kCODeEQVVrA0nb1JMFidRYm8r42+80tVp9EQReprrj
 j6s2/YxJlQWfs6kNrBHpjcgmjjXur2BOp1vyYB9yx4pL1KFCKdU6MaOsc8oQRACyKr6mA
 WIX1x4Wv7AVPTtKXmT6j3oGkV01QkjvB8EG9pvWdD1rz7NoczwRNKAe8jdorpl5aP0CS5
 pT1Da8m2lEHVHXjMT2LJ0hZlAL9ok2qm4te/0wdZ8hXhmWykMlFw+1cXX9++lqPU0/yqJ
 cgw0kvmqh6mIBuZKIJkvwkeJeVS17KFQ37rnwhwmRpeafhDPW738MD+AKDPvhvLDsNA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC0654009F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:56:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A83C9C8C2; Sat, 24 Oct 2026 20:54:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 22:45:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d39464398d3d14dd2176bc33cc8531f6f2299072
X-Git-Newrev: 66f318bff6b691f468d762177907b63be1b2b1b7
X-Patchwork-Hint: ignore
Message-Id: <20261024205438.8A83C9C8C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: security bump version to
 4.25.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66f318bff6b691f468d762177907b63be1b2b1b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.samba.org/samba/history/samba-4.25.1.html

Fixes CVE-2026-109411.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 10d881b093..5b4e95639f 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.25.0.tar.asc
-sha256  2e2cb7296833b35b8f7a7fb76045e0c57adc0c2cd03264b37df5d58e40f28437  samba-4.25.0.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.25.1.tar.asc
+sha256  7f367545bca69aa96897628f82f0f04d4b66b3bcb36cb978b9bb952c4b4c428d  samba-4.25.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 1fd73b2bb6..a1f056b0be 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.25.0
+SAMBA4_VERSION = 4.25.1
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
