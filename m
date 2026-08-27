Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1140C61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99CDB40776;
	Thu, 27 Aug 2026 19:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjntjbmU-s73; Thu, 27 Aug 2026 19:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787858545;
	bh=Ct38xoTORrhLfckr/OMzKGpjd9Rb2qXzgQNDGNIGsBg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AQHct7rlG4NoR3Yu+wPvZjT44hjUuBxZaDepYJBUL1MA1c7YIJfk7xSDGCPVjOmA6
	 IKLR972n/2sOYXRlTaqPik0UnXaCJkNCRt23WAiaLS79k4PcgkOFw/WgzZBYK+C8dP
	 zjsIBSDgO3hQ5+/ZiYa6BeG4AckC6VjgdzYtehzIoJiqsJORKKXfcBHRzPHWVmK2TG
	 wDSQWf3YbHwsW88t89tOAn+IECB0wrdm9yGQbVAlTEX0T7blu8hCVzr0MiZuqll8hz
	 /1KfpX07Kyn6VMv6sAh2OLRzW1uOBjWG6E7x++IpcLjSVVThpmJIPHRizOnnwDzcPT
	 RGexEjIjMsw0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D57C440574;
	Thu, 27 Aug 2026 19:22:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BD27466
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E11940358
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B08j-b7pxBXt for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65E61402D2
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:22:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 955905FFB1;
 Thu, 27 Aug 2026 21:22:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Aug 2026 21:22:19 +0200
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 21:22:19 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260826152732.3556127-1-romain.naour@smile.fr>
References: <20260826152732.3556127-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <19baa97969b0b8dcc95399cbb2d7a938@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] support/testing: TestPythonPy3Gobject:
 test glib 2.88 regression
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

On 26/08/2026 17:27, Romain Naour via buildroot wrote:
> In Glib >= 2.88, GLib.unix_signal_add has been moved to a separate
> platform-specific library. This break backward compatibility from
> GLib-2.0. A workaround has been applied to pygobject >= 3.55.3
> https://gitlab.gnome.org/GNOME/pygobject/-/commit/74e4e0f40a66436a55c72d4a6e6058c1f91a7310
> 
> This issue currently break TestFirewalldSysVInit and
> TestFirewalldSystemd runtime tests since the bump to glib 2.88.3 [1]:
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152329 
> (TestFirewalldSysVInit)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152332 
> (TestFirewalldSystemd)
> 
> Break the test TestPythonPy3Gobject now in order to reproduce the same
> issue than for Firewalld test.
> 
> [1] e313a2d2590af689eb1f79e55b5a488154400da1
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
