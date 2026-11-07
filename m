Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E57B606A32C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IGFFIuzs
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226F4810EC;
	Sat,  7 Nov 2026 10:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtVbmYcgbMW8; Sat,  7 Nov 2026 10:13:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 36DEA810DA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794046388;
	b=BbWFo63JiJsRdDEkbIsve8ydBi5vSvMPEdD1Glzeg8qkmwp4+wEEjgjhuIw3GHpU8A5C
	 cyUZwAomosTJkyJdCG1++iB35NEesvSwhi/4Sa+t/qNNf3DH0dGaeCNg21+W1Es/vX7z1
	 ImV5v1ejx7vHMLDun2cebnW8H2xmIiIbJ3lGQC4+JEZ/qr4kvG2hZLi9ZMX4Qk8b6UdKx
	 3mrJXvbV63cJlUYYcKO0a3s3QQqfhF2Wu0zR9otgibJ4yIjoMxDU3zGgcfo8m9Wi5yb6X
	 Gv3a2r2pflcQCbg1sslAgs/iE/+3/3aBlbiNiXydhy1O375/P0+Bv3vpO2nstZAEnZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794046388;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Rw7p89jNZJLfNVtoU3nyjiIT1m2xvU7nOK2T6Xjmnlk=;
	b=iF//fIpzHI5ok2MfjJaK89P9ncVCWIp//uYLdQC5RGCPfPzNIpDIk5ryjQYbCJEzjMPm
	 7a+GWc9PcjA7wldnbZj7vQSL4cNsIN39gchpFAKRwOmtfW5gPOxMlbBXgyITCh1UDHofq
	 U2SoveAECvU9+WIxKzBNhlK0/zcC1NypSyKv5D7Vz/tu1BsW9NvftncrV3GKKuwMchD5Z
	 SYBtLOQCZIvVuZ7I0BelFxaVIwdmAwNZtvPzlVTzK22ngfCH3Pfq72MuhAD8xfHtapizH
	 yePg542XMvOXG+WivB+Q9ZX5xoHzQsySlcUSVN1cxfNkoWVxjY9kC+tOMEEBPKGVB0A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794046388;
	bh=Rw7p89jNZJLfNVtoU3nyjiIT1m2xvU7nOK2T6Xjmnlk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IGFFIuzs2yW+H3JYEJoOjZTXWHQJJ6NFAIORSZXE25yTOPyNwiAhHgyu9oqN6FAUJ
	 +kB53dwmSAqowvZqNNtDHREdkhtJjb7weEeY39xTADz+roUykP11oKP+Qb5Xa9lYkJ
	 ok1GJXwBeDlUuqVkzyCch++KWGDOi4oH1gbwcX8mKxKCpvfotIhNfxe9+FmSeEno+5
	 r/A5DP5pZ80VUNsdz0LDSUZmf7pDFjxYZ7XLWRUrLC8lxchZ+pBRkQbWTTRBbOqUqp
	 XKMIS5seVPf2u7y6IsSxwIW3kDWs9cbxMna2dqLiewlxeVtHzI61EOUCEacwM5sVcN
	 qCbDSDhBMBPBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36DEA810DA;
	Sat,  7 Nov 2026 10:13:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 763471C6
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BB9340770
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRD8736omV9s for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:13:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 525E140705
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 525E140705
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:13:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D5758B44C; Sat,  7 Nov 2026 10:11:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 11:09:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60a3423e958dc4266565c6bdfbb619dd95839314
X-Git-Newrev: 66b775582ef89c4c15924a92f4bdb58dcfc7793f
X-Patchwork-Hint: ignore
Message-Id: <20261107101133.0D5758B44C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-telnetlib3: add missing
 wcwidth dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66b775582ef89c4c15924a92f4bdb58dcfc7793f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 25867d252b92 ("package/python-telnetlib3: bump version to
4.0.1") updated telnetlib3 from 2.0.8 without adding the new wcwidth
runtime dependency.

The server shell imports wcwidth unconditionally, so importing
telnetlib3 fails with ModuleNotFoundError when python-wcwidth is
not selected. Add the missing runtime dependency.

Fixes: 25867d252b92 ("package/python-telnetlib3: bump version to 4.0.1")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-telnetlib3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-telnetlib3/Config.in b/package/python-telnetlib3/Config.in
index 487258c272..80e30d683b 100644
--- a/package/python-telnetlib3/Config.in
+++ b/package/python-telnetlib3/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TELNETLIB3
 	bool "python-telnetlib3"
+	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
 	help
 	  Python 3 asyncio Telnet server and client Protocol library.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
