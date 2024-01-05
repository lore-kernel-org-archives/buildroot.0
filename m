Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126CEC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 05:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57CD460FE9;
	Fri,  5 Jan 2024 05:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57CD460FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xdp0bCtyjMgP; Fri,  5 Jan 2024 05:52:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B145560EF1;
	Fri,  5 Jan 2024 05:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B145560EF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2D1E1BF3F2
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 05:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B852241FA2
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 05:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B852241FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a95RSBSfNHE0 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 05:52:16 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C9C841F49
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 05:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C9C841F49
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 29C6E3520918; Fri,  5 Jan 2024 06:52:10 +0100 (CET)
Date: Fri, 5 Jan 2024 06:52:10 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <ZZeZClA0xpt7gTO5@waldemar-brodkorb.de>
References: <20240104190529.1521901-1-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240104190529.1521901-1-abrodkin@synopsys.com>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1704433931; bh=20et0bJ4cOrHPQgqdFZl63qOuuyJo+vt+O81x/+4nO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QJvcBizjv1gc3UF55cQ4N2gwZMlKdTIOzgMeFeySiPTNzmosD38dNNAx1w32T0QeL
 CnX/+NdQwCU1sxEYFFU+0LQ3xQpKDP2TVPspcNcvhSf1uNJfNF13FPbRIfulsz155d
 IzyGXGGA7Y+uave0Fv2jcU5DtIyZpBVgHoqRHuxUyqOSaDUOM38igGCXI6ZCNCOvnT
 ykz4N3E7kw4xXgPPYnkHj4syUwAtTl7qyEwHx0mj7iKfYK669rLSLy7001cWCgYizG
 FBcxIeLaZdLb95cgv/OrmeRZyf9aeZ0y0ePA1l3gHzcazOmKyCI1lmy+tETIQ4HoY6
 ZEtqtVg+THOLA==
Subject: Re: [Buildroot] [PATCH 0/3] Add support for ARCv3 ISA  processors
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
Cc: geomatsi@gmail.com, artem.panfilov@nokia.com, Shahab.Vahedi@synopsys.com,
 VVIsaev@gmail.com, vgupta@kernel.org, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexey, All,
Alexey Brodkin via buildroot wrote,

> It's been quite some time since introduction to the market
> of new Synopsys ARCv3 ISA processors, which are meant to
> build on top of success of their predecessors in ARCv2 family.
> 
> ARCv3 ISA is meant to improve efficiency of high-performance
> embedded microprocessors and thus by definition is not binary
> compatible with previous generation of ARC cores such as ARCompact
> (ARC600 and ARC700 processors) and ARCv2 (ARC EM and ARC HS processors).
> 
> Moreover, finally in ARCv3 line there's a 64-bit processor family called
> ARC HS6x meant to cover cases when 32-bit address space is not enough.
> 
> Since ARCv3 ISA in not binary compatible with older ARC cores, we have
> to switch to newer tools, which in fact are already available as a part
> of ARC GNU toolchain v2023.09, see [1] & integration of them into
> Buildroot [2].
> 
> Even though that update is long overdue (for too long we kept all that in
> our GitHub repo [3]) it's better late than never.
> 
> I'd like to say thank you for all the folks who used to work on Linux
> bring-up on ARCv3 processors, most of whom did contribute to these
> changes I'm sending out today, some even no longer work with us, but
> still it's another amazing example of close and efficient collaboration
> of a group of truly highly motivated professionals. And it is my
> pleasure to work with such talented and bright people!

You can add a 
Tested-By: Waldemar Brodkorb <wbx@openadk.org>

Thanks for working on this. I think I can mark my patches as
superseded. At least my work on this kicked you out of the silence
;=)

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
