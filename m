Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB61A606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 13:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DM8/ZDYl
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E20E38108A;
	Sun,  1 Nov 2026 13:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1R1-vP0eJZ_z; Sun,  1 Nov 2026 13:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DD7A880FF4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793541171;
	b=cw1YGAff/l9KXbPwthnqARtePns9qcfEoXp9PafjrYpP2NnUrHHzU5gT7FhlS+wfBfhf
	 jRbkpYGxDjP+tknhiu4xQMQxKXYrq1x1HNfnExrLGBOB2jAn1MdTVpS3yzvzrCwdxNUhg
	 +byzLHIJS/RaHc+iRTamm+7Xy6TGsq/U0GiMsUnERSSNoIi+6B/gAxux8w1eknqhExLu3
	 BVdlWvJ3sN6e/oKyDz7vDbsHrz+FSlAAKnoulfAabpONQ3GY2JTJfG/ZBai0bI629/sNC
	 d8cb1woldS3YxmUPOoxjcnDuBkZkMqVIvuNZDFnXOBYmeC4e9CpqVjgNAkDu16rHZbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793541171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=h/XoPOVWIk05QeZZ2DMTeSGkGPs0m2RVoph++Kzp/sk=;
	b=ICkie4zKZ3Y2+2bDuM4vFN/0wN/JSpMTouXmmQKowYmKLPOpmTWWQkD3hMPfN+TItiMv
	 21q977t6Q1QryaA83i/U0pPpErUs0cSc1NiesQ8ciU3S6oWSOP1YECMo4B/KTAawmPXNq
	 5muRT4H/MxPoejpQcscRsXpyUtdH9X39c62v9QUbcRy6SPyQaf4dLDf+6es9X9JHVeeF+
	 AOoCoXSVXOWtQ/DqGpXfx7ZZgK+YDwMMCqlYqvmLhgso/htGnQtZmuvhbMI1R/VYwvEd5
	 jjY3la2yKuGbvZfMzrzlqc52UUO4BrHE2SvkRb8DBfe05HILaq6W5haKU0ociHoECQg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793541171;
	bh=h/XoPOVWIk05QeZZ2DMTeSGkGPs0m2RVoph++Kzp/sk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DM8/ZDYl/hxjN+13Xjq3yakxhifxqtYG2oPZi0KDUGwvISeF4aebuOERFIxgch/hY
	 D/aKqCJHduWM5DSl9lNXYIiOqNaOj5oIpG3WGRk1V60GrDmaEV9Mxp78PV92EH7kiV
	 PNoPnPMH3LSZX2a62LMSH5IlGZyCKk7+PQCwiJKMID+vLUe16AvnYJ/LRm+RuL2D/g
	 6k1L0viz7tEmVkCYnim/jAP1fDKo/jd9+QThOhAqkrZaUHWHlUGQ+GXvEWxTVzOF0v
	 kfnhQnEaJKDr6WD4qPyB3CtN4lBAo8vhxjVI8EIbIbQ30+7z+QrwhWwucvCEil/RWD
	 YHjAVSphmypBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD7A880FF4;
	Sun,  1 Nov 2026 13:52:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F958156
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 852144009B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jk20WY7XJ6rU for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 13:52:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D6C6E4004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793541167;
 b=WwXoSkISSBv4Fh7kqfmyBM/TqMNG0+3eyRZdT2j/nXzGi9OgPBt1J8aB+QXKHYmTkxhv
 MdhrMaeWVdBuj2goj5FIBTxAi4OkGaNUlArxkpZKLlp8d8VRsaVKJcNfse9o/8jh7nYyv
 3DbXBXJ+oPt5ymPEiatWVG8D0N4MEjKQBwRMIxE67mPIPA22Qok7nko9ot2Reu4dvrLLl
 JaTiPmwolljmJzHWkQfnDCMK7sa4jcE53GQEeAcxYgd4Z3C8MVIH/nGK+EHZCA0L7ezGT
 YX5G97yn+KcTA7KCvIBvsd+7BJTdAItF+YdyWb8YZCDxB3PJ4COf4d4KSRokOvWKXYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793541167;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JqwU/Gmleena5WUGXYeXVXzkm3/+ML0aAFK4PfCVNVQ=;
 b=NfC37DGky4oQAfGNorAEBZ6FZgwfbCfhy9EWyX/FVo4GjHaWvYe8ox/4MKa45/Ue+yz4
 WwlNBAIk1Ylt5WmZTdBq3kwKYc2p91PcPb6JAgyG4IfQSe+VpPLEXf9DooRWlQM2vBCNO
 LAjYRc3vLqadLDWPr38ko7Faihp9fcr2lN4PJpLmkJRhP7eJ9wf1Z2Kq5nZjyq5yonstL
 TaV1g26ZJA0AE4L/cOOhqraKVqUa/UbHwdLhgFYhlgQYkQd5vNnKgiw69vRVUVRFuXTob
 BwpeN4rlNGckYFbD2HtyPmF1eMbn+aAuykWDAIALNeCn+asirL8rY1eTJQZe7dyf93A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6C6E4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A797B9D460; Sun,  1 Nov 2026 13:51:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 12:50:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdfb817b1c97da7835e7ec60e5bed962e1c4c3b5
X-Git-Newrev: 86a3f994974296c9b358f7287dc5fc0a8968947d
X-Patchwork-Hint: ignore
Message-Id: <20261101135118.A797B9D460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containerd: bump version to v2.3.7
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
Content-Type: multipart/mixed; boundary="===============5343147656005350888=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5343147656005350888==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86a3f994974296c9b358f7287dc5fc0a8968947d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/containerd/containerd/releases/tag/v2.1.3
https://github.com/containerd/containerd/releases/tag/v2.1.4
https://github.com/containerd/containerd/releases/tag/v2.1.5
https://github.com/containerd/containerd/releases/tag/v2.2.0
https://github.com/containerd/containerd/releases/tag/v2.2.1
https://github.com/containerd/containerd/releases/tag/v2.2.2
https://github.com/containerd/containerd/releases/tag/v2.2.4
https://github.com/containerd/containerd/releases/tag/v2.2.5
https://github.com/containerd/containerd/releases/tag/v2.2.6
https://github.com/containerd/containerd/releases/tag/v2.3.0
https://github.com/containerd/containerd/releases/tag/v2.3.1
https://github.com/containerd/containerd/releases/tag/v2.3.2
https://github.com/containerd/containerd/releases/tag/v2.3.3
https://github.com/containerd/containerd/releases/tag/v2.3.4
https://github.com/containerd/containerd/releases/tag/v2.3.5
https://github.com/containerd/containerd/releases/tag/v2.3.6
https://github.com/containerd/containerd/releases/tag/v2.3.7

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Jan Čermák <sairon@sairon.cz>
[Bernd: squashed and rebased commits from
 https://github.com/home-assistant/buildroot/commits/docker-29.8.1/]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 97d2691c5a..6a7a36b163 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  a07e4bc9959ffdc409d2df22bd199be93fcb7a88f77b3c3dd1c07c199c01b42b  containerd-2.0.14-go2.tar.gz
+sha256  5d973b7d239de0e4cb72f6d4bad348a1540a80f394beb03f84a868714b06706c  containerd-2.3.7-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 753011e125..a4fe07c8b6 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.0.14
+CONTAINERD_VERSION = 2.3.7
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE

--===============5343147656005350888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5343147656005350888==--
