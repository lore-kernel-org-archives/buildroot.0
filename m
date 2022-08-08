Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6E5C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F4FD8146E;
	Mon,  8 Aug 2022 21:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F4FD8146E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id csqs9dsvJGWI; Mon,  8 Aug 2022 21:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D9F98142E;
	Mon,  8 Aug 2022 21:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D9F98142E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66B021BF3BF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 411E38142E
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 411E38142E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tIJM4aZ2qvk for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:13:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09282813AC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09282813AC
 for <buildroot@busybox.net>; Mon,  8 Aug 2022 21:13:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D61EB60004;
 Mon,  8 Aug 2022 21:13:03 +0000 (UTC)
Date: Mon, 8 Aug 2022 23:13:02 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220808231302.08adad89@windsurf>
In-Reply-To: <28767d03-5c5f-d40e-12d1-ebdc6b3a5900@mind.be>
References: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
 <20220805143625.16542-2-guillaume.bressaix@gmail.com>
 <CAJe0E3cL8MK4ipwq3tLDy_D6dqrEJ2gfi20J1rXEewW4fUSkcw@mail.gmail.com>
 <28767d03-5c5f-d40e-12d1-ebdc6b3a5900@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659993184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XK+Ao0bFY+NnrSt6cgQmPnJC6Xokknq4WG2/LrHoGQE=;
 b=GzYMqlj7E4egPmuA6qJOenH67WI69spgUZvQCZIi0PM6pCeqV9Ef5wlaoULIZ/eSCZRKDa
 wh09RYnp9m6GtpxIO2Dpfmql+qBsiaVbl1kb06yH1vSxHYdgXX+5egOgpCqonjM5uLt6Hw
 fB00I+xU2HucH8Qr413h928BTq80CowAPdV9Z6TY/U+zrNOB1p2X1ukjrVRAFIc97Ys1Kf
 5WNcEmtbUGVZUbWzhl8TOYaIlU0ykUgwaTpKXqC0JdZnoxbJuXihA/qHNPd/NXV8VepCKu
 bDjtrJnQKDUkX7gO/BdzwbkkmKGOh6AV95Yvkm6eZBXv0DhBhwdHWJJBPlqhLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GzYMqlj7
Subject: Re: [Buildroot] [RFC v3 2/2] package/python-scipy: bump version to
 1.9.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net, ralf.gommers@gmail.com,
 Guillaume Bres <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 8 Aug 2022 22:58:46 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   pybind is consistently annoying, it uses ldd and stuff to discover paths...

Well, it's not just pybind. Python itself, in its ctype.find_library()
function, uses ldconfig, tries to use gcc on the target, and more funky
stuff that borks terribly in a Buildroot situation.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
