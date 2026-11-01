Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB61F606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rTKAXrLR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA48405F1;
	Sun,  1 Nov 2026 17:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAabPa5To6dl; Sun,  1 Nov 2026 17:07:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A1B47405CF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552846;
	b=OLyKIeD54vMZye3Uk20aPvXLa2pMQ68vOJ7CA9lH7egWrTnXIFW9Yn4/ZW96NbKQuA+U
	 in64HX08Rkq6qAvo9XG5KZF8j7s3k10i4fMxYBVGZcz8UiOQBg3tdxk4DYpfKKVJMEl6S
	 u1CYyZxi0zsqL3/PWOlBBpIdC0QDr3jaOkKGuEBxcA1XWPGTS31RtSvmBVhi4UHtBx338
	 7atKfGLr3Jm9f+AV9gItmA3F8rlcB09D5tlqSVAm+96MoiTCEiNIV57DE4t8klsdZ/AUT
	 1wOghNLjYi2kzCkL4zsBV8yaektydQW1cA96UfqeBP5AR4pasZxJlgr94bmVQxF8LCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552846;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eL6C+hXujAeT+aFnK/Pp+JkDs4jqrsPdWbZ+WB5sJnk=;
	b=eg8SPkSsG0b4hKx2QSnoeaAgAoCcuWBbOzm4nID1St1cnC376SP4qLbRDwg/TOL/rzJw
	 Ae8KH7T05PPZpniPR3FxFK0hsty63w10aH7MaHvtI2+/574gPOhKLjJmAxA4UAOqEH8xT
	 PX7EJsu27BnJDfW2/HwVsZX7fd1/4dZAgGBa/oAZ3/4f/mZ2VRXnKEj+UBJevTKelb7z+
	 WGgvfl1t+A8ANfq+Of7Jf8cCofy7OuECgjKZyF59HPAOVduLd46LUqxexs6tdfykpu3l7
	 ZrxzXSSJhkQK6p7LUifXid4eF/zVpqm6OKKk24nZkSoesxXgm3y4AGzrjEq/Vkp09Ow==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552846;
	bh=eL6C+hXujAeT+aFnK/Pp+JkDs4jqrsPdWbZ+WB5sJnk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rTKAXrLR6q92rOdHhSaIP1MnTw3I40P/60m7DyoLBai1byaH/fyqzgVxve4dQqSgb
	 NTRFBQt1olcX0IbZaKybpaOewXyge/OhS7ueofgCy19ueSlLWIsjK3C9yoY/1emYru
	 IKImGtjg5vhKzWPtlqEC0PPQbz4QQD9QPzpTvJzk41DI2jB0VQoisJhN39vYXtsLA3
	 hFnXktZYzEUjqY3X/SJv0MS3ZDxNQU3XMqz2fgeo0+U1+sP6Cjc0OBQVMBa+26zRrP
	 WwIk33o6PqG/1YXE6afyK/u8oRJhJHrN3oP+nImaTClDWGzAkszRyskApCCo+foDKG
	 5nxK8u6EyFNrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1B47405CF;
	Sun,  1 Nov 2026 17:07:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 831E2EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7497A605F1
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x43-PSEx-zv1 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B67536061B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=jX4iCvg2DTcgrnwOfWhJHboQDJtJeZMYKVud+IifFO3N7TiJt4Dyw4io0/bO89lhdTci
 Pmyg9XDXoMaaVzEUnJOE81WN3skS1l4tcbQS8svJjJ8ibjUMpNM7HPVzS2l0JKJK+U140
 N89vIUrcDpFyPPu6BRr+f1MlOL38FbFGq50i5kQ9wpiHBzv4JyaS1LjiErk4Ao1rHuyum
 GlsFSLW5wVlR4Z88+/ZcHwwkSBzxFYivZTrTKja42XV9Bo1eOY1p5vn84hZRDWEWKSdln
 8o+Vh0eoeZTyHJl8wN6G/dS30Gx4H3OsS3glsvJuiNXY6YSHEBVEIJph0XGZt6ylTPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=o6MXYNbUkuIi1ooyxiFd2Cd8CCY2kCOUEVPS3aZ4gRs=;
 b=Qdemwhh7sTJ3lF78i7n18Wwe/HZYbOJqEq58HdAQikXhR0TGBy/uxhrcWEdWLo5xG8hL
 CV/u545xTuv+Rz/pqd+8nEToAdfZ/kN/bqK9L//dd2/2cursDW7Pi6c8+V3hQN78+ZjJv
 ujCQq78imShP0VeBwtygsy16pBmzEKjo/Rj/qx+OLmiyRxRIKMeaeIEmhoXltZr4gq1AX
 MJgyhAQdls+dv6y59Ub2frg4dsfwDEXhZfj87zFrI1V4GugZDPo8K+esYLgtnkEgF/4+X
 sQC1lOcC6yy9I2pxzSOI8vCVRwg9MfeCf9BoCple76vYxfvz8M/t599ImMSlfxpCORA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B67536061B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8484F9D4FC; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 974cca19ce15eadbe259a17cf6ac43e9cdfb2e96
X-Git-Newrev: 51cf2769d556456282b2f68813dcf9d6c87ef746
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.8484F9D4FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jc: bump to version 1.26.2
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
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,BITCOIN_SPAM_04,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,PDS_BTC_ID,
	SPF_HELO_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51cf2769d556456282b2f68813dcf9d6c87ef746
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index d27a6e99e3..230889053b 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  dfa209538fe6eeaf2f6462847dedd131  jc-1.26.1.tar.gz
-sha256  fdf1a58d05db351bd597438cf3b67ff7a9653cc0da4c63234ce77fe26051a4dc  jc-1.26.1.tar.gz
+md5  1d3871c419721c433f871b2776de4d69  jc-1.26.2.tar.gz
+sha256  6e57c302ce55d5862c1f7be1c2ba2baa630bea1ba690f6bb82a8c7e734b70fc1  jc-1.26.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index b5eb2c08ae..6649750f21 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.26.1
+PYTHON_JC_VERSION = 1.26.2
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/e8/e0/ac16e68e8e56d0c63eb97d6d9a0f1d0320dcd16763ab288de4ea950eb7ca
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/d6/6b/001e082ba68c5ba0a604a6664afb66a1302539da0fdb7862f5d7a9ff0902
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
