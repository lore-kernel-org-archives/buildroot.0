Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91388C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 11:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2153840651;
	Sun, 20 Sep 2026 11:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecjIaTcpXt8T; Sun, 20 Sep 2026 11:32:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3B5AC40664
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789903974;
	b=J3Vtj/tFdHrOun2EVkwo5bXywjC3OpS/0APzKXEFSEcRkpeUngmw/iDDec9UAaWUpgxK
	 8ElXcQpJ2B3jSXjzgRTqjGIvu9V19dGPnf6XPMM1/Szz12MTZBhH3WjnYp/OPnYcN8uE7
	 V2l+/DUDkUKy6ZGozEjiC7TcqDgmPdnmqDZShVckSY32uIwG1ocOzD4W+uu5D2AgvM1PL
	 ZMElRkKywkpNT1zHr+92cZvXEpfPOV8fFLEG+Inp/wrg/lueAe41uuVdKd68lyCBhydOi
	 sWT84SdE0w5ITxGXQLM7EN2byqskGPC6FE1nC61r4ipNsULRwBqePC5VXSEWEITBDPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789903974;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vwXv2Pc6yWI1Rz44/9OC57xl6KfnNrvO8ERUKZGrfuo=;
	b=pvSNF7I4z8sw9OyCWB5lu4mfUc70Bzxwc73ZViwttu30bHAcLjHgPel8CnvyLQNdx+O7
	 0TVudD4FxqvECYbO8QKXYceWI5carBo3cIi+JUZENAyYoW6gum9gL6f+H1yxkTH0su5RB
	 alaU8bcCYKy7RlABRw2fySnmp56mGVNfcO7EkMKM0r1ywQkYNYDScyzh7yV16MX4xcTpc
	 XPVYLhdgDCmIpyAHOy1wkWPIMy8/idvgSN3PqMhy11jYFhbA6EbxPpom1Ftq34ApLp0Ow
	 FhZk7pof58GoupyJwqRdU5x3G6lgwAwjxtMPvYNMclWmVKCMitoEM39i4oaVFOD75Pg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789903974;
	bh=vwXv2Pc6yWI1Rz44/9OC57xl6KfnNrvO8ERUKZGrfuo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NxWhtFzKK+0iQ+v2oSn8FYYBRj+l8oSIZmXuS+EAqvlmfU5gkIubQtwhLUEqGJwnj
	 HRg+N+upErMnpZNwlOShMlmv0rWfDyvi+5TbVHoXwl+vlutjglOF3iFdUq7Hw2K2NN
	 Dde+lUeSWWv8hQoQ2iIqitlQnX1FK80M1qDfPeXGBRO5ViFVvixWDvzD72DEZ7plpQ
	 f0V1f6nZmirFo21SWyKHX2h808RY6+FPgrWSj+NpI1FbWV1zIT87fge1L1ll+SdlqJ
	 WZBXDkRRHf4D3TRrpixkTv1RZDA0UaDhJdFzKzAp2vdzhYxqCBpgMNyygc2uy73dnb
	 0MtQk1uy1uwRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B5AC40664;
	Sun, 20 Sep 2026 11:32:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7075C392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5638460619
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TG0L5xq-lWJt for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 11:32:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CCC0960600
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789903971;
 b=Cbx4nEPrFY0kimI2K/8PgDc4z28+FcKDcLUl17rm19H26JPZ6N660GNb7l5lQqTLzEdS
 g81o4tc+SUbZ1h2nD+ATdEdWhPPTESohU6pvNWOXB919zkx5KRWWoi/d08B7/0GPwM2H0
 IYAF1jN2b8ywkd5PoVM2VdFg3sN80wKtRsJhD7wtXw0Sc2HPGj2k2pI+kQMXZIT7enQKh
 oJS9vqFp/SZnj/6JT/2OUJC5Wsp80DdKBD36rkTjjZEuIKGzljY6MqJ9FcJgQtsgEA/tp
 GhxirEJBq6aO21B1PIvQz7fooWJku0aorWRHehrtQAzr0dz+ShxuxA9/uP1WhnSjXVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789903971;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=6YFpTCbj9NkFi+O6rh4r933dU/up7GOt2Dz0ce7DYDA=;
 b=k/lphlAFcTKZg9IZ1I2gQMISILQLAQvyrpcqceLmoaz76Vwkz6DlFc+tNIs3fIJ5cssC
 YvHjLAUZrRWz2uPvbbsAgtR+ohLhl4wDyVUW+V8LpdlByHo9rRy6W9yPUf6u3K1x+rxOM
 2rVRV8q8MHtJS9I2sgdVtTd+6GHLwfWnsGbSW92PcoVqKug30YrRMKZ6xeq1lJsyYVi1W
 TfopMn6enD+kGdoSHND2H3LhaxAldqDuCEEKWdYkKzYAK4eWbDVjpTqgAq5/2JBkrvrUd
 vpBEI6fGBGhBGNSnATdBWzs8plrr539WoNqs51AyM+gn4Rz2+MpxKtZnCzCurHA7/6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ov1r3tvF; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCC0960600
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:32:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fIQ-1x9voo0xbu-001Yoq; Sun, 20
 Sep 2026 13:32:48 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 20 Sep 2026 13:32:31 +0200
