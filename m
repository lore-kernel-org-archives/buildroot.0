Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372ACC25B7E
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 13:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E41E161056;
	Tue,  4 Jun 2024 13:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xm60ZvM217n6; Tue,  4 Jun 2024 13:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB5366105B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB5366105B;
	Tue,  4 Jun 2024 13:15:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C9351BF2A2
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15DA64051C
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 13:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMr4kd3tKYGD for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 13:15:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73402404B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73402404B4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73402404B4
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 13:14:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3153240008;
 Tue,  4 Jun 2024 13:14:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sEU08-0069yw-1D;
 Tue, 04 Jun 2024 15:14:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240511235609.88305-1-christian@aperture.us>
 <Zlw0x-GMNwen_N31@landeda> <87a5k3ljy8.fsf@dell.be.48ers.dk>
Date: Tue, 04 Jun 2024 15:14:56 +0200
In-Reply-To: <87a5k3ljy8.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 02 Jun 2024 12:26:07 +0200")
Message-ID: <874ja8g88f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to v2.27.0
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
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 >> $ make docker-compose-source
 >> [...]
 >> go: downloading dario.cat/mergo v1.0.0
 >> [...]
 >> go: downloading github.com/imdario/mergo v0.3.16
 >> [...]
 >> go: github.com/docker/compose/v2/cmd/compose imports
 >> github.com/docker/cli/cli/command/container imports
 >> github.com/docker/cli/cli/compose/loader imports
 >> dario.cat/mergo: unrecognized import path "dario.cat/mergo": https fetch: Get "https://dario.cat/mergo?go-get=1": dial tcp: lookup dario.cat on 127.0.0.53:53: server misbehaving

 >> As I understand it, dario.cat is a "vanity URL" [0] so it should not be
 >> resolved by the resolver, but by go-pkg, but apparently that did not
 >> happen for me...

 > I believe the domain simply expired:

 > Registry Expiry Date: 2024-06-01T07:05:04.361

 > I reported it upstream to their issue tracker:

 > https://github.com/darccio/mergo/issues/252

This is now fixed:

Registry Expiry Date: 2025-06-01T07:05:04.361Z

But we still have the hash mismatch:

ERROR: while checking hashes from package/docker-compose/docker-compose.hash
ERROR: docker-compose-2.27.0-go2.tar.gz has wrong sha256 hash:
ERROR: expected: 448eaf225c2984a2d78b4faa3fe74a4aa1e2bb791f90ac8d4970d3d046e638df
ERROR: got     : 42e9d2a33806656bd145ec742a3ba00b64acc3f88b500793d3b78319c39e25e0
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

What to do? Do we have the original tarball somewhere so we can compare
to see what changed? I see there is a 2.27.1 version that we could bump
to but I would feel more confident if we understood what went wrong
here.

https://github.com/docker/compose/releases/tag/v2.27.1

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
