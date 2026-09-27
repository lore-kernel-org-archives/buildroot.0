Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B858C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 11:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC21C40587;
	Sun, 27 Sep 2026 11:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8zYhNwvhj8B; Sun, 27 Sep 2026 11:37:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 005B5404FF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790509059;
	b=XyOV5CvJCYeMHcUd2HIAVcHrjA8uqTWQ7tho0EOrctuwNkrcVAuRGPiaBe5i1EQ5QXFy
	 Q7U5pFPrAo1CLcd3+8U4gYTqRntubemTqPdCVGny1zUeYb529Aam5p7P7feiwdkB9xN1q
	 51BH3XPLcAQ+pULe2unX/WyGUZRP+aObkEgZpTt3y6GdAbygDqsnXN4gMNgQ0LqhTm20s
	 CkATB7aDKFgeZoPLDYcvYR7ztHK8t00r1liiRjsOYh7si6Un8hqzSwg9a3Ib491tlCdlD
	 AeMb4/7GG62TiCLCjbh1V1AQPr4pKfDjKk14gv90gm76oxg1j+D0a/+aJZVUd7bum2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790509059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mm3+hoRDJN5tnhSmYfqD0fiBwJGxonh7jrO4VGV0lds=;
	b=OdQQEFvi51+dPoBRwpspi8GvH0jTKvoWa/l42XxJAdrd9WJd1pamfvJqVoUFChuudLEN
	 0gICjG0As2nuOpDVy0/pm05hT0xqZt4O/UB1FlN9HfDfc3Na2oTWfHu4+/sS6lydXynJU
	 athPU+IogpgA/yCmamXioQ/rUeRmb6DyZoH6I1UtE9tzUfGAZ97Ho/46Qj/WONx5Lhz5w
	 p/7cQIZVjRt5HZnKkfIwbiiARfOLlZSFa2hqXvz1D6J+Ir9E97oRjBepXEq/cuU01miCu
	 BpfOhrJ1DpNJ/WrNH6/8wQssS9DewpzF+IRV2bBpfAQdjs16J9+BOOXAObVBFSJdcEQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790509059;
	bh=mm3+hoRDJN5tnhSmYfqD0fiBwJGxonh7jrO4VGV0lds=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cQKSxINlqyiD8hpROhpJdLwjwAWRRO/DawSMIh1AB41A7kwvALmtO0txNYKOBF8q9
	 Y7qFEt5qw4sEBkv4DXZsJlAsdO1nr/evDn5zbpBJMaGFkxMgKqwWjbP4u2Y0QLhLgW
	 Y3JgYwKuq4AXKEo7LFic6xtXfh5xEkxNQ6WSlFIUOUt/vfyBQF7ZaW47tdEYEPDoUa
	 6Gg2zRKrN3CjyG7nGGGMyCS0oJTEd+c9EERFVx4FMTszstH6SVGbs4433WFsje4VHC
	 YRH/+OmPYTKa1ptWqS4G/BeRbIRL7mzTjovRUpKoeHFXRveZnnZ9uMXa4yEZucveTP
	 5tk/Tz15NkYJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 005B5404FF;
	Sun, 27 Sep 2026 11:37:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 266B1334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CAD3404FF
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dk68NbFUVh5T for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 11:37:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E54A6404D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790509057;
 b=i+5gnNNhP6vzdYEC2ru73aFbKa8OzrWWA9k6ZDykxeSZiKPN1ZN1SBBwQjYDor2cu0PP
 CPaMdvYqVfS/TdkZ/dWtPORgipHOGKI3OQtAvFu13O3DxMk65LWCKCZim/O/7c/k8O9cl
 AzwF32DF/8+WuoUd7HMyrN/iubkbm4AHDtNc+7NFcUewc0zeVPrW7y1X24YmRjSkGTa0w
 QCfQLbeFNxq9UM5yCj0LuiQzWaGXBufxVR7ppL8yMgMUE+++SJyZWp6syEIv7jsNJByw2
 lUhpPhO5gWTGUqoRDO44snL8o0hqFXP78Tmg5JEL/pjMvt003oFdlfgyvRjuY91FhSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790509057;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=AfUPHE9TfPycz8p8V8oulZgbujyY5aIeWzCrgGjnUnw=;
 b=Nz2Sw7/qFyHVCysu2qnE+lo3V5nc3C88RSciCW9gKAQaPDCAEFxC8VhUhdfC4dUSHdI6
 6v0sSB5L2AfYaFHPXD+Uw1x57QGE6Ne5LL6KUm2huC1BkPFtUcZiOhbkXx3e+assRBxQt
 00OnODkpb01oIFFnBQcfV/QVB+BRgyAG2okuyUwQK7I7Zn8W+joGXybT6LcA9rv+HaR6g
 jaMuz0AdQonIX0S2BBKa6skAqA9o0kCeVAnuaV1K+6zjwzvydZJh2xVzxQp6GYoAHzZGH
 /r+kggJtzeJWLpF4mHao9dFqm2a+xGwBN8I5MzB9VV57HJ9az33IkefsvlLQ/tCwbcw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=ASI3uUjv; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E54A6404D0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 11:37:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9dwd-1wh6aH2VMr-014GRs; Sun, 27
 Sep 2026 13:37:32 +0200
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 27 Sep 2026 13:37:30 +0200
Message-ID: <20260927113730.117619-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:g+HJCJQuQiCvIGxTxgZdPKbwUU6FMPQVWUIMU+CgRXe+HrAGLvk
 IOnsWI28bxgLahcHGYuABTJYNtxEOH9f4dn//3g3rsxqJVm3L0x1KQUsznq2ki59ipTt/RX
 bqf1JGPNgRR/YUkjl3MWuqZoyM1o9IqJNvIiHHy9qokg0PS2Odl0U9fiFachEdx0DSx0Y9q
 2OXWzKp4a3SHQyspqiDvw==
UI-OutboundReport: notjunk:1;M01:P0:Bkeg4PDeh6s=;eAMXcmpGmdM9zm+AOqZYpKSJheb
 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
Subject: [Buildroot] [PATCH v1] package/chrony: bump version to 4.9
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 4.9 (for details see [1])

[1] https://chrony-project.org/news.html#27_aug_2026_chrony_4_9_released

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 6b07b8d56a..0126d18836 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://chrony-project.org/releases/chrony-4.8-tar-gz-asc.txt
-sha256  33ea8eb2a4daeaa506e8fcafd5d6d89027ed6f2f0609645c6f149b560d301706  chrony-4.8.tar.gz
+# https://chrony-project.org/releases/chrony-4.9-tar-gz-asc.txt
+sha256  4924c6f530105bcd5b9e9e33c48a2ae1bfd889222c8480bc41601110efc864d0  chrony-4.9.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index d1745419a2..a42042744f 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.8
+CHRONY_VERSION = 4.9
 CHRONY_SITE = https://chrony-project.org/releases
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
