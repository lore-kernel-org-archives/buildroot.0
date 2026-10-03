Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D75CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 960BE60F48;
	Sat,  3 Oct 2026 13:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLvcei1hKEVq; Sat,  3 Oct 2026 13:57:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B66A560F3D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035837;
	b=rHf3kKir2P/pB0od6AplC197wtUxotVz0Kq5L960WJs66lSqLm6qQUDNB3xjyVm+aJ1f
	 ru520OKrSp3jyHQ2ZHTEyTchAmnkhPpDntf8iZsi9W9H+Cg3uy4Mg/bNT17NRaBuCHj1m
	 adSAm2NXHNnIUjy1UFOw85tqaKjZN5PxyS2jnxreGeiACyTuKn0vuN5cLdjeYtH11AhmQ
	 wHjDO0yO19aDZ4gkzo/dE2MB8//FtFV75d32ghLHXuckyrnvyb8sE9YK6QkkoZdT7RMkT
	 y5kljVOWrKN87llRLOkSKiQ44upqSS8W2NWZZPFhNDAFWGwxKkHlqC25R2uuvYJPg4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035837;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rUDKW+cEajCzlJJzezteOYt12pGYXpnTtscTcd0/Lek=;
	b=ToWONFze2Y6+wHdGb0qnAYjZanQbpmi34HqjxR7youklT5UCN6/vrrJozOrZnvLAuWw5
	 Shnm/rQmZzV0TLcHrg+XEfpLM+xacY3zEJdBE+wIR9JT/7LJUjD3hhPW2bqkaXQ+IGbQX
	 mBfzw3kbNWd+hWQ/LVbZ6kSWcBhjlw3oHnt/aTkYhava/1n7wvnZrSxZ9x9iSwhAtf9nV
	 PNGhlRJJ/hv6vp5Qkb+YwjKplXldrX8+yxWgu05DbxdVzBpV/ArQ+f7jEOmPj27m9Mlq3
	 gsllxhJVlPB0uFWn2UWbvp6XIJSOv9OIhGr/scBrjYjrNkHpeSpO4VfN9Vw81LYuXyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035837;
	bh=rUDKW+cEajCzlJJzezteOYt12pGYXpnTtscTcd0/Lek=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cFlDp8asISxVYE4jpmrm6nEjBooq1dozSfTCfjYEEY36uw7emTlsODhZmofWa3XeG
	 gNm5dqqPU8KDErWGLvoqDLwFv7Eaf8AqcLSltlxu5zKxOTtMMBCNax8fq4MJ3r1dEW
	 RTys0XkP0I8WcxeOMadrJRc1F1isnLsgNJ0goaZJBSFf/fCXu/CniJnbJv8GvQdqEn
	 6+oDNgbI7Jt0vKvHDGIeYJW069v9kwjeDD/56LKa7jpHHKHDrlh9DZGPP16mwfG27k
	 QDLJgmi3LxTDNaTkDpBZGJ7pWCwfYRdZxQ5FAnWnbwuQFSQhycQLkJjSlgV2QRbLFh
	 XLlEwCoKEKmqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B66A560F3D;
	Sat,  3 Oct 2026 13:57:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97BA04B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92C80414FA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRWg1MLOwuJF for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 75B26414E3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=Z8V46z8MOFXccLsQjsTcuqTTrznTnhw9ps3qdWdPBiRhcdSJeIZNQC83DsKihCnEQsXR
 IiDT0j1Eea6xxTexipwhHBV3q6AZEwk6dPrH0o5CFFXCX6EQ4wSHSn1ZuLZLSxJk3y8C5
 aDBBkhrVGmT4XUDTVavbYAjCJBcAicBkrhT1bzUgLegQZFM8y6V/Pbz8I5vJqOqU9E7xh
 HuWs6VYFtCcmnlEc/edp7xSQ3O1LFc8Yn+L8rMT/c1Tkl28I+tRfTeoQNdajQGr7zv/fb
 RnKZe+WxbKorCP4EpI0kwNPbQ7ZXQU8A4p+1iiKBc73tT+mRNCWh7wDxvzDhhFrtLmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Wppk8g1KZCTx7d03T8o7JjtPTPcb2ixGakI5W/kpGUg=;
 b=Xc4zNtdF1NWCA9whrjgAXWn7zS8Wawia/D6cYSMccgzXMbF1c4TMWABq0DvaB9Vot9lz
 MmieMrMhHCsnWoMA3KsFPQUhenLJt/C2TEOo2wpl2ZTwNDsMWf2TQ2GBuTdLK2Az9BZ50
 2bCYzLqIM+lVYR2SLrj6RlnQ2dQObdc5Inu6SMAqgFB2eIzD2Eb4wqqZczXkgcGDl7ZkY
 I9J0yYvhrZ5CxWJt1QfncgeGG472vC4Y2peza6RNboC2GwOC+/jEfVlQOW125qaU4TRtA
 O0V/FNT50csuc2+tN2s508GmBNLxeyoXPcHADh4Ijb+/SZYSkNIUQU0+2H9ef1W0mvQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75B26414E3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C14D68A318; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d57d31302d1bc20ec88aef0cead79eec3e8bff07
X-Git-Newrev: 42347117dc606fa4f825cb129254d8071cfe6fe2
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.C14D68A318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pdm-backend: bump to
 version 2.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42347117dc606fa4f825cb129254d8071cfe6fe2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index d9e1364adb..0218e18afc 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  20119cc4fe88d92eef4ac48ab18ff69e  pdm_backend-2.4.8.tar.gz
-sha256  d8ef85d2c4306ee67195412d701fae9983e84ec6574598e26798ae26b7b3c7e0  pdm_backend-2.4.8.tar.gz
+md5  eb962f59a1ef0c62310b42c081154b01  pdm_backend-2.5.0.tar.gz
+sha256  7953b994563d3151755e3364b9d0cfe817ed0eaecdf27c8f777f412d26bcd98a  pdm_backend-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index b02154128c..23dfc858b4 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.4.8
+PYTHON_PDM_BACKEND_VERSION = 2.5.0
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/7c/7e/6d441c8739a30820ec59517a88326789c201ae43a344b2ffb02fb2702d8e
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/fc/d5/a82f533ed51f91a2183faf67a1fcb3b759615ffeca95d05b3e7648bf84bf
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
