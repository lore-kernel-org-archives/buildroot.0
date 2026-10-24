Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EFA606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BtKiZJhT
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88F2B60AAD;
	Sat, 24 Oct 2026 11:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v11jtuEruzdQ; Sat, 24 Oct 2026 11:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8432060AB8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842844;
	b=nY+LlgRY4Bw2ppSwrqEc4MzQv41so99Md+QxXmovEHWuuCSZxzVYOYxeE4XVsCIG6aq3
	 S4WE7fxR0vQ1Lq8iq07Hwdu4tK35Rj0C9EASMRg7/fSV9bR/X1sp43rWrKy14lUtXTeWk
	 9zomVOIp/hqAdUH3FWIQSzO38ZtiZsIlcU0yvB3EVDDn0IpQ4MUp05TlrD+jeTdXNQLL8
	 0cVZbIcvdr/C/ZsPAqF6q2utSwutK6C+v8XLl5jvtp2nCLdOVmfEetsC9phHWg/BZsvLx
	 cx0CECYhluqN+8bFVH67k2rNzCYQAIOjzV7qZfcx6bLMtWN1CNL18iQwdAK/3D/P1fQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842844;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rASco67oCka70CKVw3z+u6PVznnIP3sZtAIbY+tpFRs=;
	b=lTHti7l5FE488FIwfbxBcXMKePUfpqA4ht73L/JThZsSOq1seX9RFjBoMvPbfNDaOfP2
	 vl7V0lE7zxm2x1kAHB0/zG+w6aISk2WWTEdlQ5SdXloFBrqTZg8usxE+bDqq/uonW90Zb
	 mqjXiQla2FBsh5uaOiOSBttVbXi+hxzfQrq7lixe574tqDKfTFBh+3A9xKSYj9qg9spbH
	 REaTQ57TEk3/fjr5CYcCBr+3cqiRnMbm7aVfj4y2KYpvtDai14qbkY4BG/kN+Ta5I/SAg
	 WOQpYcQKYGgYZn8lo9Fa1/VCfuWicAo861eO9YsYAbgi2oDD5fxitC3aoOEsMNrs/dg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842844;
	bh=rASco67oCka70CKVw3z+u6PVznnIP3sZtAIbY+tpFRs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BtKiZJhTcai5fx+Vfn2g/dLGmyJI9gkxZjXh9bb694aPMHp0K/S6e157/vOakyQ6A
	 toEwfaWc3ejbM7O6wC8/HR2TW5nGGilnNv4yhNCwqa4EcvViMHsObWK5pp1phUPZaK
	 +lVDb4MCU4MNv+0alA45FjdAxP/b6qTFPso/qqez38nQ8WhxhKWSu8HRvVdCkQv0H3
	 uFaYK2iMcFuaAQo80huP9Np+8j5n2NBFSR+YdAq7e4yJJhxmSAHZARKV2zH6mIlwwp
	 4Wet/PNkaszXPhKl3xNN7V64+1Gvn26etbDOJMLTz8EecRDyRIhASs3x+VZ8M+6ojP
	 mxMU7FBaqsC4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8432060AB8;
	Sat, 24 Oct 2026 11:54:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECD1BD36
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D30AF40068
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geBeu01inkpk for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 16CF2400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842832;
 b=OCzVklTPNv7s/FjzKQsx2F5qs8UOoSDqJdMkr4rFbLXs+V3LoCf1jgfoT7WoYhr11tpv
 AHMQI1UCYTXYon6FxQ9eX7RMJ2VrrFTvunbMEveyee430tC2mTxpAI5dROa9e45+dTtj0
 0aK4RhN4nP7wRcW2VJhwBaAeLE1ONniVnO3YFRRj6QBCs9uVJPnQB+MAcUYPLaonkN7En
 llK6LK8FSFecEZ7cWT93bRQVIuj0S8vW5OxotRvdtmIOrNMeEwWLutK5RMg6yEf3ccsPz
 tdrhbadGMLEwfT74rVX2vbWpHDGw/v79tapZPkRCUM9D3q503ij+80AmC6s4dL98qmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842832;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8AYufR2yL4Trr3feXVFoeCRv610IY7Aqibjj8nzM1p0=;
 b=FzV2A3jgOu1Aeeiea09IlB9SO69hb7ybIbURzcqXdz8ZfMPJUHduYFL2aezSMDtFtuU/
 5Jre5UvTKZ33IM420V4IPj/Qg3fsbpGCGCTEhSkM53goSfUY/M2RBcuYQQXR+7myynIJn
 p9/j61HBFT0r6niKELFy3Pjy5Q+Fyl+VUvqeKm+CyOuw2VAD81J42vr6U7sMYvcwAf5NR
 DS+tFylWoAARAyLQTx9mqNPC2EbMvuLiudeAVRV3cCTCfuUsLB1MmHBzUblZub3kwysDw
 14ME8ZMEBXoCi/eRQvKyYigRzovk+tQDywF3LffYAW0yzcXjSjI/qfOTZ1Y6zgS/O0w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16CF2400D5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CA1A9C7A6; Sat, 24 Oct 2026 11:52:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:06:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f524367454123461ef3dd162b9dea753fd15dbb
X-Git-Newrev: 3b7d1219a93f5c8b8fce996a3a2c0bf14e5141d0
X-Patchwork-Hint: ignore
Message-Id: <20261024115227.1CA1A9C7A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tornado: bump to version 6.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b7d1219a93f5c8b8fce996a3a2c0bf14e5141d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 01806b164b..fcb8a26d67 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  cb425742bae00f50c5c1ba81c74ba95e  tornado-6.5.10.tar.gz
-sha256  a6b1ccd08c04b4a06fb5aeb381be99de5ad1e5375c1785e31d78c880feb57687  tornado-6.5.10.tar.gz
+md5  2c34bf303447660611db3086cb66ba5f  tornado-6.6.tar.gz
+sha256  34c4aa916d7f2b2d5cadee2c6850f5a4a7f3d688cbf58399ea9bd3057af4abd5  tornado-6.6.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 35fc9ce131..a57e274b8c 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.5.10
+PYTHON_TORNADO_VERSION = 6.6
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/06/61/53d562a57b28c08eda40b258c0f975e360541943ad7c7bef897a40caafda
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/d0/02/5f549b1ad5da6267ed1e1fac2eef69257b1979cc812497002499b7895ff9
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
