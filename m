Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A518606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B+wARHWy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D86E405E9;
	Sun,  1 Nov 2026 14:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxohEj0i9Qdi; Sun,  1 Nov 2026 14:50:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 331E9405E2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793544649;
	b=M0peKTgaad+ohP5EbLRHfOm0UKdSL083/fykWpo/a1CM04kozAgu+gCkxTQKAw22E6A/
	 lmr+1u/qv/KYXFOpmxh41RdCx0YI0YndYiNWh+YWX5qt1rdJY8kHxNoklo4kXU3G59E4Z
	 K1X9/ym9EYjNA9ZP97qkjgt8kbEC3AD1KijWIgUY0TGXJTBcckvSl59+zqgrlPHkqPbqY
	 /+bZ7/RcLpFyilr9IUPiR5ePRM85EGhPIA/cD1uoJDoxtJw9CtNFhWpaGtinEpQ4pqVwm
	 bHXBk4juKG22qZTp/sNHuUSdf2uy+6uwikDjKX+t3mdwlkilda0tOyiIWsNzLqFic2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793544649;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hYpt7KeMHnqfGlOqov0qR+iPXJNMzJy4rGXAUIfoNMY=;
	b=KhHFM9lvJiGpHQIjKut4IoV0jQWc5/e69L0JQbFjLAR7D4xlL9O2XYfXxUbYSibtG/eQ
	 deBD7wwqxkZXBKVbCnfd/fUI7HjlrUMp3iWXxUX6YpYGN+KxVEetR2dWyd2ojtSxVRe3F
	 dbMTrz9BZF16EJVo/lQ68E83kiekqnwymbXBvT+5Prqt/inZ9DU+qEbzyNqOiH+i2vKPU
	 wul+PoHRZj5nm3RIrcjvbljNQcVlXkbO+9TMrtHKSwmBKi7HlR2jlQatNPp8WwPNjr+Ns
	 Znl4JxLKYY7uqA9+8BvoGLCKr+xzeB0CqWofb6QeA7Qdkhx/33xR/Nt3KFmZRtp75Uw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793544649;
	bh=hYpt7KeMHnqfGlOqov0qR+iPXJNMzJy4rGXAUIfoNMY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B+wARHWyfG8moTtKZMMdhLKEL2RmF2wg7dsNFBO/VJuzGO76rVHrn24k4sdPWbtLP
	 +FtOhsqJf93U4J7ao5OZaNAUXRzbEEju9flDM+Mzm/yV6A6c2cGmP/gpWlVnOlI8du
	 iN7ekA7IiVBJgW0TqRNwsyBBHV5Vlf/LryY80cutJmf83jlTibwU1H+I4PSIq9uetX
	 oQJSNTQ/vK4T08ISBNf0Kt7/vCqpncl9Igskdzux3oCTp13dSTlM3YmAE0BpRWHbX6
	 XH1bXphWwHthCBipKcEYo92SXIBQi1oFFY+aQVu2zQqHB+76PLSv2vP3nrzO/+LR7r
	 0hiUERkYR0w/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 331E9405E2;
	Sun,  1 Nov 2026 14:50:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D49F4B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7BC9405E5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2bAf5Y3Fsi2 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 470C040518
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793544646;
 b=J0Aw8KSqGBuc5M99TLCpP0ypFvXvRc7JB+W8fdhEp3HR721GK7IilT2XkYCM/oA6IiFB
 +Csz7F0kJr2D9HVYLiouoZycK1i9w3/CYBrmODIPy8tzwgoYsgMuit4SfPB6mXrmEV5g3
 MBI2k0gUTPgZ1bJ53L8J7lyYmQWGUnZRblYZSpF3ubgRxs8gn3W1bXPdYNyf4qSU3Bk/W
 AqAL3DfSsutg2AOOL1ypfuFW6RVbQpv7wDdt2nePpgNMQ1Z7w5MshLVp+yGcXtQk6KyG5
 +2u17EioFTWUxWrzIw29b4a+flkgFfVI2a90URBcA2CpptyZfs2HvL5dQTelaMMNXrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793544646;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=l3wPVNES6xyhC9Pj3vL9yfuswnV1ZKyX3P2mmPpKvlg=;
 b=UknWJwyy4AJy9oS+UNaeEjmoYUu2L6r1AC8H9usXx389nVFuPj1uh1NWAWjdA1xQpruq
 69kmkkDOHeDlR3ULtiGxfKCtBqLVJENdORXn5NO2G08BzxlaDnDnyB5VIzhWq0fDEv4rm
 Z4GmxgatN6H/lvUjxEWCoURUvHtzUaB1T2dHxDBH7q1bQu9rla9LMx30oqrks1Mcepbgi
 Wcbo3QnH7d5IPzUk0Cl+kXjAz07Bz4+7t7cre5SWHD9yH/7cMMwL7LcO8tPKv/rnKm/A8
 BOMK2PEd6K3QgJyLddcLbdxuMDm6HnUoD7frMWzB0lu8VQtpwcu0ldAtRVVHc364n+Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 470C040518
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FFDE9D48F; Sun,  1 Nov 2026 14:49:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 14:54:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e1a371a47c5abbbdae8e633aac8130a37aa2688
X-Git-Newrev: 8828cca1d64615cc8b74f24aef8add8e3d3d5572
X-Patchwork-Hint: ignore
Message-Id: <20261101144917.1FFDE9D48F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-twisted: security bump to
 version 26.10.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8828cca1d64615cc8b74f24aef8add8e3d3d5572
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-83813, CVE-2023-44487, CVE-2026-115778,
CVE-2026-115775, CVE-2026-115877, CVE-2026-115774 and
CVE-2026-115776.

https://github.com/twisted/twisted/releases/tag/twisted-26.10.0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index beb1c7f3b5..f65e733411 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  931ac3e39a52c490f85d36bcb4c77369  twisted-26.4.0.tar.gz
-sha256  dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9  twisted-26.4.0.tar.gz
+md5  02a15261bc2c23036399954941d951f4  twisted-26.10.0.tar.gz
+sha256  5f0355403e507fc23ceea85e9dbb4bc59335aabde41dd324e8b8cea180dd38de  twisted-26.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d7a2f74fe5c2b3f610052b75b5a131728c49823b28088893dacacf8d58849a4d  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 09198d2afc..d45d2fef0f 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 26.4.0
+PYTHON_TWISTED_VERSION = 26.10.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/db/97/6e9beb1e78247ae6dc34114f27d538cf2cb183c4afcd3609dfdf2b0439c8
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/fe/31/a5f99ae7f1550914b0702b8f78118d95a79da20525d26fbc1b2ab42bc8ae
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
