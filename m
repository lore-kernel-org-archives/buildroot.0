Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5F8C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22833600CA;
	Wed, 26 Jan 2022 20:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Edq6LScgBSb; Wed, 26 Jan 2022 20:13:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D3B160BD3;
	Wed, 26 Jan 2022 20:13:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 475431BF4D5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34FB341732
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOCOWyqqETNh for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:13:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A0DF416F6
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:13:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D9FAE60004;
 Wed, 26 Jan 2022 20:13:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCofg-0006ZK-6r; Wed, 26 Jan 2022 21:13:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
References: <20220103165451.2769-1-florent.aumaitre@medianesysteme.com>
Date: Wed, 26 Jan 2022 21:13:36 +0100
In-Reply-To: <20220103165451.2769-1-florent.aumaitre@medianesysteme.com>
 (Florent AUMAITRE's message of "Mon, 3 Jan 2022 17:54:51 +0100")
Message-ID: <8735lafe6n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-pyqt5: Fix parallel
 build
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
Cc: Manuel =?utf-8?Q?V=C3=B6gele?= <develop@manuel-voegele.de>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Florent" == Florent AUMAITRE <florent.aumaitre@medianesysteme.com> writes:

 > This patch fix build of python-pyqt5 package when parallel build is used
 > Signed-off-by: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>

 > Changes v1 -> v2:
 >   - Re-use the existing QT5_INSTALL_QT_CONF macro from package/qt5/qt5.mk  (suggested by Thomas Petazzoni)

 > Signed-off-by: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
