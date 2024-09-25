Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C07C369D7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 12:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF2D742666;
	Wed, 25 Sep 2024 12:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjvaMcocSUC6; Wed, 25 Sep 2024 12:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91EFB42667
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91EFB42667;
	Wed, 25 Sep 2024 12:05:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFEE41BF2F8
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 12:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF099607CD
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 12:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNdxe55JE6mm for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 12:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B903607CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B903607CB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B903607CB
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 12:05:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D341BFF802;
 Wed, 25 Sep 2024 12:05:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1stQlz-007oh2-1C;
 Wed, 25 Sep 2024 14:05:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240922205744.3811678-1-nemaakhilesh@gmail.com>
 <ZvHGJv5KM7q5j0hx@landeda>
Date: Wed, 25 Sep 2024 14:05:35 +0200
In-Reply-To: <ZvHGJv5KM7q5j0hx@landeda> (Yann E. MORIN's message of "Mon, 23
 Sep 2024 21:48:54 +0200")
Message-ID: <87zfnwey5s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libpcap: bump version to 1.10.5
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Akhilesh Nema, All,
 > On 2024-09-22 13:57 -0700, Akhilesh Nema spake thusly:
 >> Changelog: https://github.com/the-tcpdump-group/libpcap/blob/bbcbc9174df3298a854daee2b3e666a4b6e5383a/CHANGES
 >> 
 >> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

 > Applied to master, thanks.

As noted in the CHANGES file this fixes a number of security issues:

      CVE-2023-7256: Clean up sock_initaddress() and its callers to avoid
        double frees in some cases.
      CVE-2024-8006: Fix pcap_findalldevs_ex() not to crash if passed a
        file:// URL with a path to a directory that cannot be opened.

So it should have been marked as a security bump. Please take that into
consideration for future bumps.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
