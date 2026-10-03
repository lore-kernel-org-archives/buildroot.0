Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2909CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF0881170;
	Sat,  3 Oct 2026 15:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvpaehbcENr7; Sat,  3 Oct 2026 15:55:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 98852814BC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042913;
	b=i/LOmXTlRdxbcuGBvSENWI0VsTK4tYiuIKsgG4noNevRgYYUPIxCVDZenGzteruu4p8R
	 rCBG/9ooTuUBpU61W/d8mhvM2A7h1+Bk2tCtyuLrkQeqLBKSmyqEIU3QcTFFEDU3URj2X
	 EtpYMedozuT6fGk7TFA5MKsLsPhu2atWnION1euYoigdjbQF6vHmmm+U9ZOn8wjFis1lw
	 iBLWKMhtagaRFmQdMNWVDUMsjG/KV9nDQiqmyZH5hEuFdMUVuJcY6or9x9lmUF8dR+88n
	 lAk5meffjsoenzi3LbDoA89SnG4SwDSvLXN3mf6TDvqKzBtBALdUNFalFEdSrn1gufQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042913;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/6j8GGjx4PfI22mY7m6m9j9nmxN+FtQflMhJBo8x+rQ=;
	b=ccwyi3sIV5eEfplHLGTzM06mMaSbIen/yG/R5fxM+NrOsIpnValymq5T7QksA2+LgnCD
	 uYqJtti7bOnD8HY2oRKrm5XHUAQnC6iuz5+IUaIflQts+W0x5hrOKergT52KwxXmx2VXS
	 86S/HJOtjJS7zMFyu/4Oc1XlQ3zL6GoPi3sNU4tKqrHXOHz3nyv0HVCldwm9mt55oOa0H
	 hTYE27PHw2G0jYoWfpqr1Oe40i2TwOGXTw8MAJJeEUkvvnbGXgjxBWJNXKOQwQKOgpxU1
	 fLGFuLzhnf6q6okXhnujbYJEGR2gQJmvqEMZfh98WXYvPde2BhsiFQ++YqPWODBcNbQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042913;
	bh=/6j8GGjx4PfI22mY7m6m9j9nmxN+FtQflMhJBo8x+rQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FokvZuGeDtzaBza+t3QsZvB7Z9UxIYmOJp/Gl/wJyeBs+UF9yr5DjNWopg9+xoQD/
	 6kKN+utagp3c21ItTgkt2LnBqkEHa8OtC9RbH1LtF+zbWI3HP1p3O+dF0OkXqxDtpI
	 JjX/W4k4a+XGdl0C2ZvZKDYcmHD+9NWeMnWUM3aqJxwoFpLikuzFfVxJG9S9d9Afwi
	 TesWRhNI1gH/4vumlQ9UmvywMeVKul3HBMtQqjPoHIlXtMKcsyizioeQjQhil6Gyh9
	 gW/exxN4Qx7pQRXvz/WtE9lRbp7ujgOonvbi1khSHnCRLpoeYKbjRb6PrUlCCLBgUI
	 L/3xKOy489Z4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98852814BC;
	Sat,  3 Oct 2026 15:55:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B02F9DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74EF660683
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tm4ko65iNTpW for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CEBA96069E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=B98mD0W98cmX1HvdNgMnsucdGxKmv2GIjqrmOa6ekW+13NyNjEIGYUqPNwPLW4YBwB8r
 AJcijCm3DfIwdjNymlcwWW20bH7FNfhyo2UyahUboPKfuu1st7tZ1Xjd1W47VJwxQcOMR
 eieGo3gIth0Upi2WlSShFn9sfPViUggjHdgOy3qLJF/+Dmjfe2oP0xie4IzWlmHSjEdVZ
 KVVUiJoUSQynLcK4JP5OyF8nBbAl7I9gLmW+tTOrRWFk7w7LFFAI4+D3shIHqjIbVQmxb
 EVZV/RcU8IXG2xwvQopssmETKSc4gRr6SoS4EV/E4LrTPuBnEaJqbcpMOdi0NrJeAbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6j3YB9v9ZuXzR8GNjQO8CluO2lQ1L/4C32PIv/lFn2k=;
 b=rIZaXTAF+/+bNTuijCpUvyfNEy8rvimbRbGMmTZ6wFaQLJvmeMfmsiEaPwpTzlezZyGz
 3o7osQccAwAMWX7ugnIMO+VoddadqHQgiTN9FRXSwRRB1yfL2+lQKYRC+VYHJwk6LZMSB
 NssUFLQ1SzcBO3KOlNKXVYvxpm94I+AkgPDcYat/6096xBb0YeEaUTSji6S5rD+WkzMN9
 7VIRTqQ/nDMqt+r6ElAhAuvv7mklSeGzeaD1SOHHFwfCo06VpOSm584lqyphJ30rRV58Y
 e+EyXoh6nJvjZ5iUBOO5Y/7Dvvv2U0698IfHVV4aNZ/Kv3UDdAqhXHt8/brHHfLXPpg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEBA96069E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BC5E886F7; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3aa5adf921e22174c0baba94b047c542d7cff6a
X-Git-Newrev: 6a8cf83373456772ab619146523caefe01ee6ad5
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.1BC5E886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytz: bump version to 2026.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a8cf83373456772ab619146523caefe01ee6ad5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index e63cf84b5b..e39ce4cdc5 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  d805ceb0fe3717e324299865398d70b0  pytz-2026.1.post1.tar.gz
-sha256  3378dde6a0c3d26719182142c56e60c7f9af7e968076f31aae569d72a0358ee1  pytz-2026.1.post1.tar.gz
+md5  cdf22c8015c77214dc4bdfddff39a1b5  pytz-2026.4.tar.gz
+sha256  464303645bafafd72418898368b2429458f709cf1eb6a15372fbcc396b64da63  pytz-2026.4.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index e095caffac..85fe1d30ec 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2026.1.post1
+PYTHON_PYTZ_VERSION = 2026.4
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/56/db/b8721d71d945e6a8ac63c0fc900b2067181dbb50805958d4d4661cf7d277
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/b0/ed/fa23d28713004418bbf2407127f80f385bfb0bf4e677bef02c25c27b00ee
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
