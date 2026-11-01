Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C5C606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ECEeiUxs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F9AE605F9;
	Sun,  1 Nov 2026 17:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zI0O368Nj5mu; Sun,  1 Nov 2026 17:07:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4099B6070A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552845;
	b=MII2Q3CZ8AxWXvrQyYZqvyda1EvcUKZHH6742QyztR93+Q1lmTk9OAuVLNf2baULOmru
	 sZ0wSv9wClL2JlpksRCRa5G8KcvG64FL3iu/vNMGPcbE7o/KwHW+m4RgSVujKyAF+x+Ut
	 PZlokNJ9xM1m24nF9J1e9pLyDTP0q4MVjd7T6RHG5E0H7dCVp5d7Fu4XvYgz2SS9te74B
	 4Cgz0zTCPFkRXQ7i9fvHzDPZvyXHfjv8eJjHrt2MbseJ07s8xpKYeDDD1mUN+sSt+jbzs
	 6TsAmtI7kX8oQqVFfEA3K3I4VgzjJmadgfViHe01XUXtxqFXvHCBEs2bDP5Fp6vb6LA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552845;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DXWq+RUZzdFGqyHILSjP1snvBzt0h2Xi9Ci0RVVkVzU=;
	b=d1vEC5LyWqAIMoDPHWE9yC+2M5j1ohNAJxUUkX8OVm1R4rS5RmnmyeiWHJjvFMpPfyFU
	 BW/M2BhqT1+pEGAtTEBbqHacfyDyKCwGb0y3q+J8AHPNfQ5DGYpEY16fdLEFzzP9hywBr
	 nJB12lLWlyhllMel3WUZ8tq4q+mgKE6PilaA28WSToAzfsul2A1xKYxvZBGQEHsNwcfnk
	 BqH5qEF+Rl/QQUKVSUObkwXD/VSfDc1Uy6PcY7GpA7K+/BraYAfqJd9gTeTPoCxDyp5vq
	 HXp2jMnOsAi1H0nTxT8PPFf0B1cYX+lw4OE48QdSdWmTq7mgndFrdv4u8/bRmLVLurQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552845;
	bh=DXWq+RUZzdFGqyHILSjP1snvBzt0h2Xi9Ci0RVVkVzU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ECEeiUxs5bR0ky2jJacTKQXHtvN67/+syj6cWkY9TYRhJR76/szR5yhQoZusROuFk
	 AFGv0tji5xj0QnV1moXEsdZmlH53V/rlSs9GrTtKdq1pc6EbwjA7HQr5PgBHj2V+yE
	 nYz8Qz4sxFxLSzL1OHYbSIh+Li1W8v879nx4tkENrczZYLVzvshYtBnv3fK5XTGP4i
	 vbat6ApZmnDIMqN64GrGAiMPyG4iicaM/+A5UiYEZg/NCm7PuF7ZDyAxisHdmYqN7J
	 P2UPfGSMNGH0P/N13Zr5oiy2dDOV9HJ1lskPBWmUNq7L2t+aC+DNIo9VNZNbukGR5S
	 7gC/1WKRjfyEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4099B6070A;
	Sun,  1 Nov 2026 17:07:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BD3C2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6153A4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vH-j0YsrDYi for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6681A40076
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=sKwyBdVTiGuPdVaX1dpnNOKk0XsF4UW+smiUnDxqLlvN/Z9WvdkCmRCNHaHbhwrzxZSM
 Df8laieB3/O7CQ4EatHHcY4F9r3FffX/xGWasL4N9N2mQazAlwQGoFgyRHW2ziI9P9Mbc
 1YPe3HRzzXV8qzrOIhhM4UYVuSYmhgo76/5ntcHC8q0OTtOgtEPLLU+j1jh5pnZGrrXLT
 F4Sx/pP8LGCSEkQp0+V+8l3Ky3iH8cQXG02AkJwhxp2DsFHnFhIktCgt8A63d5ZYETGJF
 7wlYyDwKSz9yvMbRfdODKFgVqYXWuq6pge2wt9bDl7aXIRg/7u25SMS3esfOyf/DkPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xzpNPpP5aagmTcav6ttiChVWODMGKEQzWxCKVlU4Si8=;
 b=Zd5ueUyIaMFGIQe+O6skL5ZMrKWG1mUj6BAmM4iofn9dT3MTcy8DjdfIZoWNujusWsIv
 0gRlSr5wPe4JBI/njhC4LBfDnvbt5nwhk+7fWybFN0XfHiZm5gLIVQVrsKriRy1gQTqPh
 U/4bKa6R9mhddsN8MoAdsyCqQPPYt4I2jt2cRI0CntCXz04WC5CaOsk2pnsVc+F3+0Xio
 HAPOu1zJ59D+cU5jgmcAybmG8xWmrLpjpybZ9VrRvEZlsf31WYIm/pi3dSZ/rDKeG9c2l
 5/DDXhNCPyb2rDbmqqDEMTjqdjYmRK+1BZ0BBozkoWw4tftvJUh7oS0vzy3broqOKYg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6681A40076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E3B19D3FD; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be6b68661e7aa53a779aa4e9f5eea84bfc9f82e4
X-Git-Newrev: cb55378294945d3d43833860f3bf8a16eba1e39a
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.0E3B19D3FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dominate: bump to version
 3.1.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb55378294945d3d43833860f3bf8a16eba1e39a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dominate/python-dominate.hash | 4 ++--
 package/python-dominate/python-dominate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dominate/python-dominate.hash b/package/python-dominate/python-dominate.hash
index 26840e5f0c..5a69431728 100644
--- a/package/python-dominate/python-dominate.hash
+++ b/package/python-dominate/python-dominate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dominate/json
-md5  4dc4bbb39297999624e2312b6fe2b46f  dominate-2.9.1.tar.gz
-sha256  558284687d9b8aae1904e3d6051ad132dd4a8c0cf551b37ea4e7e42a31d19dc4  dominate-2.9.1.tar.gz
+md5  cae3b6ab495fa4cede991a2eaac7e7d2  dominate-3.1.0.tar.gz
+sha256  926989c819db2fe91e590590a2902183685edd94829c8cfba5fd71af57c1a982  dominate-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  LICENSE.txt
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index d6301af9db..5766d93d34 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOMINATE_VERSION = 2.9.1
+PYTHON_DOMINATE_VERSION = 3.1.0
 PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
-PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/fb/f3/1c8088ff19a0fcd9c3234802a0ee47006ea64bd8852f1019194f0e3583ff
+PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/4b/d4/35f08b4f459a44fff3295a70a46d6f8847b77945f059b0fac8d082efd9a9
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
 PYTHON_DOMINATE_LICENSE = LGPL-3.0+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
