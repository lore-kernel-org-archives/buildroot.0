Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9A9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA09417E1;
	Sun, 22 May 2022 10:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6QtbBoUhPson; Sun, 22 May 2022 10:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 581E7417D0;
	Sun, 22 May 2022 10:10:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5A61BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5935260C0F
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaEBHxR3KKDu for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:10:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AD3C60C0B
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:10:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B301A40005;
 Sun, 22 May 2022 10:10:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nsiXX-00BgAb-H7; Sun, 22 May 2022 12:10:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220414215915.2974871-1-peter@korsgaard.com>
Date: Sun, 22 May 2022 12:10:23 +0200
In-Reply-To: <20220414215915.2974871-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 14 Apr 2022 23:59:14 +0200")
Message-ID: <878rqt27zk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 4.0.4
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
Cc: Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2022-28346: Potential SQL injection in QuerySet.annotate(), aggregate(), and extra()

 > QuerySet.annotate(), aggregate(), and extra() methods were subject to SQL
 > injection in column aliases, using a suitably crafted dictionary, with
 > dictionary expansion, as the **kwargs passed to these methods.

 > CVE-2022-28347: Potential SQL injection via QuerySet.explain(**options) on PostgreSQL

 > QuerySet.explain() method was subject to SQL injection in option names,
 > using a suitably crafted dictionary, with dictionary expansion, as the
 > **options argument.

 > For more details, see the advisory:
 > https://www.djangoproject.com/weblog/2022/apr/11/security-releases/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
