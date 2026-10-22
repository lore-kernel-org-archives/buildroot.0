Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96047606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 16:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=enr8rA1b;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org header.a=rsa-sha256 header.s=s1-ionos header.b=C7O55hEa
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E6ED40583;
	Thu, 22 Oct 2026 16:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6HGcp2LqvFk; Thu, 22 Oct 2026 16:44:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 883A4405A4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792687462;
	b=Zcen0K4jOphU/KbGUOaQprBFxWkM18SaIC7UlnQ6ubjjZjUZBjW7isYKDyLeevw/eIr7
	 DGVtKUVoc/P9EZbzB/oYqEC+HCHWxvAGt2xO9nLTRqipRaGXHWs3lCI8MUgGZFxaJp5XD
	 9kNrTrETjaebx71YvNG1d0shz9k3oxcLXhc8R+crzEov+v0oex4/eIqd+DapgwH9V7XdU
	 svAmDVo5ISzHmC3cIotBjfWe1wDXZAOukWaCyQzArpbRuC4zYZoeB0XaxyPAkqGElA5Lq
	 gWYY6sLUlEifkVbr5eLwD9/neayMSjDPuPgKMn3+aJFAlBoM4P9rtYqeqy+y4brQ5BA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792687462;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1gj9Qoq5rw2926mFA6USXlNPx+8Fcelz5jgLfiPRYF0=;
	b=AkkfFSNBJhxngSEh8LOOzHvuypGplq+AdK23MRRZPyd/4Fa7LwyYSXV4iPruQv5spOh1
	 8OPNVDF2FxDKKDixbiMxWGqmekwQo36qczCFdcvX4xnjhdQniFox7NJDOp1komjclcvWa
	 lzrY3eafiiYexgziKLwgjLfScSRLwRfNBukrwyeVQxqiDewteTPpP/RQ7k5H5Q3b4oVBU
	 wzzIKwvFB1VfjyHlYoGp7eXuy4vm19krljZnHI2wEG+6oIVLiCP6HSIzUAoZ/6JkaVHEk
	 VPqsRigXwWBL9krjV+94nnYgKG+O7g6DtIuLQxJ4gO9UQ7BIFrY+uN+LPuSkj4kpFKQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=paguilar.org;
	dkim=pass header.d=paguilar.org header.i=paguilar@paguilar.org header.a=rsa-sha256 header.s=s1-ionos header.b=C7O55hEa;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792687462;
	bh=1gj9Qoq5rw2926mFA6USXlNPx+8Fcelz5jgLfiPRYF0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=enr8rA1baqxt07+LyJSktgwrHdYhkcqsRO6lY6xz4CuDMIBWJnMS6RDQ6/lxNxyhz
	 N21x7WI/cikEl55NhwXYgTDRx+n3Az/Y6L5uFL/Hyd4XLF0eelrZLTGKou2DQkPlht
	 LFxCUBZU+UxkkU6UXZa/TTU8IvxmV45RwsSAT39/zLL8xLLfcn/taj4+xnb7CH05nY
	 mREnE4CpK+g4vukxMRElbNJpEgIepmvtSFMZI2as3FSK/cWHPsyZY2+TfH75pZtTW8
	 3bC9bPddAxfc+ZQN6Q0VdHzjfrh7eYzvR5DXPeKjWlox5QuKuM+bEW8qyoK1NAckl6
	 1rkC9jlHs8LOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 883A4405A4;
	Thu, 22 Oct 2026 16:44:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85504356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B02D405A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIvsAw5vvHHe for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 16:44:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 958F640583
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=212.227.126.135
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792687460;
 b=UYa1NqA9LF5O2SCHbaGbKrJln2cGqKKALVWECFG46XFb5FnDh8MQn6lTPh9QLfGQMKGa
 w8MYj3fv1KY/JGv9/AMCT/rUlIS2+nKcc7AKwNRzvrXkHVY9nMxzaCYba7IAzr1ioUFPj
 AGr/YeF24mSt5/5YwoeCZqXONDTwtRiKmvo3g4s0SSPJJjJ6BLq29lpbtrIFDNzHhTqS+
 JCrBdrD8VeEoAqu+rJGSg+bvVeXK0+FTQjhxFPerjy/Bbo39vVnY71wTByFePN7M1ygeP
 XSru7ozFW+cQfchzQ2MdR1bzD8cjTD9ERcn7W1T3T1lQxLJz/dTnbcZ0Wm3OhHKliSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792687460;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=7wZDYNI/8kgkox+19eDdbNqGs+os3ZYD9uIVIPnhq+s=;
 b=kSRJYAmAe3ffDOb6glzUMbBvKAn8Hcm4iimkTtVP7eSNF5cqFrAZk7Mot/cZRRyeE1mx
 gw2htlFmnRpvDouLKVlcwDDAmr126vvkeNSL9ax6sQVn3r4y+QYC/94fl1Le1IZTEdvYe
 sQU/IvnYY+PDyn+1OitSUlQJj0hFuJqZyr9BqY/I8M4o3hpfDKRn680qLiYbBe83FvV/9
 8nTIOHl0s42kcazSI+jix6b/aDI+sZlW1neTelDDPW1J+Lpkj0+c17ifwZ2YZ7TaP10tH
 zeCarG5x9gOsNnhr93jk10fgWABgwKftNNdOCW8YMRuRlqSliefFex0CoMy9P6JIlbA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=paguilar.org;
 dkim=pass header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=C7O55hEa; 
 arc=none smtp.remote-ip=212.227.126.135
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.135;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=paguilar.org
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=C7O55hEa
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 958F640583
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paguilar.org;
 s=s1-ionos; t=1792687456; x=1793292256; i=paguilar@paguilar.org;
 bh=7wZDYNI/8kgkox+19eDdbNqGs+os3ZYD9uIVIPnhq+s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=C7O55hEaSYfiHEaDQ8fIktzT90TfolzMXl8H1uSVVkI+wGr4/VwHHYiP1vMFmEU4
 ZYdpfssjs1HdjN3StxNp49MJJOADqrm8f+X587bPY6cKkouUs2yDG3qR4LO0R8qrP
 c1zLg4F+vLEHJ7TrblYD957jndcZVc3Sv7rux7QoeBZaVlZYKJRMEtH/ByjJqVmrf
 Kx+MdLC0z/H/u9dsP6GWCYyjpUU5YnCCI1AqLG0sFVYWIf8uM8LK1trfh98M/M8Zm
 8+dj85d/ekoF561iFiBfc5CUE1fFYxrdyVlgXE+5piTKHnZF2ZmEKgTmq/UYCWdim
 3QwFrq1vwPbzwgGMOw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue012
 [213.165.67.103]) with ESMTPSA (Nemesis) id 1MKuGD-1x1Z5P2vxl-00N9FX; Thu, 22
 Oct 2026 18:39:10 +0200
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Pedro Aguilar <paguilar@paguilar.org>
Date: Thu, 22 Oct 2026 18:38:57 +0200
Message-ID: <20261022163857.11112-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VlXn/QG3zwte7MQUoW2fz1jCFuZitW8JKs47hzSQwSKhsEpYvO2
 sXn06+mG92SkRRWCziyTRcPQcrBwfCAirgLzh/TKOWULNi2RWUX3cqws3zB4nC9+nJQEBCh
 Lsfis0Z1K0rTmqDN1Jx1tbZSDXvdC803FTw+SW7BycCpWg6mTGneluXh1nUr7E2i53B8x0V
 AkIg+BPhJzhvj2fZdQWGg==
UI-OutboundReport: notjunk:1;M01:P0:c05hEoKXNmI=;jYcy1sSOPk9nY00FoZPps+L4ywz
 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
Subject: [Buildroot] [PATCH 1/1] package/libunistring: bump to version 1.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://savannah.gnu.org/projects/libunistring/

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/libunistring/libunistring.hash | 4 ++--
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index ef2f3da341..7fd66628ff 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.2.tar.xz.sig
-sha256  5b46e74377ed7409c5b75e7a96f95377b095623b689d8522620927964a41499c  libunistring-1.4.2.tar.xz
+# https://ftp.gnu.org/gnu/libunistring/libunistring-1.5.tar.xz.sig
+sha256  fe89007a8a414ae4790b816b86859e877d3ab135db3c37f06541ff7e85ac344b  libunistring-1.5.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 57333a35bf..00d44d5015 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 1.4.2
+LIBUNISTRING_VERSION = 1.5
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
