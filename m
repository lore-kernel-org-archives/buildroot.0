Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3CDCCF2E3
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 12:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A2F460600;
	Mon, 19 Oct 2026 12:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_mRQor1t7fI; Mon, 19 Oct 2026 12:16:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B2EE560612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792412175;
	b=soOSMaPGNKlIWDNjv4vXYMCKmjNY2joR/S5lp+mkiA05CdtB6ztgaLAkFL8loQLqQWKN
	 t+IJe/8ZFhH76+CI2Fn+EQk1wW/eBw/hf9PqMfqvEdcGlMyRtggtTgJHQCFZb5fcW0ctK
	 kAaAsXhBSorISuCmj9o3XyudV27dLVoCnLs44W8g1YRKB1HwsccyGuSfPkzVq7GJpcmu9
	 Jo7ZXVN86eVP21Q7is4kP9U7GhBKS2qupHXp4dQ+3DwiI9W1dXy3/btosSw1kbMZLDiJS
	 SkdD4dirUm57gZABTy57ozkHvZyuWkDVCH0K1G79N6jub5EncEeL1G/dxCTzcb2cG7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792412175;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+5NPG2cnsCD/Kfw+VlXga+Gc3bTjNhVW6hS+dWXYqbE=;
	b=Xb20B43KBVFP0ctnIz6JhWmnZm4/j62fA8PDkKxuDMwuoZCC1ijYOUbztWtJbVaOh2Y4
	 aknFwHP08bEFL3P/X4qfHSAxlnfiSwnIleoNuHkH1RTjnti9BOaMpgdNllChxZ/WxcGO0
	 r+/m2k80tz6ZZCh36oORGY5j/hw5S7RasdrIPj6MgHAH/E4qhK58s8BEWsX8PvXjRqw5/
	 Ks7PxSi79LqGFinNYu4XOXGsZ9baor+FbwBRgS8gAon0jD5Ujj3ZExykzjnZgV3jJffii
	 L/CYSg6an1sTEGlf0fzsj55di2RMqR8ty0UIgR19q73oYWsQemmqolSYBNQXS3UnShw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792412175;
	bh=+5NPG2cnsCD/Kfw+VlXga+Gc3bTjNhVW6hS+dWXYqbE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R0LU1w/Y7v9Wkanzf9Utws0ToVJXrtwLlHMFmOiCNVrriP46YjWghoChQVs+2f6rL
	 0ualFhSV5mISQpoP+cbs0m0R1TuwQYOCsdtbBIcYcvvfw6aIODqdcjrun/x0SOkxjc
	 HMzGmltlv2P3ihgwIS3ZjUckUfrYjElL3GGAenvXYKLf/N4HbkAKu99poeLRFd/Hqn
	 ZSNX/jJfaPH0xbcgLpgOOJktTTz30vxEt3P1F452r2FQgrIncS0PrMt4odGaMG94BG
	 Uyk5qbxp7yi32UuDS/JWjiIs1aREoXLYIPusXWbUrIyO+9BhbzRPhtKp07OboWqjFf
	 q/08zMqXSMSlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2EE560612;
	Mon, 19 Oct 2026 12:16:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54A07279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4690E40080
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0y-yYTPz2Nf for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 12:16:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8F73040079
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792412173;
 b=CuU0l7Y9jPG9py/5bXqsRJpWcHxfSUXaqPX8NaNj5uYCoUx3L/3lYJQENoogltiMZXYv
 6hOmp9JC5wQhDY8uoCXfR3stpjh1N1D3r4p3Pif48ikLxfzPZ+va6VCKgtdlaP+9C3bd5
 c8FchEmV99O4ajZPR9leacbhEDomQZNpBcZkSnro7Gu+MAZdSsWt51c2KCQH5f6Ddc33W
 CNzqdpVxNCD+42MJaE9JZJ9//J6g276iv0+XCdu8oMYAx3wIgbL8m8cQhSyzbPZkHT9cW
 WYYUtIY+dfIBQsBoczjOLUhkFF9crCzdJr+v0vXQe/Vd2y2nT1voUaocAlTZBggakmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792412173;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=767bUIIodKGI9J5nhEQ8IyMniEA302BRWDuccLNIHok=;
 b=BsHKd7DSPMBqXGlixbGONLoOIwgLvlhI+w06h+3K55R+YYrYPT1RQ3gGa0kxUL++3qs3
 9d9lbW50CQP6OmZATPN2LS/RXb01PVEljFtvH8QAWaHSWjsnO5OsQi9FGZAyB65usPvHD
 AzZpr64H84PhFne1hha5++YCtVcqF6G0F1j0dB1EGnv8uI6WXeNdpw+cDfm6bwxOhkM7Q
 tjd3wqdbmB/CobkJ9pU9j++MrWQhPZ0ykMcA8L0XVWgLXdg1b7/Mh2XVULrDft48Q4JIN
 2I3zoGZQ7OCxmsDUaBa9wb7kE3GNU81c9aWb4Ikvar7KJBSjI/6tWmnR/4Yyccb+6gg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="l/iyXxqo"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1335; helo=mail-dy1-x1335.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=l/iyXxqo
