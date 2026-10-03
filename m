Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37318CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE3A4411E1;
	Sat,  3 Oct 2026 10:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSRDfy5vc9uL; Sat,  3 Oct 2026 10:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C304B411DE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022108;
	b=Y/oqbatK/2lmqwWdvo+aR6uxfpOVkGIrjOnrz3sC+0KEnk1sjMNEO3Yf8cqSfuc0S3iW
	 YrhMBQFlrHu4/hkRdBBrVnBQ/+XJvMQz0cN9MN7ImXPB4Ki3MQ+t34bx/vd407AX6AQLX
	 QkiZWNs53BvyedJSC1/WeyFQVStjboFonXI99M0sz5S9J0lM28zSVNxAuJ0Pz807AntUf
	 m2QNh14OHPCNI9vFAZLqMWHixDOksVOc6tODxgp8ZO7FMbPrUS/GEqYTOAaCu7dTfcyWx
	 NXds5hV+3DvALwafTgxXwCsxRVS3gO6f2Cj0rw4TR+vbZttN2ijcjP5RxfQOCmTbyng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/zt7DZth/WJPmF9spMq2ZsMrmDjokk/6re51yE4j4P4=;
	b=Ix056K5KXXwUfA6Ju41Ndxzl4uf9n46saM1KTn6JayIEI+CkoCoDDuYLhm2A/+RnZSun
	 wiUNgLD/vV5whWIHktraOZcSIosK6anEER+ZekwdV3LAtv7Hr7eiigz3Oc12Roggw4Qcs
	 dM1hse0KkxPF+sQCRREW4dm5sdNN9D8AndkK/au7FcJ8WwoBh6lVIQwWtBz7v/+scLhc7
	 EAd4AU1bd5LvvqpazAVPhm/QdsXvv5Imf7eVxSUwBkg87kcQZC/PiJ1fWzwQb0Nlv6KyF
	 TyLxEQhMIKpvD6+XsYmnU0T9KYAaC9+LrZvOiR8ZeYmXBXdu9wPdUsTky8Ni/ytl0dw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022108;
	bh=/zt7DZth/WJPmF9spMq2ZsMrmDjokk/6re51yE4j4P4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Epj6IsDI6YjW62es4hDNd7IBeTWi4Dsvk1abevIqwt9hyxOnQZ3zHPxHkzpa4qO8l
	 +yfp348SXlJocmRxr+JltMY01az595bfNA8I8lZno3cEOpRI40uhbl4VuU/zZ8XZVK
	 3bwtHXFkaFs30ZnslPeaSYEwfximJ1c+HuIAvVpGoA8jiIlvh28tMIngyKeYWAqs2I
	 DLRj4vv+Kouw++kLkf6rES3wIBlUuu5ik7oCKkee4U0ns7026dkdelaM5PWo8PXgkw
	 t+FXpB6dNx3Ox6x81ikcfxj7T1gzk3D5Z+yuFEzFuvgAP7R5WVUZCp9tyHGCns4jAO
	 H5NDmUTrC2qbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C304B411DE;
	Sat,  3 Oct 2026 10:08:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8416A335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76155400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRcxd_UT7e_Z for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:08:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DB9CB4007C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022105;
 b=EfbJN43rhGV8qfnXWKHQN1qMvta9Zt3/pkURpjsc44ZAr11m7tarJaegl3uJmi/7wB6O
 3HrF3QJi8jf8YqgIhkD+Ectzwja+5DpRGv9MnroZRegE2wSvcQaWcY+vbK4XO5nMb6pBZ
 1+aG+Wdd9c9MkgJ4vVvtkS/Wo+slfVBBb/P30VptTq++cIexWoEO4kG7kSjWgZT0rISUh
 IFJpE8pnd1XbsjlYLI05THfezkLHgflLQgNC3U4S4qggtawIblBzLnpacbSkIcAnLSIfV
 0MIPvcxwXTL1ofgn+cdMJWr0JLAf435aPwM55ZYifI+znzlrCzUygACKmCnhiHTgtYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022105;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=R8boEfhFuXc9d79tXnwQZ8qcL9OyhCmG8VqJm5xfIH4=;
 b=gNJ/de5YmNIkZNsm+ulD0Cd/+ubwyLkwnJoQKVXNyRaGoaHZ/DBLTsdtydzseBwE9h9v
 3Ef95HCNJRxntOilX1auaqQlIqbJWpov77G6rFxY4q2lYWRyeAn0Ze7j/TmFpGk3xVACz
 olyAc6AlVWk6Jjfp0pZc6FtEIrzxDWMsp7D0Vn1fPie6DlItl674PtRHYvLPQXXhHuzZB
 FevnZ3fHhmWF8KQC22YbaY4g3TyPhVFNBuoOxqyDjHthVH9nXz7wxOvbO0oJAnyjiP7cR
 EmJ9v9a83cUV+QuNW7cFwiEBgU5ORdyHag4xpN+EWXaRq3DgNAWDCuUFd7SSQUeYJfA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JAxL5Lz0; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB9CB4007C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:08:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3C9A71A1100;
 Sat,  3 Oct 2026 10:08:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F139B604FF;
 Sat,  3 Oct 2026 10:08:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4CE6110328318; 
 Sat,  3 Oct 2026 12:08:18 +0200 (CEST)
Date: Sat, 3 Oct 2026 12:08:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <asDUC868cPT0dQ-_@windsurf>
References: <20261003084316.2457542-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084316.2457542-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/dbus-python: bump to version
 1.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 10:43:16AM +0200, Bernd Kuhls wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> https://gitlab.freedesktop.org/dbus/dbus-python/-/blob/dbus-python-1.5.0/NEWS
> 
> Migrate from autotools to meson build system.
> 
> Update the license file list for upstream's REUSE conversion. Keep the
> full set of split license texts in DBUS_PYTHON_LICENSE_FILES so
> legal-info can hash them, but leave DBUS_PYTHON_LICENSE unchanged: the
> GPL-3.0+ with exception text applies to the unused Autoconf macro, and
> the extra dbus-gmain MIT files are not installed.
> 
> COPYING hash changed due to REUSE formatting:
> https://gitlab.freedesktop.org/dbus/dbus-python/-/commit/f83a62c27203553c04c375ff663d9d99273670c9
> 
> subprojects/dbus-gmain/COPYING hash changed due to REUSE formatting:
> https://gitlab.freedesktop.org/dbus/dbus-python/-/commit/ab33ebefc5ca34486509e3a87591ad2e883b9549
> 
> Removed autoconf-related license files due to upstream commit
> https://gitlab.freedesktop.org/dbus/dbus-python/-/commit/b286e65d1e4c88db16876e31e6b1b63eaefab2f8
> 
> Switched back to gz tarball as provided by upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> [Bernd:
>  - bumped to 1.5.0
>  - updated license files and tarball URL]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
