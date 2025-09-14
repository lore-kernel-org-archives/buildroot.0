Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E85CAC582
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 09:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D669F411CF;
	Sun, 14 Sep 2025 09:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fv4unprwkKTH; Sun, 14 Sep 2025 09:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E11D54113A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E11D54113A;
	Sun, 14 Sep 2025 09:04:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF5CC255
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 09:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB7CB819ED
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 09:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSZLq_GprAdk for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 09:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB588816EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB588816EF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB588816EF
 for <buildroot@busybox.net>; Sun, 14 Sep 2025 09:03:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 34BF119F733;
 Sun, 14 Sep 2025 11:03:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Sep 2025 11:03:55 +0200
MIME-Version: 1.0
Date: Sun, 14 Sep 2025 11:03:55 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250914063635.696367-1-francois.perrad@gadz.org>
References: <20250914063635.696367-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <07ec19d9e62d8b719607c7d2229d854e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757840636;
 bh=WUyqSQTvFcGgfRCB5itXQS7wlAAXqBqRQA8DdasbgaI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pt0Mq7oaukBofBpwpBfyk0rdFHyVq4FcpoDvR5Wrmjdqnr+b818Q+GqnL0O3uTxUi
 XcQ5L1wAjia/AO1zsiEu+W5vrqSnMHA44aaG5NtMTFLCY0esGJKiV+2BZcrG/YbndL
 kfPMPqOVdUl73L4xgpwVMYEqfT5P7nXClJLw+stDRh5MkteEYvItNGU8hQm4uIxceP
 XQOjzk2VNz915jbq9AhK7r7CAmdZUmfYcWVbftatjTPfz5fboPeqW2VL1esx04PJH2
 x8lU3qblcKQsyGyhR12nPT89iFZsC/any6su7eVq34EVy40R881BpXaobGzSftr3+a
 TbZvT6JuuuX5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pt0Mq7oa
Subject: Re: [Buildroot] [PATCH] package/lua-utf8: remove upstream patch
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/09/2025 08:36, Francois Perrad via buildroot wrote:
> this patch was useful against 0.1.5,
> but now it is merged upstream in 0.1.6
> 
> fix build, see 
> https://autobuild.buildroot.org/results/3bffe55275a9434682af1bf3390d0830a4859c5c/build-end.log
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
