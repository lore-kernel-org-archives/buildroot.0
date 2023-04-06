Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F28C7618D
	for <buildroot@archiver.kernel.org>; Thu,  6 Apr 2023 09:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C998C40584;
	Thu,  6 Apr 2023 09:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C998C40584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIbNB4l97gJU; Thu,  6 Apr 2023 09:06:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13D25404C8;
	Thu,  6 Apr 2023 09:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13D25404C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E60DA1BF855
 for <buildroot@lists.busybox.net>; Thu,  6 Apr 2023 09:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFBF560E29
 for <buildroot@lists.busybox.net>; Thu,  6 Apr 2023 09:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFBF560E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxpGYqdn8UJC for <buildroot@lists.busybox.net>;
 Thu,  6 Apr 2023 09:06:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05D8760C2B
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05D8760C2B
 for <buildroot@buildroot.org>; Thu,  6 Apr 2023 09:06:29 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id F05BCBDE8178;
 Thu,  6 Apr 2023 11:06:26 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 06 Apr 2023 09:06:26 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
In-Reply-To: <mailman.2529.1680707196.44770.buildroot@buildroot.org>
References: <mailman.2529.1680707196.44770.buildroot@buildroot.org>
Message-ID: <3ac6de8b95570f85901baf624f95e994@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1680771987; bh=XJxY4lMUG1bukoQM1u5HSgLbm1hzKlsP2GU4k7UufQE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=keGYTLRh4hARS50Ao/XOuK5QHlEf+P1qLrQpPeR/FbNqWqhAvZq55o8bLNJc26Yav
 kkPDF7u6W43jhrjryhT3tVcYhXrFQwhb2GWrwFsXSNlYxKSFQpiUWx228v3AtzFWuD
 pdbCMQvSYjbsF2a64abLmAcD6p9nLihc2tOjYZjo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=keGYTLRh
Subject: Re: [Buildroot] depmod / drivers
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Gerd,

On 2023-04-05 06:41, Gerd Kautzmann wrote:
> Hello ML,
> 
> for post installation of device drivers I need a tool called 'depmod' 
> on my Raspberry,.
> 
> What packages do I need to include in buildroot?

No new package, just a change in the busybox configuration. Enable 
CONFIG_DEPMOD in the config file (default is 
package/busybox/busybox.config). The editor is available via 'make 
busybox-menuconfig'.

Kind regards,
Andreas

> Thanks
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: 
> <http://lists.buildroot.org/pipermail/buildroot/attachments/20230405/8a81f29a/attachment-0001.html>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
