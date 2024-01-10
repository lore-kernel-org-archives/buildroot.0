Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF918C47074
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 10:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E95C613DB;
	Wed, 10 Jan 2024 10:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E95C613DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpPtecvrhBwc; Wed, 10 Jan 2024 10:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10E3F613D3;
	Wed, 10 Jan 2024 10:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10E3F613D3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4341BF23B
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3983C613D3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3983C613D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y19-vuRQNBCd for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:59:57 +0000 (UTC)
X-Greylist: delayed 552 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 10 Jan 2024 09:59:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA96460E71
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA96460E71
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:59:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id DBDB2352107E; Wed, 10 Jan 2024 10:50:41 +0100 (CET)
Date: Wed, 10 Jan 2024 10:50:41 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <ZZ5ocQQWDLYgVlHl@waldemar-brodkorb.de>
References: <20240104190529.1521901-1-abrodkin@synopsys.com>
 <20240104190529.1521901-3-abrodkin@synopsys.com>
 <ZZeaRKqDAiE5m4kW@waldemar-brodkorb.de>
 <DS7PR12MB90411CB511567B9B6446C795A1652@DS7PR12MB9041.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DS7PR12MB90411CB511567B9B6446C795A1652@DS7PR12MB9041.namprd12.prod.outlook.com>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1704880242; bh=zZSxDdzwdbeJuknfW9w9gcRiyhBmw7WCTRAsuB4e2Bw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mw6yMz3zvg1yy1yVfncSXRKQcY1Mnvqkt5E+BROUEe0SY0eeGzhV1oKwwTMlyD8sJ
 o95h0k8RaVtehqed0T2s4qCruVNLlbLrZ+X+fj2bfpd4JmunN47WYb30harlXiQ020
 BUt86tbe4xQLe48HggHb4Vt9GUviSLx9Xl4CFfQ3CAxzjS27STkz0UFptCOHyMZjX6
 MrOZ9jEJwVq7sQJQp+as50QDfPDwUKTLdgMNSZuB6bEUdCp/B0bcRAH5uAut7xwFAk
 i+qX7oBTQVQ155VrCrMXnnosYhqMMnm8Xghjuv4LYlOZd8ln7mv3E8/bs4RVvI2E6O
 C5LTUtLJpS2Jg==
Subject: Re: [Buildroot] [PATCH 2/3] ARC: Add defconfigs for ARC HS58 & HS68
 processors in simulators
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
Cc: "geomatsi@gmail.com" <geomatsi@gmail.com>,
 "vgupta@kernel.org" <vgupta@kernel.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "VVIsaev@gmail.com" <VVIsaev@gmail.com>,
 "artem.panfilov@nokia.com" <artem.panfilov@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexey,
Alexey Brodkin wrote,

> Hi Waldemar,
>  
> > It seems networking is broken in nsimdrv for both defconfigs.
> > I am using nsimdrv -v
> > nSIM, Version: 2022.06 (Build: 006_FREE)
> 
> First of all, 2022.06 is quite old and for good ARCv3 support you'd rather
> switch to a newer version. Here https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi
> we have 2023.06.
> 
> Please get that later version, give it a try and let me know - if problems still
> happen - we'll take a look at it.

I now checked with 2023.06 and the network does not come up here,
too.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
