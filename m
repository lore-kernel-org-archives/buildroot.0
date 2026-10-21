Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E497D606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AwSBchee;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Oju6fvrv
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3024F114;
	Wed, 21 Oct 2026 18:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VroeQPtSD7o; Wed, 21 Oct 2026 18:42:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8B2134F110
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792608122;
	b=QWX8fcBlQvvTtfOPgRyWZcRpttG4S/BXU7u714VSetoLNg2mc93+4zjClHrQxery8hIn
	 He1z3ePMHVXLqotzNviEo/PhTqnbVQ2JgwW1HiITcnzy934BQWfb4sZk8prMLpxh+Qqlo
	 kvHZHHOuDLg7qg4miRBA/E/5msiHNEka80grlmj0pspzh8cZTinaaqplQ8wPERlHoEA5u
	 iiC6fjX2ZeEChuE9PE0iccHRe4YxzThLRFPNeaRcTMMtAqKjzzAoABDHTUGHZLMu0dstq
	 4d4lyyCAOZQTFy9Jbls2OQmsOqQopMo344q1Y8biiDps7TaYNnWgH+YlPjqP/Kptpzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792608122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IzR9ZJWgXH8eZgY5jyurIixf2Iqvg3PxqqO6D1Ratas=;
	b=ixoW+HFb8DhF+xhJPoyh0ryU29qfTtnoZo1Ihfxq7Pg3spsQdddIqANuQ2RSBaGMIHLK
	 pFSf1s4HSHrlyPE6E6UOjr3FJS2qRPwdNar6Fq9WLJhBOmN/NrE89asBRgfP2UQoUPdL0
	 hXIBGzTgaR+WS1a71Pmyg5o/ysr4TsH+vAuO1a4cTdardB1tQx+h82SuGabkM6TMhcBrL
	 8JLdpp0MGBjOUgJM9+D7HqKJSxHXql3nz5ELGNizhp3wITqjLj0lkTGiDhc+Z+iX09O47
	 GJqJQEOJF0vn4Cv5LtatkTymPD7/3yZ7Hj+mpUCpvqJNRDCRezju+YvEmrN1mrWhwbA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792608122;
	bh=IzR9ZJWgXH8eZgY5jyurIixf2Iqvg3PxqqO6D1Ratas=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AwSBcheegYJvQjhpZMB//ckR0GGMC3Yjbhgd9Iu6fUvC/YN/a/rLaIVk9ZQ3D9GVJ
	 kE2svbW5f9uhELXdBMFKwYwn70n0Dc93WIfz+01n0pcuebXTbIGUjzV8EdNDVITYF0
	 fG6f2Jryv8EcNrH7nLOpYQbNNx0d13h9LL1FABz2jzvjfxA7ApL/+OcGSl3L9M7W/Q
	 kGg8+GjtUVx6sUpUSP1H6Mlj/5zCgXZNGLBmPEKqwX1WtJwTAw5CsGeOIn+6t0l+jR
	 eX7tYLB+AGh41BpBM9pv4bUWVzVyA+AJNo+5QiMi1ooE9xFBzF7T3ALWBmU/tzQG4n
	 291/LTVyEXsVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2134F110;
	Wed, 21 Oct 2026 18:42:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DB0195C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E9776F4D9
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyZKtolW78oM for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:41:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C971F6FD6E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792608118;
 b=kHrTN68fwuzVZqdwPntaw3mrL4c80cTK95L6ykYTAPwLfdMkKuYUt0lRqnovbW+xBYpe
 BVr9ImuLCg5/LTn3JsJanVMsY6AU2i2slyRkzE1khYXVY3kbYFvv2Vs6v4aD4h65iEYAV
 3oyK8grMrkfEhb8/d5Mb03r0USeRZtsmyOQFzdc18GjWbwNti33o0WUX3UkBoQ78LPgQw
 ywRdbpOsOLLF0pRdMNxea8j2t5XDcfrGf75Q+qLa/29CNLb3OHi0yvCWAxTkXU4OGNaMU
 B09K98s2x+/cAfoqRdMYy+hXqF7SDqWW2/pd0KVR+OD/lvmIFGq+LSJFKJrWOanZ5lA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792608118;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=6sj2wCIWgv4Tg2EaMcMOEfJMQFD4tl0FPaWLmkzInnk=;
 b=rlRj6FYC3a873eq1WpvpHR2WzyIUlejYM1GW/4e6OnoaXBj/hYvPLCAaOZrCItmhgK/I
 DEopvdtOGKFSJggr0ciSDzZ1IHTXYo/X063orBco5XEqp4fW4Gn5C14H8yHN7qjugogr3
 jTRPKt7ROyQDIE7xRsLySGRTdSucBZAchMfNx7F1PjTPw+rhyrdLTZCnHQzKX0ngQuAxN
 ZOKtJ4WEJsn9K9jznKNbktLabY5xVgs2rgpWTOaISi146qNfJ84S/odQbvQTEZDngR7T8
 UrqBPXmCiB2p25Kui4uTD/BrmGEzLiP05t3Ea8Co2NMARYU+OhIh3rMvmNtWeXgI34g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Oju6fvrv; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Oju6fvrv
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C971F6FD6E
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792608099;
 bh=6sj2wCIWgv4Tg2EaMcMOEfJMQFD4tl0FPaWLmkzInnk=;
 h=From:To:Subject:Date:From;
 b=Oju6fvrvm1j5wV39fia8cDKCPE6IEi/a2GXeqPZ7FVCFXhMfMcOhDTnSfwYqlyiY0
 7OV9f1WBOSsrWBWCvRNb4+qWOhRTK53LPPnBnfRpOpmmglzwJjbGUPsGeJq0sjAkzW
 Mcp/HGDjgmOEunEJQloaXONJEEjOZRRSIzPiF9k2nnIBQTPBjEEmBfplJ7+Jivve62
 fw58tA1luASsY2UkGGI4yHuWLxZjgWto1rOTEjBNvuQtGuStbx4qroEIlMZzynXU8U
 Vj4CYr1aEFdvmVHQmzq56p1fo+OroMvoWwJHLcnyL2VK/h/9hyNLkntgo6hiIEUU1v
 J8QwwZi0jQhwg==
