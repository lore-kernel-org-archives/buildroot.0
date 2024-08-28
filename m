Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE40C54750
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 08:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1498040B05;
	Wed, 28 Aug 2024 08:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXU9LTCTVL5X; Wed, 28 Aug 2024 08:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A229F40B10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A229F40B10;
	Wed, 28 Aug 2024 08:35:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B06621BF283
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 08:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA59860A87
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 08:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZ6mzXp0_rkF for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 08:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6876560A79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6876560A79
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6876560A79
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 08:35:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B47BC0006;
 Wed, 28 Aug 2024 08:35:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sjE8s-004hpZ-0H;
 Wed, 28 Aug 2024 10:35:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240716094305.1646641-1-buildroot@bubu1.eu>
Date: Wed, 28 Aug 2024 10:35:02 +0200
In-Reply-To: <20240716094305.1646641-1-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Tue, 16 Jul 2024 11:43:05 +0200")
Message-ID: <87bk1d82q1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to v20.15.1
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
Cc: Daniel Price <daniel.price@gmail.com>, Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Release Notes: https://nodejs.org/en/blog/release/v20.15.1
 > Fixes the following CVE's:

 > CVE-2024-36138 - Bypass incomplete fix of CVE-2024-27980 (High)
 > CVE-2024-22020 - Bypass network import restriction via data URL (Medium)
 > CVE-2024-22018 - fs.lstat bypasses permission model (Low)
 > CVE-2024-36137 - fs.fchown/fchmod bypasses permission model (Low)
 > CVE-2024-37372 - Permission model improperly processes UNC paths (Low)

 > Also these additional CVE's were fixed in the v20.12.1 and v20.12.2 releases [1][2]:

 > CVE-2024-27983 - Assertion failed in node::http2::Http2Session::~Http2Session() leads to HTTP/2 server crash- (High)
 > CVE-2024-27982 - HTTP Request Smuggling via Content Length Obfuscation - (Medium)
 > CVE-2024-27980 - Command injection via args parameter of child_process.spawn without shell option enabled on Windows

 > NodeJS tests are passing:
 > $ ./support/testing/run-tests -o ./outputs/ -k tests.package.test_nodejs -d dl
 > 12:02:58 TestNodeJSModuleHostSrc                  Starting
 > 12:02:58 TestNodeJSModuleHostSrc                  Building
 > 13:17:15 TestNodeJSModuleHostSrc                  Building done
 > 13:17:23 TestNodeJSModuleHostSrc                  Cleaning up
 > .13:17:23 TestNodeJSModuleHostBin                  Starting
 > 13:17:23 TestNodeJSModuleHostBin                  Building
 > 14:06:15 TestNodeJSModuleHostBin                  Building done
 > 14:06:20 TestNodeJSModuleHostBin                  Cleaning up
 > .14:06:20 TestNodeJSBasic                          Starting
 > 14:06:20 TestNodeJSBasic                          Building
 > 14:55:40 TestNodeJSBasic                          Building done
 > 14:55:45 TestNodeJSBasic                          Cleaning up

 > LICENSE hash changed due to changes in vendored components:

 > * copyright year update and adding spdx identifier [1]

 > [1] https://nodejs.org/en/blog/release/v20.12.1
 > [2] https://nodejs.org/en/blog/release/v20.12.2
 > [3] https://github.com/nodejs/node/commit/d5a316f5ea3fade3140c2ae35c144b500fb5d758

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
