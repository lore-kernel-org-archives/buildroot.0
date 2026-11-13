Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97258606A883
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sgqeS+cF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7155440CA6;
	Fri, 13 Nov 2026 16:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZ8IJiIvi7OZ; Fri, 13 Nov 2026 16:41:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C70E1409D5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794588104;
	b=ZtK+1yzbv4Ei5ixD0vnODRn2Ho2DRiJauEIuuTjwr/3ajx3lI89ujvyTVSyac9A5ay4V
	 ujFeiHJrEnAfNDjcCv6zmsqKbD+I9vQrXqFD/6cwsNl3r2RNMdusjlMXRXmgUS0ie1f4Y
	 L/+5Bz3kSonCqsLlG8teoCWfbzoU8TmYl5yl5fxd7feylYEOFEKkGSkjAZFUPTVK797Fz
	 TcA7sgpV+0mZ+LbhjrJs19p96UwVnbuU+LwilLKzM3JXl7SqUhJiAsybGZoq3GX0C5h1a
	 H3RxJ++mk4g27n+1sVoEUH+nhJOwVj1Jh9AAc3hdp0BHrbDEUG4Ja7K0b6uNXsK049w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794588104;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7GGywy8MYLngK9Tupsy1wm+2TXJmmvQBN8rnzdPMFx4=;
	b=Er2qlpJcp3bJMliAfCVwJ54UXXFJBE3UoRh0OHxOiU+crZi5/PbR2jRKJ5VM0pIC1Wqi
	 yewC3i3mDlRGZHjLgeYqhhSaoNwyI4TRZ0BIx2Pq3scr8SpyeUDl9YVb94DEe53W5cGhC
	 gFrCrgqaipE/Wg3vynEfsPuIypb8+2VtBwiSMz8xQaQeOeVXRLRg3tiscd4uhay4zEQ44
	 djfDLT78fLnoR7P7bsY5qrlaIInaRMg1PTvtnADYwAfKKfHX6sTZ7ihbMv6VSqQ1fZdap
	 Ssvsswi3gEmI7Y+yhZuYbAqWz2QkuVA7/srHJykBqQNERTUgs9ctChcgOj+FlPN7qvQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794588104;
	bh=7GGywy8MYLngK9Tupsy1wm+2TXJmmvQBN8rnzdPMFx4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sgqeS+cFbSZ6vn6or0ZpKjTo/jO5Yhde70PuA5q0vILJs08N5dOPYaqGEol62R4+s
	 YnwCOsexKv9k7tSH35xiVzUFjCGGdJD+DSA+XQOMdNmHrsbbzL5dOEkxURDi1xIBoV
	 zQB1ulZcsJYEwtRh2vB25WvZx35xUCUU6zyHv+8eEWjk83f4x8bNaQKYmF83PFZCZF
	 RvowyZeRdfngw0LrudT2nuNNhis0guH3mPnrxhfK6B7m1AQlV/v1PZcwgmfvXKyZ3e
	 +MYuUCXWfzjILU7/Au1U5Q8cEt12tHCb77v83o6enrUfC5XuN05eZN2H8iUAc9izOj
	 KGkYvgHBpvTlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C70E1409D5;
	Fri, 13 Nov 2026 16:41:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9628528C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 16:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BE426069B
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 16:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSTkeRKEkELt for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 16:41:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E780960733
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E780960733
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 16:41:41 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794588099; mf=PHBzLnJlcG9ydEBnbXgubmV0Pg==;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.net;
 s=s31663417:rsa-sha256:s3a3zD1V7n2KpgYSLQcVUO/kHjHu
 GwEi86T9/40drF5FsDVpI2zFIQUeX8aJnbYdYi01sEBWVUbghfFz3TTXq/SbZmZt037OYHvJ0R0
 Q9hD9AtmuR8HIdQ+FEUVAxvApwVaUstZwO8VnqqNynJXvRMQRXMlcTN14q+m+Jy2xxHb9HRc66z
 2CmdQByKAYn8HFSqqFlZSVkcoMdR3XXoDn98ctWNsf7Gxu4ufR+aKjN2ABRT2THyTGjFbbKA4Kr
 r4c5w5lrPZqBKnLsYIPPDOKMPVxFSVfopG6xF3uKmi+8wkq6/HxZ1zlbG/o+R/DEER1NRLPrFb5
 XfgI8DIjOHamYw==;
Message-Instance: m=1; h=sha256: ggmP0hltTitKpABmFQRttlbeyk6ATRFLwACpAFEIVEk=:
 tqugOoCLdrqj9D+WSDZWivUixuvD2hkfG1lzfD66GRI=, sha512:
 3rFSfA86NipNfUYCPbdZOrfbbDcmSrOzSDCwd3ujbHWslzoEJ4MbQ5mcMzy75xuxCYQyPVHMDXacgMy3j6GYpA==:
 8TMISKqb4kq2dDKDNdgl8NRtg4+RzDc3N6Sm4LucGSDBrcvHKmEhae6NKNWhwnYNYfuhKJm1bMMWlSYepP9nIg==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mof9P-1whVmq3BF3-00imyh; Fri, 13
 Nov 2026 17:41:37 +0100
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Peter Seiderer <ps.report@gmx.net>
Date: Fri, 13 Nov 2026 17:41:35 +0100
Message-ID: <20261113164135.3036282-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Api6tawd/x2BkysWvCvZz20i8inpL71Sly7Fe+gkC4wDKAeV5he
 pag6LDxun0XMJKNazHIN9AdqD10yH29EeejRO8JTB/FvVEIIY2Po6wG4eL90pZKBL7WRQV5
 AvEq6BEVHir8CJeISCx10MVW0Xp/d3HkTvg6bFBGuTFVFmJc/ghPl8gZYnPj8HRTqjKWo5Y
 sVGhqUVJ5QJP/JJ6IWoJA==
UI-OutboundReport: notjunk:1;M01:P0:OabaRtiCNoU=;JDBIy0L6VZHGxD7thGaAhEgnQLv
 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
Subject: [Buildroot] [PATCH v1] package/eudev: bump version to 3.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- bump version to 3.3.0 (for details see [1] and [2])

[1] https://github.com/eudev-project/eudev/releases/tag/v3.3.0
[2] https://github.com/eudev-project/eudev/blob/v3.3.0/NEWS.md

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
 - This version bump increases the target install size from 11.8 MB to
   14.9 MB (according to graph-size). See following (uncomplete) list of
   installed file size values:

   eudev-3.2.15                        eudev-3.3.0

   /lib/libudev.so.1.6.4  199K         /lib/libudev.so.1.7.15  339K
   /sbin/udevd            435K         /sbin/udevd             927K
   /usr/bin/udevadm       459K         /usr/bin/udevadm        979K
                                       /usr/bin/systemd-hwdb   879K
   /lib/udev/scsi_id      139K         /lib/udev/scsi_id       275K
   /lib/udev/cdrom_id     139K         /lib/udev/cdrom_id      271K
---
 package/eudev/eudev.hash | 2 +-
 package/eudev/eudev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 0e24957621..58aa19b695 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3  eudev-3.2.15.tar.gz
+sha256  8fba6e4f49ea4b1938828a3c2e7cc48874816c68621386e527076b6477f5d6ef  eudev-3.3.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 0deb0e53c6..21b5c5100f 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.15
+EUDEV_VERSION = 3.3.0
 EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
