Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E35606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JsKuX7oc
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA8640A74;
	Thu, 29 Oct 2026 20:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLKdPXSqS5Lt; Thu, 29 Oct 2026 20:23:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D7C8040A67
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305425;
	b=Xto7A2izyoMGlVrIHArrej5AOZi850YZk50mHT1WYnF2LJJWj4bsaSQDk031ojib9xUd
	 UQkp9PQUICqvGZFxdDUmDPpvC8R3CpxGVJtCQdMnQjfytwpmgjeH+NuGWVSlQ/qorkoox
	 Vq0ALMh5gCYMDztiJxn6Yz+eV97bxFm4l87ncICtHMm00Gplq1s9dBpSRWSBRF0UtxxmH
	 I2oVvV+4O4wvHbZd7Nhr+MGHgShz2SS6HlgXi375Oz/IlsZ/owPgTgzzrRuaSU+kJgOCM
	 7iDJLPwXVcxwtCm0g/LTHru8b0IL81147uK2Ibq1n3m7d0D2V3QUB4gSJYhl0DKQrsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305425;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wZVjfDHrG+snNeWOoj6IYOjWEx2GbwtB0hFxqaQjFuo=;
	b=N13bumAvz6dhAfL72zNAiDXYdUszWqS+4lQxK02UWP9PDJcUAQrI+c7MjftAAx0xMj31
	 dxXFfV+QUlm0ZMIwYuct2QHaWo43m9vm9sOhYaWOKp8fHRryFE8Zbc+Z3Ln+a/0BBWwEG
	 6l7vYWdDCtogBoM+/EykAzcyqycLg4L6YAubqu48aQlWgT7RbaN2NbEFRHaHWF+cGskP3
	 XD6U8VEcjldzXmVMJNOPKIrrBaP/Jputdg2WuDjeN0XrJAuk8GBCHVwSJLWt5srDlbOnZ
	 HGaJoBNGuG+cutvx/c+78ADvrLExgaJGj2LjFpgyvAO4Edw6baUJm5tF0wJ4eeHohhA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305424;
	bh=wZVjfDHrG+snNeWOoj6IYOjWEx2GbwtB0hFxqaQjFuo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JsKuX7ocHPmH7Yv2dgsscmDBzbG3eUjgAsng0bmopNOUSCa94SDkUCfN4zktyFqp4
	 UIdy6uAicj17ETaT4rzrTbigXRQk+CfUYpij+qCh7zlqI+k+HCocQ3EZ5mo/5vIikl
	 iMuX9gwr3+2p7mK0hHXVD2II8GQBt9rbnhCXU3oKhit1DDQbw7TP/OkMYB0rGN5qip
	 8q6GkPK9tbgVJNzcKDnmG4dj127vjbSv175hdqIYu8Kt+ue0yUsw/eQ/kMKfMx43ur
	 h3mqEXIC/c3BEMssACo2G78FrmNxrgtUEKSS0b+XZI6+6OwBf18Oa4juw5VOnh/nZ+
	 KQk8Rz3OZKBpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C8040A67;
	Thu, 29 Oct 2026 20:23:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 569523A7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A09040A68
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fH87KSmOUInj for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7D3F340A72
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305405;
 b=J/S1pLUPb1nh6SF/HNgWGzFC4bXEXktiXPuVmg99lLaetmi4MLh7I26v7tpqfl/v3002
 gyDS48IlNyHLwHj5WwOqnLQT9ce2Gc0nXlr3/Vvry83JeGIvvfRkXSWHZCZjNrVzUAB24
 gxz7DRtvJvK0r+JaGx6fO7cOPbGPaBY1fiKCN6w0SBn6NCeA45H+cfBx9S57FApqqqB4Y
 Zar6gmlwJ3D35oa8skYZ5RWXkwm35n9xjoaHLYVVIW6Ty1ZTFv2HXPZr1N+qM98PMMuLL
 fvyU6lxKJPNnBJ08edhHvhd9IUbE6FXbvAArut7veQ4VwZ/KxABD7UHMj5kJ7/Gd8Cg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305405;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gi+AOtNsEu/wPFKRjdu1ZL4IiiDu+jPFvhFwvqJUXD4=;
 b=jZcwJgH0rvl3xOadw7nofsLvlOxWr5J5zRMdtuVGFaD5LvgAo3Xwdl2ar2uw3M1psIpC
 ymKfVgjjgSqaeIADxs+H+LNF2xhJxDeW1PuIh5lP1xmNlmivguLtCI2vTk6Hdh930GFT1
 nFMgLeZLvC2lWmz3FqiLLLMJUZKtZCr4kljdS7dmKaqbp9mVx96jcxS9kX3MxUlbPnQCT
 tJE7yRmVF7MdwMnD4QkreE2yzXSc0pYkCYAk0quS6CSYZB0iWLEDBFfFNuvYysMnteSGy
 LXzklXV1F0YSG/FEHpO/3ZPtTx0s/6xokD92PlQLWbjzqk1/W4ZbjkwpuqwRLkSg06w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D3F340A72
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8F629D2EE; Thu, 29 Oct 2026 20:21:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 933e27c0de451e94d1a3a7da5eaedd434d5a0f1b
X-Git-Newrev: fcd7370ab2f30d9c0e768320811a8bb09fee11ef
X-Patchwork-Hint: ignore
Message-Id: <20261029202157.E8F629D2EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-skin-confluence: bump version
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fcd7370ab2f30d9c0e768320811a8bb09fee11ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 9cde584da2..9974b4a3bc 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae7177ad7f06fdb38ba0e217b2ac3e4375cf29a7792f2eaa70003286410521a0  kodi-skin-confluence-b049aa8b6bab50518de72783efd219680047d6d9.tar.gz
+sha256  8043658a939e141305d6acd426a5a5be3a35ec1b94baba23fde069e4a1ff0f00  kodi-skin-confluence-da60e21de4a87581a8526c9409625e9f21cc7a33.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 31d6b37380..2a83eb5994 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = b049aa8b6bab50518de72783efd219680047d6d9
+KODI_SKIN_CONFLUENCE_VERSION = da60e21de4a87581a8526c9409625e9f21cc7a33
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
