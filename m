Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D92C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C356360AE3;
	Sat,  8 Jan 2022 17:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mlPvsO59O82; Sat,  8 Jan 2022 17:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2716E60A71;
	Sat,  8 Jan 2022 17:35:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78DE91BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 673B160AE3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WriGgPxwm0ob for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:35:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 639E4607F2
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:35:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id F3D58240004;
 Sat,  8 Jan 2022 17:35:26 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6Fck-0006gs-DE; Sat, 08 Jan 2022 18:35:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
 <20211228164916.2beec0d6@windsurf>
 <CAPi7W80OfGF3AhM2h6mjtsUjLEnYEV4gteJ12GFq4edNysEV5A@mail.gmail.com>
 <20211228181447.2a42dc86@windsurf>
 <ed10db1b-6b39-344d-8c4b-aa0a6d085d40@gmail.com>
 <CAPi7W8094+7P-RRPafDfRgSCe94aqQUfoQ7z=WvGRFsj_wdpww@mail.gmail.com>
 <874k6egvrm.fsf@dell.be.48ers.dk>
 <CAPi7W80y_knjUqY1TuKsxbqvgPET08pS9vee07zM7HCm9w4qYg@mail.gmail.com>
 <87zgo6f9sa.fsf@dell.be.48ers.dk>
 <CAPi7W83EtcjmXsa++4J6cyVK7muHf84Ckq2G_gGYDA_AUBJ+Uw@mail.gmail.com>
Date: Sat, 08 Jan 2022 18:35:26 +0100
In-Reply-To: <CAPi7W83EtcjmXsa++4J6cyVK7muHf84Ckq2G_gGYDA_AUBJ+Uw@mail.gmail.com>
 (Fabrice Fontaine's message of "Sat, 8 Jan 2022 18:15:46 +0100")
Message-ID: <87a6g6f7vl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> For the question if we need to maintain both 2.28.x and 3.x in
 >> parallel I guess it really depends on if the packages we have depending
 >> on mbedtls (E.G. bctoolbox, bmx7, mongrel2, shadowsocks-libev) can (be
 >> patched to) work with mbedtls 3.x or not?

 > It is really unlikely that all these packages will be patched to work
 > with mbedtls 3.x.
 > To my knowledge, only hiawatha and curl have been patched to support
 > mbedtls 3.x.
 > and it should be noted that curl supports mbedtls 2.x and 3.x:
 > https://github.com/curl/curl/commit/3f126138be3c459a2794d35f8170e92e65a50dad
 > lighttpd is trying to migrate but has a lot of issues:
 > https://github.com/ARMmbed/mbedtls/issues/5331

Ok, thanks.

 >> If they can (or are no longer maintained upstream), then I would prefer
 >> to only support mbedtls 3.x going forward. If on the other hand mbedtls
 >> 3.x isn't really stable yet and only needed for hiawatha, then indeed we
 >> should perhaps just postpone it a bit and use the internal mbedtls copy
 >> in hiawatha or downgrade / drop TLS support.

 > 3.x is more "secure" because many obsolete cryptographic mechanisms and
 > TLS protocol versions and options have been removed. However, it is probably
 > ok to postpone the addition of mbedtls 3.x until more packages support it.

Yes, I agree. What will we do about hiawatha? Patch it to work with 2.x
as well, move to the internal mbedtls copy or revert the bump? Did you
try contacting upstream about the issue?


 > It should be noted that we'll have the same issue/question with openssl 3.x ...

Indeed, that is another can of worms that has been on my TODO list for a
while...

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
