Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AE9606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N0I71c7k
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EF3340B4A;
	Fri, 30 Oct 2026 14:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdK9ptJpPwo1; Fri, 30 Oct 2026 14:06:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 32D2940B5F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369196;
	b=jNR8jT6lrrDX9zLbq0lzOlDjTOv5ebb4GuaJaR3PZfIGJqRq5ZS+kQOwInN6GS5r6T/c
	 j/8vjEBkMn/j6J4SrqDk8GlsJPDLu7l6gAXC4rDy6109wSMogPAJL0jpeNYYCN3DQmmtN
	 07GoSYAJXO+89qy/qjcFtcEPgporVJZoXnHG1IyQfgWbUe+qrWFKxe1wCB/YS9aZK+1rz
	 DOvjeR/7kR9zBqwgI6H+lb0P6xRBQWsDilsNfy7253IhvH5PFH9Y8koEb3Ip1sbtaQ1q6
	 6OD0SmVb9+X7O9YqpZcrdpSXCprFYddTU4sIJLGo0NkeY7BwPexZ/HefFmeITQ1GDIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369196;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Eq1EXricZb4ZceOcyBQRCIsAp4PpPk836943OFzJW2I=;
	b=q8j7oBkrUmkfzYH54PPDxWMF8rOT4U12EtNT1LxrrZg2YzDgFzY0+KCFdczGsQ/TqhL9
	 m56xExMxQuPqjkiy7ybhlCQu8WbpBpKkqrL7bWbDa3jSuJRPScGc9fNHfCeE8+xsn8eOL
	 7sLI2RCBaNy+VhYue+dttAojP7TGelzB+ynwEXVuPSO8dOUdG338XB5/sjI14tO2rCc1m
	 6zvjgnY8re0V7ea6/e5zL+LnZd7s+nKHLK388TcbAmkX9/fst4tau5jE0RdATeXWXUPC5
	 2XVtv+SAh5AGIU6orrZ1DfamP2teJ8qwzEdHZJpABifoi7SddqJ091fUdQb7gmYgGVQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369196;
	bh=Eq1EXricZb4ZceOcyBQRCIsAp4PpPk836943OFzJW2I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N0I71c7kJmEn5D/1kxscpdtLwpH/K4/HALCFoAybS5CEWLr9wlOBmpdWZ115shbp9
	 A+Mqw+omlZ+zZCnqMtBYuZgLBicMbHrq6Mvy3/hjtX8ceLqMabLYkz9qUFVrcb4Drc
	 Y0Jb72/+QbMVltlDLPZ3ie/pEEfonhGXEwrcVqy3tbQn0VbVQB0MthgZ90t09eraE5
	 x4tMkCL1w7/XgV0r5gxFreGn/S92L3AtLPNETdZRZlJQttiSFhbFbz6pLd3JeDm2Mi
	 G0nsEgp8vunFcVaks6c+aaN2DZDPA4joFm9CQe6q0bZGRHialnotn/u/xGdtVT1k2g
	 4WlntG+Gr6lPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32D2940B5F;
	Fri, 30 Oct 2026 14:06:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 709F0D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60B7960AD3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGBV5wNZXJD0 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9382360ADD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369158;
 b=D+r5kfksoJcAANLLORHLEPCGZXhYBdiFHFhuUm+8cs1w+kKgg+RRI1AbyIjfKjI1NCZ8
 1bORj6n7R4dshqVb6dNHjXQ1jxg1QRXZJtmqY1ppGTtldienWsyoVYwpU/bzqDblQhtDW
 HyKxqqofplnP1RUdArd0KUc5x+sMgiQVGFdQej5W3oaK+7gOe/DWY9wSE4wZVEej8Q4fy
 JE8GN31/j6woIGFy1/9XfEW6hvPxgun4sdwxF1VrgWRehVqmQRiHAOUFzNpz3BHtw5GwF
 5NGgBQFyzCwgJcPH2kj2XuYsjrWU6sJUR1JNDOi+Canoi+GXyHuXFaeNriJeEvWFWCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369158;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Q2niUw5FQmeNhvdbbGFHDQ7JwgTOl+lBvC2zb45itX0=;
 b=WGYDdxBekiod3olWb/wLGikiYIYlcgjXzvQStl3Mk5D2i3bM5mSSgQkOIfcKOAyNmvsm
 /2JQdXZJclE9Db0o6TvvUrA9VtHK5I94bbPISP3orziTU2VlyV+dP1692ZwdXUYQeHeFQ
 GHyAo1BORMNkXb2nwkuB1cpETavc05qkjWw74ZimrJzLkGqVXt/OAP6Iq6Lfko5XPKfa3
 yqTvYyiryDso3PHPXPzQ7p7NuSmgtTLnrO6AwKUzLNkxiVKCZir4TLdkL5D2k2Ew/DrsQ
 EoPQDvNNoSoEO3f0PQpJlghg33DAFVziIp8iSyHxvdYe9XviDo31zfQfdT7y+XnqF3Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9382360ADD
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3B2F9D389; Fri, 30 Oct 2026 14:04:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6d13792aa675d8df40095ec909cfa7080ccc8b04
X-Git-Newrev: a24c26082b60142c14ff0f51b1598019c3c5fd49
X-Patchwork-Hint: ignore
Message-Id: <20261030140430.B3B2F9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-golang: use
 external linking on ARM Thumb
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2595115539806288586=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2595115539806288586==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a24c26082b60142c14ff0f51b1598019c3c5fd49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

On ARMv5, runtime/cgo calls __sync_synchronize, which comes from
libgcc.a. When cgo objects have unresolved symbols, the Go internal
linker loads libgcc.a itself to resolve them. With
BR2_ARM_INSTRUCTIONS_THUMB=y, gcc is built with --with-mode=thumb, so
libgcc.a contains Thumb code, which the internal linker rejects:

  link: R_ARM_THM_CALL, are you using -marm?

Go already passes -marm when it compiles the cgo C sources, so adding
-marm to CGO_CFLAGS does not help. The call from ARM code into Thumb
code must switch the processor to the other instruction set, which the
internal linker cannot do. Force external linking instead: GNU ld can,
by rewriting the call to BLX or routing it through a small stub.

Fixes: https://autobuild.buildroot.org/results/7534211959577546c3777939d11e411d8a417baa

Signed-off-by: Christian Stewart <christian@aperture.us>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d2d3833f1d4d4bba742bafee3197fc456d41ec42)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pkg-golang.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 00aa10360b..c3ae85cd7d 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -128,6 +128,17 @@ ifeq ($(BR2_aarch64),y)
 $(2)_EXTLDFLAGS += -fuse-ld=bfd
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS),yy)
+# On ARMv5, runtime/cgo calls helpers such as __sync_synchronize that
+# come from libgcc.a. With BR2_ARM_INSTRUCTIONS_THUMB, libgcc.a is built
+# as Thumb code while Go emits ARM code. A call between the two must
+# switch the processor to the other instruction set, which Go's
+# internal linker cannot do: it aborts on the R_ARM_THM_CALL relocation.
+# The external linker (GNU ld) can, by rewriting the call to BLX or
+# routing it through a small stub, so use it.
+$(2)_LDFLAGS += -linkmode=external
+endif
+
 ifneq ($$($(2)_EXTLDFLAGS),)
 $(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
 endif

--===============2595115539806288586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2595115539806288586==--
