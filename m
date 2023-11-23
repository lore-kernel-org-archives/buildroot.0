Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A00C61D85
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 20:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA9C382143;
	Thu, 23 Nov 2023 20:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA9C382143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p5Jx09TCJGzq; Thu, 23 Nov 2023 20:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00C482131;
	Thu, 23 Nov 2023 20:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00C482131
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 025DB1BF3C1
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 20:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC34F82140
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 20:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC34F82140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVxdMIhMeGdT for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 20:24:32 +0000 (UTC)
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8035B8212C
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 20:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8035B8212C
Received: from [IPV6:2a01:e0a:12:eba0:f0a9:ee80:2eae:d9a8] (unknown
 [IPv6:2a01:e0a:12:eba0:f0a9:ee80:2eae:d9a8])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 49F68BFCAE;
 Thu, 23 Nov 2023 21:24:27 +0100 (CET)
Message-ID: <3cc0c118-da2b-4f80-b6d4-3662beb6731d@grenoble.cnrs.fr>
Date: Thu, 23 Nov 2023 21:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dave Rathnow <drathnow@gmail.com>, buildroot@buildroot.org
References: <CAPH1yshB_JnFEZQNTTmA5hbYOiX0YfsDvnUbdmy7H6TbT_T3Ag@mail.gmail.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CAPH1yshB_JnFEZQNTTmA5hbYOiX0YfsDvnUbdmy7H6TbT_T3Ag@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1700771067;
 bh=GcR559lyT+VTnVrQKTIr36Di/JxqaXJQ3Sjx3j74uOc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=kSmOItzDmtJrglrjUWgaSoNdEX2ChDfgdaoCzBd4VhhFUmCMox0CKYnJTSZTsNplB
 u7np+mg3zqWU+M0RQ09muT3Cst+QD0w55QZZ7OLhn/zi26yTKrWPRvc8GtyfU6fTLa
 XRJ7G1uPOW3YvTLmH5fJ+/6DavyV0pt+iIHUBMyTWmJFl/8YOY2E9ThWrs3En1rULC
 deDz/4vpK479nAOjrLPH0H+mC9ZRptEPkD8NHNbuLZ673uiRSz7OBVejCjxVmFv40b
 z4Q2vmQ5bD6KlHR+YG5Z9Ut/1hfqoW9YEUj8dWLyHv2iUvWHE8PGc63y0pmuIr17hi
 VgfbwXoDnPk2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=kSmOItzD
Subject: Re: [Buildroot] Broken build
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

Dave Rathnow wrote:
> [...] The Git repository with name or identifier linux does not exist
> or you do not have permissions for the operation you are attempting.

Grep your defconfig for 'BR2_LINUX_KERNEL'. You should see a
configuration variable (maybe 'BR2_LINUX_KERNEL_CUSTOM_REPO_URL' or
something similar) holding the URL of a Linux git repository. This repo
has likely vanished. You should try to find out where it has gone, or
what alternative repo you could use, and fix the URL.

Note that there is no commit named
f593d9e1e347488358872bc8618180db7aca685c on Linux mainline, so your
defconfig seems to require a somewhat customized kernel.

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
