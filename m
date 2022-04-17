Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7B6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 09:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7904D611F0;
	Sun, 17 Apr 2022 09:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJ2eSZ8qhgfO; Sun, 17 Apr 2022 09:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9248060F41;
	Sun, 17 Apr 2022 09:16:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF87E1BF3F9
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 09:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBAC14171B
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 09:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=fail (1024-bit key) reason="fail (body has been altered)"
 header.d=163.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z84ix5NqnTiP for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 09:16:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from m1326.mail.163.com (m1326.mail.163.com [220.181.13.26])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C19941712
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=WzOe2
 zRyAkc8bZj9oe3DqGp+XTXkKWN/HuQrzm+qK0E=; b=cJmIZoB78eWyDjIQpaE/f
 Dta8cVQvKJIFuGpTYGYQl+hWSLKuoQzQXtrjot3QX6vlv2abuKC/77h8h4wO51Wf
 Z48Rz7ssMl39IL9DRySsyTPPsvCGK7F7lrIB36gA3XBdV8PhjlH0kui+9vyQhqfi
 GD6geEi+aFxmJXfavmx8V8=
Received: from andyshrk$163.com ( [58.22.7.114] ) by ajax-webmail-wmsvr26
 (Coremail) ; Sun, 17 Apr 2022 17:16:47 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sun, 17 Apr 2022 17:16:47 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: buildroot@buildroot.org, ps.report@gmx.net
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
MIME-Version: 1.0
Message-ID: <5868454e.114f.18036cf775d.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GsGowAAXe6r_2ltiIN8KAA--.17001W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiOwzlXmC5i4K6iQACst
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Subject: [Buildroot] Is there any plan for supporting Qt6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



Hello:
      Buildroot is a great project, it gave me many convince for building embedded rootfs. 
      I found Peter has submitted Qt6 support at the early of 2021[0], but it seems this series has
not bee merged yet. May i Know if there is any further plan for Qt6 support in buildroot?

[0]https://patchwork.ozlabs.org/project/buildroot/cover/20210213174013.32584-1-ps.report@gmx.net/

Many thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
