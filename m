Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1051D606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d2wvuv17
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E26D3405CE;
	Sun,  1 Nov 2026 17:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TO3kVtM-3TTn; Sun,  1 Nov 2026 17:07:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0C9BE405CC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552853;
	b=gd2834IsiKRdTFajSYTcZVeeda28xivakMbr61azniZS+J04c/e1i9Fla8915GeNLVdP
	 qP5CEF8DUC61XlLP8OKQK9kTJmdVYciNsVKLFnTTEMVTaEGw1jN19TXBXG5rcLG48hlbG
	 Bw6v7BA89d93gUh4/j8F1NLISzkm+K46THBd/Op8fiFJrTw6IiRWq3W8WVlb4jpuTFwb0
	 ooyi0/T283CixVOaCH/hpIxLcS/LM3ghGPElxNjfomfr2AYaSXP46bJMwjS2gT6FvChlV
	 LtBQaKCWE1ER75qhDuaMy3oZ45JVRXsPYkm5QDGxihFaDLtYQCofC2bcmUprFgEyAHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552853;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=E1PVEnCPE69joX2de+cJpopfUkqBWnFLwtHd3MB7o0w=;
	b=ccUj3YZ6TYXSaytQFQnDlJRLVLX+4VbaSI+8HxtJumYPBnIk9/Q4flIGpRrNLkgWsTii
	 MO+XuAzrfQUSuIs0BdmZ5dyAkgP4Dk2+7mar8u/o5nmFnRADn0Plys+1kVUWFvu/3opkd
	 p8pd52zY0NyLCJc4KKaCwO/ukp2rQvChMVQbOeEnX5qOg1fz2VCJCLlMawUKUaWoVX3N+
	 Ico9vQKQMQjNg47qzHogmPe6J1Aa5DEh57jPQ8uurMKzgsms5PeCHF6RAsvUFmQXXRZvh
	 9zeIjsdY2KnGhKLs4kDPpMomL2ONBbZvkscUcCVCxAyhn+VdUn3CNec71j5UUELiBog==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552853;
	bh=E1PVEnCPE69joX2de+cJpopfUkqBWnFLwtHd3MB7o0w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d2wvuv17RJvo7y3BpDguPTOr/BGakX92CQLtxuw+Cu2tXlSgUVUkL8r6Ox/K9t4Pz
	 SmaAgEvBCFxGPaHp5Lzim4he10UYazxgNCbn81sFxucaBAcEkZrc8OVdcCIRyc4HTV
	 ofxIt8wiLd45sa1qtNA7wld8lD0m5jxlkBZRepAQCMUxrT38LoD2PnhEA3Wv0Nfnfv
	 rw/LdskNQaWknABNCR5FtM7VH7I8dDtAa7hkbqOOX6y0rAAlaqrnoVSzPVqsPYHVkN
	 OeTRQTeW75i3M2Otpp4oW7ocr12CtpT3kUkqvxzaRaZjg8CYKCb9J12H2cdg5DDaD/
	 e7ZETDTk498kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C9BE405CC;
	Sun,  1 Nov 2026 17:07:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5002380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9253C80C97
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id up3VFhUtjp2c for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A717380CEE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=EJV2oUW02Wdvamimwu2O9jVWW614V3+c+tDJU2cVZ+QVOxyBwFhIYdE9BKr9+7XgBOwV
 P37bUQEjCAApDTstE00ZXX9Od8RKS+oEt+9bV6zCKa5PxrJQ6QrRB6ryFCbTrzgv89QSl
 XUnXLfuo6UpbzlEm6ADa3KvJYouT9VZ0VDEGqIWPZOVeW4lE379lxSSGLMJNOVwFfO4Un
 FmJkcgLf11YEEe0dFeOIJV1nDLIWuxWPgotw67nR/bRlmQyKHuApR3RUl6qwCVi0agV90
 jYod39p6YhWRJweU389AiqweGueiKJHFkKxq4vmUQUdXbCFDOwWOdmKs5lzpE+cH7nA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7oGWraVCBrUISux3p3gff7ER27Ty5C5bDCnbEug1kwM=;
 b=bShNET7Ua5ujpzLb1Zt5MpvBJB6xnQ1CMKrrJToYFubQz+joxpl3u68GHS+DzhdRjIsT
 Rm9JqVrUrGgEbOkPjAPCOo+EWpkQlAu7WOLcL3jQ+bri87UKAh5tkr3k/QdaXQTr6r93I
 I2r30kRM82J2pgSGU7Bj1+uO2gs5LzY/RfkobJNhn9H9hccSBb2bt0PW8jMey5YRC4OHP
 ctsFoKulaUF3RMieG+0tK//6hsmpSOTWe74xYtldpoi6Ubc/eTeQmA5Wt0Bd74p6F0EeW
 nHGwjsyrWHiaoefOn/i7vpvlbLjKddJqi+qkuG/95id/CwFPQzhzCIV7B5K75KuJlbA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A717380CEE
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65C829D4FF; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70ab32df6ba7474acc117993a769cc8311dac86c
X-Git-Newrev: c1abff70e816a73b426c8d0969c8f43b19f62423
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.65C829D4FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iniparse: bump to version
 0.5.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1abff70e816a73b426c8d0969c8f43b19f62423
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-iniparse/python-iniparse.hash | 4 ++--
 package/python-iniparse/python-iniparse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
index 747d403965..a64cc17495 100644
--- a/package/python-iniparse/python-iniparse.hash
+++ b/package/python-iniparse/python-iniparse.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/iniparse/json
-md5  2054bab923df21107652d009f2373789  iniparse-0.5.tar.gz
-sha256  932e5239d526e7acb504017bb707be67019ac428a6932368e6851691093aa842  iniparse-0.5.tar.gz
+md5  229454c1e6c5a36a3e8f1c9330f97a4e  iniparse-0.5.2.tar.gz
+sha256  4f4fd009d49e4290a721e9bc5716719e9a767c9c7fdc3d7ebc403ef3379d6129  iniparse-0.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  ff45637d8a96adc414179e502fbed40160e57205bf2e302140e79a0c71eceaa7  LICENSE
 sha256  9b02e3dfe433ccd2bd94636ef6eb08638b5a54deafe5f87a3d9d9104356c48e0  LICENSE-PSF
diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index 05c9b3930f..4b62405bd2 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INIPARSE_VERSION = 0.5
+PYTHON_INIPARSE_VERSION = 0.5.2
 PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
-PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/4c/9a/02beaf11fc9ea7829d3a9041536934cd03990e09c359724f99ee6bd2b41b
+PYTHON_INIPARSE_SITE = https://files.pythonhosted.org/packages/9a/5b/f8b3a923142f9e4cfeafce9b8f7343ead2feb71929365486ce96b5372335
 PYTHON_INIPARSE_LICENSE = Python-2.0, MIT
 PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
 PYTHON_INIPARSE_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
