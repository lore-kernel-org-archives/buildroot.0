Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB18C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 14:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BCAD82733;
	Sun, 23 Jan 2022 14:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7xdUGytTcP9; Sun, 23 Jan 2022 14:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6848F81BC2;
	Sun, 23 Jan 2022 14:48:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7779A1BF42C
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 14:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 661D1402C2
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 14:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 19lrR7Py8w3Y for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 14:48:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19A134027D
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 14:48:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D0AAC0004;
 Sun, 23 Jan 2022 14:48:17 +0000 (UTC)
Message-ID: <f427a5f8-c19a-4f13-c8ce-b1c2ca75432d@korsgaard.com>
Date: Sun, 23 Jan 2022 15:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220122153714.26991-1-peter@korsgaard.com>
 <20220122153714.26991-3-peter@korsgaard.com>
 <bde7ae07-e97b-592a-1680-da61af531fe8@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <bde7ae07-e97b-592a-1680-da61af531fe8@gmail.com>
Subject: Re: [Buildroot] [PATCH 3/3] configs/qemu_aarch64_virt_defconfig:
 bump Linux kernel to 5.15.16
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/01/2022 11.56, Romain Naour wrote:

>> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.16"
> 
> Why just only taking care of this defconfig ?

Simply because I did some other changes to it (see the other patches in 
the series).

> Most qemu defconfig are using the same kernel version (5.15). Usually we try to
> keep all of them in sync.

Ok.

> Since Qemu defconfigs are runtime tested each week in GitLab-CI maybe we can
> safely switch to BR2_LINUX_KERNEL_LATEST_VERSION instead ?
> But we have to check qemu defconfigs using a local kernel patch, currently
> ppc-mpc8544ds and arm-versatile or keeping kernel custom version for them.
> 
> Also BR2_LINUX_KERNEL_LATEST_VERSION refer to the latest stable kernel version,
> not the latest lts version.

That would mean that they are not really reproducible, so I don't really 
like it.

--
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
