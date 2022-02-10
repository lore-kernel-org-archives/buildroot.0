Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4E7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 17:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D529B4089B;
	Thu, 10 Feb 2022 17:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFsn3mRR7h_n; Thu, 10 Feb 2022 17:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DA9940871;
	Thu, 10 Feb 2022 17:38:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04D661BF228
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 17:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0169840228
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 17:38:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dvOY71NYj0i for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 17:38:01 +0000 (UTC)
X-Greylist: delayed 19:54:28 by SQLgrey-1.8.0
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BB1D40123
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 17:38:01 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4JvkVH1xStz9sj8
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 18:37:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1644514676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmJ5ImwbMplC4mCiYuhHXPpsMfeSlAAn+/YSUjpvn2E=;
 b=fsZViag92VsWUpweVWbTzoXaqiDdfXdSYajmg+s7ukViA2EqlEqxSACR8dkYHP7tm9GvY0
 9LJWg4AmTIQBTCibulKaCrXJCTVVlEZHnrby7hxlROZSv25ufcJ1ZCLTrJuaWUdc3n2YUx
 As4w2dDLMRDHridfJmiXeAggokjc5uTIp5DpJh8szkPvcoFG0sJ4o9u74N83l0NpsISoge
 ZQulBEhb+bigMhkKbx2RBYNyYJMwOF/hCIErcGw2635at0D5+zhoXLM8WHCS6pzJ9Ez9It
 xWqtSFnGMR31MXhr8jLvfdqFjK6QmE56fyEGChn4N3dnDq6v/sXkmqpeGLiKVw==
Message-ID: <d83325d3-e945-eea8-cbf7-560cf0350a57@othermo.de>
Date: Thu, 10 Feb 2022 18:37:54 +0100
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220209214326.21671-1-heiko.thiery@gmail.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220209214326.21671-1-heiko.thiery@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/rauc: bump to version 1.6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

On 09.02.22 22:43, Heiko Thiery wrote:
> For release notes see: https://github.com/rauc/rauc/releases/tag/v1.6
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Builds and works fine on a raspberrypi CM4.

Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
