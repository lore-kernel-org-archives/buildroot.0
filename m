Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DC8CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 670CC60EAA;
	Sat,  3 Oct 2026 10:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HdNp5KUwsmk; Sat,  3 Oct 2026 10:07:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 66C7C60EAC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022063;
	b=mi2oUZG/9AFOjWhTVH8XsKf3xFVOWEP6H2QDf4/T/gs9KQ2xqFnv9G5IM3rgKTujzqBV
	 AmyqaB751yjuYMh9x1SOaKVkU7ehz/faJSFekKdQR0V565tD4xqlDmEbwlrD/3+cQ6KRS
	 GyvJXsqEt3q9sJuvnAslbbTD5HfuYeqSpzPQiKeFlFIGx6MUN0MzbJ0e9mrDVIEqwYHtH
	 2mWx3+q65K8QcAuUyQwYb2usYB71hsUFZhjU86THaF4ZIUH0XSHf538DO1st9ujp1KA3D
	 158OXZ9nzH7gVFzmhv1UsuHn3ybzt7Vdfh62EA3ZlIVNpfhOOU5vbQktNXkHwh+O4kQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022063;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6if8YhGTGUV0FM8AYoNO+PJcraiFgmPopkDRQ/N2Fdg=;
	b=fQWyoQ48TkXBJdZUorOSx03Iew0iQQznCtCihATTDb/bqtF5oBmhZ/Q8G5u3BPycRiB9
	 eG1QhssSscCKQzR8vB8a2h88I8k9nmx4f0Ou6ZNjl3rq/biHIPuHLXCNSQSu4zm/25VFl
	 fUGaQyj9Mz//SN/VDC6S0WvS2j3fLSb/DYVxIz9d6U4QIk7lInBlpPgGZehH2EMS02M7/
	 SoNL6xpd8genOo3ZeNDJCfzxgjTpr4f4Nd18TSN2yNoYZQHRd/jjfW651so9pd96aHsUt
	 HyfIV1xQOnEdBwlIXVbv1dT4Fm8b3Ldej72s2t5UHoXlwPzOSeKLN1Wd5+sO2JcB7Vg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022063;
	bh=6if8YhGTGUV0FM8AYoNO+PJcraiFgmPopkDRQ/N2Fdg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HfPemdpWnuOAKwj3dnTm4KyDf6Yp+hKZSZ7X7Ad16IR/zHuk3Yj6W+hs8bQyLHk8T
	 6+sq9dvEm2RRV6aUAsA+RuxPF3mu9s7nQLGagMC3zryUdPVs4jkqeOmFILjBdfEe08
	 gNOLOTypESHU9MdAvKdyhV5BYIYKh9mYZFpBosfWG5h4xMUcYjrua+9brlb1+WuuCK
	 Lzx3DNMHnAHhqIeWiVrDbSPdR1MxhHoC1ZVvFbGoDxuc1yDhN3GMuZk5lkpIxuak4Y
	 fRoSgD58OvkIa+ut6FmBXaZTAaN0G9tqYksQ5wUaUYO0n9SbPBeD0jgX1JvhjJl7J4
	 eXvTGrSCSMlTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C7C60EAC;
	Sat,  3 Oct 2026 10:07:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A15C476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05EAE60E8A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0gk1_sAhmtt for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F050A60E89
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=WGsTMGn1aH1wb2DFL67I0wSBro0ns3lASt4CtUPrc8LMygEEd8GkMeeUtimlSqYX9LlR
 Hf0Tx4OMzXDJ90GYuzQY3CV6Ifl5wK6jejXt2Bc4pSSkjPlqf02vrJiqI/iPw2YQe6uv0
 FgdOJmEh/MGJZUfolep7ylFMYiy2sZGO3Q7Hm9c+/QatOApncF36V5bHM7QG5fR4UTIcC
 xBZayGQIH6T1MXj47Y1XFnjrKmQIL2/jSZ2uE6e38XryRQ0l5H4+rMhDpls0xwVhnyvPb
 MrMcSyioolwBVAHLwNgrzjjmJq1E2Icca5lQeB0BzIcSIaY7RtfLOOBL3auSP/UQHmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pfFhdbumh7YGty3oQhzftP19alQPohtwbfAlM924nBE=;
 b=HtUg245E8lg+nPOdBaSEI5M86ybZMa7Kq42dy8e2d1AMkWmpALb0SR4oFTJ3jUdRdxXU
 uU2hV4DKirs15xMSnaY2B7vWwHU6kzFRwyG8gYxNQVXNGAqG690m1L5jqtXr/JeHpH3JF
 OCMW4XLLw8aZ9rvyIPlP+181ZaEvqyM6yLIKlp8+WIdWrFDxA+ACdEgFh0PXb1pY2hyMR
 K2DUCij6TgnNYF13i0fxzEzjINrWHbegvRwf3yJyx6sCIoK9DuQduN1ESezQshLrE9VvM
 5KikSIvuK2EkO7EtWP6B0/gpqyMNpRGiLNUFVTFnOGitIcbvKOAJtSghpxk1cI54UPw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F050A60E89
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A6218875A; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1717226e5968737fba7f04f3c8a4c729dcaeabc3
X-Git-Newrev: 650ca27e0b911a5023ed79d21b48d6f110022b82
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.5A6218875A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-libusb1: bump to version
 3.4.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/650ca27e0b911a5023ed79d21b48d6f110022b82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-libusb1/python-libusb1.hash | 4 ++--
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index a933e98416..30f375c702 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libusb1/json
-md5  f4973afe56c872eb2b8e7a930f566bb4  libusb1-3.3.1.tar.gz
-sha256  3951d360f2daf0e0eacf839e15d2d1d2f4f5e7830231eb3188eeffef2dd17bad  libusb1-3.3.1.tar.gz
+md5  3a67d341ce82d41111c1c95000a550fd  libusb1-3.4.0.tar.gz
+sha256  9cf5638506d54f21bf36550d97ea63189111a23c4d8078f630103a2052135f45  libusb1-3.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 10a727a7a9..9aff93467a 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 3.3.1
+PYTHON_LIBUSB1_VERSION = 3.4.0
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/a2/7f/c59ad56d1bca8fa4321d1bb77ba4687775751a4deceec14943a44da18ca0
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/89/35/f9d2a990d092d647b47540cd229e1d68432c0f51183484ca189612a4824c
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
