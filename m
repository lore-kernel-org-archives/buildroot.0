Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99D3F428EC
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 20:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9708760034;
	Wed, 15 Apr 2026 20:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-xShggeqwqw; Wed, 15 Apr 2026 20:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6CF560035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776285852;
	bh=/Qx8kdIIlljNBXKrcho03Y39o+hLyxRiFa9Sf6C9CrY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R2BwnltUNIl3uf/NCuuw1Yabswz9nl6q0KDSjRIbqSb5Q9lqo2lgiicEzuqWg4+mX
	 GeglAnyTQL/QFC2dy0wV7lX4oouNGvNh2paIEqj9OOgoFKvja2hKu6P/uolqCMy8IS
	 J/TxTdY079ZbSG86Sh3pXNwg+fHln6oFjnIedumaQq5MPPQleINW0qMEVyQYlSH1D3
	 a7sSxTH+yD2L2crOSMfJ08iiEKqPrJH4g59HMgVds9k7+Tzkx4R1fu6Tkr3yV1j47e
	 Fdh0K6E7/Gr6X29+ood8a7GIk3J5D2NQU8O3BOYxFMyPLog+aISMidMcAUmdoaieoI
	 HHvFCtO3C1gGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6CF560035;
	Wed, 15 Apr 2026 20:44:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59BC8127
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56A76801FF
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dlr29OHJWE3f for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 20:44:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F2DF801CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F2DF801CC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F2DF801CC
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:44:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EBFFD5FFB4;
 Wed, 15 Apr 2026 22:44:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Apr 2026 22:44:03 +0200
MIME-Version: 1.0
Date: Wed, 15 Apr 2026 22:44:03 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Brandon Maier <brandon.maier@collins.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20260415185037.3034594-1-dario.binacchi@amarulasolutions.com>
References: <20260415185037.3034594-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <bd807eccdcb8b02e3d0fe97bf341ab8c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776285847;
 bh=330PUMjKphMdL7Bkfg9YDypHMDUFaeqd6UD3KmYtzlE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LVEKcQ2JEsT5xznoG9cgBeow8wUL67m/goSXEPSLxkUDrgkG54WuF9NlAPj5Te0Xa
 F3fcUWiRqcWNv93bqlFeuJ4ddk8pWU6P1fxyhDOS561VX4q1vOyP0wwXlaSHMeXV42
 mqNpiDM1ZO5kJCSkcXH16zXSKbpPja5bbyK8Yf6hKfFPALzF1a1ykBldtxiIgm0SKi
 yYsdDqY6W8aLX+A5oy/y7IWmaFZrh039WMDNCI646ooG3b0oPzyeqAxohgrlm30HZ4
 oCGjHAFNg34jIuHm10ji+PmOomLtArgzKEzJFzxvH4eDgBcjqNkyj9DDonwh+uL1Af
 ZMoODDk5tjwuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LVEKcQ2J
Subject: Re: [Buildroot] [PATCH v3 1/1] package/mtd: bump to version 2.3.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/04/2026 20:50, Dario Binacchi wrote:
> Version 2.3.0 added the fsck.ubifs utility, so support it with
> the new Kconfig option BR2_PACKAGE_MTD_FSCKUBIFS.
> 
> The new version also needs host-pkgconfig, as can be seen from the 
> error
> triggered during build tests:
> 
> checking pkg-config is at least version 0.9.0... ./configure: line 
> 5613: buildroot/test-output/TestMtd/host/bin/pkg-config: No such file 
> or directory
> no
> configure: error: pkg-config not found
> make[1]: *** [package/pkg-generic.mk:263: 
> buildroot/test-output/TestMtd/build/mtd-2.3.1/.stamp_configured] Error 
> 1
> 
> Changelog: 
> https://git.infradead.org/?p=mtd-utils.git;a=blob;f=CHANGELOG.md
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks. For info, I fixed a typo to fix
the runtime test. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/1124bc4b836a0f16ce46088f0dd7e595a4d1b2ab

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
