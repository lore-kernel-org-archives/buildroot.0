Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6361606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=po5t1Ner
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B493181685;
	Sat, 24 Oct 2026 11:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdDVe_UHLUh8; Sat, 24 Oct 2026 11:54:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D590C81699
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842841;
	b=Sba9kWVNNAdhup91hf3nTMDg073zaUtrz6hlHS3o5awHAsN16ICfVvVMwNzsaNcyfQj8
	 lsmJnaluFFsZMPjgwVhyUo/YNeAS0+V/RudFHINduxRHgVDRc2hYKBY/UAWsTvk0q50Dq
	 T6G/vR5nUFTeCoAGIBnu4Cs4CsXxlWTSG2qpZnJX7jDmXVZm2yGmY56jcDQi8xuqNsWIP
	 K+fD/V0WW48zXex6PCPYGL5DKHLMkq5VU+SBgxyVPu1XLI4Uo0/eRBWj1AFkffVWlTQYf
	 WQBXjDaV1chBpSjb7T/8nNwIqO6Nt6gJHmm7JEUvqQR7xlxRZQo1yXAJTYNZJRqYWCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842841;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+e4rvJHRGQTlR5Fuh/73B2LgWBaVkQs3F6krDWF/5w4=;
	b=B6GwjpgUQ4uTjL3avvy94WlKbuIKb9DEqRCUGnes35lCKnXU4EO1xU/Tx/9m+Y2r+aiu
	 Ez/Z9T1052hbQwtWK4YKK9RZTDFIdp2Cs/LwyjUUncx5Eu6jPMYbYv44ZcdQgrX2ISXaW
	 Q9WGFzVG+sXcLeXs5EA5NOMn1PF8FpiLTuqSAD73r/a3Ii6xm9Y0PNMdM79GoXeU13s48
	 pem4iMnhD63+PLR65N4UZe1AWxVwQ0lNMAg+A60VOj5R2Lc1JsaONfT5xWeqBkGbsC+N4
	 Nx+ttv2vefOPchFtXukBVTh7tb9jw9oBdGL5q0WXXbndJjINbRxr0umitpdW1R16d6A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842840;
	bh=+e4rvJHRGQTlR5Fuh/73B2LgWBaVkQs3F6krDWF/5w4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=po5t1NerJhV0PBLDtqN8CBQWiYENua/iWaq7bGA6kX6HZvfSr3cw0UJMH3Im2ZKtx
	 pK8ATnsMKz8MMbS71405iiHQkoALuEfhN2h0Dn4a7d7l1ojWB8Jf0DGoqk1D7GPwBi
	 VISkOfj8PjeQybFpm+dvp7sU1zYoN0llJxWzePbVOXPtZ2RhVcCWhs9W5TbQ+khrbV
	 NohtiMI/921bmRytRsyG3CHA+gxJ/KwsdtexBObNFzEssQcwjvewp6wfJz7KKp7jGK
	 JdnQ3h7SuWqgHO7bEdT5qvOReJ9wmgsuz92GtRaoZkUd8okoQEqIWbx7PqGBDJjcVm
	 TyBArbNzTsbnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D590C81699;
	Sat, 24 Oct 2026 11:54:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF6C3D35
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD5494007B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VV6m5XMmx-4u for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2B078400E0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842832;
 b=Cqk64Fits/6lVpgjce9U3apLCGA0E6Jf1pQslT/WsAbrp/uO4DTmaUhy2NMrBFmWHm8U
 oQ7RfJHNAiu+E7SULy9fnOKkL5d7WMgi/UtCYcXx2SPuSbRSjZ7TGuu5RFTKAwvz+KpeC
 RbeZTiXb2nI20ky6vVtbK6Z3ZvcyOJupOm1FAB8+xGf2n6YgYVYucgg9EzL3a2NLOLOcY
 RyPxBCFzjkcQALVkeNheUsAIuKFABRkgh8WfbJkK5ii1qcYnBMpCLYDpNjKcjLHvZQ+pX
 ARNBJCAtlmF6UQi56XazqdmDhhiC/IlnJzXoTuWtAwS+DvTrcVLNZOCGFfcM8nT2tGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842832;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OF8VWNiIVGTivbDi3hko3yOqYpi7HD99QkoBZixCcZg=;
 b=ZiPMnBPQQ1FzjK1+crj0JogBm9OnEUYtDf7EMNdURDUIuMZHN1YMwxRaAXXoM1U+z8eK
 ZBRYumeAW6dUNy1IsnqpeqZpxkAAYdW058ldlaeUKvTbqzR/tj25rx33gyaWJKzCc22N7
 ZlkyOUAobDjkPncPXic/MbY3ipj51cel5MKqO+P6W3bHNP+wqryE4os8OeG20p9StHcDT
 uuE8s20UbS6JPAT/053XoRiGgPZ89JPYvCQZRpxKyDYc8e75xfyjXA1zfDPEHlrM/KSSl
 nJdF1GSn+Kp0KkpJgjuXXPS6983l4CHHgQFtc81KvjOkGc8ssWdMym/WNC8tQG7ydnw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B078400E0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E25C98327; Sat, 24 Oct 2026 11:52:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:09:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc5acfc230e004e8e5d40dba418776039edeba54
X-Git-Newrev: adcac6190d5328be65b00fbbb5d642fac9110430
X-Patchwork-Hint: ignore
Message-Id: <20261024115227.3E25C98327@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tzlocal: bump to version
 5.4.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/adcac6190d5328be65b00fbbb5d642fac9110430
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tzlocal/python-tzlocal.hash | 4 ++--
 package/python-tzlocal/python-tzlocal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tzlocal/python-tzlocal.hash b/package/python-tzlocal/python-tzlocal.hash
index d870d54d1f..68368b3039 100644
--- a/package/python-tzlocal/python-tzlocal.hash
+++ b/package/python-tzlocal/python-tzlocal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tzlocal/json
-md5  24e01420acf49871034e25bcb64139ba  tzlocal-5.4.4.tar.gz
-sha256  8dbb8660838688a7b6ba4fed31d18dedf842afb4d47ca050d6d891c2c15f3be4  tzlocal-5.4.4.tar.gz
+md5  dd6d0ace736a684b9a3c57a30a509cc9  tzlocal-5.4.5.tar.gz
+sha256  ba976898bad27945178c9ca25c222c19e322b30c10342b9f40b46714f70d2d5f  tzlocal-5.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256  d99ab209aeb16aad2c25c90ffd83c1a981e290ffff76a420a2ab03e03f041b8c  LICENSE.txt
diff --git a/package/python-tzlocal/python-tzlocal.mk b/package/python-tzlocal/python-tzlocal.mk
index fa60a1b7bd..0ad873ce79 100644
--- a/package/python-tzlocal/python-tzlocal.mk
+++ b/package/python-tzlocal/python-tzlocal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TZLOCAL_VERSION = 5.4.4
+PYTHON_TZLOCAL_VERSION = 5.4.5
 PYTHON_TZLOCAL_SOURCE = tzlocal-$(PYTHON_TZLOCAL_VERSION).tar.gz
-PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/81/5b/879b2f932adfa7a053c360d50bc896c977fa6426109185f7c12ebdd0cb9d
+PYTHON_TZLOCAL_SITE = https://files.pythonhosted.org/packages/d8/89/2bd035df331499589fc92e59375c17c6cea6a500453b2c5f6a6ec9572825
 PYTHON_TZLOCAL_SETUP_TYPE = setuptools
 PYTHON_TZLOCAL_LICENSE = MIT
 PYTHON_TZLOCAL_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
