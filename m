Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12370C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 20:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7146841AF;
	Wed,  1 Jul 2026 20:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHzzuOXHdIWV; Wed,  1 Jul 2026 20:04:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD97841D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782936267;
	bh=pDbjvKLRtOQPvco6+c8+s1FQaOjJCOBg4P2fEuNvm7Y=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aOVDEPJBTxihODjlxNx+i6vYZkWPkGuuZ/DhCExtpR0tneWnh0xWXRL+BldGE2LDV
	 oiI94+MGuMaqmbKIkisNojyP151aFC8qmlxlgAPxEGOXh0Pe1kaQYBDq6cl3Jt2tWM
	 5K30kT0umjB9okf5O/lO9BKaILNqlBhLwkN4+90RznX00Zi4CuWrKi5OorxAHoFFji
	 r5FtrQqzycuUu09h3kDrLZuagpzbdz5i6e7LNBxPfxjUoEaiLliEEtPghnTiRFT96f
	 6hvcVdlOQ/MDIXfkzBD113DEDWfMNZ/IsZ1lEkLbjVkExXMTXEy7x1lBfuDr0/zGOF
	 e4cJhjj04Cy5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BD97841D4;
	Wed,  1 Jul 2026 20:04:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53132316
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4433541483
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqxCPMMYTbt4 for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 20:04:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84630406D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84630406D1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84630406D1
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:04:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2118223764; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 20:04:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wf1AS-000000032Wp-0kfn;
 Wed, 01 Jul 2026 22:04:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260625105642.24181-3-fl@n621.de> (Florian Larysch's message of
 "Thu, 25 Jun 2026 12:56:26 +0200")
References: <20260625105642.24181-3-fl@n621.de>
Date: Wed, 01 Jul 2026 22:04:20 +0200
Message-ID: <87fr22qxx7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LVmR+z7BNpS0mc4orizCaOmMO1nVqByIkl/odjsm4VJbzxxdvfEMn2GvPjOlW68CRXYo+wwWS36a6sscLHiIv+a15l7yLIMMkOSoBcegCPWKGp87xOVIfxHilMPW4EvfSY8L58jnYg4KXj2kkXKhZ9sF24ShC06crKbjpocHA8Le/b5+j1qiCsrZhdtU3/byE/7iAvniAgWkqLgswUkGjqTmVkfSw7u9sVAQoMpvX6/a6m432cOzeLSvry6IqxeU76Bo6MQ97o1kVKz01x5ByG58zfeUbuKTMf0iqK52rCtPd37ixNt/mc/TMVPq+jo9Er+F6D7JZrfDXtJLNy0BkA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=7/YCfvMiRrvhSVvsFLfgGBuF9XdFcA4uDeCrInIW6Lw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=LVmR+z7B
Subject: Re: [Buildroot] [PATCH 1/1] package/sigsum-c: bump version to 1.1.0
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

>>>>> "Florian" == Florian Larysch <fl@n621.de> writes:

 > This release now includes our local patch so we can drop it.
 > Changelog: https://git.glasklar.is/sigsum/core/sigsum-c/-/blob/v1.1.0/NEWS?ref_type=tags#L1-28

 > Signed-off-by: Florian Larysch <fl@n621.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
