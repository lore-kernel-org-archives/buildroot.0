Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCC1C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DB3C84321;
	Sat,  8 Jun 2024 19:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJVtntg3AE-p; Sat,  8 Jun 2024 19:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D45084318
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D45084318;
	Sat,  8 Jun 2024 19:05:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 675951BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 604C04097B
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nNo3BDj_Vdd for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:05:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B895C40915
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B895C40915
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B895C40915
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:05:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81A2560005;
 Sat,  8 Jun 2024 19:05:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sG1N7-003jrl-2R;
 Sat, 08 Jun 2024 21:05:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
References: <20240604201720.64420-1-christian@aperture.us>
 <87tti8csqc.fsf@dell.be.48ers.dk>
Date: Sat, 08 Jun 2024 21:05:01 +0200
In-Reply-To: <87tti8csqc.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 04 Jun 2024 23:18:03 +0200")
Message-ID: <87ikyjuug2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to go1.22.4
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:
 >> Fixes the following CVEs:
 >> CVE-2024-24789: archive/zip: mishandling of corrupt central directory record
 >> CVE-2024-24790: net/netip: unexpected behavior from Is methods for IPv4-mapped IPv6 addresses

 >> View the release notes for more information:
 >> https://go.dev/doc/devel/release#go1.22.4

 >> Signed-off-by: Christian Stewart <christian@aperture.us>

 > Committed, thanks.

For 2024.02.x I have instead bumped to 1.21.11.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
