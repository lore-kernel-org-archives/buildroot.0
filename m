Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8578606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LwAmDm6m
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C32D80CEE;
	Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93VkcfWoJebR; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 657E480D6E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552839;
	b=skVSVXW8kNEWasugXtjPrkw3CWHt+BS9gpKAhsWAr45LlKtd8GEYgCk1Mw5JFhFaaJP6
	 YooULwMJTxTAjiXhh7X6/ujOv64Ts08TDjFRJtehjm0pz16IQ6rfOrMSzqzteKXFYrDOu
	 nRbnuH+ow0cFbW0rwkDFXIkAtWea7oPJokfuJ1XL/pXew1fKMxqF3d88Vs73z1qXQlx5B
	 r5lr0JxUf2VQKUKIDs/onkeEWNSOM7L06yoesx7zS6NVr88z72XN1xvlGFGyffM3rW40h
	 FzW+vffNipkId8yXYO0tvI/EhdK6u+R/r+b7j7rHp5E+T8KzK299o89DO/qq0iAv3Jw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552839;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=F4kjNpgIbtdLcL2/BbnodzADE7GGHn9aXeHVWSHbim4=;
	b=NMpptPtMsVF+M12Cyu1zIwLl6G7dsWX5gw4zsYCADtPT3YOnnO/vbWgINrGFcoDFlq2y
	 bj+bYkuBoNRVSgA+arsMO8qmRBgFIiODIIqVMyG9zbLTfYtuiZNaJzI+FtA3APATSc4d9
	 mUMFVOjPAtaWQZU1VI+j7j0I5t58ZA/HcXTlQ73SdMuov7sqzaTblHQ251L+KAApLTP7U
	 R1Y5pV3Z5XTYcLFXXC3abCzj2q2LPcy2LTEppYnsdFZhxnq1D17aHr10uXZ7+YpU6wLV/
	 TQiFdUpwdWHVRLD/L3/pMWVTg81ZnaVZyh0AQD5GMZPntZJiefaODLlAuGOGl/ZtdXA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552839;
	bh=F4kjNpgIbtdLcL2/BbnodzADE7GGHn9aXeHVWSHbim4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LwAmDm6mHfs38S8+7K4vv+KIjQ952RZSs3CYIQ20cSRC/K3NW0Q29wh7TpriY41rD
	 SiLIznyaANQquetF5qbAF2x92mHjJAjk+Fr8ariOKOhapYvpdgHr19cNe0p+vqIiuS
	 U6KSM7pVuaEXCQLXRWPC6ZXG6Mm4VF75ILfWB7LEVTZ5dATNd/snbS26LAtCYUKYnW
	 NQ7RyPpJvibEP3NWlssRdUva7nWp8O7m6meXfXYY55oa7+kQI19pX8DlEKmwlKwTA1
	 4raeDZnamZ13flMxe1wIHEpI0Q4fNqX+F2CIY/btu2uE5LjbG5LSLz8c+LHuRh+i1y
	 Cv6ORL5aDlwXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 657E480D6E;
	Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 160672AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F05A0606C9
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZYcWFCTuq3x for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 26389605F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=TzNSGvgxEfAMa1f+nMrrXYXUpEGcIahdW3md0/RW7k/y4kAIuVgVhX6IcMBzuN1riYg3
 fBR8yMFuIWFQBQ/6NY3ceuL50rggCQ5sCtHbqTEZXrtCl8rbmby3rVrp5y1VDDJ7Dr7us
 Uge/JNasoRrsUJGYCtMe3j8yjN18fGDrtQ32nYQbFCC+7ibwbx1a+fsAGC3LuTjIyvEHz
 uO5wPrZKUqFeZN1UVggTerUT4KymJn5hu1L1k4oNp7P7IPVlYhnX87TtGUKx62g4HLOHJ
 215QPUubsbUBuDM5ia2tiPp7rVPXspoz2pnXUgppy/9VrOkrqvSzNaW5bOlH2rXIWsg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fMgA12KgFxQ/kYnbnk533JoiSGRbzcMCSTwDFQvRUvQ=;
 b=WYvF1kBIUXiz8jqf5QH6Jvr8hdMGFiD0mZDd43o7lBfJua89ofsWvR2t9V4D+iv5yOlj
 Wd0LiyL6pivFshUDAC3yCOww8NyqjT1HrdSIMqW3oF1Ow2XIih4QjrPmtJvVb0HQtfOuN
 bQoaJQONOCQC1s3EKl1zQERUo6fwMhTfihtSmr6lmxEl+tmEmMfA5gIecIs1rC3xEnb1+
 8nvGNVmF7rxiGSGhUGdUGHQQkOszCc++W8dieD44K8D00AsmdtqcgVlqHD1J0P6ypSoIo
 /KG3tbZY28NzsDsgMegZRJKqguU8peuSWziwPqGBnfAkYk6vaUeMCaPob81ZKRx9Y6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26389605F1
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D44F9D4FA; Sun,  1 Nov 2026 17:05:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4959082756ea1cd1feb9d74f1b4f1b365780114
X-Git-Newrev: be6b68661e7aa53a779aa4e9f5eea84bfc9f82e4
X-Patchwork-Hint: ignore
Message-Id: <20261101170546.9D44F9D4FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachetools: bump to version
 7.2.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/be6b68661e7aa53a779aa4e9f5eea84bfc9f82e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 0d1ed1532d..23d9a832b6 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  cc09f6909df2d4c8c1db9af8572f47fe  cachetools-7.2.4.tar.gz
-sha256  e0203b04b75fe13e62098eeb5b2018c4eb1a14c04e2b5b450e70db3ee7e92ec5  cachetools-7.2.4.tar.gz
+md5  37a3116e73ac0870c9e58bea5bc0aae9  cachetools-7.2.7.tar.gz
+sha256  e2154c809ce9e1247120258c36821467597b5663d44c3255a9790785f23c2b1e  cachetools-7.2.7.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 9d1e337d61..6f75963bc3 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.4
+PYTHON_CACHETOOLS_VERSION = 7.2.7
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/3a/5d/15ea0494ebcb9062c7ca79bf026cbba380a50538ae73753fb40bdffa79e2
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/40/3a/bce69b9ecf4658dcd3599abe5122a9031386f8f94bd85c6525fca9109db7
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
