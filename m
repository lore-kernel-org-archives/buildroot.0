Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21998C5DF87
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 12:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E38B60896;
	Fri, 21 Aug 2026 12:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W62n_iWoYy2u; Fri, 21 Aug 2026 12:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787316048;
	bh=IUAiOc4jijn1OF9FW3kQ6Y6YGu2y7xt/NGo8ZkJrXQs=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=l1OjCzt2OPCsyV/n/WtF0jPQmj1ME4p4Tqll8/JU88flRBE/4TCPoWCUO9Cxx9+Xv
	 4bxv96KQsrqT8zBHIMbqdNu/3IzNA13UIYZr28+J3HYWGYzmcRqWufq6ZO96QVdLRX
	 Zty/MVHVccACWtnnOei94Iv58ajomFoTL7Sg64p16E5z/7+2DqVPGFwoncYPtfoTMo
	 tgo9BW1S/RoGdp7UVJ6fjJPuzd0GN//at9Ttk/CrK8MNSVbOWF8ZgxovJH50ngfNHz
	 gbd3qxf+MjjwbX35bRO+fyfbzugGnEGszmMgUj49wq7leUQLiXgh5pY6P4CevE+YND
	 k4Kotpf0YJzyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E89DB606A6;
	Fri, 21 Aug 2026 12:40:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E9C7263
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 12:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C482606A6
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 12:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ropd2Y46BTHa for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 12:40:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2714060661
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 12:40:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1D54B4E41319;
 Fri, 21 Aug 2026 12:40:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CAA28604AA;
 Fri, 21 Aug 2026 12:40:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C96F611C770B6; 
 Fri, 21 Aug 2026 14:40:38 +0200 (CEST)
Date: Fri, 21 Aug 2026 14:40:38 +0200
To: Alessandro Rubini <rubini@gnudd.com>, buildroot@buildroot.org
Message-ID: <aohHBg5JtecHVORq@windsurf>
References: <amaDQ/RxzLn24+me@arcana.i.gnudd.com> <aoglkraRzHufPBHQ@windsurf>
 <aognldAvgHC81hyu@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aognldAvgHC81hyu@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/opencv: depend on webp mux/demux
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

On Fri, Aug 21, 2026 at 12:28:11PM +0200, Thomas Petazzoni via buildroot wrote:

> Remains to figure out since when this problem occurs. The 4.12.0 ->
> 4.13.0 bump of opencv4 in commit
> 33178c538541be224e49b5f548bd5404de3912fa ? But this one has been
> around for quite a while.

So, I've tested on 2025.02.16, the latest commit of our oldest
maintained LTS branch, and the issue is there. I don't think it is
worth the effort tracing it down further than that, stating in the
commit log that the issue exists in 2025.02.x should be good enough.

Alessandro, will you submit an updated patch, or should I do so?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
