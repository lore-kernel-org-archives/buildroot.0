Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A856CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B07C41779;
	Fri, 29 Aug 2025 08:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZdwu533LsI1; Fri, 29 Aug 2025 08:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B36EF41756
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B36EF41756;
	Fri, 29 Aug 2025 08:35:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AA43D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80B6A83DD3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glE5M1vxmPFg for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:35:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B62B83D98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B62B83D98
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B62B83D98
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:35:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -21899111; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 08:35:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uruaH-00B82H-2V;
 Fri, 29 Aug 2025 10:35:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
References: <aLAkodShF1xxCh3C@waldemar-brodkorb.de>
Date: Fri, 29 Aug 2025 10:35:45 +0200
In-Reply-To: <aLAkodShF1xxCh3C@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Thu, 28 Aug 2025 11:42:57 +0200")
Message-ID: <87sehajzj2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XDBkDtOgF/qwzE+Ef9inguAvWSVjMsWN0qgnIehgx8Og6VpQHCMdSJBC/MhFsnUJSbrvnCFpTlaPOVkJ+xUenLIXNrUlDVgRubJJvT0VJvT4tsa7zxrpVzdNZCSLMzUsKHkyAbwTXhzQvfTVE8uD+BktrHmbaY2OXPKmhinN73QvcHJtexhY6UEjABC4aXFB/QfI6eVlDed+Iba/+/EEX0WXchcdeS9Oh8241CMab9liVL5VFblE6/g6fZrc6Cira9LGfQh6HkErFxquFiJSWyONln0DJxAlZxhEp8Nbl+O9ue4zZfPD7zI89YH6/iWSKnKYRUuM489P6Se5K4cvvg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=d3jS/TC2YH7kWWpyz/Wn9JWqnRm1TVLbmnXJLsa1dis=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=XDBkDtOg
Subject: Re: [Buildroot] [PATCH] package/x11r7/xlib_libXt: bump to 1.3.1
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 >  package/x11r7/xlib_libXt/xlib_libXt.hash | 5 +++--
 >  package/x11r7/xlib_libXt/xlib_libXt.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 3 deletions(-)

 > diff --git a/package/x11r7/xlib_libXt/xlib_libXt.hash b/package/x11r7/xlib_libXt/xlib_libXt.hash
 > index 577896d38b..209552b898 100644
 > --- a/package/x11r7/xlib_libXt/xlib_libXt.hash
 > +++ b/package/x11r7/xlib_libXt/xlib_libXt.hash
 > @@ -1,5 +1,6 @@
 >  # From https://lists.x.org/archives/xorg-announce/2023-April/003383.html

You forgot to update the announcement link. Looking at the announcement
I see gcc-15 / C23 fixes, and we indeed had some build issues already:

http://autobuild.buildroot.net/results/40e/40e2022a57170fd32fe9de1fdc042abb948288af/build-end.log

> -sha256  52820b3cdb827d08dc90bdfd1b0022a3ad8919b57a39808b12591973b331bf91  libXt-1.3.0.tar.xz
 > -sha512  64c5978655135b925c3aaad86b1aa6a3f3b57ad8b3592bf142be616b8aa339a02c2fc7badfab9564ea8076ea8f37acfe31709ed528f5a1d251f2d116aa074118  libXt-1.3.0.tar.xz
 > +sha256  e0a774b33324f4d4c05b199ea45050f87206586d81655f8bef4dba434d931288  libXt-1.3.1.tar.xz
 > +sha512  c220292f60b0f53134cf9364831a32bbaa9fa6bbb3a7143e917920957b7a48c616e946042747089f29ea9d8a18ecd64de620bcaf56d82462e7107de906f5db38  libXt-1.3.1.tar.xz
 >  # Locally calculated
 >  sha256  75c5574ca04731d739b1420f55f2b7b47f30df895817f1b03d0d7f5c1fbee534  COPYING
 > +

Do not add trailing lines.

Committed to master with that fixed and a more detailed commit message,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
