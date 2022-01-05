Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BB9C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 13:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4926983005;
	Wed,  5 Jan 2022 13:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJOM2S4DL_pD; Wed,  5 Jan 2022 13:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3E5D82C75;
	Wed,  5 Jan 2022 13:49:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A04B1BF2C2
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 13:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44FDF404C6
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 13:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FIaKwe0Flgf6 for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 13:49:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92A40403AC
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 13:49:33 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B3AD4240013
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1641390570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmsNoZYIGUAexPTdLUSIH7muIjP9M/FwHzOcaLNVZW0=;
 b=Ovp6Ncm0wZytZD/4ql5RkjQcKETf/OUiEyHheTP5xctTmNyQe5jjF+Qo2HGbLlu9RUGzOe
 dNeoTJla6CzC7O31ZKhSmKx21UAIfOyZ9v4iwjQMoye0S+JO7VdlkA3cqDgk2OyG/DJxHE
 j6min6aiNtNhmpBW3J4QHu8Q2bvRZYstPH7JKKFVHdebwucvgnoCoPUONHuQF/uHg0GAgW
 9MkymHV799dSvt7JQrhxOZMd5HYqy4/vm9XEC89ge6VcTRrA6heX7L1s/g48rbzpg7PHsL
 ZHi+Pd+WBrWY/Sujs9Y9xmiusWG1NhWa3gSGZ3QpAfy2QC6pBRmloD0gH56PvQ==
To: buildroot@buildroot.org
References: <2209e11a-bda9-5193-9b4d-20a5f0fa34e3@linatsea.fr>
 <20220105142924.4b11ed83@windsurf>
 <5d0600a1-eb8c-8d69-cf9a-fee4fbca0c73@smile.fr>
From: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <5be78f0b-fdb2-66a0-71a1-11538c064148@linatsea.fr>
Date: Wed, 5 Jan 2022 14:49:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5d0600a1-eb8c-8d69-cf9a-fee4fbca0c73@smile.fr>
Content-Language: en-US
Subject: Re: [Buildroot] candidate packages : ros2 and wxwidgets
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> We also have some companies interested by ROS2 but they are using meta-ros Yocto
> layer.
>

That would be therefore of less interest to them, unless they are 
thinking of
switching to buildroot.
In my case, I rather see companies that just start to enter in "the 
embedded world" but already use ROS(1/2) on desktops,
so it is still not to late for them to make the good choice.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
