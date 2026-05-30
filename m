Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DF6CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 18:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60F49853C0;
	Sat, 30 May 2026 18:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aitn4XGiqHfm; Sat, 30 May 2026 18:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 559DB853B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780166351;
	bh=Q7IFOfWJHxNENHK6Op1zifBEd8TQSGQFdaV8KyWqlhI=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jHNQmng1pioTCZ/h+GErBD24KgGBrXIrfjOimprw+5i20W6hxTlPA97Cga95ah63c
	 VS82AVw81SM8ObYC0mtNV5WtSMY4TeYIv6Iyp+Rda3gFr37VyaB0/59zFMHdOchMF5
	 gJoeFK0IN3A6l86eoNocp8AdIlfvmarg70zExG6ai47wrXJamaOZQZW2P4DuAB8phh
	 J8KcGnkzJXHulHNcxTZE7ftHiS1aAaThb8kEExJkYyhq5A1Eg3Ma/yQCpsXrmpBJpt
	 hpHpo8RROxPqCq0lhKMg9gW8WuaS+GzB71aXac3Mztp8augNmTa4XEE5TOLKQGB0JG
	 x+6oehvVCtN1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 559DB853B7;
	Sat, 30 May 2026 18:39:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B80E12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 18:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D0A942F60
 for <buildroot@buildroot.org>; Sat, 30 May 2026 18:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WctbZpTYafeh for <buildroot@buildroot.org>;
 Sat, 30 May 2026 18:39:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DC6D42F5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DC6D42F5C
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DC6D42F5C
 for <buildroot@uclibc.org>; Sat, 30 May 2026 18:39:08 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wTOaQ-0001Ue-BY
 for buildroot@uclibc.org; Sat, 30 May 2026 20:39:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 30 May 2026 20:38:02 +0200
Message-ID: <pan$3ff23$85d4d336$2d667857$26c30f95@ID-313208.user.individual.net>
References: <20260421185136.2577202-1-bernd@kuhls.net>
 <ahsK2eJNNKDZBkrZ__17811.6684591927$1780157262$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH v4 1/1] package/gettext-gnu: bump version to
 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Sat, 30 May 2026 18:07:15 +0200 schrieb Thomas Petazzoni via buildroot:

> Aside from those 3 packages, how much did you checked whether other
> packages might now need this explicit path to /usr/share/gettext/m4 ?

The patch was used in the last weeks in my work repo where I created the 
gcc 16.x bump, its allyesconfig-based defconfig has more than 3000 options 
enabled:

$ grep "=y" .config  | grep -v BR2_PACKAGE_HOST_ | wc -l
3495

I cannot guarantee that no build errors will occur but they are unlikely 
or so weird like the linknx error:

>> +LINKNX_AUTORECONF = YES
>> +LINKNX_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/gettext/m4
> 
> This change is weird. What are you adding AUTORECONF = YES? If this
> package does not need to autoreconf, I suppose it doesn't need the
> custom autoreconf opts?

A build occurs with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_SYSTEM_ENABLE_NLS=y
BR2_PACKAGE_LINKNX=y

The patch description of v5 of this patch carries more details:
https://patchwork.ozlabs.org/project/buildroot/patch/
20260530182706.1679355-1-bernd@kuhls.net/

The build error does not occur without the gettext bump.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
