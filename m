Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CDF60A2617
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 11:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ICPlldgz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=JGPJLiA7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3F1D60615;
	Mon, 26 Oct 2026 11:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAPhF-pY21E5; Mon, 26 Oct 2026 11:19:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F1A3060600
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793013557;
	b=ECG+73TTmXHDB/HPQkmRb3VLIKTsh94xjihqDugtedyG0Wt45dCI5lfajlpDufmP3eqa
	 MRyXDfH/Kkmr6S3pAeWjlt5eUEpd/GN2e/XDfnC7PPsMZiFAIy38itb00hfTOrt5Wu98/
	 QvMOUk4wkPE5RAPl8w+q4IO7OOT82eyqj5+d8bAqBgown1AYTve69KkyqcXho5aIhtM/1
	 Gt8aF3R0AXClDwpQoVvykH8RLlPW/EMCSw+AeQBQeoZTrHC/+QSkzCZvmVrsJOOfRzo1E
	 yjz4nu/05j4dD7ih2lopSbNfCNdrXU6X8nsoXZrwuC57zdjDtuwba9seIpCj0R3KQSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793013557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PcIb2kO6DmrexXep84ytNQGU5nRrPGfv2Nzmse1wwP8=;
	b=fq4YYF7FPDzmb6jwI3u0VlPORlQvUSub0YmKaByAtUFfJpFvaoPnDq8dtS4uNlXM25+V
	 Ejgpa3bH7NYrKexSJJR5ohScSOExi2hTaq3xVugrE7NWxJafgU5LErMvASqwee45lqwbd
	 6zgSNYybWuCnX/Y9qzBEJexdbDVcuQj5nfrKs365aV7BvlozLYsgfBwkxtvybLuAmMdSv
	 4oVQai/EWj4aXZATuo+/XkJx7tmSFYMThswsU5xbkVBqzWoK32avJS2sV2itOAI6s6Tf2
	 onQUJE7XCoLWLBgEO6MingW4IBskdPjc3MguZMiuAXpe7sVBBkJMJAJYbpdx+37lTug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793013557;
	bh=PcIb2kO6DmrexXep84ytNQGU5nRrPGfv2Nzmse1wwP8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ICPlldgzOHkzfWKohRMgfr2i6u2MZNsjAM23P015UdrBmkf1RwwfmKCQcInmnAILe
	 TwSbFwA5RyLAn+0LV51PRc/C3cq2pF3JTDcURNKTD8NNzF/xw6K4bp/njVQ2zGIMYc
	 IHhQXarLjuAqeozMiSy2L2ZWlkgkdLFnjjOr3iAolqShlvLUfnFG97hI97WEwihibm
	 4XDD2a7TfCvBNrc2DbmE7IKJgFBIQ8f4/9OEaXmaDLW/5cKcND4G7VAoMrToBOdB84
	 tjf2PlqxVYznNHNaPp7dNFEvfv2YhAd82iD7SldY4aCuxH3hvXSyIHvH93PXwEt5bG
	 f4T/KacCuI0hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1A3060600;
	Mon, 26 Oct 2026 11:19:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA71E4D1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D08B6400F8
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dG2uNl0xgMaG for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 11:19:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BE55240072
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793013555;
 b=rhZ/0JJVGtlfQu3xSevniqpDu0FU1Kt26tJC80HOx/GSGgR5rpfPB5zBpvbdIV7I//a6
 X4iN+0OZh5l9uAmaF1e4B7zQtk0rVK02F0iKgEQiDXhwE7gMxZXkbsEMnJZm+22glrkBZ
 B2BwymufBS2/MF/Lyly40rsmwMyDMjR9h0CuaYU9uQJR3l8dZiGMfU5chAGRuwibm1G+I
 aXTHVla7PwpVFpQpzHbzoV097SxaseKvGSyjyU9aZspzAdipdM2zbZi3jms4ck6uZwT9F
 JJoVnc8Yebn0FV7ti+yAtrikgmxoybNKvHDjEoR0AMHGXkdePpvVQe/bpjQkJ6A3Ajw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793013555;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+R65UFXILrru8keUOKty5nbua9poRoSD8Fs7tG2C7l4=;
 b=hYqSieTR8IYxCJPlfcGfepi4WW+mUN9R+rflMB/3Qkbwyhhyh6tCxxJTGUKbXzLkxIrK
 1pGoXT1li7xKB6P7orVTQPkp4JBZqbeKUs6s+c+x+LFrPE6Sky3IS16h397aloI5wBuO6
 i+vbrRm6N4sWn3KfUZr47Z4E12O6VF/YsoWFXanItsLsly6XylqhWCF9ziMgYGpWUKPn5
 f9AUqyPxUoqtu2pRxT2m1aJ+M9yJJ6vRH46/K+9SCHVRqe8FkA4Ywdafs6qodrbum9bpI
 XtI+0UKsTQSTweESCROZWpbKVeqjA6/qIPtA+N2/u505UPOpIG1xwMcz73GuHuPy+KA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=JGPJLiA7; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::632"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JGPJLiA7
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE55240072
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 11:19:14 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c40f29667e6so455304666b.0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1793013552; x=1793618352; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+R65UFXILrru8keUOKty5nbua9poRoSD8Fs7tG2C7l4=;
 b=JGPJLiA7G0fHwBFpPA7AUPmzcGh54jLddG2ifipZeS0vDY7zHsqH0CI/3S7CQcy3NV
 N3fhAsozTKeEIHOxONRLQCCej2jGmK12ZR7nY0DloDxW8g1sZgt4vxDGM6IlnEy2zUY3
 9q3UsjLzdwbXCW3v0avOHsTRbOV0NCml8V8J/CRaFnVaAUJU60AQTG2LjV1UBuaNCD/v
 xkhSxTLbvXK+PTFAhVjOdv7AZtWcqrwVq9cmGBwQoiO/qtlQIATKmq+vFode1M9WtO+1
 ikrnG/0w/viOPIBARv1n6WtRak0tKJeJjVWGiq50LHtP1opUc8GA5RFGKWdz8ichsCnI
 c8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793013552; x=1793618352;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+R65UFXILrru8keUOKty5nbua9poRoSD8Fs7tG2C7l4=;
 b=CX+kp/I3BCI5PIdbsNWwiRhpShp6oLVvuKdhp0M26C6VQATKD4YojUXyDeMTIpAfuj
 9ag06drYWNBeSI1DA6Jrer3hUiwN8hKC4Xxm6roKzDSBTxV2vKYpZie1brnQOnRjci0n
 nZ+Kxkcvu1vDPAPyJ3Koxt7LL9H04ObdoWfjc37SotquzWKz0yc6ynjB/YFZJyDvcdPL
 //0SPmJZR8U5HxRmi82E/0IbD6qBrssNGJDYr92aX40+z+UY2DfGh15kIJYV8HdYjN57
 FSugB3Mu1M6u+IuDWVf/O42aQnsBGdeIBHVLORT4VqHXJMCYSvRtHh9vX/X0RiGmbg84
 Zrag==
