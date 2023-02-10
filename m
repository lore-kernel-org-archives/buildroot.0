Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD50C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5AC960BC6;
	Fri, 10 Feb 2023 22:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5AC960BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3M22Oz5BNX3W; Fri, 10 Feb 2023 22:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38265607F9;
	Fri, 10 Feb 2023 22:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38265607F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9071BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5450B607F9
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5450B607F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oIiJSsLFY_t2 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:14:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC0560758
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AC0560758
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:14:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 45F12240004;
 Fri, 10 Feb 2023 22:14:55 +0000 (UTC)
Date: Fri, 10 Feb 2023 23:14:54 +0100
To: Dirk De Becker <Dirk.DeBecker@ebo-enterprises.com>
Message-ID: <20230210231454.4f3aedbd@windsurf>
In-Reply-To: <DB7PR03MB4841CE1D746B328873113D87B5DE9@DB7PR03MB4841.eurprd03.prod.outlook.com>
References: <DB7PR03MB4841CE1D746B328873113D87B5DE9@DB7PR03MB4841.eurprd03.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676067295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJBm9uVIvd2aDTV0m7etcxyRP+SOHkOTlYZKCMSATwg=;
 b=VmwnAbL3hiRUYpQDjaCr76NHig2Q77Q1pBFmzrGpRWL8GXgYGVL6VZ9wJDnWyVTa4vqjqd
 EpyMWMNRRuxX61qHTCe7e3/68mGR5D+lsaoDy+oP+6tQbXeHaglxQ64LeTaSqE0lgHlwT9
 rL9WQnfADaf0Kv2pW7XzYbtyVCsqk7hI9bOE3YsLUxbjWQiUIOdiW6ySqfEVi5TKhi2uW+
 jEo6HbaJ+NfbLPQdTa/3z3PYHAfjw+6sL5ZzTV5Lkyf26mFxw6dY3JKwXb4/Hg9GB/ORbt
 X6UdohLBeHGSpNd+ZzoiZyW+gozMrZYK1AuXGfp0P+u57iS2C7F0M+stRAzetA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VmwnAbL3
Subject: Re: [Buildroot] Dependency problem for gtkmm3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Steven Boucque <steven.boucque@ebo-enterprises.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dirk,

On Fri, 10 Feb 2023 11:15:12 +0000
Dirk De Becker <Dirk.DeBecker@ebo-enterprises.com> wrote:

> Hi,
> 
> I am trying to make a buildroot containing libgtkmm3, but I run into problems.
> I did the following steps:
> Checkout master from git://git.buildroot.net/buildroot
> Select the following things:
> 
>   *   BR2_x86_64
>   *   BR2_TOOLCHAIN_BUILDROOT_CXX
>   *   BR2_PACKAGE_MESA3D
>   *   BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
>   *   BR2_PACKAGE_MESA3D_OPENGL_EGL
>   *   BR2_PACKAGE_LIBGTK3
>   *   BR2_PACKAGE_GTKMM3
> 
> I get the following error in the output of the build attempt for gtkmm3-3.22.0:
> configure: error: Package requirements (giomm-2.4 >= 2.49.1 pangomm-1.4 >= 2.38.2 gtk+-3.0 >= 3.22.0 cairomm-1.0 >= 1.12.0 gdk-pixbuf-2.0 >= 2.35.5) were not met:
> 
> Package 'giomm-2.4', required by 'virtual:world', not found
> Package 'pangomm-1.4', required by 'virtual:world', not found
> Package 'cairomm-1.0', required by 'virtual:world', not found
> 
> It seems that gtkmm3 is dependent on versions of some libraries that are not available.
> 
> The following packages were built, but these do not provide the correct versions of these packages, according to pkg-config:
> 
>   *   glibmm-2.68.2
>   *   pangomm-2.48.2
>   *   cairomm-1.16.1

I have not looked at the issue, but it seems to match what our
autobuilders have reported at:

  http://autobuild.buildroot.net/results/172/17263ac51f197031106eb7fd595126a2720f0397/build-end.log

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
