Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8604FC4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 17:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23BEC60B20;
	Sun, 14 Jan 2024 17:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23BEC60B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXlF8DAbca_V; Sun, 14 Jan 2024 17:34:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E4660AB2;
	Sun, 14 Jan 2024 17:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69E4660AB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3573E1BF2F9
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 17:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10D06409EF
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 17:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10D06409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lMFYBNvafR5 for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 17:34:12 +0000 (UTC)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2B97409DB
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 17:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2B97409DB
X-QQ-mid: bizesmtp76t1705253633t0op7ixi
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 15 Jan 2024 01:33:51 +0800 (CST)
X-QQ-SSF: 01200000002000B06000B00A0000000
X-QQ-FEAT: ceHWIenCpmB28ylWCXRRBoNiG8rFRvqHg4qU4ZinzCcmng91nf8Y2gDxubFeu
 Vqe6/YEgyvY7iJZiwRPQ8rDDyfT/MorGoEBLiZeVkYx+A2bPliKWk62tk5aX5rQriiAikt4
 75sI9TweKYT6OLd5RBWb6J4aRUe6iUkm6NdKCBNSf15oiWa4udr1biPacmBbdGBD2cc55u/
 Dto2BlhzeYcU1h+LFHJCJVTT7ssbi/sW27cz33rgrfXCkXO4VGE3GjtJd8OtJBHXzTM5Zrl
 XUqRPA55cM/pl4fYeK8ZBqZliREM+mgYeMah/TVToWwu1v4pbHqYLtyTNgkdYk0IHZl+nlL
 KWAsSBlTDlbCqBAKB4MFEkfXrqBww==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6442957718602121627
From: Yuan Tan <tanyuan@tinylab.org>
To: peter@korsgaard.com
Date: Mon, 15 Jan 2024 01:33:51 +0800
Message-Id: <20240114173351.287285-1-tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87cyv94xd0.fsf@48ers.dk>
References: <87cyv94xd0.fsf@48ers.dk>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
Subject: [Buildroot] Inquiry About Mirroring Methods for Buildroot Packages
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
Cc: yann.morin.1998@free.fr, tanyuan@tinylab.org, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

It seems that my last email was ignored, I am resending it now, and I hope
it does not disturb anyone.

> 
>  > On 11/12/2023 10:56, Yuan Tan wrote:
>  >> Hi,
>  >> I am reaching out to inquire about the best practices for mirroring
>  >> Buildroot packages. We aim to establish a reliable mirror for these
>  >> packages, particularly to facilitate access for users in regions like
>  >> mainland China, where downloading packages can sometimes be challenging.
> 
>  >  We use cloudflare CDN. I just read up on it and it seems there's a
>  >  separate CDN that needs to be enabled to serve China. Perhaps that
>  > just needs to be enabled?
>  > Peter?
> 
> Hmm, I guess you are referring to
> https://www.cloudflare.com/application-services/products/china-network/?
> 
> If so, that doesn't look as if that is just something you can enable for
> their free offering, E.G. you apparently need a "ICP license":
> 
> What is an ICP license
> 
> ICP is the short name for "Internet Content Provider". According to
> Chinese regulations, all websites hosted in Mainland China or content
> served from Chinese data centers (which is true for our China Network
> service) needs to obtain an ICP "BeiAn=E5=A4=87=E6=A1=88" or "License =E8=
> =AF=81" number for
> every domain that serves content to your pages. This number needs to be
> displayed on the footer of your pages.
> 

Yes, providing internet services in China is quite troublesome :). Some
universities have set up some mirror sites, and I am trying to set up one
for buildroot as well.

>  >> I have two suggestions and would like to know if either is possible:
>  >> 1. Could you enable rsync for sources.buildroot.net? This would make
>  >> it
>  >> easier for mirror sites to stay updated.
>  >> 2. If rsync isn't an option, would it be okay to use wget to clone
>  >> the
>  >> entire sources.buildroot.net?
> 
>  >  Wouldn't it be easier to construct your own version, by running the
>  >  same script that Peter uses to update actual sources.buildroot.net?
>  >  Though IIUC that script is a bit of a hack.
> 
> yes, it is a big hack. It basically runs make allyespackageconfig &&
> make source, but then does a number of mutations as well to try to catch
> per-architecture packages or packages with multiple versions.

May I ask if this script can be shared?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
