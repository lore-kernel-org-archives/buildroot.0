Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CEC606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FGSij+u1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75C6C816D7;
	Sun, 25 Oct 2026 11:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3s702v76rEFn; Sun, 25 Oct 2026 11:56:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 851C1816DC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929394;
	b=J8Fw+Keo/zBu73kQ6PJ/1c2TKbv3M2+3IesiOOIVkHUSD90QnX3CzPxVZ7Xg8Xt+zj9M
	 F4q0Z36wyRq4bm8LpFZURtZVh5SA4YCsEs5h6a6TCvQb0ZKIixJX09AMMDtBdO1sEuqvN
	 EYJnqE3Ze5TMKBDsehdsJv0Q/Kw3/VTpwVFUhg3Jst1dK/xcZhWPtfiPkdsDn5jTtI8eo
	 YxwKKC+xKBrydbm1VwgrRTlRzR0ED2MFPCOjzQIBNUgw7mEYWtdGpRKxsnnWrfE6zT3Z7
	 5dxUSOD1o+bY5Mc1m5UVKYgTflnW5MUCUvujA6wQqcpZR3Hif6Auqa0Dp3T3yAKn4SQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929394;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/piu9V1gnPtXlreSenkdgkaHdJyg2AfIwYXA5LA6Wso=;
	b=L2fSHpFqEWhF9LiE1lA9DSIMAfC7uoujTprjovVtC9972BZlbd6REyMjNXYlzKe6V0kA
	 A6q6zkyAqahNpH9Hn+9B/CRSe9le1+CB77MdIZrYDBWcr8pJ61rRtRzj8nQOqcak/i7hJ
	 KFLOReOCRLXobDNxdncNDJSUTpkblYjjLyZPcJbKjdbKjjlOQzWt9e2A1dVllMnrJU+BC
	 oF7ITqiLcKeTZ9xcO1B9/FJcaB0vbg3yxGoPlIIScIsQuQsQjiAK/uBnXis3WxPSr00kX
	 8Cx12dMPZ9/PimoI98s6nJbwsKBTUrHiPW+CZeZcJsDT4agx8UCsP3+b9SJ24xNp9Yg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929394;
	bh=/piu9V1gnPtXlreSenkdgkaHdJyg2AfIwYXA5LA6Wso=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FGSij+u1l9Zignxe8xAGvtmEelenaPf1F99U5u1/AWVSPFiNNHR0MfL3PLXm1gdad
	 BFpKGsPSrisPR7kUZTzrr93Tu8EOD5oVwyk94BB4nTvRIY8Y407OORd2TNyWkvci7A
	 oXK+mbpebdmFNXWP4s5eIiA+Omolm1mz9iBvQlCSgbvOx0pl8RiTCC3d18B8lNpzmq
	 zPLLqrfItzDapGr3y24ivbBxo4sN9hlkYRKod3Hsjt2Tf/h/D0X63mab3nvwdNZ2RI
	 QAX//G6IOFfT1qkThqpg/ywuCJRykR4hUS9+ICGii6GXBGT4NvvM/9V0xejk9q2lUi
	 gmi4pY7RKvvSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 851C1816DC;
	Sun, 25 Oct 2026 11:56:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F07A0D37
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1EDC406CE
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5t07DE6M84iY for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3393D406D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929387;
 b=mSgEz1hF/ZpVDQ29S/tbGXUCbeElFBIvYBmJ1EjZFNlk3M2grlybr1xsbIKixrdmVlp3
 uMJ4uzuj40Em7rnkKb0YQk6DSpbHJPO25tjHHqNbQOifR7RlXuBONg0hVEuVWQZhH8MpU
 lLIWl4YGA0QAmhjIFeM/Js+8EzosEU2st9gGKhU9gA0cyB7QzEMqv7S4UkFNchTmZT849
 uY0lVs9tHzoo6cmw9nmwBBCNZlrQQtbv8amdbVLBqYD2DyzyE5Xv3XR9uiqsBiXpio7OG
 fj7XEH7tcL6ok+sI3o4qvabTWRKwCf5Gc391lFH75qTMtnwaksQd+c/sVi2W88R9XQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929387;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Kq2qfL7rd0LXqHYfPTH4pGswIujYjybsr+B2BbUYMog=;
 b=lvjrZGNXOiW9Y4PEZqhXuxQX6J2oXbdxApF89WA8/mvD9eDEJwp6febdgdlYSYA3VodD
 G5yh02hVbD21I0rBIn2ChuxGWYVZYo/uyP3RTtewVtv5NdCpbu79pL8nEMl+rAnXnE6Cb
 Ps+fNRoORqlkAwYjMqw27nmtnHWI1+GnbTLqFk4vwR5T5MaOzk7uvkmG6q2KB4PcAaPa3
 WUEe24NFIysMihkaQLfFCIPRxv5e8UpIDHAp6J2SDcOiloA4u4kUh8L/AzvTD3rOnQy80
 5War3P12VL6tTarJIT9u6Nwq+vKu9T7b6u3GoZ4zRqTLl5I+Y+IkC76aJHIkI4/tCfg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3393D406D0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9DEB9CE84; Sun, 25 Oct 2026 11:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 12:02:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d753c88e4d689623358509b6e14cc1182d88533c
X-Git-Newrev: aa50cdd44d39d004b370d0438b99d5a127652ec0
X-Patchwork-Hint: ignore
Message-Id: <20261025115501.B9DEB9CE84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-setuptools: bump to
 version 84.0.0.20261006
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa50cdd44d39d004b370d0438b99d5a127652ec0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index 6e330831fe..b16553abfb 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  9a93e89b935a6a02dbfb4a143fbe0ccd  types_setuptools-84.0.0.20260812.tar.gz
-sha256  09bedc248ebbb7a232c9419dfcdca329706e61bf2aa5743e9424d027f1d956b4  types_setuptools-84.0.0.20260812.tar.gz
+md5  c2d13d00413ef92673581c250430493c  types_setuptools-84.0.0.20261006.tar.gz
+sha256  0f123655f44390a15ec62c9fa30b57f6dafe53014524d28b62cab1edbc303059  types_setuptools-84.0.0.20261006.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index d0cfdba1bc..0ca0056c54 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 84.0.0.20260812
+PYTHON_TYPES_SETUPTOOLS_VERSION = 84.0.0.20261006
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4f/cd/3b2a3362a526f91c33f785a291462b2ec448ae531101c62372fc30a21f53
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/fc/36/012e992d81f3c3575e6428d53c2bbe266858cf1b7df7335476ab99f17908
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
