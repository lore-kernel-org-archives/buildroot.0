Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07265C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 08:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8010B809EC;
	Sun, 17 Dec 2023 08:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8010B809EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rmpz0pXBQQ-3; Sun, 17 Dec 2023 08:20:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA44881DAB;
	Sun, 17 Dec 2023 08:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA44881DAB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FB081BF4E6
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 08:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82ABA400C8
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 08:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82ABA400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id scBuBrep5t1q for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 08:20:15 +0000 (UTC)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C75A40012
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 08:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C75A40012
X-QQ-mid: bizesmtp80t1702800939tnzl2dvw
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 17 Dec 2023 16:15:38 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: znfcQSa1hKYFMvDWDmX9cA6IOQCzf3L5fRukJf+jpz6EGMf/jNhi6mzLzDNCy
 GH+ezW4a8EpDd6oA8Z1ZtpGVz5n3yYzYH+ojHkum1msRmOaAr70qaMEXWI/dxO9yjnnRb6b
 dGp3R18M2bb4X2cpIiOz8kdILtYLnTMxILXuhSCFmhabVfEHc7KQ0l2ni+dc7Okz7kUc0CX
 qAc04utdX2uOazEGalwApYNoiCezYMrizIKPgGZ+2i8oM5lXjVDXAUbDNrjxF1qiSXd6F7P
 HTCrgTvOUI4R3o7sKhi8Kh2xtLljnpMIQU9n1J2iYOn8991cHE1TmdydasucYZLK5v0Byjo
 1RfUSWmbxpx8hCV2uw=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5760130664181418815
From: Yuan Tan <tanyuan@tinylab.org>
To: peter@korsgaard.com
Date: Sun, 17 Dec 2023 16:15:37 +0800
Message-Id: <20231217081537.206156-1-tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87cyv94xd0.fsf@48ers.dk>
References: <87cyv94xd0.fsf@48ers.dk>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
Subject: Re: [Buildroot] Inquiry About Mirroring Methods for Buildroot
 Packages
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
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
