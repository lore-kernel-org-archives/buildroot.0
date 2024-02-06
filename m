Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1905DC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB9D361112;
	Tue,  6 Feb 2024 13:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB9D361112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9SXCEjpc-OK; Tue,  6 Feb 2024 13:44:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20B1C610E8;
	Tue,  6 Feb 2024 13:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20B1C610E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0390F1BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFF5C41EE4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF5C41EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRU94RzuPQSs for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:44:34 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E161341EDD
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E161341EDD
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E0C9B13F8CF;
 Tue,  6 Feb 2024 14:44:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 14:44:27 +0100
Date: Tue, 6 Feb 2024 14:44:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZcI3u5X9fZQ6mBWd@landeda>
References: <20240111051726.2918732-1-james.hilliard1@gmail.com>
 <f2a019a9-60f5-45eb-be00-e6922a28106a@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2a019a9-60f5-45eb-be00-e6922a28106a@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707227072;
 bh=cXQdUA48xpJo1TgUgdbKDS2TIKECU4mFTI7Fd58wZj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Db0oJ+j5RhdshWkeAhAqKaM4RMvTkPragRbMq/FsaX/Yn89WcmH4NFzjS4E5SAvv/
 4YZQj9PfPW56+uRpjMyivm1y1n4EyP6WinO8kPl2eOl/thHT1cmgGvvZtmatNyO1T7
 t4bCCrPGX/FZBQg+6BM/Ou9GiFNmRWtD84h0NhSXuR8C32R/ub/TYAnxUJKKVtiAKm
 8u5GJQNpfdSkdGbfDM2V+acD9xF2GDFvZZ8fk6Vf5/cSt2X+jTbC7usZnYoMUNjlRl
 PJxryAZ040amqp2Tijtj59XG4uW/oxMmqV44qPjBGL9SwjWvATll35QRZzZGmUgRyy
 3ae/wQxdwUAwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Db0oJ+j5
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.16.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-02-05 12:05 +0100, Arnout Vandecappelle via buildroot spake thusly:
> On 11/01/2024 06:17, James Hilliard wrote:
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/python-rpds-py/python-rpds-py.hash | 2 +-
> >   package/python-rpds-py/python-rpds-py.mk   | 4 ++--
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
> > index b04aa210d3..8c4b6181d0 100644
> > --- a/package/python-rpds-py/python-rpds-py.hash
> > +++ b/package/python-rpds-py/python-rpds-py.hash
> > @@ -1,4 +1,4 @@
> >   # Locally calculated after vendoring
> > -sha256  87361601241744fff6235e35050addfe34d00508172d2bd4f178193a28727287  rpds_py-0.12.0.tar.gz
> > +sha256  861b1fa8c37819b2e2cebbde6dea66ac2fa1247e4a7c3933dbf4c89244d7fecb  rpds_py-0.16.2.tar.gz
> 
> ERROR: while checking hashes from package/python-rpds-py//python-rpds-py.hash
> ERROR: rpds_py-0.16.2.tar.gz has wrong sha256 hash:
> ERROR: expected: 861b1fa8c37819b2e2cebbde6dea66ac2fa1247e4a7c3933dbf4c89244d7fecb
> ERROR: got     : bc62a37913de53569414f6eb4a16a005b1dd04afb473c3c27561b11614f92034
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
>  This might be the gitattributes issue that Yann has a patch series for. I'm
> marking this patch as Changes Requested, you can try to re-submit after
> Yann's series is merged.

It turned out that Arnout had a broken setup, and the archives were made
with tar 1.35 rather than the expexted 1.34.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
