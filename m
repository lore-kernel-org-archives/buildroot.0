Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C97FC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 10:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C0840721;
	Sun, 28 Apr 2024 10:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cV70ZefYAYR; Sun, 28 Apr 2024 10:53:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5447540744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5447540744;
	Sun, 28 Apr 2024 10:53:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A80A01BF396
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 10:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0B4D40242
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 10:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9gnSFBXkQey for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 10:53:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04D92400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04D92400FE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04D92400FE
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 10:53:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EA5A20007;
 Sun, 28 Apr 2024 10:52:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s129S-003HRf-2D;
 Sun, 28 Apr 2024 12:52:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240325223701.0D12B8412D@busybox.osuosl.org>
Date: Sun, 28 Apr 2024 12:52:58 +0200
In-Reply-To: <20240325223701.0D12B8412D@busybox.osuosl.org> (Arnout
 Vandecappelle via buildroot's message of "Mon, 25 Mar 2024 23:27:45
 +0100")
Message-ID: <878r0xg3n9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/go: bump to version go1.22.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=84caea5d58b979490260e733841f2dde591b75cc
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Upgrade Go to the latest v1.22.x point release, go1.22.1.

 > This requires go-bootstrap-stage3 at version go1.21.8:

 > See: https://go.dev/doc/go1.22#bootstrap

 > https://go.dev/doc/devel/release#go1.22.1

 > Signed-off-by: Christian Stewart <christian@aperture.us>
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

For 2024.02.x I have instead bumped to 1.21.9, which contains the same
security fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
