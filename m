Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4CED5B146
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0415980C17;
	Mon, 28 Oct 2024 20:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9njNP4p0zDg; Mon, 28 Oct 2024 20:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5C0080C75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C0080C75;
	Mon, 28 Oct 2024 20:35:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 310494EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1217F410DE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2upzz5957bOC for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:35:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6292410DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6292410DB
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6292410DB
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:35:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 846B01814BA; Mon, 28 Oct 2024 21:35:08 +0100 (CET)
In-Reply-To: <20241028025410.62158-1-james.hilliard1@gmail.com>
References: <20241028025410.62158-1-james.hilliard1@gmail.com>
Date: Mon, 28 Oct 2024 21:35:08 +0100
To: "James Hilliard" <james.hilliard1@gmail.com>
MIME-Version: 1.0
Message-ID: <5109d-671ff580-3-4946930@44461145>
User-Agent: SOGoMail 5.11.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1730147709; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Z7/oASdc+GPuqXnCZKuT3X4O9s5sQqmuzPz1JxarMN0=;
 b=pXyms46vGrbM7ydsSEoL1dxA8/US6X4eQlw4ZN9Rs1XMuq/T6CULAB3S9flVjnmpcsLiJF
 0X5fiLxr74jzgzvhic06s/oon9aw/tY+IBtzJ/FpU0rtUzYOIOfYoh2SsDKxDoIj2KkSGc
 dIqryifjQl8XvkEkJQ4Q1BIym+xZLCw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=pXyms46v
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_v3_1/4=5D_package/=7Bpython-=7Dpr?=
 =?utf-8?q?otobuf=3A_bump_to_version_28=2E1?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, buildroot@buildroot.org,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>,
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On Monday, October 28, 2024 03:54 CET, James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate protobuf build from autotools to cmake.
> 
> Migrate protobuf-python to use pypi sources which are now required
> for setup.py builds:
> https://github.com/protocolbuffers/protobuf/tree/v28.1/python#building-from-setuppy
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

with this series I can now build protobuf-c successfully.

The packages I now see issues with are mosh and collectd.

For mosh the error message is:

 119 | static_assert(PROTOBUF_CPLUSPLUS_MIN(201402L), "Protobuf only supports C++14 and newer.");

this is already addressed upstream: https://github.com/mobile-shell/mosh/commit/eee1a8cf413051c2a9104e8158e699028ff56b26
So we could cherry pick this patch (which raises the required C++ Version to 17) or could alter the package to build in C++14 mode...

For collectd it does find grpc but for some reason fails to find the correct protoc version:

checking for protobuf... yes
checking for main in -lprotobuf... yes
checking for google/protobuf/util/time_util.h... yes
checking for protoc... /build/buildroot/output/host/bin/protoc
checking for protoc 3.0.0+... no (libprotoc 28.1)
checking for libprotobuf-c... yes
checking for protobuf_c_message_pack in -lprotobuf-c... yes
checking for protobuf-c/protobuf-c.h... yes
checking for protoc-c... /build/buildroot/output/host/bin/protoc-c
....
grpc  . . . . . . . . no (protoc3 not found) (dependency error)

not sure what is going wrong there.

this is what I found in a short compile test...

used defconfig:

BR2_arm=y
BR2_cortex_a15=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_OLA=y
BR2_PACKAGE_USBGUARD=y
BR2_PACKAGE_COLLECTD=y
BR2_PACKAGE_COLLECTD_GRPC=y
BR2_PACKAGE_KISMET=y
BR2_PACKAGE_MOSH=y
BR2_PACKAGE_CRIU=y

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