X-Gm-Message-State: AFq9FYLS/nPdWyCNFQoXfDCDgt2bfIBAl8BfrZK+6LgmJzJB8dbqu/AX
 W95CiwPhqXnBd8EEPxylAfELnjHBw0oGdQTKI/S3HKnmKDMhNvBfZFw/mQX3bA==
X-Gm-Gg: AYBFou3kpd6RftljOCCz0rHUslk2vdRSEh1dSZGACih6GEcjagJh/cE8zJob0w2U06E
 nD/P7fxZzf3cALw7raZzuWDa70tx/vBp3TVm9iHQXHQeAExlDR9az6oXlsqy4Drc4e+fFgnfHKL
 d+fCgg1GCY2luqabnWO8ipNukcWGvROJUbhbLzqjL2TXYegkOKx6+pJMtCw4SCFvj8zl8Su0VsN
 T2gvmmEkAq9Eo6yrMHmArXc+kuq7pyXJaFMvjvmsd7sD4sEvDZqPc1Isw75a1L4MtFOPnVAMIiX
 9ZogNcCcyJW4uvVCXt+OY+DEDyqtlvJjXmoOhqvr+7f+wDiW3sTpzQ3Tk50t/kkEeEIDIVCFd3O
 W8Vdf1Zm011YuRJ+uBKLYi0rdMxO1+C7bZWg2R/RYWBpdMMyUeb9dPy++SDMlFpQKO8DdCuW4a/
 n135oytrbrfiwE1ArnX2DBHvDAcecUxyoy5YFt5i+PykG0sf/JM+GcwqW21DqnEnlLI6xLOzeW4
 vev2PqSo2g9voxihn05wdCbvQUI0XpDz+lxtpEyhGbO5HxcbrGkpRhpKaunXB54uiPAXwbKWEzb
 sEEqfATBeFsK21L1oykg5C+F8kB/k9rhjCg=
X-Received: by 2002:a17:907:1c84:b0:c41:8e21:4d58 with SMTP id
 a640c23a62f3a-c46bda5675cmr772095666b.5.1793013552078; 
 Mon, 26 Oct 2026 04:19:12 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79eb05sm307035166b.79.2026.10.26.04.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 04:19:11 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 12:19:11 +0100
Message-Id: <20261026111911.756778-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sdparm: bump to version 1.12
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changes since 1.10 include new SCSI mode and VPD pages (e.g. Command
duration limits, Zoned block device control, SCSI Feature Sets), new
--out_mask and --examine options, and experimental NVMe support for
the write cache enable (WCE) setting.

ChangeLog:
http://sg.danny.cz/sg/p/sdparm.ChangeLog

The upstream site doesn't provide signatures. The tarball's sha512 was
checked against the one used by Arch Linux.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/sdparm/sdparm.hash | 2 +-
 package/sdparm/sdparm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdparm/sdparm.hash b/package/sdparm/sdparm.hash
index 22d6b5b87b..6c509f1657 100644
--- a/package/sdparm/sdparm.hash
+++ b/package/sdparm/sdparm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7dc9e148cef22744e00809dad21b59ac544e3615001bc1b2399978f73e1d58ca  sdparm-1.10.tar.xz
+sha256  c4c9efafdbeb662e2f9712707ec490932bd4d010bb1129ae7a99526546eeadbe  sdparm-1.12.tar.xz
 sha256  4f98444e14adb18a94a65c3ded5f0dad42d382c6a2288b593a2d5bd5ecc4f46d  COPYING
diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index b9fac518c8..4c1aa42f4c 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDPARM_VERSION = 1.10
+SDPARM_VERSION = 1.12
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tar.xz
 SDPARM_SITE = http://sg.danny.cz/sg/p
 SDPARM_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
