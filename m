Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0961B606A320
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ozKMv0T0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D623C40B7D;
	Fri, 30 Oct 2026 14:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHTpHEU_GP5W; Fri, 30 Oct 2026 14:06:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BF38540B9E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369209;
	b=FvJCVh60ln6KqrRDrIaSkbyd0LFL7kkJQOZKlp4r6PGSAkLm0C07LXeLK8VaObj91qmn
	 QXSCEJDfv3/7kIM7DKViEguQ/RdoawvvdO3RQqM7JwRMuu3BQbJXM22OIsfrIn2XZXEnY
	 ZWErfOXS3bZGJDDtLfru+8GZ9HzXWoiVqsOXKX+zqJqKo7ub3MGcg3ro75npn2Ez6gVuB
	 RNwrmHHwbZDQltUk8XV76Q/XCEaQ0+j/5f7l+TxxzDbyqukvjb+315YCUauqruZk9O5G4
	 eDUxWe4SKjhXtIj/CG1V689xdRfYTYr17lMQss5I+25tiNshKl77UjGE10AdvCiyLLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369209;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=pxUPEBlN6oRfeoGd6R3BCAGLKWifeDVfYKDV0CtjRTw=;
	b=R24yr1hsBhU7QoUeizKLJKdAORRYSBtH+5TgiHYE49Q3s+p2g5lXrxeYstq5PL4w1jRV
	 cV04PLQs+at9zYzg+s/O2g4uIvqnnRkZvJJbJTj3+CPSEaQ8CFxqV1ybK0Quka2LXSGlV
	 GUVXSCEh8p6uUMnsTV4OWTWbjaqtna3Dh5KvjhSpRsTRyLe+jCkpMR1RXCEH3ppRI3/ZT
	 o+weFqzycZ62lBZQWX5brx4ZP5gW+YWTLJfIfjCcpirJKQGV6cft39EFuNsePjUQRcNyE
	 CqjCq5O8sHBf/KQmKg3lOX0tAIIqH3L3VQag31qDkYDbEnmYrWclyyeph9bbSVc+2uQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369209;
	bh=pxUPEBlN6oRfeoGd6R3BCAGLKWifeDVfYKDV0CtjRTw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ozKMv0T06J+J2CfB7Cm+050tNSza+jZJ/S2SWjZP/px9wux5kn3Mf2gDy5AGm4jun
	 5Ucjn+wWMmihpMc5pT3lJiF9CH0HiJyTfIv7qHMlG9CV0HI5M+7Wu//aNFQJmeUTxR
	 TAlL2dhoCh91ehgGitjNoEgY023PUSW/Ec5E+H6bgbIn2dJwFLmWfra6MJYe7EHcMj
	 X1wIW23i/C0bDnMFyxCZ5UH/Kptgh5cWpAj6AZKlh64nJZJG/acyE2dFDHA5/daWrr
	 6+6LllxiLKoL6/CowSgfsKsqEVnHvsDOgnHCaBNRY8tZo4KUR8YvNzIRbAfjqN2jMK
	 cz4Ze03mnYOmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF38540B9E;
	Fri, 30 Oct 2026 14:06:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0E8C362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A275040243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiyD6mxQvCCW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EF400400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369162;
 b=Ue3aQsl9gCD5sSKwGo6CGuaYaXVdvDKxx3gH7ekX2LFnwV/3b/OWbRoWmqWVLTnzbUP6
 FzeY4YTOkdxM1iMFnJeo0mgl9h3WqTHxB1C76mFr+4i1M3mxZv392vZ1N0Gcsh698UovV
 M8Lc9CkiUc6kUg9wYripj9pYuEDu9piMxkqESfrI82FbWrYNzhnDvTxPh5nEDIoKEA8NG
 dlkyfZWMlr1kmSgQ3srAahMJNwS2tdz43WwjGjj5Puk8FXdPkGG4OeGo3JLjLoapCi78F
 OX8s/x5T15rXniTpajrOVRgS+wIIANvwbf7BqafU23OOIk+/pBtmLxPGDfwlE6X71Og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369162;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TXGMOjwHWTvSJAAkXwQ8GdY6bJq+25xPv7i0UxlrBPs=;
 b=hAL+rFHX0/Wmqb62SrR7jcqiwVfM2s7Xj3HNBkf2RH+7eY0ARvbLCsByXTyFwqwhTr+W
 HVLkJ6ilDTWdoeq55mpGrYB6I+MX3gnP4ziBkn+u1XKLVF7once2cfdERfJAPk2sEfAZb
 c7UjiSPRA90EtEi72mhuICZ3ierthqBaQkRfYHmmrLQj0q7adryuU/M5Up75ie6V339vw
 MMXPru9JecYJiebPj9rDmeYmlGHbd9+nwPis2Zs6oWEdFGgBONk0ujovgPS5+NW9rVQmY
 GD/7XLTxidybGfMNwCr99D5QfJnioD/UdZsmk3+etnYNfF2vKNWhPNqRd7iwnMIiazg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF400400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B9769D389; Fri, 30 Oct 2026 14:04:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:56 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5c089b5ba0fe58eb0fab5f0038ab3dcf96aca8aa
X-Git-Newrev: 6615c3ad302541a20d8c5a63074de049425ce1aa
X-Patchwork-Hint: ignore
Message-Id: <20261030140434.0B9769D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pip: bumpp
 version to 25.3
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
Content-Type: multipart/mixed; boundary="===============3396082292465285810=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3396082292465285810==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6615c3ad302541a20d8c5a63074de049425ce1aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/pypa/pip/blob/25.3/NEWS.rst
"Building pip itself from source now uses flit-core instead of
 setuptools."

Switched build system to flit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 285097051d4a7dd821f01d15c705867f7e26c635)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index ad70f0da7b..24d731d9e8 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  6d109857fa69274dacfc1d6528471eb5  pip-25.2.tar.gz
-sha256  578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2  pip-25.2.tar.gz
+md5  31f52f428372020b80cd7518862fbbee  pip-25.3.tar.gz
+sha256  8d0538dbbd7babbd207f261ed969c65de439f6bc9e5dbd3b3b9a77f25d95f343  pip-25.3.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 02d7da6fe9..95bdb64963 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 25.2
+PYTHON_PIP_VERSION = 25.3
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/20/16/650289cd3f43d5a2fadfd98c68bd1e1e7f2550a1a5326768cddfbcedb2c5
-PYTHON_PIP_SETUP_TYPE = setuptools
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/fe/6e/74a3f0179a4a73a53d66ce57fdb4de0080a8baa1de0063de206d6167acc2
+PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
 PYTHON_PIP_CPE_ID_VENDOR = pypa

--===============3396082292465285810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3396082292465285810==--