Received: from mail-dy1-x1335.google.com (mail-dy1-x1335.google.com
 [IPv6:2607:f8b0:4864:20::1335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F73040079
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:16:13 +0000 (UTC)
Received: by mail-dy1-x1335.google.com with SMTP id
 5a478bee46e88-3550c917fd3so2380009eec.0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 05:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792412172; x=1793016972; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=767bUIIodKGI9J5nhEQ8IyMniEA302BRWDuccLNIHok=;
 b=l/iyXxqo7eETQIvRQJBU3KX4IQ4Cm0XwoxN+rHtbSVc82qiWdwWJNp/Q95kb7QhAwY
 lveW7XUsUwedQflFAc18os3yuIZCHPRswa+JAgC5eWSFaf1/g2m+CLOHsY2ZtefsIlAN
 Q6mQMHs79VE+g+JNnvPKN3HWMq26raHWcNIJbCPTLm8Mae1j6uTPfUrE2k9MiOchkaYF
 1cZSQy0mI+wQMSiY60ELBNVKfkQ4WikNRu+sGksLx18PrtNk+wv7+zAIwhkchPnrOiLf
 k1wvFdoeTNeFLILAjLsIQabd7CVKxN6nDK/V9K+Si4wCgQsqOqZiD1P3841IAjqkxsXT
 mk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792412172; x=1793016972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=767bUIIodKGI9J5nhEQ8IyMniEA302BRWDuccLNIHok=;
 b=JxVIYF+ZFNIxQ0xDJNzjB3209VkO5zU/KMFD0/wgw9/1bp4W1h9zPPR0zNh2nrRRTQ
 LDTSLF2Adn8beh2XOTyoTX1lSmr1jmM/pbfD7/cM4yaqxmkxy/UpeGeYJoRLNcUNoHZ4
 dk9jr+xCtWYzWh6EdogmIxA6dBdiqIo6lax+nRj6n9geesxmPxPbGwExqBR8JsFJEqUI
 dWvQLD+Hhx2vS07qTOVdoLnyz4bmkCWZzuijMIEiL/aFdTYR1pusW93yY5jpK5o8ZNqv
 tjTPzSPxWJPCRgorBr11hj6pkgl+Y0IhRIyaZID7+99yyT9gO3YWaKzfNyl2BLgLO6E+
 t11A==
X-Gm-Message-State: AFq9FYLl/pdobMHRFSzmfAoks7iwGeo0SkkimW9+7GKfj7S3ffWSwzDN
 iGfEb1KHXvssrS38F39RXWH9vrfG3RripzJsWLHOpIj4C03BFwRcq9oUJlPLUYYF5P8=
X-Gm-Gg: AYBFou2PRtmypNGtYbFeFbtZEgM+rOwc27gCZ2Ys6Gu+BEbxl1BmycMArJbf4ZjcqV+
 dUP+3T9AAunrA8u+Sheaov3/DFvFtdN37nLq3VHF/f7IuWRhH8TVZkTftY2vUOcsu/3To+re86T
 s08K9B7R+MThI1+DhrcL8nlt6HkD13qU3awddTl2VGnE1n5DL32ppAVVkAGc+dJ26wEKDFK9Z+q
 Bv7jCuBqPoF9mlphdK5xpRB+WtkK6w+6H607KaNIz763bnmQ+NBP+1Swd2TgM9pjG+nDWCaCKWm
 ztHeiv1pcp+MxQfXK5k3y04Wx1tiM0HXtlsEL5dYtcPkpepQbp+YFJBda6JzqaxmT5Ocr0YEbAI
 sdOoCOKJqqJg6HOdrLlr6MR4ZrtedVu2vrqv98pgFB1Gthw0lTzT0cTkYdVn/CVcj2IgaqYJZjh
 9eISJ+atYSVXK5Bd1+q+hGdbciF3N7IJPuVI+nh7VQSg265XrNeuIJAs/zPHN2sEUmwisUYdCJI
 +3Z1S9EY2IqscBvhBz6iFfLZ2bseqG9
X-Received: by 2002:a05:7300:7aa4:b0:34c:fb30:3e30 with SMTP id
 5a478bee46e88-361a1268dffmr11159600eec.7.1792412172073; 
 Mon, 19 Oct 2026 05:16:12 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2405:201:9008:10c1:dea5:be99:85df:68ae])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-360813b6791sm36476347eec.6.2026.10.19.05.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 05:16:11 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 19 Oct 2026 17:46:06 +0530
Message-ID: <20261019121607.780131-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/xterm: bump to version 412
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

Update the download site URL from http:// to https://.

For detailed changes, see the upstream changelog:
https://invisible-island.net/xterm/xterm.log.html#xterm_412

Changes in patch #412 include:
- improve fix for regex-selection of a wrapped line.
- correct limits for a partial screen clear operation.
- update tables in wcwidth.c based on Unicode 18.0.0.
- update config.guess, config.sub.

Tested using:
 utils/test-pkg -c /tmp/xterm.config -p xterm
 (Result: 6 builds, 2 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/xterm/xterm.hash | 2 +-
 package/xterm/xterm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index 3438e7999a..93328ffede 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  7ba9fbb303dd3d95d06ca24360d019048d84e5822dc6fe722cd77369bdbf231f  xterm-410.tgz
+sha256  b48bc780c1cbc14f6d89269f7e593712af6095876960d650be28b55e5dad65a6  xterm-412.tgz
 # Locally calculated
 sha256  f272fa007de2cffdb22b4df09e9a3aaec3555d5a6913229b70006ee137ab22b5  COPYING
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index dc2f3c0e60..ee82551b4b 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XTERM_VERSION = 410
+XTERM_VERSION = 412
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
-XTERM_SITE = http://invisible-mirror.net/archives/xterm
+XTERM_SITE = https://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
 XTERM_LICENSE = MIT
 XTERM_LICENSE_FILES = COPYING
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
