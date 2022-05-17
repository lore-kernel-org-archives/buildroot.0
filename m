Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1D0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7485741A32;
	Tue, 17 May 2022 19:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jfcior_42tV9; Tue, 17 May 2022 19:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5165541A1D;
	Tue, 17 May 2022 19:55:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89B031BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 863F140132
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MC2IU0_xMGhW for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:55:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7174400D6
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:55:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7898AE0007;
 Tue, 17 May 2022 19:55:17 +0000 (UTC)
Message-ID: <81055554-665d-722b-18d8-ef9d86f9f27e@korsgaard.com>
Date: Tue, 17 May 2022 21:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220215015307.855341-1-james.hilliard1@gmail.com>
 <20220215015307.855341-5-james.hilliard1@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20220215015307.855341-5-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v8 5/5] package/qt5/qt5webengine: bump to
 version 5.15.8
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/02/2022 02.53, James Hilliard wrote:
> We need to use the separate package for the chromium submodule
> which has python3 support patches.
> 
> We also need to apply a patch to qt5webengine to allow building with
> python3.
> 
> Drop a patch which is now upstream.
> 
> We need to set QT5WEBENGINE_SYNC_QT_HEADERS = YES as we are building
> from a repository archive instead of a release archive.
> 
> We need to add some new required dependencies to qt5webengine so that
> it will build.
> 
> Switch libraries to system libraries instead of bundled when possible.
> 
> Migrate unsupported WEBENGINE_CONFIG to new config flag option.
> 
> Override feature detection using config override flags to ensure we
> get the expected features enabled/disabled as autodetection logic
> may otherwise disable features without throwing build errors.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v7 -> v8 >    - add missing BR2_PACKAGE_QT5BASE_HARFBUZZ select


Committed, thanks.

--
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
