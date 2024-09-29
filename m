Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B909CF6495
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 08:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3AFD4052A;
	Sun, 29 Sep 2024 08:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEI3L3Pg8bwl; Sun, 29 Sep 2024 08:11:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1184052C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A1184052C;
	Sun, 29 Sep 2024 08:11:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B22191BF393
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 08:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F2334052C
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 08:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgXLLx9-ytCS for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 08:11:32 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4FB74052A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4FB74052A
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4FB74052A
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 08:11:31 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 65B56BDE7035;
 Sun, 29 Sep 2024 10:01:38 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 29 Sep 2024 08:01:38 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Andrew McCann <andrew.2.622266@gmail.com>
In-Reply-To: <mailman.16709.1727481986.183350.buildroot@buildroot.org>
References: <mailman.16709.1727481986.183350.buildroot@buildroot.org>
Message-ID: <deda89f9ad1d28f5dafbe6aae4784caf@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.5 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1727596898; bh=rg0BpJY5rMOGEq6vHdltyUxjvy4oE55XN//bvWNR/SA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EHx4WY8+stPFp/cMhlO92k8+2k3FpWd7KB7LJEcRQdS99cqPJ5HnmXu3w8VcbGUgy
 JK5EQATg8tqVkXFYWr6rxziktmEF0+/ZzRm4k4d/7R59crnrQKUWLUgqV2QOJZwKPB
 8OowQBnkt5CsX8OLCKtaIK5BQH1QxCD4gvT31RJY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=EHx4WY8+
Subject: Re: [Buildroot] Add Kernel Configuration Fragment
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy,

On 2024-09-27 20:06, Andrew McCann wrote:
> 
> I want to add the following line to my linux .config file found in
> output/build/linux-custom/.config:
> CONFIG_KERNEL_ALL_ADI_DRIVERS=y
> 
> I put this line in the file located at board/andrew/rpi/linux_frag.conf 
> and
> referenced it in the buildroot menuconfig as shown below.  However, 
> after
> running make, the .config file is not updated with this line.
> 
> Is there a different menuconfig option I should be using to accomplish 
> this?

The location is the correct one.

(1) There is a 'make' rule behind this, so if the .config is newer than 
the fragment file, the merge never happens.
(2) Check if you can see the symbol in the kernel config menu (run make 
linux-nconfig, search with F8). You can only use symbols that kconfig 
knows about.

Kind regards,
Andreas

> Regards
> Andy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
