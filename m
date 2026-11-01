Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1A6606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QcTbRGdZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C9D060738;
	Sun,  1 Nov 2026 17:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIkfU18hgRZa; Sun,  1 Nov 2026 17:07:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 79684606E5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552869;
	b=A93x5edj04USMZHoEKiwXlEObsOAxvp7QxSQvj9X+BeqV6AHakagvcPlbAOsBKFQiKS8
	 GWUqkbghXyz6zhs+42HnA3sTn1H5/Z/LTnPDlg9RluBUns+P/FUMbG//G+5t9L5F+nAkL
	 Q75zgOULbOmFLdB4N9PzS7dZSdagfXgCa8ESFViPGajfRX+wQdER9M1+pzfk1gL1dPQzk
	 pxZl2D75fGIh8km9j5SrccHg2YKmdt28SN2DZswHeVJS3j9BGrXx9DbsJ1V+HBjaJVVKq
	 jduBYWMheUjnksKd0hZjL/dKJ8aytxPYakvUpJIDlFWBs+3emtOHE4r+uwhO3srYwRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552869;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Jt3pTXzdZHPlpIUma1+Iff1mD9Xf2LacaIjyiXogaG4=;
	b=Cr/7TUe2Cek3OGFtsWjl5hd52CqE6a7/zjrCpiGIZI83eQqx2ZWlBU4Nl5gL9aACrMEQ
	 UB8MZapxwrifuD0vzkfo65P0cXYw9sh7APuT8qLvNzsOCzvy/RU36QAL9LnzBoL/PLwFm
	 cP6KcY9vrzmjpbzLRNkJxmDN3ZDhNCij1Uhlvrmz/vZjkbWow7QUbRPLRg+jUwDvAS7zn
	 RwAlp/1RUU1AYEHc6qepvhBbJo33EiM/8ayBQT3p2k+TXa3DFSavHdFQrVklcr2fRA9bR
	 OHKaynYIPjP6euQGTdp6T8DXf9bEFy/Cmjpc8yjEmpyW1sAk/7qODDiElb5x2EZxpcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552869;
	bh=Jt3pTXzdZHPlpIUma1+Iff1mD9Xf2LacaIjyiXogaG4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QcTbRGdZrknOsscZERJ06Q5IoFqTlgnimFLELtr87hqqs7s9AdLT/LlPCl0wM9HOj
	 RHXfkEOpe2w603qCt1WhqG4sbF4CeS4ISwqO2S+9/KlMO2wgh2o1VIkIAQvL3Y/yvW
	 rS7oc9V+0PiQ59wgqS+Z8SxgWyZQ77QabLqEi+3G5ZYztGsAPDz6ZvnkESDq72xsAw
	 K82TlzhQ0FYr30PwxrUGyzocAqjXuL3xUhH87iw6JdYQLHlA9k7/Uhzsjm7q8t+DMr
	 bM7b9o1EsyV19tTfH8m7/DL6fd81XFSeMM3NhO6FN9gPoNrGXK6eGYSkleMelFg5gj
	 dFRR2ZY2ln+eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79684606E5;
	Sun,  1 Nov 2026 17:07:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFCBDEF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1C62605F9
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyhgPiYhfCFv for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 01973605F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552839;
 b=LSsPQrA/K/ftOB+Y1Jkr2vcxzy4+2diYyj/lTM0D/ihETNWWI8QeJVGA9ozv8WjyRPyW
 UqiqApf2gnzgpeEY6+OdpP5KDqheXj9aCpSM3JZz74kDLzD2F3Dar6LpXA7vhYM52txqq
 e5quirI6472KTzTtHDPU4IwsxZ2V6KBiAUUYH9EThK4ds3ntrzSySWR7fPPigtcffYrGy
 Hf7prVi+c44ZCXrjgRbuX3U+6tzRJfRV4nObpGRktDkIVauD3belMYj8usulDS3+UKbXy
 wcDZHocseCTPJiiBnThggpjcU3RMd8BF2OzBias1CI3U168kkrMBcFVLQGXWT7cX0nQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552839;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=97X1n+rChlm0SxIDhyh3BkTW7T8yo4bx34Hm+IJmjUQ=;
 b=oWhj1Ehlw07pp6282oKnJBXTaNxmq9WkkVK3GWaZU1d5V4iqPTM8vDIETvKAf38Ox4lM
 DdvXfPSXxuWrOqy3DxzL6U4FSFLQXDG61DEX+rL1QQqdSsDuZhivGaVcvncX8HX1f3lwH
 5GTGNMNMSAj7CYfI50BGJL+SlNLRH/xKsL25OEcvdI+gUtE7YlOI1quYJ6vYb67DcTe1B
 0LVNu+1rgUYMD1Xeutc3HH4gCTkRvUDG3hjVaJ3TKvepqt6L76uiwskoR4Dhgve34O1HI
 Ek/h/N/PsvIvebYHjuyx2ub1rwYV9kKYz25JG4zvqx8vr7tiHcrnJktW+j/GYp0o1Uw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01973605F1
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1E249D4FC; Sun,  1 Nov 2026 17:05:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a54c1574e4e0e3106df11f7a78bf9c4b7f303e39
X-Git-Newrev: 7821acac3aa60115627ced3dd462d4518bf2f03a
X-Patchwork-Hint: ignore
Message-Id: <20261101170549.C1E249D4FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytz: bump to version 2026.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7821acac3aa60115627ced3dd462d4518bf2f03a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index f26bbd767e..9fd4edf598 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  f6fcc93492495d83d7bea567fdb1eab9  pytz-2026.5.tar.gz
-sha256  fa23724b9c486543b9ff54a327ee7569ac83ade54bb9afd0fc18676620401c86  pytz-2026.5.tar.gz
+md5  1e4b17a2643acf32ba23b8b97005a493  pytz-2026.6.tar.gz
+sha256  3b0fc2727707663d6e517936f444fd8a8b240f1fc32f4bf7ee03274245945284  pytz-2026.6.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 4513fb6b73..7322185316 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2026.5
+PYTHON_PYTZ_VERSION = 2026.6
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/14/21/d83d6ef28c4c912c4bb4d1dcf591f7b8c6bde87b9c66f9f454677314e16d
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/f5/b0/168030b0bfcc334cf09fa3313afdb888d892c8a0027324683d1de0ec277e
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
