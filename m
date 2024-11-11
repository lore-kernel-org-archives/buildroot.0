Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65B1D2E9D3
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 10:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D74C40076;
	Mon, 11 Nov 2024 10:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKOrwkCxNYEn; Mon, 11 Nov 2024 10:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53846400B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53846400B3;
	Mon, 11 Nov 2024 10:35:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B875D8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0879A400B3
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-6-3V_zHn9w for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 10:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F49340076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F49340076
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F49340076
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:35:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18FD71BF204;
 Mon, 11 Nov 2024 10:35:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tARli-008lEJ-1r;
 Mon, 11 Nov 2024 11:35:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Cody Green <cody@londelec.com>
Cc: buildroot@buildroot.org
References: <CAFQdmxKcoojruP+5Cebkm_oqCzBx657NddiTJ+nJi_u0AChJzA@mail.gmail.com>
 <CAFQdmxJ-p8TV4wK=TJxUb0D8hGscODzXApgZviemrQiUEf+y1w@mail.gmail.com>
 <CAFQdmxL-C6cxpEaOJmfWzxB80W2deVsiu5mJ9J-rgHZO9zVnTQ@mail.gmail.com>
Date: Mon, 11 Nov 2024 11:35:38 +0100
In-Reply-To: <CAFQdmxL-C6cxpEaOJmfWzxB80W2deVsiu5mJ9J-rgHZO9zVnTQ@mail.gmail.com>
 (Cody Green's message of "Sat, 5 Oct 2024 15:15:39 +0100")
Message-ID: <874j4ecb2d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/sysvinit: add version number to
 SYSVINIT_MAKE_OPTS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Cody" == Cody Green <cody@londelec.com> writes:

 > Version environment variable VERSION=$(VERSION) is set in the top level
 > Makefile of the sysvinit:
 > $(MAKE) VERSION=$(VERSION) -C src $@

 > Build command SYSVINIT_BUILD_CMDS doesn't use the top level Makefile, but
 > src/Makefile instead without setting the VERSION variable, which leads to
 > undefined VERSION macro in src/init.c.

 > Add VERSION=$(SYSVINIT_VERSION) to SYSVINIT_MAKE_OPTS to make the VERSION
 > environment variable available in the src/Makefile.

 > Signed-off-by: Cody Green <cody@londelec.com>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
