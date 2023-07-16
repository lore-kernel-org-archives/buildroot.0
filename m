Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7CBEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 20:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92F9760C2D;
	Sun, 16 Jul 2023 20:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92F9760C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2nnZOgfNPLrN; Sun, 16 Jul 2023 20:07:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD03860BEB;
	Sun, 16 Jul 2023 20:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD03860BEB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 590401BF365
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 20:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30DDB40873
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 20:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30DDB40873
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aPk4r_qJo4SR for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 20:07:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB8EB40872
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB8EB40872
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 20:07:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC3EEC0005;
 Sun, 16 Jul 2023 20:07:21 +0000 (UTC)
Message-ID: <13bd378f-4ed7-1361-964a-6c3d7298fbd8@korsgaard.com>
Date: Sun, 16 Jul 2023 22:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230702103121.289122-1-bernd@kuhls.net>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20230702103121.289122-1-bernd@kuhls.net>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v4 1/1] package/python-pyicu: fix build
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/07/2023 12.31, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/977/977c043615603dd3541e23b81c5f11374606aff6/
> 
> Set environment variables to cross-compile friendly values, this prevents
> icu-config picking up host libraries:
> https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L89
> https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L179
> https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L216
> 
> This follows the upstream build docs:
> https://gitlab.pyicu.org/main/pyicu#building-pyicu
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v4: removed variable ICU_BASE (Thomas)

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