Message-ID: <20260920113231.2342852-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:xgkl0B6oOQuTC28SgVStejP83jXkBNgLGhuBoaPXkLTrt1oxS0V
 QI+z3NzFkLDSQpyhcl7gqJCDFXkbRMtv7VE94XUX/SExF/g6zmouXXFK9HSaySG7sEb9TtP
 EKcAfXaJvAvQH5WU6qQDpjmh6Y2WlGNutudjBq/sbVTlM6uPnLEk43iEakzntjyrdRBrBcq
 K1IhD4MaCag7VfbFIlI4Q==
UI-OutboundReport: notjunk:1;M01:P0:OwQ3wkSKXRA=;T9pVDpXTiSLhseXbQFZmpiAAhdr
 +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
 FWhJ1u5jnIgNTl3YR4BaInVMNQ==
Subject: [Buildroot] [PATCH 1/1] package/kbd: requires shared libraries if
 using uClibc
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream commit 7fdd8debe37ae52812b77d82e08713bd62c607f4 [1]
(included from release 2.9.0) libkbdfile unconditionally includes
dlfcn.h. uClibc provides this header only if shared library support is
enabled [2], so building kbd fails if BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
and BR2_STATIC_LIBS=y (BR2_SHARED_STATIC_LIBS=y works).

The issue has been reported upstream [3], until it is fixed disable
building kbd with uClibc and static libraries only.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git/commit/?id=7fdd8debe37ae52812b77d82e08713bd62c607f4
[2] https://github.com/wbx-github/uclibc-ng/blob/v1.0.59/Makefile.in#L260
[3] https://github.com/legionus/kbd/issues/159

Fixes: https://autobuild.buildroot.org/results/872d12bf869717ae8aec9a2ed6295cf8f7e8b098/
Fixes: https://autobuild.buildroot.org/results/056b5fe4ca230989041a1ed166c1b509f8bb0908/

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/kbd/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/kbd/Config.in b/package/kbd/Config.in
index 27cadf1af2..e3ed20a5d2 100644
--- a/package/kbd/Config.in
+++ b/package/kbd/Config.in
@@ -3,11 +3,13 @@ config BR2_PACKAGE_KBD
 	# Uses fork()
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Generic
+	depends on !BR2_STATIC_LIBS || !BR2_TOOLCHAIN_USES_UCLIBC # dlfcn.h
 	help
 	  Keytable files and keyboard utilities.
 
 	  http://kernel.org/pub/linux/utils/kbd/
 
-comment "kbd needs a toolchain w/ gcc >= 4.9"
+comment "kbd needs a toolchain w/ gcc >= 4.9, and shared libraries if using uClibc"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_STATIC_LIBS && BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
