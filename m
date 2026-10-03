Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AA4CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86381812E1;
	Sat,  3 Oct 2026 08:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nw1r2ZXFCQOm; Sat,  3 Oct 2026 08:45:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AEF7481222
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017133;
	b=ULJHLdY467F0nQsEb8xcJoMpX9qA2RwVftFhvSPRZAnr3JH/dMhJmFmA3du/mQojtkT1
	 miYH5i14ubPlX9OsPMqzFGs9xy2Bbz655hEyAT6+EmXrgZwkakEOSa5tQACxB3anTGGXf
	 JN5cvti4hlWBxqKyBAJPdN1D4DXm+tW5U9G+UvDxjdF7fBR5My9Bgi88tcfur+x8/clvH
	 naAtkgP2CDkXmWAEwu6H2EzFYCkixvoGEYiowfeH64z+tSvRADZAxLeral3aBgAFaAgku
	 tkFVD+zxyFNodILEExd+13XLgRlhVOsCKprknW4IOwjrxgb+iJrcDrhK1F3GiaQGMpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017133;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ONre+7OLHYgiBHDIEUSxn0r6vLahC6Ypcpp3Z8/n6/M=;
	b=NoI1Co67bRHFQgCVeHIfwccyDs95U0WW4qmlivMK3Uamu60B5AdLEM3itHowWNXOiSwp
	 uXQkJmdu1tuwP0sgU0jAyS3Ds675f2tkhWZ8oEBFmLWpDpHtR86T6jtn7/dU3PeYPBsyi
	 MneAXTd3St78TNXZEe0uBSlX7S+G1pP4QR41eRxszVmNynTVMYhe2qWNHKk3tmMkWbaC4
	 0WJkM8ojEFUqIiSba59mqXYz+Qhq4r/8E4LjrgUcg/C9e0pcGo5dEaYKGGdk0ZgUoBK1m
	 LjGGaUre8aQ+NI5Nd4bPTFQEra1fzzMwHVFvhjYtbvx+UR3O4SGt5GEek4IRp/teTPQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017133;
	bh=ONre+7OLHYgiBHDIEUSxn0r6vLahC6Ypcpp3Z8/n6/M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CUNqwPGesIvLPbN/CFbL6Fjbg7d+YhZ4C1+pIAVyTyZZLoGGFRyEH0mNTbJYST34Z
	 lN9KzpwwwvLGeiofTk0jMsfIQflRu36ddL24KUOPCr04q2z+8bp+KECocazgdx+aG6
	 IeAQzNwOQ8qRpbq/gQwgFd+AvNgMPo1co8E8LpVjybdmXK9A1526p1WcKaJ56v7i6o
	 Zgx7dbp2F3pRbvOhEgHcHHWZJMOAy6p4qss5oaHHm3yaEXgA5UenwiOAIn8KtuYJhc
	 TNtznTxg4nM2kipR6rroovs0RjtsfTBTJKA3rsjAvIvjoVR+XuCduXglDTTQnu5kDR
	 el8EN7C8SdD5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEF7481222;
	Sat,  3 Oct 2026 08:45:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51B8E2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FC3140070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJ00iHzD2UwN for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 53FB440059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017127;
 b=EDvbj37bZF7MrU/PZG4Lid0/M67Drjg66m05YEg6nRWdm+8uyBTXLnC167GwVa+YxYtm
 8GcU8UZMr6cvqd7uslQMsGw0efsOskFTokhoDQrj/ylIHXiXtwoLd8qICffuWyD3yMiQ4
 U5GtTadhaegZp/YqycDueNCwqGNIsKX4gEDEUOp34a2CDEjaT/UQ9It4rzq3FqpSfqUDJ
 M25O8Y2QpQFb7E1IaWS7wTmf5d1tvKe8GTcShrCGdDUZqSwjOD+BP74ST2e85lqgzxqKv
 dznvjueLWrzqFxrHo1I7ID4q+ZiJ9imgnTRzQen4Qo0e5GQtxpdVlGC/K0f29B7qMdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017127;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Ya7ErfcBODUbiXsk2DR/3RckW0BWrj8eZOzzGGYHoxw=;
 b=QEQxcYinaedIwqFAcV1W+rzpDAjoDLWXO1eJJ4ZEwk5AGpATP79eCthR8fs+BUNg8m+A
 ZapShvFRoTXALs44E2RIp7GP1nCMtBwRZZDvAWPpagII7AAGSmB4jOyDbsLXOdAA3pjrB
 eQnlKtkPH2Dxkvy2vqpUaKe3yXEXjTXcjK8D9lx8YbNT/x/YqoFqr0mHBJ87fE6y3Iohq
 ZXck+5hLFLI/VzditKCqs3F4svZf/qoCKFK7+O8ya9xppwRaYwkL4fgaFCrM1WWwKfnwF
 sXg04Yj5RlLLG+hrj7aeX4GPh3x1kebE7/njMcfqqU8cljAFBGDHUxiejyBNleBNEgQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="DF/nfhjT"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DF/nfhjT
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53FB440059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:26 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-81ba09a5d23so551519a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017126; x=1791621926; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ya7ErfcBODUbiXsk2DR/3RckW0BWrj8eZOzzGGYHoxw=;
 b=DF/nfhjTB5oGAGd5Z5pdQj45Oi6/tr6P1KvFJlPsTSfnNx9XgGLrXfKIZa8gJsch/e
 v7bsS0bW7DlVFDeCqEp7+tcSmQSErNhqHUjGk3shrmV9tohwwYY/lUN7/S3SCxsC933c
 bVheWPfjF/yV8S4fWorQ/ucqt9d5QHkxNZReNWX8gr5NJbe+YP5HtwRD2IJ60afu/x6r
 EA+ffYgaaZd4v9kTLaMJERQYpoNS5FbDB9Ejk2/e8KD3O01cRADNtZKBDrY+3BjED8rM
 wSH3fp2RuWEHmlmeptirKU8IakS647lC3hRLVhi63E0eMD+/FAqWUVTR3y+pKXwMwEQ0
 +NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017126; x=1791621926;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ya7ErfcBODUbiXsk2DR/3RckW0BWrj8eZOzzGGYHoxw=;
 b=kDajJ9KhKohxjXFwZE4v3XP80v3obvnI9M8QwHeembaIQfDZE9CEcwXB38JG7GmGLu
 BZYKF5paztWoHkJXj5JLnnBqiZBDAmXGvU2w2V26fJg3snuQ57Wj3fEWfRA2NPHPSeqb
 M+aFmL587j3+r8bW5gMdO7Oz5ugjh8ni/o2pMJ+G3SYstN+A634dIoawBvOKirSGWGTa
 qjOBdh+TLqSbaYHIoG8dRPEfFCH2yZXZKQIFGB5x9eWrugUajdjtUbRCK2ymQF0WGCy1
 hokU5ChGB/jFeUh4AA3VBOlycD+aA7+byfcSEVGtANC80QT1SaeoLIBk9QwqlyFkifcu
 OWyA==
