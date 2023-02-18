Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A79DC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 14:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 797B760EA6;
	Sat, 18 Feb 2023 14:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 797B760EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPWc5Fy94Kgj; Sat, 18 Feb 2023 14:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C747760E97;
	Sat, 18 Feb 2023 14:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C747760E97
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E2371BF2F2
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 14:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17B4260E91
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 14:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17B4260E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iB2YJJJ6nfp7 for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 14:21:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85D4D60E97
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85D4D60E97
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 14:21:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2DF6D5FFAC;
 Sat, 18 Feb 2023 15:21:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Feb 2023 15:21:15 +0100
Date: Sat, 18 Feb 2023 15:21:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230218142115.GC2718518@scaer>
References: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
 <20230218121940.7442410e@windsurf>
 <CADYjeSuzT5ueq5F5SQvib87d1HCKXLj565mW-Rm91N7Na1KrDQ@mail.gmail.com>
 <20230218141937.60c307f7@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230218141937.60c307f7@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676730079;
 bh=TQBFZjOj/CJEKDaCSerKqsG3cj5qylRzSAPq+uxGEKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rnZJ80UTCv9N18xIbMqFcBhuipTYoYoSuUNUvaeC3dg9fXdQbgyNuCQApPga3h/mw
 RigtkX5kRWJPAAjEpRl+1oIe2241N0DMDxA2FGv8XAFnApL8iXkBVNGys87wH2i7sQ
 nng0mrdjP/hnS6HEZHj8e3Z3AP8Iuvi6Bcf2yGbTjyAMpSMjgemLG4puusFL04m+Ke
 5fqIKBvhjHMvWWBHS2uAdIj/+khGwbYpHC+uPKWy1u+vTt1QlfA/P+scZGqYPpKVqi
 xzlDckFw/M4saIts49FE8LRm7Goqs3oC49zuohG1IyIil5OnUstHuy6gZJwyDmpS9D
 qsgP4pHYuzyiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rnZJ80UT
Subject: Re: [Buildroot] Updating trust store using update-ca-certificates
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
Cc: buildroot@buildroot.org, Sourabh Hegde <hrsourabh011@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-02-18 14:19 +0100, Thomas Petazzoni via buildroot spake thusly:
> On Sat, 18 Feb 2023 13:54:15 +0100
> Sourabh Hegde <hrsourabh011@gmail.com> wrote:
> > I was thinking the ca-certificates package will take care of this. Maybe I
> > was wrong.
> > So, how should we add local CA to the trust store in the target?
> I am not sure as I'm not super familiar with that aspect. If what you
> need to do is to call update-ca-certificates during the build, then we
> could potentially build it for the host, and run it as a post-build
> script. Of course, this assumes update-ca-certificates is capable of
> doing its work on a root filesystem that isn't at the root.
> 
> Do you have more details about what needs to be done? With more
> details, we could probably give some more useful hints.

I think we just need to split CA_CERTIFICATES_INSTALL_TARGET_CMDS in two:
one part to actually instll the certifcates provided by ca-certificates
itself, and the rest to update the castore with all certificate, as a
target-finalize hook.

I.e. all that starts from "Remove any existing certificates under
/etc/ssl/certs" should be moved to a target-finalize hook.

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
