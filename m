Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D68ACA5FE8
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA04160E10;
	Sat,  3 Oct 2026 08:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVvDyGMIECDJ; Sat,  3 Oct 2026 08:45:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F32B660DF8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017137;
	b=sB9ppMsfrepD2LTcGWKp+stPjD+Mj8DOatD2s9oul2UbE2ICKFU9UCFOX2Tc6EpkmzdP
	 RuMfZNvsvAptNcuV8gDWzlmAL3OewKJy03QtHCDx9W4dnxrBYmB+NugJkvsfQxyLBVKhO
	 nu4dmiAMEocMeZfYMtTft0rP4xP3j/YbcYUIRzX6NTsAXu2gWnNLfekwIomvvNq64fpu2
	 e9G8+snb7HGe7jJls4dEHMMSRgyuU+r8Ic92bYxnMJ0yA0Ho8oQmCmcXgm82QHcCxwL58
	 nD8HxoYxVMge4LVAcBnp3mcJUU+Q1tMu9g+2+kTX4mkX4nxzvRwBQAq+rURGSSolaSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017137;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bRr0G1RYWlNJieXgJKMuR5YmqgNpxUHrPyxjzcus6o4=;
	b=YNClfg5nCrx4yFE88ShtG3Ab2jIxT6s9Ui5HLoAKUb5Osw9xg2eYYCkbLk4gizvwnePc
	 UTdv66cOJ1JZaCHfHPOOei2TX/WDu2j2bjaeZ0voMbCTq7e5HZEyKgM3q30Gl21K1/h8k
	 7p008o4fjMh1ff3Gc3dLjtMARJ8I0kIc9Y2IXNMc1lYMRGb5UimM1Ltcb/rChzplcUEFx
	 bhFW+r7NMDi7Yld+rNdOrpfPAMl9pJltNrCA6gX1X3MEIfoQO/tGtvZUwfB8uIQJi4Ih3
	 /j/LRFyANG0KQaJBu7eHwpsIvACDzo/AldgSzoQ7jQB4zTkDTvbl7936EXHbsonh83A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017137;
	bh=bRr0G1RYWlNJieXgJKMuR5YmqgNpxUHrPyxjzcus6o4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CAF7Jue2XP3w8en5nlasJDIyeUXitC/01FjCoKSa1BiWrAPoCWs67JrdI6xxriytz
	 HfDIOO1sed23ohHcrOHqNWG7A7jZCPVmWZ+Asyf7IYVZcfUuSb2qexv20j9oNbTBvx
	 S4CLYT4xVQR/sY8zHQx2XFv2a12W7ecd7phCHG+8hFNBCS9f9t8Getk/sE+NcWwCkK
	 hYGTVOYlnGEY8DcJv6x3gkZrcr8LFFZvH5V2iJGml9UhJO/71ow8XGOdzyQkXgQwtx
	 ytiY0AMh/6zC9RrETMneWXdgCVw/c4MIxpdw+tFv+q/SVijK8K3S5R9LZB9smFY8cw
	 64ZbGgLy+Qhmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F32B660DF8;
	Sat,  3 Oct 2026 08:45:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DAFD32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F42981222
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AzKoUwAhEqq for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2E986811ED
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017131;
 b=opSWDib7eqvhturYJ20bjJau742hS7j95ZokC66y44jZ8a/R5RHu74dyetLe6+cuVRAn
 MuBraY+fcgPOVWRIo1qnfsWQQt/cbAbXpUiS23rbrV2dhM4uR+Zwf+9m6ltNjzENOFl9g
 mBXyHSvufenPVA1etnWf7gv9hfjbAdY583M1xBxKLJlGmDFLLI7Tkk44Bk33zVfWlJqHu
 p92RA9VmkdQkMHXqjRXXF1vIlAgtGFa5PK/PldgEJaKLIXmYBz/49DIZbjSzBHQwkXQki
 djoLNr51ABZJwbgiu6NZOQYmrGRL/kuPh1+O+Qk8Pk0lD2tF1JuRMYX7xSJaTAjCm2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017131;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=JAvp7XmX09P/gmBTCvX0ukVD/SES1pugWtGZZ2pBg1Y=;
 b=Mb6Bty2buP1IA4D5TX4Fyv6rj83aruE2XF1DrIdr7WUB4aLENPIwkgVM7Mm/AUzG4SiH
 +oGmR3Di697C5u1CipmdK34jWpmHA8xNFpZBnJSdkazs29FXrTlwHMc98I8PX0bLfj1KD
 YOhkHmlq/wLzuF2gbPnR31Y3dOmYX7F1+jIybbyxX1F2emGMqWGL5QIcwMxoaxtvjsrb7
 WHModrbm3+kWC/THE9x8qH+Bj5LIRmcf/qbwm9wqTbugibvrww2HCKtWTSRW7ocV+I55o
 ZL2y6MEjxtNk44C75y4L2kM1RxK/IIzvD7TdpgZ4RYmpIIzhaylpVo+JXNvIkV/92Xg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XHofCJPs; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=XHofCJPs
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E986811ED
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:30 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8243e4db9dbso126682a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017130; x=1791621930; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JAvp7XmX09P/gmBTCvX0ukVD/SES1pugWtGZZ2pBg1Y=;
 b=XHofCJPsNkkX0ykvdQa3OY757dlfj++eSo/7Ktc0+BRmVXrvTYaSR80keRlJOPQSmj
 qxF9bRFd5io2i+1nsQk454uKzyXIDSGZFU77xa4Fvvt76AJFnjoUJ7RyGUPE1fkorPDk
 CEuLpWYAtS5p7qD47ARe2JHpsYpoJjByDwEURgejSxjrDiRiuwG5D3zujaR04LH8jKIZ
 Sv8aW0SmGwEqcXPQ4p7HXbB03KO84UY/dkV1rkiUv7jMN/JL4Y2GwyUutq4cbjFNZDAj
 Ui4OwISI/XatkOUhhjVHlGtSXLv+j2oUYfmrc6hSTzkk3O4QKe5FUVpxoUmqhgMCqMaZ
 VLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017130; x=1791621930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JAvp7XmX09P/gmBTCvX0ukVD/SES1pugWtGZZ2pBg1Y=;
 b=bSR57W9iVjaoCjhMIK2xS2u+8oCbImbHWMqBWT3Un9P40ElRHXeHkxmVXzPP56+prG
 IE+ZwGlRqDZIz8CinmjqXRcpVUM1vXx9g106XJ5zpMy1ejA8HvdCc74lbPU8CUBV2ebs
 QsGfowfPw648ElATXTK0wSdEEWMj3jFvcpwBXO4s03TdEwP5jKCXnQ+J+eR1HhsGJldB
 CY5vjcAiQ4DkLmCVs7Vxt7N3VHvRqQUfLNU2yeKFDTrvQ3kAYAON++NfRvKhyzMimC+q
 EORB0JmjY3jrUr6ax3aayR85DEVTDlZztRnJfpLziKNY80krHYbRqkWIFcyWsV0YDoLr
 j6Ew==
