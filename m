Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD8DC02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 16:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95655606F4;
	Wed, 22 Jan 2025 16:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ly8WYYXQPkV5; Wed, 22 Jan 2025 16:58:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9E216071A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9E216071A;
	Wed, 22 Jan 2025 16:58:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC9ECD7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 16:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAA91416AA
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 16:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oum3-k18YFvk for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 16:58:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51823405D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51823405D0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51823405D0
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 16:58:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3015CFF809;
 Wed, 22 Jan 2025 16:58:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tae3S-009AGg-1F;
 Wed, 22 Jan 2025 17:58:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Buildroot Development <buildroot@buildroot.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Romain Naour <romain.naour@smile.fr>,
 Julien Olivain <ju.o@free.fr>
References: <20250117105515.1105270-2-bagasdotme@gmail.com>
Date: Wed, 22 Jan 2025 17:58:14 +0100
In-Reply-To: <20250117105515.1105270-2-bagasdotme@gmail.com> (Bagas Sanjaya's
 message of "Fri, 17 Jan 2025 17:55:13 +0700")
Message-ID: <87tt9qlra1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/git: bump to version 2.48.1
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

>>>>> "Bagas" == Bagas Sanjaya <bagasdotme@gmail.com> writes:

 > Bump the package version to v2.48.1. While at it, also drop clar build
 > fix patchset applied to v2.47.0.

 > Release notes for v2.48.1 (security bump):
 > https://lore.kernel.org/git/xmqq5xmh46oc.fsf@gitster.g/

 > Release notes for v2.48.0 (feature release):
 > https://lore.kernel.org/git/xmqqplku7cvm.fsf@gitster.g/

 > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

For 2024.02.x I have instead bumped to 2.43.6 and for 2024.11.x to
2.47.2, which contains the same security fixes.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
