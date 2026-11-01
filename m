Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0525E606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y8rue7G9
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3E8C606C9;
	Sun,  1 Nov 2026 17:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPjpPNPWtZAI; Sun,  1 Nov 2026 17:07:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 010FA606E5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552856;
	b=XguBDO/azpC55Ce89LUy5wExujnciCm5uwhpGvsPHTMWBjXdoR7T9yfgANz01lypMxFP
	 v8B+LVuM3IHnFb3My/l3g+v1IwlZb02evE+JqIYvXGenMkieJChF2ZSNjCf6hj7NoAN1e
	 C3LoB5upIN/+/yVkpUNQ3fDvhwUpaUM1G2+aaCP/HnkBny/z1Qd22ARYId8st7f2URc9n
	 tuCJC+mqrcEcrRWTulAcgrwmoYJia9g+x482IHtrOAqbP/D0gTWDeef4R5CoskY5RfjFV
	 svp855loRao+j/cn5pEGERAeD8EwkwFMBdc9NHgrUgpQjLs489EK8c+y2jwhzRpbsgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552856;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ufIHurbiOMYZ69xiI4A8ikGJhevZSiG0Rcb4gVyFUTs=;
	b=qhom1/D5y/0+oRZ0NEe3gojzeLXnPn52Mjc6B6E2eLSlZBHjtVJ7d5K/yEwJ8JpGpYBq
	 /Xnms2tdCpRyEWfc1b5zcsoGqc6I/XQgUETGe5Zfy3uoHVpOaC8Q1nxIjbi4U1KOCcQ7z
	 Fl6dVsxs59PH9cBbGirZmN1V+fJ4XyDOggY7GxqJxV5bWtf395Bw1DHdk1phTirM4xmfH
	 a0xWMq5I6hajo1drLUMOL6ijFhkh0F1RCxUHG10qBTDJJPwqtqnYB7uOiGL5GgCFsqdVR
	 A5G6oEWqFcnqOVi9N7apPiaClWwVPvvrSDbkB42cnsgiH8XGRYDTnVb8WcT6mzu2fAA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552856;
	bh=ufIHurbiOMYZ69xiI4A8ikGJhevZSiG0Rcb4gVyFUTs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y8rue7G9QEfnEjSTeQlzM32LwmKEmdlpOaKi1d6VwTy8KAXIJHrVcd9p3Pj8i88+i
	 ulT5nUiGpxC3ZhHYqzf8C9zgwIqNoZ4SgVzuzMS2LQRXsjfKqCJUCItwllVyrmge2X
	 MoKCJyi6cR0H0AEUJa4KRCMW/oG0ZRTfeO1xowWBEhqVx5arpAjHCHze0zms9EVqqN
	 Kr6n2oFYTNFhDnCaPyycofyJbJLnQsIZHV56jJiVu/e0CIisjAjlFZb1tMr2XmISCq
	 A2+vK0D6onO8fdwIl1hJJyiQZNJuLGXapTutoiOIR60QMbp1TjXX39BMKBl0LEL8vE
	 t9aM9S+u3M6Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 010FA606E5;
	Sun,  1 Nov 2026 17:07:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C0A80EF5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5B4680CEE
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INmo0uF6z417 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C604180D3E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=j2TYxm7ZaG0iycZ9W0Huogyl149s8gz4x+WhcGvCsEXkpkch/XPvmQdKNLkl6E38J6GO
 lUuURmSAyUCJE2HTt9Rqk0xO+v5raCO7n9QljB7TCn1riYQXT2L2QfyAjUPJ5rPPI0e1T
 s2e3ljLlNy/iJWFjPOJ38dtb1SBGf6sLalg5Uo/PbwYv0GVPFzsukMcZA3DgFgCOiz5v3
 B8Kzsde/QgIwVI28LCLHypQHKpZrfkuwMuLMMmzyMqaS5B4t4QDPd6gR/cXcmFk8b/4h2
 M0mIqc3GfwhI3ekqdrwcf6N3uizPI8m3uOjGY9MklZCpv92xLJ73N0emwStW8JBqE9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SmrSCwIAREKYOo2Tum8ysrlmFY40Bbmj8RgWpFQ0Zr8=;
 b=EBxTHrrR/i+ceeEcJcfL8XAULHBJpiSRNrlT1N/tRJNNXNMezw2TS4WgTnxlRxL5xWwS
 0taS1Qmyy2GdSNsfl/SrdVciMJxC1YiUnQ0pZvq8wZtZEVlKAuzECoZvXU+a5uGi4Tmus
 CZNC1gpCaKP9NxbZxTLf+kPPpcfI2BS/85vQjsT0rGkjaTGMrosoHbtzYMm95isQz6RCb
 +lDpG6LVu16X8BsINfA5+vCWqBgcqKO6368rJctlGvfpAWRj/N+QmCXFRNdmNZk59MZqt
 b8c/qXG8Wy2PDpOVKyyNA9dnNpLj3YvG3FVK3ma6p49oSf1xKpMeqbKxympRrLluu3Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C604180D3E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9412F9D4FA; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51cf2769d556456282b2f68813dcf9d6c87ef746
X-Git-Newrev: 9c3a69d1e09b6b7035ea5d529288cb01e61d4fd4
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.9412F9D4FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jsonmodels: bump to version
 2.9.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c3a69d1e09b6b7035ea5d529288cb01e61d4fd4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-jsonmodels/python-jsonmodels.hash | 4 ++--
 package/python-jsonmodels/python-jsonmodels.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonmodels/python-jsonmodels.hash b/package/python-jsonmodels/python-jsonmodels.hash
index f7cde97b4d..e417f0c236 100644
--- a/package/python-jsonmodels/python-jsonmodels.hash
+++ b/package/python-jsonmodels/python-jsonmodels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jsonmodels/json
-md5  8fe7bda2a40b92e5d3fcdb7e676fd8ad  jsonmodels-2.8.0.tar.gz
-sha256  9c37ae58f0417252b743ee1fa85fc937d9696e16520824f6b221f19f62f08f9c  jsonmodels-2.8.0.tar.gz
+md5  510866299b5082340e4bb0473dba8b7e  jsonmodels-2.9.0.tar.gz
+sha256  45d17aee2fbf28e0689451641cf97d41f8321266254f024e20c9f52088fb3bac  jsonmodels-2.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3b1219763eec6924ddd4c4d61dee6a53c5fc9ab62707a9ad763ee363d3050cc5  LICENSE
diff --git a/package/python-jsonmodels/python-jsonmodels.mk b/package/python-jsonmodels/python-jsonmodels.mk
index faf40cfcde..5275f215f5 100644
--- a/package/python-jsonmodels/python-jsonmodels.mk
+++ b/package/python-jsonmodels/python-jsonmodels.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONMODELS_VERSION = 2.8.0
+PYTHON_JSONMODELS_VERSION = 2.9.0
 PYTHON_JSONMODELS_SOURCE = jsonmodels-$(PYTHON_JSONMODELS_VERSION).tar.gz
-PYTHON_JSONMODELS_SITE = https://files.pythonhosted.org/packages/04/85/0e02cbc656ef7f0f5d3db13be5b622c231bf55bbad6a8c4612ce95fcb8cf
+PYTHON_JSONMODELS_SITE = https://files.pythonhosted.org/packages/8a/8e/134dfa6f8cafabfcf406835fced78ceb95d1433bff9b375e34ed08b2775b
 PYTHON_JSONMODELS_SETUP_TYPE = hatch
 PYTHON_JSONMODELS_LICENSE = BSD-3-Clause
 PYTHON_JSONMODELS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
