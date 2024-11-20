Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22558D743D2
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 20:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF24660818;
	Wed, 20 Nov 2024 20:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HyitkmKXZYu; Wed, 20 Nov 2024 20:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E913D6059F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E913D6059F;
	Wed, 20 Nov 2024 20:53:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0978327D6
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9D684711B
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdUFv0iaHt9b for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 20:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96D9F45AEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96D9F45AEB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96D9F45AEB
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:53:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25C1B240004;
 Wed, 20 Nov 2024 20:53:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tDrhS-001EBv-1k;
 Wed, 20 Nov 2024 21:53:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
References: <20241030194650.C1CE984CF1@busybox.osuosl.org>
Date: Wed, 20 Nov 2024 21:53:22 +0100
In-Reply-To: <20241030194650.C1CE984CF1@busybox.osuosl.org> (Romain Naour via
 buildroot's message of "Wed, 30 Oct 2024 20:45:29 +0100")
Message-ID: <87ttc1tynx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/musl-compat-headers: fix
 download of queue.h
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

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=ebcccdfbd625b2773de705f4519454c131561f17
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70 now
 > returns some HTML soup instead of the plain text version of the file,
 > causing the hash check to fail.

 > http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70;content-type=text%2Fplain
 > returns the correct data, but the ";" in the URL causes some issues
 > with the parsing logic in Buildroot.

 > So let's switch to
 > https://raw.githubusercontent.com/NetBSD/src/03be82a6b173b3c62116b7a186067fed3004dd44/sys/sys/queue.h
 > which delivers exactly the same file, but hopefully will be more
 > stable. The file name changed to just queue.h, but the contents is the
 > same.

 > Fixes:

 >   http://autobuild.buildroot.net/results/57c8078f382f74859076512425b2f1c52f44e95a/
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992850 (and many other similar cases)

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
