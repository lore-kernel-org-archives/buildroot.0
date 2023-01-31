Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C998CC636CC
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 21:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE1D60BC5;
	Tue, 31 Jan 2023 21:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE1D60BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gteIwa0YDNfs; Tue, 31 Jan 2023 21:36:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C48E60B69;
	Tue, 31 Jan 2023 21:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C48E60B69
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00B091BF3FB
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 21:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C860F4159C
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 21:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C860F4159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x1lHSxeVn0QF for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 21:36:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B04FD414C5
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B04FD414C5
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:36:15 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:6e20:2978:7b29:e91f:c04c] (unknown
 [IPv6:2a01:e0a:947:6e20:2978:7b29:e91f:c04c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 63F85C0348;
 Tue, 31 Jan 2023 22:35:21 +0100 (CET)
Message-ID: <f9ed7f28-711a-2fd6-d04c-06d007a34fb7@grenoble.cnrs.fr>
Date: Tue, 31 Jan 2023 22:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Ramon Crichlow <rcrichlow9000@gmail.com>, buildroot@buildroot.org
References: <CACHw65JEOTp4HhvXMUURSoD-ce5Topa1Z0VNvHWjw8HaBaE-aA@mail.gmail.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CACHw65JEOTp4HhvXMUURSoD-ce5Topa1Z0VNvHWjw8HaBaE-aA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1675200921;
 bh=jy6H0luD76EZfZxN9zCpEMvuQGR6QEPo29e1Hntx3GI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=nJIHkUxb/ABUqGjeoR2SuYI/JkzHRbi48t72kg6vAalhwpT3elSxM4DxgA8eIGrz4
 FtCbWK7KUYytE7whv1Kfnd4DdeeLBNZSe8AkxT6Cgi2EtKu2CX+orLnYIuNoKpwSnc
 WMlvEyhR1HCPp+mUhNPmGC983zRjKYa4Cq8gtdr7bepLCNtrCALY+IgSeyRKuTp0Qe
 rB+W05FD0nrGuiQT3AKIfF/tsKhrf+BjxGbUilswZop8HaOjXCsVVGoIKwEJ6aMQQr
 ZPx66a4KKcgoTlBuu5IpfNRq9jgmQx67iQvph/2NMN9zDDza40w/+Ff+VfQ2jpbVcG
 1n10D3FdSxaOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=nJIHkUxb
Subject: Re: [Buildroot] Development flow to track .config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

Ramon Crichlow wrote:
> Is the following flow best practice?  If not please suggest a better one.
>
> 1.  Make a change to .config using make menuconfig
> 2.  Diff the change between .config and .config.old
> 3.  Edit abc_defconfig to mirror the changes in step 2
> 4.  Commit abc_defconfig

Not sure it's the best, but here is what I do:

1. git switch -c 'my-custom-branch'
2. make some_board_defconfig
3. make nconfig # or your preferred variant of menuconfig, save and exit
4. make savedefconfig # this will save the relevant changes to some_board_defconfig
5. git commit -a -m 'My custom changes to some_board_defconfig'

Best regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
