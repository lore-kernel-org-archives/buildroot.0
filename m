Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88F7C6FA98
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 22:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F063C813B3;
	Thu,  1 Sep 2022 22:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F063C813B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wB-oDLFOAaPJ; Thu,  1 Sep 2022 22:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15E0F81381;
	Thu,  1 Sep 2022 22:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E0F81381
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82E631BF3C9
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 22:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E42E81381
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 22:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E42E81381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 90C_VtUkd4ei for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 22:02:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9DDA8137A
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9DDA8137A
 for <buildroot@busybox.net>; Thu,  1 Sep 2022 22:02:56 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1oTsGy-0008W1-KO
 for buildroot@busybox.net; Fri, 02 Sep 2022 00:02:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 1 Sep 2022 22:02:48 -0000 (UTC)
Message-ID: <tera67$v9n$1@ciao.gmane.io>
References: <tequdh$10ie$1@ciao.gmane.io> <20220901185825.GL68979@scaer>
 <ter0vs$i38$1@ciao.gmane.io> <20220901194825.GM68979@scaer>
 <ter3cg$lbs$1@ciao.gmane.io> <ter4s1$s24$1@ciao.gmane.io>
User-Agent: slrn/1.0.3 (Linux)
Subject: Re: [Buildroot] sftp-server for use with dropbear?
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
Cc: buildroot@uclibc.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-09-01, Grant Edwards <grant.b.edwards@gmail.com> wrote:


> The server doesn't need wchar support at all.

I got gesftpserver's server to build without wchar support, and it
works fine. But it's auto-selecting iconv. That makes the total rootfs
size increase for the gesftpserver almost 1MB, and I can't justify
that.

gesftpserver doesn't seem to be well-suited to small target systems
like mine. It would be nice if it could be configured without the
fancy bits for small systems, but maybe that's not allowed by later
versions of the sftp protocol?

--
Grant




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
