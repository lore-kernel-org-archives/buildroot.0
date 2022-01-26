Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B403C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 12:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86450405BB;
	Wed, 26 Jan 2022 12:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOVESv1m2Pq1; Wed, 26 Jan 2022 12:26:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95B4840385;
	Wed, 26 Jan 2022 12:26:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83E0C1BF473
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 12:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73162415D2
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 12:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oKqpCEKOR7lO for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 12:26:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60C1341527
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 12:26:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8F5C5FF805;
 Wed, 26 Jan 2022 12:26:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nChNI-0002DD-Pj; Wed, 26 Jan 2022 13:26:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20200226090939.1810498-1-fontaine.fabrice@gmail.com>
 <20211230152059.465b21a8@windsurf>
Date: Wed, 26 Jan 2022 13:26:08 +0100
In-Reply-To: <20211230152059.465b21a8@windsurf> (Thomas Petazzoni's message of
 "Thu, 30 Dec 2021 15:20:59 +0100")
Message-ID: <87h79qisyn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next v3,
 1/1] package/font-awesome: make it compatible with fontconfig
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
Cc: Benjamin Calderon <benj.calderon@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 26 Feb 2020 10:09:39 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> This commit installs font-awesome in the standard fonts directory
 >> making it available systemwide.
 >> 
 >> Thanks to baruch for his technical critique.
 >> Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> Changes v2 -> v3 (after review of Baruch Siach):
 >> - Create a symlink to avoid duplication

 > I have applied with a reworked commit log. That being said, I am not
 > sure it was really the "best" solution. It probably would be nicer to
 > install the fonts usable by fontconfig directly in /usr/share/fonts/,
 > keeping the rest in /usr/share/font-awesome/.

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
