Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B01C6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 21:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C839982330;
	Wed, 22 Mar 2023 21:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C839982330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DftQqD1dVMYi; Wed, 22 Mar 2023 21:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E4382257;
	Wed, 22 Mar 2023 21:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29E4382257
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F20F11BF21A
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 21:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9393614AF
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 21:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9393614AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 89vbwjdrNXKl for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 21:59:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D69F6146C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D69F6146C
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 21:59:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EBE6AFF805;
 Wed, 22 Mar 2023 21:59:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pf6UR-00AfIb-SM; Wed, 22 Mar 2023 22:59:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Zvi Vered <veredz72@gmail.com>
References: <CABRndgw1EVFyDNDcRJ10gOPFfw-gH+7Gqx7P537EiSVr5Wq6Kw@mail.gmail.com>
 <875yavx0ui.fsf@dell.be.48ers.dk>
 <CABRndgyqeJXm6XqwYQ_QUaQAGB9EENSq4dc3qLaq6Y3RUhxFUg@mail.gmail.com>
 <87edpiuehn.fsf@dell.be.48ers.dk>
 <CABRndgwMRVDXzSAoGb5fU9PqM2b6z6we5rH40_NCs7w12LHiDA@mail.gmail.com>
 <877cv9vr7v.fsf@dell.be.48ers.dk>
 <CABRndgz8n37jikSwt3uBkGTM-UBObYcny6xEqhnFkDod9dae1Q@mail.gmail.com>
Date: Wed, 22 Mar 2023 22:59:27 +0100
In-Reply-To: <CABRndgz8n37jikSwt3uBkGTM-UBObYcny6xEqhnFkDod9dae1Q@mail.gmail.com>
 (Zvi Vered's message of "Wed, 22 Mar 2023 20:03:35 +0200")
Message-ID: <87355wv45c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] 2023.02 : pty_allocate: openpty: No such file or
 directory
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

>>>>> "Zvi" == Zvi Vered <veredz72@gmail.com> writes:

 > Hi Peter,
 > The output of: ls -la /dev/null :
 > -rw-rw----    1 root           root       256 Dec 23   13:07 /dev/null

So /dev/null is a regular file, not a character device?

 > In S60rcma (my script, in /etc/init.d)  I added:
 > mdev -s
 > dropbear -R -E

 > After login, ssh client works fine.
 > It seems adding "mdev" solved the problem.
 > I think buildroot rootfs should solve it without adding any script.

It does. Again, please provide more details - E.G. how does your
Buildroot .config look like and how do you get the rootfs onto your
target?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