X-Gm-Message-State: AFuF++lAWklfdEG8IkITHZIR3voFrFb2VaNB1fdTVeubbwepethaQeee
 h9vFTV3wst+lSLt3cFIOXNrjgihmUi/RLFgPiT52NlBxltb12sOTiIQE+5wrpA==
X-Gm-Gg: AYBFou1npvriDdTxcoPHuDJsr5vSR0Mer0meqKuShi6CLPBhO7pSbV1vPUu+D13IdZO
 jtRipKCTebFuScA0g3nE2Sgo4AVXmgftI82oJG611HnS+hRA6xoadF2eZTdeWFli5L1ZzbujndY
 /wuJUDMOtbI2DoOB0rcH5pUe77B7FL/RmOb96BAD5XkfW1b9wOM6GwE5QeTiKjquDGDQ4rfgvOu
 e+h07MAYMKYUgdwivQs8FGesFrVYOdW2P0agYD+NBT2OLDOugXMxTicivFwmcdIm/XQlbsi9f/j
 hhqk3SbYljy2+JJTk7AwMKYEAIDZ2uXBLY8DzCv0DFa7X/fs6U1uUZp6Zn9djdF3FSAALgbMgJm
 9KkeW2rm3oApfJbVJHpRxmxqC5gr+ANXvCD3+aVNAXoEEGOXoSQhhzfQzD7l0y1P+X8KWaOZXzR
 Qi9drx2X1Cv75TIy3ZlDb5XE9KU9sGZI+ix6+eNG6WE3FrNxi5BN2GwNQQV7ssmxxzMcspEyh1l
 Rxe+wrGqYvwcAL+HdC1Pmap/HiOOkhQA18EIpZKN4NHxAVirYScdYGDcubU3PeaqkXchSa9MSDP
 vq3HBPEIbLGfypTUiE5gK4jv6b2Xc1dJSdJwtdvVUoejO4SgCfkMm9dVe5/R6AMMqIYWSZl/3hb
 F3S4QFqWvn0X0Lb5wGMvUGQBMwzOH8zsRe68O7MJIF4c=
X-Received: by 2002:a05:6830:264a:b0:7fa:ab72:9df9 with SMTP id
 46e09a7af769-8228555cbd3mr5142523a34.17.1791017129832; 
 Sat, 03 Oct 2026 01:45:29 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:03 -0600
Message-ID: <20261003084453.545653-18-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-markupsafe: bump to version
 3.0.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markupsafe/python-markupsafe.hash | 4 ++--
 package/python-markupsafe/python-markupsafe.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index 639a8c10e0..1c10d4f268 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markupsafe/json
-md5  13a73126d25afa72a1ff0daed072f5fe  markupsafe-3.0.3.tar.gz
-sha256  722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698  markupsafe-3.0.3.tar.gz
+md5  7c70b0284d3733795287d8d67e7164e0  markupsafe-3.0.4.tar.gz
+sha256  2e9ad7dd851bf45fab9f75cbff4cb493fee9979e8d8c7c9c3ee119022518edd6  markupsafe-3.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index 7732b9a7e1..4e81938ab9 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 3.0.3
+PYTHON_MARKUPSAFE_VERSION = 3.0.4
 PYTHON_MARKUPSAFE_SOURCE = markupsafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/7e/99/7690b6d4034fffd95959cbe0c02de8deb3098cc577c67bb6a24fe5d7caa7
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/38/9b/e422a865e1d5d57d0e509b4e0bf1c1a70a7f6382c29a5aa428df994c8bc8
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
