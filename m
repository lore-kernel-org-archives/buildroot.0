Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7338EC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 09:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35B0A60835;
	Thu, 17 Sep 2026 09:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXRP67M_xp1a; Thu, 17 Sep 2026 09:23:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 59E9A60838
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789636987;
	b=L0KcdWOg7gYRokKfnGWz2ALKEaZEVER1weYX6F2b3lEo6mlbY9LsHf+AA7k9OM9h4tYZ
	 IdFqeXKgJvugpTYwCJJScdyUkrxuMf06pgwtV6f5wsoFqhRFne7KhoaDOmO2c6x1zdE1z
	 Hh0cfObCDDEVhnjw3XfF2WU9SG6EWPDckGuiqeHomeRaZXXhtUZFr3x3AOkblfF4/+WJ7
	 NldhJl9J1zlXJuv+PSCfzSOjbNk7oyJygUyMKhj6Cyub30JxP1XLWrUfHoaCRjl09EWTo
	 9YKmZNS6SgHPfiyMnADjnM2xAodTFu6bD/u2cWO431OVGv7H9JElYFAuUljCYjeLy7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789636987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2rgsT1yxhIhN+jdoT5yG+XSnRYlddmXlHYCfgwyzmBg=;
	b=Vv/Cu9ttVehe7L9YLftg2e7USFiu61xi/CPL6UUu5jOJT/5N/NOOu2G6gk8m8rrEzFAv
	 MV0SztvgFElVtaUNZ7+WcWryevikOT/jaiX/um1exnkIHjZwyHdcGjLtpdZI5ZNLN6V3k
	 JzkFGgJ5OLjywDRg7R+1MEsiZ5X3lz5cFsq2o29MB/Ylca0LcFw0TJwAUaBexMNFoQ5bM
	 C5CLlGkIeuKmilhl8YY2jNbvRVZCH9Fjo1gkALNFnwdWAOBKHMVH+CCdxwIDKuAH1OdeE
	 Kh9zFHnS0bKLXxNrsQlgnE53vk/az269sJQ6J5XyS56oyYdKPTGO8uVZzzMdRlEEtjQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789636987;
	bh=2rgsT1yxhIhN+jdoT5yG+XSnRYlddmXlHYCfgwyzmBg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BlpK5B+ebLsVxo8s0JADodpzah2gD1p1DlN3JOv8jm15S43JjN7vi0tgF20dS8SgN
	 0wnQHQV3E7DJE0HPziDoTBq/OcBNHh06iahW5o2jJcXtshnYL8nhnzjyZkSUSSQMVp
	 NBZiPB//78OsopqfDupeUvf6ja+aocCaAarOb2tNFrK+yvt1rH6+ZbwSTou5F/ciyo
	 ZseiGoQNzxWawyuCdKlvySjtwobzl+3/HYgNGyubW6hB56y4GYanXye81hFD2nm+/W
	 Q4EPrEC+u7ioLVFrYDDkUUIUlOzbsvGmelNNkld6utgqTdjZd5k9dF/G9z8XowVPai
	 IOTRpxjtbfaMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59E9A60838;
	Thu, 17 Sep 2026 09:23:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD38B422
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F2A3401F2
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4bP5rzc4jtR for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 09:23:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 302EE400F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789636984;
 b=IFz9quIUNn4IS6L1rRbhPy9OaimDzIMun49DayJPYzX/FW1NWrPESJfI93JfoGLgYvba
 heiEVMS+YV9BFUNpaBw1CBgEjqnn+7nxPKfrZmSm4YnnSJKfMxXInZt7fhZUaBRUpyHrS
 JhQeXT+Lg2LpEi+w1rsuJGWpPjIlmGvcakdTRwh2rA618+pfT1JONSFr4dIrE3S3Jlaj1
 r8nLq2ViHTTM3g9sbVTDjHAr8RE8eR3UVM2WWrJQr/H+CxqOmo4DAFwg31xHUaX4yyPme
 5c0DAvCaI8coTzAdQYLcVM1wCVxnldZtImQLxM037BfFBktp73aYzlTQCfSaPQepTqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789636984;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=7IAO4YJOI3j+9o0sjIIa3omXAoSwH/uPy+tA9+seDE4=;
 b=P7CV2ZpMo/yXIPw+tfy2UN8+PATOrbkfpeXOx76Pseku66hV6G2oljhqUSld4kCD3oQb
 pwSlHifGD1S7ndH1TKtMM/T9juNhd1LMBfiDgyMrTu2cqAtd2almGOCeKWeVHesRKJrQd
 8Y8MREwJvGv1DllgKS5ExqFG0IksELuYNPDB/wXQS6NZmYmFqdderYE50YnP6StRy50w8
 PCW9zMtSDfQEM8Gj3DgwCFopvOSXJos9/OWcqhNInFnMoI+rEvtXLkrl84kMzowC1EwvM
 Pzj/X1Bmz/jMMP8c4b5Eb+eYOnbz3XT2ajdXW98Ht8MR33VcQhKM3+nzkDrKjWlHEHw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LLqY+BCK; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 302EE400F3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:23:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 70A6A4E40796;
 Thu, 17 Sep 2026 09:23:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3ECF75FAA3;
 Thu, 17 Sep 2026 09:23:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 54D2111C7B071; 
 Thu, 17 Sep 2026 11:23:00 +0200 (CEST)
Date: Thu, 17 Sep 2026 11:22:59 +0200
To: agennart <antoine.gennart@quimesis.be>
Cc: buildroot@buildroot.org
Message-ID: <aquxRk4m83QOof4l@windsurf>
References: <20260917070632.1930848-1-antoine.gennart@quimesis.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917070632.1930848-1-antoine.gennart@quimesis.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/nxp-mwifiex: bump version to
 lf-6.18.20_2.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, Sep 17, 2026 at 09:06:30AM +0200, agennart wrote:
> The previous version fails to build with Linux 6.13 and newer because
> mlinux/moal_main.h includes the removed net/lib80211.h header.
> 
> The header was removed by Linux commit 02f220b52670 ("wifi:
> ipw2x00/lib80211: move remaining lib80211 into libipw").
> 
> The new NXP release skips this obsolete header for kernels newer
> than 6.12.12 and includes the corresponding Linux 6.13 cfg80211 API
> compatibility fixes.
> 
> Signed-off-by: agennart <antoine.gennart@quimesis.be>

Sorry to be annoying, but could you fix your From and Signed-off-by to
use your first name / last name?

When I apply your patch, I have:

WARNING: Author is a single name: "agennart"

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
