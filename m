Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD401CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8130360F25;
	Sat,  3 Oct 2026 13:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtsWAfM2umkz; Sat,  3 Oct 2026 13:57:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1AE9460662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035822;
	b=N/IiIK+QFs6WRGvZJQczd39UxbkcrL5AGozMyT/i/lleBGtqCQoVYrCz+XbD0TAiiPTG
	 bNLkiqLIEWN/4QOdRNG5F5tGKM7ldurBw7P539aucJer8j4hRiFlfHQ/Hx4ue1b1XOE6+
	 gM+v+3FGjmzq+j+r28Gz5/rjx7RKcjK8K6IOkoVj5TWLNQzDhP+BWFpEzARQBu1JFmhgZ
	 NWdSMvy8983uP/amxDX/X94VkaCdyIMBL/Hf4ugCgXpnia+7a4+Kl9OLGREsR9uJ2OakD
	 dFsK1EkVrInN86NZ8R/e1Q9TOyrgNKcZuBbS98OWcDOn0x/AZS3mt1SQe+9LVJgWJvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035822;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zJey6yHZaAwueSsxSa0w23MtcSjWZipAs/8ncNe7X6Y=;
	b=R7BGjMSiTCJMjqhuij3aa4yCahngPl5OXvqFdNEwwTi2JyhsR9ZBmwDDJ9+HsKHoDO+f
	 oSIIA2uauPTkFGhLiOR9L/c0SrmfKpbF7Myjd8URr23fYQaAtt7XtD2InEkp7qK1bkPVw
	 wEVRUQW7DLN5Jq/56Vtz0hSc1Q1wGcOqJcPrZN8SYF5AGcFmzmHUk5vzn53DTJIYnduyd
	 FG7oTXsw45geRyS8BKTm9v/vQZ48CP8LV4RFVnEbeAnAFPH75gorcXYkBOQjZhqL1kpmr
	 xjbLQcGglaUfkez7FjhsMiIpSc4NUr3phYcyg21FGsBFMGC6bsWzBTS9wuOIUjpGvTw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035822;
	bh=zJey6yHZaAwueSsxSa0w23MtcSjWZipAs/8ncNe7X6Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sb7WoVF4SX3FKkV8tzWeRzx+4HOMI2Yan8Pu8BNMJr++7tSi6gltnClNx0ynCusEY
	 g33QYr1NAKmWxEOcboeljPpnzYN7QJyehUGCj4Cuv+sa5jyXd/nxTHbQDItSGy8NMl
	 fBZE5pDCytIXzf0ApFdivEg9noepVwBRpLDjN/DNdToTKP55pfEW2Z51OQe6x7hIjv
	 Rwr1EWDcLi05Rx2O8e5/e5tIsF218z3X7HgZWbquLIYn/ROnAJqb3Uufn0z2qvPnYk
	 9iRbuMU44Xva/vDPFH8QyCdtdUJq9aWnE/LFCY9Kd1aoCnBNvvUa1An1M1CZgfuSLq
	 pS80HtYoOvspA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AE9460662;
	Sat,  3 Oct 2026 13:57:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3361476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7B68414EA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIe5V3CfeFbF for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1A47C414C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=AjefY2IPDDOcipmnMNucxg406qMK/P7G8Ix3jpE3DxK/9edKsID+a0jPoUSzmgHPw0Y2
 V4rtLrO7ms3VRPEWAnJ6WWpxSFeAt9169/Ql3bG9Rziq6jV8yMK/F9WqrDkkr4K0EpX/n
 MjIe176ZLM4Mf75mOw2CEiUfkgbqJMHW8aRydUYlC1Cf+Qw8s0B6hh34upLc3T2Vn1wD/
 l2mujr4f/jkn0UHbn6Efvisw2yThF/pApw5OPeQ6hA4qxO8fid7VVmqIvCcW1YFzxxpX8
 T90gHDlX29t/+TvgGBdJSsv8U0SQYfWuJaabV3alJE7r+PokvF8/YMqIZ8Klg2/ZFiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GRPNcmpEYsHdqQwbimC2B2MzzT6AhE4+PbUHzqLq4Ek=;
 b=gLYT1mTCqmAyIIabqPeT9DVK86Z8U+ySdwLk44WoigtM4sPhGpxV09POeSvh8OkNMxOk
 Iyfx7H2PfEh++1jaj5ON3OXeemxYU7P9j0KivbNS/MaB3krwd2Ejnb+6Po6k+MTl2dcyN
 xJDtIrdQyUdQekdlcCBS/8TARFlKgoeigA8DFRsP0zomlHpdqpSawkeHtIhfpOgVweQq/
 X3roe1R2ypfzAPGXjJVJ9iuUq0+PtalI2V4LSGID1RhNqjOsNpRPxlst7sXtYmj7UzVs5
 /LfxlNmf8zql5k4VLJZ/4w6PwVgdo+nIu22+39V6TycA2RViX9YR+2N39SVeSv0Ikxw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A47C414C6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 596618A31D; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd66866c9a9bfdc8430298c3db33a1dd8319ce22
X-Git-Newrev: 256b0dae741fed450fc629003f45a15de2352732
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.596618A31D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cffi: bump to version 2.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/256b0dae741fed450fc629003f45a15de2352732
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 347a6f3ede..c8fb41f136 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5  5e897f6251e614f6bd128a73e81801a4  cffi-2.0.0.tar.gz
-sha256  44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529  cffi-2.0.0.tar.gz
+md5  32f0067c08d797dd28cef1544105caa3  cffi-2.1.1.tar.gz
+sha256  dd31f52ea1086513bb9df30f8fcee9b8918323ae067a3d5b78bc826a000712be  cffi-2.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5ba24ddc57067f9249add644c3afc41a5d6dc37e23433ef759d95df370b0af63  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index ab9068b101..120b98fad1 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 2.0.0
+PYTHON_CFFI_VERSION = 2.1.1
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/9e/ef/008a1939e372c06329a3fce4279c02f328488f3526744906eeec3da7ad5f
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT-0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