X-Gm-Message-State: AFuF++kejswu9WtaP1ZLIJ5nRrk+lzjdVdw4m0sJ+XBpGYrvBKZhCXfN
 CQXxxX/SddRt8MDH+UlAyJ/2Iup4Sh6y4q9eDbSaVPd16iZsZdbeVt2GSGFOxQ==
X-Gm-Gg: AYBFou2oW7CDBS6HCXsW7OdW8F8bIValC4Jdye+NyoSERE5b7WGXN4so+cEzjFzpmvP
 KoxMuuKV35LY2kDP7L4uRggeydfn5Gd7pSNF7CSv2oL8CUL52lRPN6L90jaFo7+MZvu4sBENrpC
 QZs3rpsbStA/tjMI7FR8TmJO2kmCZ1isUFyU3Lo/OYqNxbWBUqQeLlQswep2vB6sOnqjSd2HcP9
 EyHWi7vQtWGSEIwc+xBWiJPM4O+oS7zuzG8eftR1YjghVpmIC6LBOg3G271gpITzGTX7cB3OLb3
 Og7yrK2/C2RCnC4YTbO5/WOpTi7uU/7wacRyokMZ97KjIX9XEFJVoOks7ySD+g6Er9nZ4Dm34AM
 w+J3dpkns6fOLX5QmJ+Eiy1RjZ8WZ4ax9auzW84rxLTqQTcaWXyU2tZqjaE6hOXbnOAj8tV/RTZ
 3PMWnwMGtG+i3mPy/4wBbCmoj13KBFOT7lKc83CuQgvM8xgYtQ7ZIJWGSHKi0qUsEp3djv6gIjU
 Nb+GJmFQ87TyvafVjtnhqnXkodPw9NyOxiuEhOvKGlvqFlfAHGI9N7MOLejmgJ3tvct1IktfQ1a
 x96gH0u8uRrXcyxo7KdU9O8qDC2rvspcD1Ql5LTtSAz1JI3xJTKXHfr8EwIIcqYU0///CQDDdob
 UqNKEjKk18WYNp1HKiwG7XL5vP9YeTB0Xvs1tfXijUw==
X-Received: by 2002:a05:6830:3784:b0:81b:ac5b:ea17 with SMTP id
 46e09a7af769-823fcc21336mr1799839a34.16.1791017125734; 
 Sat, 03 Oct 2026 01:45:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:01 -0600
Message-ID: <20261003084453.545653-16-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-magic-wormhole: bump to
 version 0.24.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index 2f03594cc1..f04a60770d 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  23f71fc6d6f78b93d419cee6d4af4d94  magic_wormhole-0.23.0.tar.gz
-sha256  4cd8f48a5c47f70578be7063f892988177681ab66845f4d6ad2d5eb03ce82acf  magic_wormhole-0.23.0.tar.gz
+md5  20b6a0c2f69f23c63eb15f166b12e912  magic_wormhole-0.24.0.tar.gz
+sha256  c01b4815878e5fbcad7a22cfa190c529349bf271164189a0ad955a34a8d4cde0  magic_wormhole-0.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 9f3b4dfe1c..d2ae7a09c0 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.23.0
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.24.0
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/d7/8c/964308aeed7b828ca726da4bbfcc8f2bc89713b39ba768e24ce6331b30f3
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
