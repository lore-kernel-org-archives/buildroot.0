Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AEFC25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 06:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9481400F9;
	Wed, 15 May 2024 06:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPpWB7ZOI2mR; Wed, 15 May 2024 06:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0034540443
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0034540443;
	Wed, 15 May 2024 06:08:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED8211BF59A
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7B18605C9
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5z0kHP2wCET for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 06:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C5AE605D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C5AE605D7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C5AE605D7
 for <buildroot@buildroot.org>; Wed, 15 May 2024 06:08:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65952FF804;
 Wed, 15 May 2024 06:08:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s77od-000ZE2-1u;
 Wed, 15 May 2024 08:08:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20240514215636.2866720-1-bernd@kuhls.net>
Date: Wed, 15 May 2024 08:08:39 +0200
In-Reply-To: <20240514215636.2866720-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 14 May 2024 23:56:36 +0200")
Message-ID: <87seyjsj2w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: security bump version to
 6.9
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fixes CVE-2024-25111:
 > https://github.com/squid-cache/squid/security/advisories/GHSA-72c2-c3wm-8qxc

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 >  package/squid/squid.hash | 6 +++---
 >  package/squid/squid.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/squid/squid.hash b/package/squid/squid.hash
 > index 4a8ea5d550..ed78933306 100644
 > --- a/package/squid/squid.hash
 > +++ b/package/squid/squid.hash
 > @@ -1,6 +1,6 @@
 > -# From http://www.squid-cache.org/Versions/v6/squid-6.6.tar.xz.asc
 > -md5  5a41134ee1b7e75f62088acdec92d2ca  squid-6.6.tar.xz
 > -sha1  f05e06a9dd3bf7501d2844e43d9ae1bd00e9edcc  squid-6.6.tar.xz
 > +# From http://www.squid-cache.org/Versions/v6/squid-6.9.tar.xz.asc
 > +md5  4888e9dc75c0daa0ed526b34c055cb67  squid-6.9.tar.xz
 > +sha1  5e73b30116ce7111589cc2b1c9bfe3c17efa2e75  squid-6.9.tar.xz
 >  # Locally calculated
 >  sha256  55bd7f9f4898153161ea1228998acb551bf840832b9e5b90fc8ecd2942420318  squid-6.6.tar.xz

You forgot to update the sha256. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
