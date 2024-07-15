Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE128C3DA45
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 08:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A0A605B7;
	Mon, 15 Jul 2024 08:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUgmqQsHdT2o; Mon, 15 Jul 2024 08:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8493D60796
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8493D60796;
	Mon, 15 Jul 2024 08:36:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D5871BF3C9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A11960792
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwAfAGvYpUhe for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 08:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C409607BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C409607BA
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C409607BA
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 08:28:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id EF8C61814B9; Mon, 15 Jul 2024 10:28:22 +0200 (CEST)
In-Reply-To: <20240710143052.25d40075@windsurf>
References: <20240624200056.440154-1-aperez@igalia.com>
 <20240710143052.25d40075@windsurf>
Date: Mon, 15 Jul 2024 10:28:22 +0200
To: "Peter Korsgaar" <peter@korsgaard.com>
MIME-Version: 1.0
Message-ID: <41-6694dd80-3-54400000@123323059>
User-Agent: SOGoMail 5.10.0
X-Last-TLS-Session-Version: None
X-Rspamd-Fuzzy: e7e437552ab7b7f1f820f2c8b472a0a899555952faf2d057e401dc88ee3a981ce86653a259cbc95fed9cbfb8dab1b759ee2076ff03e52941b3006dfadc60b452
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1721032103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WzoA2LAMPBi1WxCX5nvWek165jALLTA35bWPz6E2xOw=;
 b=pvdEU1rmxa7sQmjrPgIMpWeH+O4etwNSprSgg8DurBccv4Ivkucz0CkYQQ/46THL8mTt+I
 FI7Yyc7bRa7ohB5x5y7Toot2VPoZ0zEhHqgjn0WUh89ZOCumybsCfdzShq1txRqcgOZvM0
 DCggSvvNivHXw57JJCsLX9S/R9hf6Ps=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=pvdEU1rm
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_package/wpewebkit=3A__add_?=
 =?utf-8?q?backported_patch_to_fix_NEON_build?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

this patch should also go into the 2024.05.x branch as the issue is also present there.

Regards,
Michael

On Wednesday, July 10, 2024 14:30 CEST, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> On Mon, 24 Jun 2024 23:00:53 +0300
> Adrian Perez de Castro <aperez@igalia.com> wrote:
> 
> > Import a patch that has been backported by upstream to the 2.44 release
> > branch that fixes the build when the target is an ARM processor that
> > supports NEON instructions.
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  ...-specific-declarations-in-FELighting.patch | 68 +++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >  create mode 100644 package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch
> 
> Applied to master, thanks.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
