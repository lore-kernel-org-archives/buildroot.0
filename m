Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634DCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 12:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF68160B6A;
	Fri, 28 Jan 2022 12:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Egw67eTEKYTv; Fri, 28 Jan 2022 12:44:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50AF360B0E;
	Fri, 28 Jan 2022 12:44:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41EFF1BF332
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2248760B0E
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLzW9SRyfZrN for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 12:44:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41757600D1
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 12:44:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BC61460003;
 Fri, 28 Jan 2022 12:44:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nDQc3-0003uu-2K; Fri, 28 Jan 2022 13:44:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
References: <20220115015004.2531151-1-tianyuanhao3@163.com>
Date: Fri, 28 Jan 2022 13:44:23 +0100
In-Reply-To: <20220115015004.2531151-1-tianyuanhao3@163.com> (TIAN Yuanhao's
 message of "Fri, 14 Jan 2022 17:50:04 -0800")
Message-ID: <874k5o9gig.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux/util-linux-libs: add
 a missing patch
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "TIAN" == TIAN Yuanhao <tianyuanhao3@163.com> writes:

 > The commit 2f5068640161f7b267099e28b69d4c2280b4ded3 added a patch for
 > util-linux, but forgot to create a symlink to util-linux-libs. This
 > results in inconsistent libblkid.so builds from util-linux and
 > util-linux-libs.

 > If you enable BR2_PER_PACKAGE_DIRECTORIES, you will find that different
 > libblkid.so is used in different
 > $(BASE_DIR)/per-package/$(PKG)_NAME/target.

 > Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
