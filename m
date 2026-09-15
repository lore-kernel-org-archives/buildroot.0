Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE3BC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 22:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4890B607B5;
	Tue, 15 Sep 2026 22:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSiS1yFOqQq6; Tue, 15 Sep 2026 22:11:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4DF8560792
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789510282;
	b=MbMHg3VmBLsVXmAoOeIAC1RnvAeZhF4QAO7uklXMToRoCBu7ns9eD1mae8XkF1lr6d8U
	 jUTeG+bDgEo3gLowEspV0RN33MHNuhrtpvAIsu1H4nBai9aqFGwSJQRmAtR0i2PeOT8lX
	 bX/lLygFJSbQh7xC71GPqg0gKyF0emRdY2KgAa4sMXtalRyc6sB+AE8O2Jxma/DNpfeiE
	 fJ8P5bTLGutiJHcOR+BMFKgnNO9B5D0X+DP4wQL2O9pC+vCz8fRw8PmlGb/jGN/3Zpkty
	 SlpZHTbUVcGo6gaEd2tOwOYYow4bQqHxb3uYvAIKVyhFkmji8O5pwkeqVodI62IQX4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789510282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=gzNCDapUOKDIeIZJJUQMLErjXvaA8+OFNGljlDTaUu4=;
	b=XpKjixhdPxWXQunWoD2MIInZOS1Srhb8EtmIUGToAHoETA4dGcRX1dPBc69F+1FOM2RD
	 lZJEnBslq5B/mCdZ+hSVpjHZZOZpHb83kzM1tTehjmnLLkT9MRWmhTKVuZYs0k96dQ5EF
	 qXMaBWwLVnJI46fWNDLknZ425hGH9Mr6BVmlPZsJizfPWrFXi1ze/QT7qlcMuAG2lAqQL
	 vYlhDQyRc2sLB1EJXsh7xDMDaW+XI85StvZnibh0Rg7G3L1NKruf6eQO1YaJwWGvpGqiE
	 mSZXxb1Q+5ntjscX3TqJYphPhU7m0RvMMslyo2/ptqBA8aEa5xg7QkvZC71FkDXFPwg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789510282;
	bh=gzNCDapUOKDIeIZJJUQMLErjXvaA8+OFNGljlDTaUu4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=XS39x+UJsWNmGKxduG0kFiK+aGbDrbZ56/yIm9P7WKTNpbWGs6Gg2McA5BKUxE6xd
	 eIHNukOP8+vjQqR0436W5vK1pqge/1SR2fxUqatHh3sGj5SVVe64uRsgu+qPXjW9xn
	 pl1/i8sOMVLbc2vVSzBXHTqupr/z7EDI9goHaTFWhK/L+sOCyVwSre6xN1UF8Zkwfw
	 CIHFTLQMne2CbFzig+GWpdmoFrni2Z65TJh+6DDhC5WYD4EHO8/NEKA87pqXLXoBSk
	 WH1aOxG6aId7bF1E5d0B9CcIdObebI6OOC1RwZuPN7sPesS2Yced9Q9YSUVGtQxnVt
	 RDb3ZKvTfL7/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF8560792;
	Tue, 15 Sep 2026 22:11:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB5B323F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 22:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D172B40248
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 22:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Q29FIWmX5i8 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 22:11:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6059640260
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789510280;
 b=ciAyBKuwpnQIpZcuTpDW75Duy4CpIklVZeW8FlZ0XG3nQUKfTyvnFLN/mQCQpWq3LLmO
 kWGG1ZPuQOzGHccoBupbN6YAqLOj0hK2jLIMZ+s0KcQ9LVC5W98SDv2zPh3ZJDb36EMli
 g/02JHx1bakmBwOGPkZTs75jIKU9xXeqFYWUCJqda7k3DCbsfQ2d1OIQ6hZwfKeCKxK1s
 F6jq1jhrZfAtMZYMfk2MUDsPGyzVeQ1p6+SyKE8KyECBUpAab6o9VSrsc1dMKKjKS9FcX
 DKuPZlISCIrTSg0dhuXEbVRFLrldWQWqEUS4E+X7FEOtRKsBJ+IyLrHzeYxC9azTTIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789510280;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=D9APv594wfmU4f4EhUWM9gHB8wDBHYdodVdXj8dzvUs=;
 b=fmNgRMMlhIbhbXm5iRA6+CPZ+1jW8HZgmA7gBVy2IgYJT9eOlsUnzIAeDLnE/+FomPkT
 taqoRSMEp4MvEnBpR4HbqQnh1UakUh8e+broFh/yH1MQPRoHM2cNI3TvwMyGQMTX+pOvu
 BYMaxr8wcFnHM/CLw8ZhXEl9QxCCB34OPU65K60g+9HrnwQUAQcK/3VZUzrEhEPU1CqM+
 XTavdAPu/9LCQU8g2eyP6NWi9kysHZvdrigOa03mxytM2ej6dNQIYiGTV9+UHNkxeozD1
 6k5cfffbs4ELxB6NAVRT7Lg2wwaRW+Q4WjOPFfLsbbtAb0QmZignRJuwi/M7jmiLAXQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Txen70Wd; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6059640260
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 22:11:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9EB2CC62215;
 Tue, 15 Sep 2026 22:12:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EC090602B0;
 Tue, 15 Sep 2026 22:11:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 32C9011C7AFE7; 
 Wed, 16 Sep 2026 00:11:12 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Date: Wed, 16 Sep 2026 00:11:07 +0200
Message-ID: <20260915221110.2037230-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/gnuradio: fix dependencies of
 BR2_PACKAGE_GNURADIO_PYTHON
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_GNURADIO_PYTHON selects BR2_PACKAGE_PYTHON_NUMPY, so it
should inherit its dependencies, but BR2_TOOLCHAIN_GCC_AT_LEAST_9 was
forgotten in commit 8b3993178d0ffae312d7dd0df70d30d1d3d88873, when
python-numpy got this gcc >= 9 dependency added.

Note that the existing BR2_HOST_GCC_AT_LEAST_9 dependency is correct:
it is there because gnuradio needs host-python-numpy at build time.

Fixes: 8b3993178d0ffae312d7dd0df70d30d1d3d88873 ("package/python-numpy: needs gcc >= 9")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 98d87aed56..e87275de4d 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -80,6 +80,7 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYBIND
@@ -87,8 +88,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Enable python component
 
-comment "python support needs a glibc or musl toolchain w/ host gcc >= 9"
-	depends on !BR2_HOST_GCC_AT_LEAST_9 || \
+comment "python support needs a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_HOST_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_GNURADIO_SOAPY
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
