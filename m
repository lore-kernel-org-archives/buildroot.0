Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5175D606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 13:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c6y7+JX5
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6AF4088D;
	Thu,  5 Nov 2026 13:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BYNZp2qVnNU; Thu,  5 Nov 2026 13:17:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B3D04088F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793884628;
	b=BLRio5Wav6qTyhIv4Japa9O0FoMEFdVBOw7TUSszq7rWThyzCM8VltqLwDPurHdIHfZC
	 AxpoV3SobQ0GrBvzw2ONX+DozSbEIzw5hzUoCF+wLkjb0sSCKXAxUOqmfXSp2gZ3kmrPi
	 Rp0/FRd5djtiwOqKG1TzcOsJILhvYnCnoCXPtnZ6uFclQyUljjb9zU78EcOprVNi3syMM
	 eMu2jSCRKHlICXoB+wqDEmTVpQRCJv2z9yaiZaWEPbz6jNjVrf+XweV7AKOHM/6CoLXMu
	 7zgf6ZNnXLP61jzegPX+Ivxli3VLu2EHRCUuLggOaHvBX9YghMpi61kiLjwNX7YuL9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793884628;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XQR8+3f/uDobNXHQI283dE6VATWm+ZnT8yIhEy7FZUY=;
	b=JIoEOkCs2onL/d2sMXyvs69TOzqR4FMloSQYmsONe9+/VS+wZCtO/g8s1KfeTe06wWmw
	 KICp9E2/wyFbrQgOT4QR/vT3OHas25jv7eT6190FjJ0ItosbEjY+tyZHIXu+RGT/ledNu
	 5oILd+cbv/QqcL4MZ2PjmtfaADdgV/h8HlNdv/j4rtoesz7JzqH9iUllu+pVU97fIxcSQ
	 oC25kDlYO58c+dkRDomn61ILsZDAeS1cZCbNcPa5itgpOdnk4r1m2DCN453nErcwLqqZR
	 PhOqTQA0AA9SqzCOsvq1cgAAnxTAefxuruBW0Jf9SmBqAaTg3UvXAMofkhoXgXuAHKw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793884628;
	bh=XQR8+3f/uDobNXHQI283dE6VATWm+ZnT8yIhEy7FZUY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c6y7+JX53cni8ZHyazFfg+BP5IzeBOqrJjsD5KARMdkhhpb5rCGWgChNJEeQYnlPH
	 3LCUFxmtXfHHqeuEaRpY84ojetC1pefxTJPdGC9h1854wzzipP+sXa/e5nSwl2up9j
	 E058RP32bZF6owSjh6ltzcmbFxMLRoUTRCDiOEkHpIuppB4V0ppQNQKAVq6WtabntE
	 GtRy9q9ba8nDoMJWUwaWoovcMZv3e0eONT77/jEH4KbCMwYB9tRlSzUbANrOu+GpOx
	 ocfHM78sjKWe75g8js5T8e9x5g85iphtICOAJLPRR66NkoVN0fi+0ZgNZHHVWw4xSt
	 W9f3QOyDrmy9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B3D04088F;
	Thu,  5 Nov 2026 13:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A24E5280
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87CD140877
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8HKDgVF6lud for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 13:17:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BD74540847
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD74540847
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:17:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQnF-1xHaxN23sj-009Qhp; Thu, 05
 Nov 2026 14:16:52 +0100
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu,  5 Nov 2026 14:16:39 +0100
Message-ID: <20261105131639.3779778-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105131639.3779778-1-fiona.klute@gmx.de>
References: <20261105131639.3779778-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:KdtJmkdhl4lkdF7bapNROopB7RsI5FpiuY9aP5Ht9auZUIuFWwV
 K1B5IYO6VOO8XHPtamw7IAMTXeMaYtV+Rkl84dxfcZz0RUnyJ5wZp/efnJgRl6fqc2WFOAG
 HQuM79HpmvspMF8c00Fqiu5mvnVg+VS8UZw9c8zvgXcRDJB1kISFjUlvmNJ419EBHmoCdFE
 2ozdaq1vOnVAdqGosbM+w==
UI-OutboundReport: notjunk:1;M01:P0:oa9vXFmFbhk=;MBXngZHPxvs5pKVskMdTnMYLhrL
 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
Subject: [Buildroot] [PATCH v4 3/3] package/lvm2: enable udev
 synchronization if libudev is available
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Udev synchronization avoids warnings such as

> dm-3: Failed to create/update device symlink '/dev/mapper/data', ignoring: File exists

and duplicate device nodes, in this example:

brw-rw----    1 root     disk      253,   3 Oct 30 20:38 /dev/dm-3
brw-------    1 root     root      253,   3 Oct 30 20:38 /dev/mapper/data

With udev synchronization enabled /dev/mapper/<volume> is created as a
symlink as expected (different dm-* numbering after reboot):

brw-rw----    1 root     disk      253,   2 Oct 30 20:46 /dev/dm-2
lrwxrwxrwx    1 root     root             7 Oct 30 20:45 /dev/mapper/data -> ../dm-2

When udev synchronization is enabled, libdevicemapper.so is linked
against libudev.so.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* New patch. I had seen the warning before and been surprised at the
  duplicated device nodes, but didn't make the connection until
  reworking this series (and the systemd updates).

 package/lvm2/lvm2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 2656d81716..504cbaff0a 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -40,6 +40,7 @@ LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LVM2_CONF_OPTS += --enable-udev_rules
 ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LVM2_CONF_OPTS += --enable-udev_sync
 LVM2_DEPENDENCIES += libudev
 endif
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