X-KAS-Sym: v3:f51bdf72230551df:V7ipQ9HkfkQ/854DwVDvAgDWVhfkomLpXYySyH7LcgFKs
 pkW4v1vaHqCWlaGpihusj2SQk4EAcyAOv8CR1Kw+QeInnqWmUW0bmINeg2ze7HvKZdXn4mF0sGp
 QKUEtpgMdGt0YWbJfFjFfVkpSVkBJfB6NmQ1W1sWSNoTq9DYA9048wfmD288GZeBC7jgFkom/vX
 pqsllhwScrJg3243HkxGBX/8ANze4akT6wjvPRlnmtGVcHzqjVbNRUL75JSIdvgvrCrcFSwrkuE
 HS0PLOQ1gEbiZYiUfjgLTN9vL3fBxQ3dOAWO0kFAL9aM7rT8CNBiCMKmcHs7Rb2lECXaKLUw==:
 KX/DYQ1g7glAfAX4VW+v7+livj4AckhUL1PDCsYyPKWSyZiVjk9WO049ItGvOODpMu6gdLJI7ju
 6pUOnBloCWdkfHHkqIDXQSJD451YK44ioKGEkjfw6pxTFg5JA84eQHb6m4nSYP433KHGCv9eKXu
 wVZAuiSw4lPuDyQqvUo7EkBYIZerAyJWVRaeXi+KKkTJRvvD9B8VKEtcPXIePpdk8EOnQpx/aId
 lQpvWtvc70gAIN45YLM1NzU7D95zCTP4xjcvv9/PNKBaqZTOtxCwwq+7bi4ZziV/M7U7PJguVOK
 oCe7qCeaik+NeV92oeORRvgv95aXmsyBI3hEkF+0F95VBps197/JZafO3wmNtAnxMjprqegpjQX
 IyXjnhRt7ShC66wxbwU0bmf7vcLsbqfIRXuQ5ENiiIGtPO1LeiIGk9w4v25tunMuMOca1IAwotQ
 Dl78n1eDGYwF6eZwkz/5Ur+R6SQm0yTAPduR8b9S/XwtzLA2PU+jC8ZJIlaIj9H2Zvv1K6/oatY
 P5Wm4da/JzZTT5agyggVHAUK43Ov4u2xw/3HWsrAnP50otehqrjcwwHoTKcLQic+9BZ4ZNM9ULj
 xaXe
Received: from fli4l.lan.fli4l (p54a1bacd.dip0.t-ipconnect.de [84.161.186.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A53CBA4C5DAD
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:41:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48174)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJbFr-0000000034c-1d91
 for buildroot@buildroot.org; Wed, 21 Oct 2026 18:41:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 20:41:37 +0200
Message-ID: <20261021184139.1135207-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/3] package/libplacebo: add optional
 dependencies to lcms & xxhash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit 006aab8d64d2179d77df9a696b3fd8636f541640 added the
package at version v7.351.0.

This version includes optional upstream support for

lcms, added in v0.5.0:
https://code.videolan.org/videolan/libplacebo/-/commit/eb14d3bdf22605263a9b6025ed6280eb1515a89a

xxhash, added in v6.338.0:
https://code.videolan.org/videolan/libplacebo/-/commit/cb1009d1455e64787e52c5c3b6f7042aa37e5c14

This patch adds handling of these optional dependencies.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libplacebo/libplacebo.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
index e03f224971..c3a2822fb5 100644
--- a/package/libplacebo/libplacebo.mk
+++ b/package/libplacebo/libplacebo.mk
@@ -12,4 +12,18 @@ LIBPLACEBO_LICENSE = LGPL-2.1+
 LIBPLACEBO_LICENSE_FILES = LICENSE
 LIBPLACEBO_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+LIBPLACEBO_DEPENDENCIES += lcms2
+LIBPLACEBO_CONF_OPTS += -Dlcms=disabled
+else
+LIBPLACEBO_CONF_OPTS += -Dlcms=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XXHASH),y)
+LIBPLACEBO_DEPENDENCIES += xxhash
+LIBPLACEBO_CONF_OPTS += -Dxxhash=disabled
+else
+LIBPLACEBO_CONF_OPTS += -Dxxhash=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
