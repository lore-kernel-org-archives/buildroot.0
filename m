Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0B7C25B7C
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 13:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77CF1400C4;
	Mon, 27 May 2024 13:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytAQ4oNWYazW; Mon, 27 May 2024 13:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68E0540102
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68E0540102;
	Mon, 27 May 2024 13:00:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9AB1D1CAA
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3510E606E5
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfPCcgOsLnzj for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 13:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93FA9606E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93FA9606E3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93FA9606E3
 for <buildroot@buildroot.org>; Mon, 27 May 2024 13:00:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61DA7E0008;
 Mon, 27 May 2024 13:00:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBZxX-005KIM-2W;
 Mon, 27 May 2024 15:00:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Stephan Lukits <stephan.lukits@gmail.com>
References: <D64D07D6-F5B1-474D-A9EC-1D765362C88A@gmail.com>
Date: Mon, 27 May 2024 15:00:15 +0200
In-Reply-To: <D64D07D6-F5B1-474D-A9EC-1D765362C88A@gmail.com> (Stephan
 Lukits's message of "Mon, 27 May 2024 12:49:43 +0200")
Message-ID: <87y17vbeao.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [make] wget: Unknown option 'passive-ftp'
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

>>>>> "Stephan" == Stephan Lukits <stephan.lukits@gmail.com> writes:

 > Good afternoon, choosing a preset configuration and calling `make` fails:
 > goedel@fedora-linux-38 buildroot-2024.02]$ make

 > $ wget --version
 > GNU Wget2 2.1.0 - multithreaded metalink/file/website downloader

 > +digest +https +ssl/gnutls +ipv6 +iri +large-file +nls -ntlm -opie +psl -hsts
 > +iconv +idn2 +zlib -lzma +brotlidec +zstd -bzip2 -lzip +http2 +gpgme

Yes, that is a known issue. Fedora has recently moved to wget2 which no
longer has ftp support or understands the --passive-ftp argument.

Yann is working on a solution, but until then you can work around it by
dropping the arguments from your BR2_WGET setting:

https://patchwork.ozlabs.org/project/buildroot/list/?series=407301

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
