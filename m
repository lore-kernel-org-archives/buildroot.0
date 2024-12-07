Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03ABCE7717B
	for <buildroot@archiver.kernel.org>; Sat,  7 Dec 2024 09:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD2E812DE;
	Sat,  7 Dec 2024 09:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1thyYgxJPFYM; Sat,  7 Dec 2024 09:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAD11812EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAD11812EB;
	Sat,  7 Dec 2024 09:51:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19EFFECA
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 09:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08490606DA
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 09:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApjlST6R-hfG for <buildroot@buildroot.org>;
 Sat,  7 Dec 2024 09:51:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB4CC606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB4CC606D9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB4CC606D9
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 09:51:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C877AFF804;
 Sat,  7 Dec 2024 09:51:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJrTR-00A6zx-0n;
 Sat, 07 Dec 2024 10:51:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
References: <20241206143742.1770938-1-peter@korsgaard.com>
Date: Sat, 07 Dec 2024 10:51:41 +0100
In-Reply-To: <20241206143742.1770938-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 6 Dec 2024 15:37:42 +0100")
Message-ID: <87v7vv3jo2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/eza: bump version to 0.18.24 to fix
 compatibility issue with rust >= 1.80
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/f41a92c22eee077183e7b7b84f8ec15f1900643b/
 > http://autobuild.buildroot.net/results/c660b7ac92e81d3ba203e345d37210dbdddd3994/

 > error[E0282]: type annotations needed for `Box<_>`
 --> /home/buildroot/instance-0/output-1/build/eza-0.18.22/VENDOR/time/src/format_description/parse/mod.rs:83:9
 >    |
 > 83 |     let items = format_items
 >    |         ^^^^^
 > ...
 > 86 |     Ok(items.into())
 >    |              ---- type must be known at this point
 >    |
 >    = note: this is an inference error on crate `time` caused by an API change in Rust 1.80.0; update `time` to version `>=0.3.35` by calling `cargo update`

 > https://github.com/eza-community/eza/releases/tag/v0.18.24

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
