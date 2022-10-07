Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE4FC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 15:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AE3683EF6;
	Fri,  7 Oct 2022 15:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AE3683EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G66WBP8IJtqz; Fri,  7 Oct 2022 15:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5219483DFD;
	Fri,  7 Oct 2022 15:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5219483DFD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2095F1BF408
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFD2961189
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFD2961189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFkDMToe_SrQ for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 15:40:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FEE960B44
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FEE960B44
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 15:40:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82F7F100009;
 Fri,  7 Oct 2022 15:40:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ogpSJ-006f9S-Hs; Fri, 07 Oct 2022 17:40:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <22269_1665146445_63401E4D_22269_436_1_6b44a0c69cdefac160c38dfa526662d35a77ec0e.1665146097.git.yann.morin@orange.com>
Date: Fri, 07 Oct 2022 17:40:07 +0200
In-Reply-To: <22269_1665146445_63401E4D_22269_436_1_6b44a0c69cdefac160c38dfa526662d35a77ec0e.1665146097.git.yann.morin@orange.com>
 (yann morin's message of "Fri, 7 Oct 2022 14:40:43 +0200")
Message-ID: <874jwfskvc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mosquitto: add host variant
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > mosquitto can be configured to use password files. Those have a very
 > trivial layout, with one "username:password" tuple per line, not unlike
 > Apache's htpasswd file format, but unlike htpasswd files, the password
 > can be either in clear (boo!), or encrypted (by calling into openssl's
 > libcrypto).

 > Encryption of passwords is done with an ad-hoc tool, mosquitto_passwd,
 > again very like Apache's htpasswd, but the encrypted form is different
 > (of course). This encryption is handled by mosquitto_passwd, which can
 > create, update, or delete users, all while storing their encrypted
 > password, or it can also convert a password file with clear-text
 > passwords into a password file with encrypted passwords, e.g. it turns
 > each "foo:bar" entry to their corresponding encrypted form, like
 > "foo:$7$101$yLPgk5fn46d....==".

 > It can be very interesting to maintain a clear-text DB of
 > users:passwords in configuration management [0], and only convert it to
 > encrypted passwords when embedded on the target.

 > Add a host variant for mosquitto, which only installs mosquitto_passwd.

 > [0] ensuring safety, confidentiality, and integrity of that DB is left
 > as an exercise to the user, and is clearly out of scope for Buildroot,
 > like storing the root password in the .config is.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Titouan Christophe <titouanchristophe@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
