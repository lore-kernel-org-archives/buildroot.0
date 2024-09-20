Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1A8CF3968
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2003040190;
	Fri, 20 Sep 2024 10:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1zQRYjWcxMV; Fri, 20 Sep 2024 10:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2ACF403B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2ACF403B2;
	Fri, 20 Sep 2024 10:32:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC5381BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8F1A60603
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsHIXa7NyhT4 for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:32:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D7A5605E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D7A5605E5
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D7A5605E5
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:32:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B8DEC0004;
 Fri, 20 Sep 2024 10:32:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sraw7-00H38V-0s;
 Fri, 20 Sep 2024 12:32:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240914095501.194725-1-arnout@mind.be>
 <20240914095501.194725-2-arnout@mind.be>
Date: Fri, 20 Sep 2024 12:32:27 +0200
In-Reply-To: <20240914095501.194725-2-arnout@mind.be> (Arnout Vandecappelle
 via buildroot's message of "Sat, 14 Sep 2024 11:54:59 +0200")
Message-ID: <87frpuipj8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/4] package/pkg-generic.mk: legal-info:
 make sure host-tar is available
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
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > Commit aacca7f0639bac6bb3fb262d0b1738c4387edeb0 introduced the
 > possibility to also create tarballs for packages that are local or
 > overridden (i.e., with a custom version). However, it doesn't work
 > correctly for PPD, because the PPD-host-tar and gzip are not available.

 > This failure was silent because the mk_tar_gz function doesn't exit on
 > error. The following error was printed but ignored:

 >     support/download/helpers: line 62: .../per-package/busybox/host/bin/tar: No such file or directory

 > Call prepare-per-package-directory before calling mk_tar_gz which uses
 > it. Note that we use only tar and gzip here, not all of
 > DOWNLOAD_DEPENDENCIES, because tar and gzip are the only ones we really
 > use.

 > Also add this dependency to the legal-info target. We use an order-only
 > dependency even though that makes not difference for a phony target, but
 > this makes it similar to how it's done for the stamp targets. Note also
 > that this dependency is redundant, because there is already a dependency
 > on the foo-rsync target which does depend on DOWNLOAD_DEPENDENCIES. We
 > still add the dependency explicitly in case things change with the
 > foo-rsync target in the future.

 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>
 > Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
