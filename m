Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D937060A3819
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SnS0hIrj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0F47408E8;
	Thu, 22 Oct 2026 15:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnfS49QPTXxV; Thu, 22 Oct 2026 15:11:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A050B4083D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792681861;
	b=mdvIX5FGMG8vbDPfJ69ARxiQeoTTNSwdKLzsL+6kCTCEprmexRUbVWOE5bDiMW+bPKy0
	 cx7X2+AOZoBVaXuUIBZ3Zlu7/7bPMaGNH1RL/CYxdtNRLyWqQZekCGDUJxqcjwnv7Yzel
	 WrW9sPBuBT/m6nwrsZg5d1YDB5bYianu5kBUqXK4C6Ck0C2vZOLmCYs9CGb3CFkz7fWaY
	 YMOYVH4a5lAYW+lHSUS525WltTUSl4q7C7gTzfZINfapWNttCLDDOR7rUnZ8Em7etug+3
	 8uAAUBGl2lFDMvybBXPnW18AxiPB0tAaoH+kj8LoD3tRYsdhaeSfI0cQAYmquIy6nTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792681861;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AD3kNZ6gMH1VkbxEG4VyQgdbRjs1fPPEHKdo0kPt/S8=;
	b=nBhZq97XGfchDR8G1P6R0LJVUHSFpLdZrEBKQFCepdyASpH3XEWf7t2sm50oyUIIIXtn
	 eswGdwF1olHXmpL0Wph9g/FwZMtcAlBkFTLfCZcZZNAQuMfMHn2ta/Xp2SqQLSc/z2ubH
	 RftRgKPYDTizJOlpChKRFlHirEFtbAWp2BaonG1afbSI7A/P1V6KIHzyX7JAYMcHHnEh2
	 hhM57iiw9mGa5aq5S7/p5/ko6Rc0YiocD/IuALO7nWobLWQC93oyYFVaMTIyYO34i+8HX
	 q+vEMRLlTPIYLAygvXWMEp9Ltw8/qJJFhA/1DDQO5t42CtUy6eEyQiG4otMfmHm+3hA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792681861;
	bh=AD3kNZ6gMH1VkbxEG4VyQgdbRjs1fPPEHKdo0kPt/S8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SnS0hIrjWopbblWuYMA5kG/I6Z6x8FucxUQLDT/sp7fJQF6M4yfVR9c0e9X4Edjx+
	 Qvp811g6BY7gMD905bHoAfqAMLiLz8WsKnon2ps0sMmxoE/juaqVV7VJWmy9NsogQn
	 RzelBOVvGklYC06f2zX+aOHW/CtChzB8HX2MqDg9fkvJ/BygoUI+2NI7l+eUgd1Dcx
	 1eUmMFb5yS0i/SAaxsq9rMrf8AMvnlEtucyBR7rgVUlrhMa6twdmZRE7HV3wZoOLnF
	 WJUbYYXEhMz+6X3fdDtGcV+MKPjzOuudZ3a9CRXCkIN/SSNfxRdTbD5PsLsd3mfYV/
	 y+Atn9e9W8QgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A050B4083D;
	Thu, 22 Oct 2026 15:11:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FA093A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7169740877
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEq6vUO89stm for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:10:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 63990407FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792681857;
 b=YuR6FVT9XrBp1nNGRyBmhQH1gw8uLcHycv8k4bU/EaHKBedkxWEg02yXD5AisbGJ7wRU
 BzIk6MIFbOM7Jbma9IYprDK7ahm62U4mUQuZI/5U+n93tKJoyISENzz/FdlkXWxS6MHzd
 ///g6sWMK1k26WGfRC8GHncvHftPCRNJA9+PTaWx+ZoFfAASGzv2h5MlwZw73ZXU90oPi
 orAKGCkYLoFI2AP/dTXtg4Jaegy9su+8140jXnMbekftqfbuynui8z4K+TPcBlfBr6CFK
 79NEBv7K7CfGdE+prHFRiNi8qwbco0sPXPj/h0bcmUjy/mbZ2YT23imSihfiXxXmGoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792681857;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZDxOFzDBswBTGfSkQYRB9c8Y56vIFlT3tSyKa0Y7Mxc=;
 b=d9g3fz1eUoMz0ozEqIfFPGSXYD3JtsEN+vR6Nv/tqvKpO3jqrWzHALIGpg+HGr+EQnJ3
 ic6mXdrFbEerM1uyW4bXAnnA2k+o9seE4l9I/1wclKJQkbwTkcJMBngLzIhtjoDBcWIN/
 rrMnMsDuJ6zZhk6dxZnDec6b9AkAzaVox7IgbZP3Z5rh4n7zPMAMVl+OZ/TU/WJO/wlYO
 UntTu7uzv+kBrkYh7ngxYphtPwdbirQwpLFlGzPyDjx17T1bY1pi9Ye5J+pt8PLlDGob9
 huv3QfUY8p4Cdj2/eF6GSapt40CsB8mydYl1hkJCqfneH4yQ62pRc/uke++v7JyqXIg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63990407FF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:10:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B8389B9F7; Thu, 22 Oct 2026 15:09:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 15:54:38 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: e232fdf3969aa548b4833fd9d619ccb2d8dd2834
X-Git-Newrev: 1f6d5b94bcb4254f490a8ad573d18751e16ff212
X-Patchwork-Hint: ignore
Message-Id: <20261022150933.4B8389B9F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-certifi:
 bump to version 2026.7.22
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f6d5b94bcb4254f490a8ad573d18751e16ff212
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fd66866c9a9bfdc8430298c3db33a1dd8319ce22)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 5f4706fd37..a0c24e66f3 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  238385f505d22767cd1860661f1c5743  certifi-2026.4.22.tar.gz
-sha256  8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580  certifi-2026.4.22.tar.gz
+md5  926857e560a3ae443ee35c2de270d75b  certifi-2026.7.22.tar.gz
+sha256  741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55  certifi-2026.7.22.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 474b147873..17c6925ae7 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.4.22
+PYTHON_CERTIFI_VERSION = 2026.7.22
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
