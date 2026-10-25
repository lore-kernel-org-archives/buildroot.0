Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B772606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rqoTsxeb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2223660F21;
	Sun, 25 Oct 2026 11:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8Wcm-qdCVmX; Sun, 25 Oct 2026 11:56:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 17D5A60F0A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929396;
	b=e7gR2OrjNzvVbj33fCruhCnHo1O/YPYfOeP+8tfmStj6LTu+PyNwMK9iHOaWsw1f5Q5t
	 MQihY5YdmJnON6/6IPkHa7TAAy3YDieuau9VdjAgegtwdgMEDVPfaREJ0x14ydu9eNS7H
	 OeXrFPA1ZvY3GcNWpxC2CpGetemMm1WjZvgubsAPTxk01w1FXgUfhZGf2w2hfphdzuNkv
	 OE8DLdvVbe7UAYq9/aLVoN+XRQEcvbVARge9lt2aBub+yoO/1QCC+nqx97sIzgNvWGExj
	 O3jYRGcWfNDVKdcXNVvWA2nhsUdDTLQ5MlTrRlY1uxt02f1atEYtTbfeiuE9UvQooqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929396;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+q/xZuA6aW8CpoQAO8tiR/OetTjT1ARQRC+93APdaAc=;
	b=cvWjPuXV5Vh+5R6BIdAzW127drYxHlrAa8WKifny9yMYM1JoisMCtBDmJ6N1MljmQff0
	 D50wpq9ltlbFcah2AFe1kLTNr1l6kQc0SHJ0ghLHQcpkxtQKQpsk8EHL0vCl/KUhu9L6G
	 TzpK1NVxH2SLr0S0GYEUWIBDgHD4wEWdorK89sWHdcLJrM0walgL0dHW0hYdUtFr9wjXT
	 Ox/H7KyfsIMRdTOChhkFLKxq8ovMIm8Xuu24Pa75R1ghJFvVf5XSZQuuieGRabUoJ90+G
	 Juv+fEiJ/vxBHCr37PmkNh3jjCL2nqgON2P28oEswr+H0UzJGAZgo2PFIAJYQcEumiQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929396;
	bh=+q/xZuA6aW8CpoQAO8tiR/OetTjT1ARQRC+93APdaAc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rqoTsxeb+NIN9k9qXwFsNwEXphmYrifVnxdI+IlQhoVqQYDZqLlMWHSu4UsgQ3tU/
	 pwMMR6bunjhPf0MAnnQrc8OCRSW0hX2t0K0CMR0bOzusR/55ZSEvVsLfWTxTN/u7Oj
	 vwYBlKVDgGTVt7B20p9qiriFddtVgiE3++/5e5zs3jMlkY58sg9Y4W2MAkxZXIiJnj
	 a9xjuF2YoZyvA29hx1MHeM3eMiKNrBYWfuDCGO7wOh34J+86W4f6xHuaWCwH435PIG
	 gVjRhK7GhdGxHEWOaugSrmXKMuh8gkz/keJZH9PvnAx035ciPczqXi9nmMkCs0/icz
	 blE/fOweAlRlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D5A60F0A;
	Sun, 25 Oct 2026 11:56:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4902D34
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAD1C60F0A
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhPWTk832zy4 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 183A360ED8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929387;
 b=oDz1WCt5+P4YnK5b/BRizVk9YkHUfWjfm3gDlxC29ZoRxWKCiTn4OlDiExh0uufDcKz5
 joD8TeuNsIohRVqMzIR+nd7AD0PowwPywEDfDRCyQy+I4HXNlbTyHTuxDzt3++rTFip9Q
 PIyZ37DgCNbULk/a8CpM7uTS57ZPsRkGZQzcBQRV+6Yj7nCaA0yZJGJhcoXyl1dqEOXGb
 iVFO4P8J5cUWYb5xf6M2k4AoxSW/IIjN8u3PNT+XLUxwtuMDQkCO2me34pp3RcFtUC0Yi
 9PQchwSSWnPDnoppnRQqXUbSRz6tyDWFzzPJNI1LsCW6c+PV7F9tIWPtU3rmpB7ysUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929387;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fF3yNV10HrD+tKKEF2AF/TI3qxQxgaVCaEaUTWjrpdY=;
 b=jEueAq+NJKQZAP5asjeMpP48vhMIzuhqwp3oom4PccC6jwHuyfMOE6azPiita0dW7vcw
 Y4UJc5hqexcqWXO06MwiQjvUmUEImymjwWY3wtUeq00KiyDMoC3+n9Uil6iEtX9c0jVkb
 +Ac+hcdq/krT44LbVv0OsqzMK/WTEo5MA7JxqFoV9CHjQnpQMIewB5DdqGZy0y6+IYGoj
 pUq1WW+H68jQ/Kf7L39USaG+DsUMY14X53+tvrse+BCzakANMGwH0EjxXTear8n91fnEV
 2mF5i4/4/Hb42lezZLYhkAVPDKklaXfpDN/Ahp4Vqu3uH9tvjfCa/GcqRCMjDW4g1tg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 183A360ED8
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F8929CE82; Sun, 25 Oct 2026 11:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 12:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7aee04077400f4cf59bb9febb633b95eecc884d9
X-Git-Newrev: f6f8e21803ecc9fee68c7a16feb9ead8e636e40e
X-Patchwork-Hint: ignore
Message-Id: <20261025115501.9F8929CE82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: bump to version
 1.10.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f6f8e21803ecc9fee68c7a16feb9ead8e636e40e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 1794b6b28b..39f138ab0b 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  b5dd1c0ce8c69609544f47cdc76417c3  starlette-1.9.0.tar.gz
-sha256  3d931de246ed870e35ce605974440816ef895e592f255d1396cfdf191d4c4318  starlette-1.9.0.tar.gz
+md5  7dae95a2bcf8d66d76b383129ff2f2ed  starlette-1.10.0.tar.gz
+sha256  b8399098d4c1e3522734f7235dc79b1fc967f96cf139c81e0fa30479e0685f9b  starlette-1.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index d9fc4a221c..4a79dcd095 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 1.9.0
+PYTHON_STARLETTE_VERSION = 1.10.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/ad/eb/4e197bf26b023abafc5e9043ec8710d7de0fcb032d0969045236d72aa0b1
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/48/bb/3d8757f21e9a53d9035c9eb039a777047139a16bfdbedfc7a58241c3d914
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
