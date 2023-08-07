Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5998CEB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 06:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B274140F4E;
	Mon,  7 Aug 2023 06:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B274140F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCeWBddynDr6; Mon,  7 Aug 2023 06:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68529409AC;
	Mon,  7 Aug 2023 06:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68529409AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 114521BF3F6
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 06:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F27D7605EC
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 06:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F27D7605EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WuB6b41Hi8Dm for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 06:53:44 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FDDC6100C
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 06:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FDDC6100C
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 08:53:41 +0200
Received: from unknown (HELO OPE16NORMBX301.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Aug 2023 08:53:41 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX301.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 08:53:39 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Mon, 07 Aug 2023 08:53:36 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.01,261,1684792800"; d="scan'208";a="24638211"
Date: Mon, 7 Aug 2023 08:53:36 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZNCU8E59+/D/rn5T@tl-lnx-nyma7486-2>
References: <cover.1690895462.git.yann.morin@orange.com>
 <20230806164036.60d21e39@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230806164036.60d21e39@windsurf>
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX201.corporate.adroot.infra.ftgroup (10.115.26.6)
 To OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1691391225; x=1722927225;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=HvpOHMT9Qk1QblHv6fCJVKvhYNaj04JN7GAoxCP5heg=;
 b=La9vtVDy0J2PeHrsB8YsSwcWb0YyBqtq4hTm9A9JtFfjkvCvONwno/rM
 qAJkV7mBmOt0n97SXvgR2lN70vVNJhhm00pHUdfavE0qST37mnXXRmk9Y
 8VcOZ5cl3cNMPkChEpcOFjZqumgANLQr7NzKITDHwNS3uxLXFihec2Tc4
 PVFEzzWGZaLHr8JU0rlPE20UpcprwHvlTn1S79Xmb8Vhg2yH9rp8GLJZt
 qn7KRDNFmSayonjMDJkN3rl91As7cvmrhzfNTEM0cZyET+0TYW4t9blwp
 6wGnHluwIIGJwiaHWggd5Ex7uYxVDjIEsad04rUxCGshEkEr8tk6uGsiw
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=La9vtVDy
Subject: Re: [Buildroot] [PATCH 0/3 v2] support/download: enhance svn backend
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

Thomas, All,

On 2023-08-06 16:40 +0200, Thomas Petazzoni spake thusly:
> On Tue, 1 Aug 2023 15:11:14 +0200
> yann.morin@orange.com wrote:
> > Yann E. MORIN (3):
> >       support/download: fix shellcheck errors in svn backend
> >       support/download: use svn credentials to retrieve revision date
> >       support/download: add support to exclude svn externals
> I have applied the series to next. As reported on IRC, the From: field
> is not correct, as it is just From: yann.morin@orange.com, while it
> should be From: Yann E. MORIN <yann.morin@orange.com> to match the
> Signed-off-by value. I fixed that up when applying.

Yeah, that's the mail server here that mangles the outgoing From:
fields... I'll try to coax git into always adding a From pseudo header
as a workaround... Sorry for the mess...

> Another aspect I'd like to challenge though is your decision in PATCH
> 3/3 to preserve the current behavior of downloading externals as the
> default. We have only one package in the tree that uses SVN as far as I
> can see, so it would be easy to verify if this one uses external or
> not, and do the right thing.

I was pondering changing the default, indeed, but that would mean
existing hashes would no longer match. So that would warrant a bump
to BR_FMT_VERSION_svn.

If that's OK, I can work on that.

> Yes, I know this change of the default behavior could break external
> packages,

If we bump BR_FMT_VERSION_svn, they'll more easily notice, and be able
to take action.

> I believe the
> chances of having people having external packages *and* packages that
> use external SVN repositories are fairly slim, so I would think that
> defaulting to *not* downloading the SVN externals would be an
> acceptable change.

I'm not sure about the pervasiveness of svn-externals, but the only
publicly svn-hosted package we needed to introduce in Buildroot does use
externals! ;-)

> We can always mention it in the migration guidelines
> at
> https://buildroot.org/downloads/manual/manual.html#migrating-from-ol-versions
> if we want to be extra nice.

Sure, I'll post a follow-up patch in a moment..

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
