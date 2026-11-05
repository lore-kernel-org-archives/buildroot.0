Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3049760A3839
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I7mp3CnB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B7936090B;
	Fri,  6 Nov 2026 16:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTR8yyadRkBJ; Fri,  6 Nov 2026 16:09:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 21064608B6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981341;
	b=DsNs0p5M4kjQ+UyhVciCuMYqsG2m06Ff6Hn8fYo+39s5QnBxaOTx1/GmXkV0Bk/IezAS
	 oZiBVEn3Pikaum29dzvVamtSnQQRTLjsjyYwb0fkT0ujiCqiA+zDGh6WpCP9EXXE8Gl7W
	 mlEDAyxyyoMM9rb+TpcDHA1Vy0BSXH9JBhwzqAYvo1dq+2CJOZguprT+orBwj5np2p57u
	 PEv7xNvt14wi9aEgXAZnzQP58JX8bt73JU/rtDtjEVswPq2GiuODoZC0xVL0ao8Uf7GgU
	 jH5Tt0vwpHP27my/yyhuxTF+TX57HpiJIG/6TbrOTSZbWKgIuhtW8kxfulNbjmamkuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981341;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=3e/xPA+ZKv2JZPumAhHXLvt/8z7V/hHHKBc3f982+MQ=;
	b=PSoGpOMFMG4jwNGKExUZI97F4rZpxx+OQ3w4mE/qjsm5nM10sXCanYvDA8SIfsONps6D
	 nwS8t+j4VPefsHqjCWCJ0LXpWkc4sSTgDIUOFk1SpFBoNtIIER3KNgdGD8ifvZX22Gx4U
	 CZGWZYAhN5kizlyXG89xJOCPEZTAipjzBqPUPqwyMfMvqaktNmEBp67ZWbO94zlWgpSeh
	 L20QVjl99RVc4tUjCZ3zyiZdnyUsCC9FjoPanscuXHCDEyB2wQRjk9hFvCN9AUGB+7fB8
	 1F1X3PoqRh30jPKOCT/LEvG6t1G2RCkNemfdP0tRfhoM5vpGzF0uHqGcAV5ovTvFgMA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981341;
	bh=3e/xPA+ZKv2JZPumAhHXLvt/8z7V/hHHKBc3f982+MQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I7mp3CnBlFR8OqkkLKMzpXLC9Ns6PNM06OKpxYIdsyEWMlbbeuVLTr4v9VOsO80qf
	 g7gXiitkisvrWahEl7WRjqiosEdgh/ezXEPQmKQ8e/C1oOOH1cfMxIQjobDLLT1wmp
	 V4I3xW64LmFKhGa93YGVxTAnwCjqjrWfhRG6GYDeCpKCQdcibUwJthMivPvq+tcnza
	 rrlf3z20rhqnevdQeuL0okZm1FRPk7QBj5VKqdm1ZZnAYMq4iKWDWeqg0znO33A6qE
	 htCpToTe9F9e3Kmd0NGY8DhzUm5HrmWseHs5zIqLJKcipzDnQX+An6JH3zCoVI1yZn
	 Rxn65JZdaNNMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21064608B6;
	Fri,  6 Nov 2026 16:09:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 266534B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CEA081468
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pw2QYZNOmQAa for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 626BB81446
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 626BB81446
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99D339E0B0; Fri,  6 Nov 2026 16:07:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2ff4fd410ec966e8518d5a50bc8629d1512ce99b
X-Git-Newrev: 5063aed28c50993f49c91647327046f6eba4136d
X-Patchwork-Hint: ignore
Message-Id: <20261106160702.99D339E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/python-platformdirs: bump to version 4.12.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6688729700746266663=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6688729700746266663==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5063aed28c50993f49c91647327046f6eba4136d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 85019ddb138ac0531b54506473be292abd6984dd)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index a237667ad8..7f7590a6c8 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  9d6b65f596852735dcdcb3109127d454  platformdirs-4.12.2.tar.gz
-sha256  eab5f70271a490ef74618bb314fbb86e3c7e82fa3b9c922c2ea0e0a1a155d329  platformdirs-4.12.2.tar.gz
+md5  7aed05d0c6d803af78de34d929e51bac  platformdirs-4.12.3.tar.gz
+sha256  427fc0bb321ae0c5b037fa03238ca74820437be162e78b4848c4d4055b9b766c  platformdirs-4.12.3.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index d3463254f4..9610dccc64 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.12.2
+PYTHON_PLATFORMDIRS_VERSION = 4.12.3
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/17/c8/721b3855fe457da514fe249247d404b9b39c5d16532278f70ebaa6acf18b
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/42/23/4a86fc741c38c5b69792a4ef954b281afa69bea9f083f881de1b0d23bc07
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE

--===============6688729700746266663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6688729700746266663==--
