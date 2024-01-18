Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163E2C47258
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 01:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D27C61589;
	Thu, 18 Jan 2024 01:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D27C61589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMVZh4MrqUWt; Thu, 18 Jan 2024 01:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E70E46157D;
	Thu, 18 Jan 2024 01:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E70E46157D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA171BF3EB
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 01:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE3436157D
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 01:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE3436157D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbsPzY34pTMK for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 01:56:38 +0000 (UTC)
Received: from office2.cesnet.cz (office2.cesnet.cz [78.128.248.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6163961577
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 01:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6163961577
Received: from localhost (unknown
 [IPv6:2a07:b241:1002:700:41fe:11a9:b352:1c39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by office2.cesnet.cz (Postfix) with ESMTPSA id 77A801180072;
 Thu, 18 Jan 2024 02:56:31 +0100 (CET)
To: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Jan 2024 02:56:27 +0100
MIME-Version: 1.0
Message-ID: <0a76a0e8-2a2d-4172-8f03-f9ffd194f4db@cesnet.cz>
In-Reply-To: <8734uwju7l.fsf@48ers.dk>
References: <20240111105621.2321957-1-peter@korsgaard.com>
 <ee6bc481-faaf-4d84-a450-d9a2730f9fda@cesnet.cz> <8734uwju7l.fsf@48ers.dk>
Organization: CESNET
User-Agent: Trojita/unstable-2024-01-14; Qt/5.15.12; wayland; Linux; 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cesnet.cz; s=office2-2020; t=1705542993;
 bh=utFytoMJNMiP5P76Ofe9/ASuCWpeKmMdBcfI6DgkwZU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=adKTFpefudka+9DQd4/FAU45JE9YHaNt6ZdUp5UPlXU71/PBNebXPuaEEF3jJC7CM
 4rTMqVjwLG1HAJw2yH/5K4VJt7kQA2hmDG4rJJ7IQ/g2VpCeQ6kRXgjNGEF731nbua
 VqQZKv65xfIcDlodNIQCgCqpIh8mr95OVI2bMLoc6TTQl+gWoJCfyXLD4zw47x4hei
 ZTNt73ETotkQIj61sF99tDNlceuTTauIgtlmZnz3nasOB4w2hGN6Vx3fz8RJM9SCeD
 75Pcy9Veq+oc/G//R1fZJDhB6IaeVY7WsMU8bNWBfZJCHGnlokjVVmxLO6MWKun5Ct
 NUsb5F20GHw6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=cesnet.cz header.i=@cesnet.cz
 header.a=rsa-sha256 header.s=office2-2020 header.b=adKTFpef
Subject: Re: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_1/2=5D_package/Makefile=2Ein?=
 =?iso-8859-1?q?=3A_set_GIT=5FDIR=3D=2E_in_=7BHOST=2C_TARGET=7D=5FMAKE=5FE?=
 =?iso-8859-1?q?NV?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Jan_Kundr=C3=A1t_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> I guess those are local/custom packages that you have in your external
> tree? Can you pass GIT_DIR=.git to them (or make them unset GIT_DIR) to
> make them use your prepared .git directory?

Yes, these are local packages whose build recipes live in our br2-external 
tree.

I tried to unset the GIT_DIR from both $(PKG)_PRE_CONFIGURE_HOOKS and 
$(PKG)_PRE_BULD_HOOKS, but calling `unset GIT_DIR` has no effect in there. 
That makes sense, because it's used like this in the pkg-cmake.mk:

define $(2)_BUILD_CMDS
	$$(TARGET_MAKE_ENV) $$($$(PKG)_BUILD_ENV) $$(BR2_CMAKE) --build 
$$($$(PKG)_BUILDDIR) -j$(PARALLEL_JOBS) $$($$(PKG)_BUILD_OPTS)

...so it won't propagate because it's set explicitly just before the build 
command executes.

In the end, I did it like this:

  XXX_HACK_GIT_DIR = GIT_DIR=.git

...and then for each project:

  FOO_BUILD_ENV += $(XXX_HACK_GIT_DIR)
  BAR_BUILD_ENV += $(XXX_HACK_GIT_DIR)

Cheers,
Jan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
