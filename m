Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A91C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 17:56:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9D3B61248
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 17:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9D3B61248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58FA683BFF;
	Fri, 22 Oct 2021 17:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mn5Qr5FHMXo8; Fri, 22 Oct 2021 17:56:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB2D983AA1;
	Fri, 22 Oct 2021 17:56:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56FF31BF298
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 17:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45AC9401C1
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 17:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1MUheFy-DmS8 for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 17:56:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E54D6401E1
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634925361;
 bh=IFZdi8my/DlpgN+ReFD1twUYj1oTd8ui3va9rPT6Rnw=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=c7lyDrYKb8KU5uE9Thja3c4rLHucya4qc4ChbUR/n7iE3fxxEeVLIWtK4dLPHJKpf
 nC+YtnIpRQ365DCvmkTyg/nOlrMcaIdN1/7BhlU8wOf19EaKf33VfPTSNciprBW4hM
 UDAdD23I14wuowEuIg3s3p5zdwC1hhtcOkJfNICY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4axq-1meX0J2SyU-001fr6 for
 <buildroot@buildroot.org>; Fri, 22 Oct 2021 19:56:01 +0200
Date: Fri, 22 Oct 2021 19:56:00 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Message-ID: <20211022195600.5276817c@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:p238yjs2e3PVNCtIIW7Drdel6X1U5SnFMSZCwAZJwcfyEZZf89g
 UNRrixKAZt8zdx0kOsGFWLXCPb3X92XP6XAjcdSRYaN9Aoda24Y4k0XjOlmcaqW3OGPBoQA
 50l8A2gK6672OiAuCW2rXsBtGKAqfnjIxCB01WL2DdNwtTtbphXGpvXbxiIATmHPNlcHYt+
 hyfnvrJF8X8hNhYEOwFCA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sJB3XESDOUs=:J8sGMDcUHWduzAhzmfkhBd
 ZIOfbDGirXhr8emNDKEEmDSHQPBr4TdTP6t+9EvzsLvX06Oi7hAwjdq7pzwza2qTv6tg1oY8G
 w21gaJRb1WwRwNdiE028xga1H/9VDgZi6Ll1Uk01FicaMbhBKMzrtKXpWPBCb/pGEOWSQUPLn
 edbEPD3yuQ7zBVEjRyZHJfRz7VIhkULpGtWkyEvg7Drp2rtUjZIpkDauNZ6wLE0u7UPCUhQTH
 4rurktmHigE5vh0mryoSrcIHRj8GbMzqlNNv0FCTBSOIV1YqQN/6cnf+OTRVuExLKGQi7WKNL
 C167SDNmGahIP1v85w6OvM5ywNRYFY1skxMZQlEgclypKvXgNnU5tKd1usMktF7XHX+CVWONG
 g9Qw3dIsb6d7d/eYUS3DAwzCBuZyCjOw4FK9+6n0qCuIYDhM90E4gVefOml3FthmKdZjUPpF3
 GK1SEkYkdk1NaX5/lypj69tL9mr3pka6EJlHurJfJ/yKjsOIZADyRD8VDKv6++GCEFdzvPgTz
 yKEfMhCFsrfp/ZLo1ASEHrXc40/zDCOKKmJG146sX2uBNZ9N8wyfzZuzDZQdgbbPS8ScMR/ZM
 2ZpOBMFQwe+QWyrfRe/NuqMuDNBoiol7CE7lHHthwuWeBo345igQWo6C/Cw6IwzSVt+f2PVtf
 tVCIv9cLP1W5Jeu7ZT+43ljNL7Lye5+/TOD89SxXfNZJ71Xg5oDtbqGWaEFr/F6rAbhxIw7Jd
 NURy5X12mhcBwAcLK+LmeqB0akcnh6jwrhVO+/Rp/WYT+VcuBO8MK06ZtNpjA9Udn9SPonDnS
 h6Z23TzhSoqZ0QVd+AjwdEybHpr4Ay+hFsVilYht5VDTdzzXkSQz6EZ+oL64x0DarB5V+vg1u
 ySzuEnB2qJg9Tj1RdB8rCDnXH4/TLgQLx2LmJ8CuciAvjbj4JbNdBQFCk/o+rFs7TdORA/tQK
 eSv6Hj89MwfKe1WMR3qW1OE6cizDjwrAhgMB3/6pYp41SR2g7A90L+E7EugZscj6Oyg+iHLJq
 wAZni2yU9bFGkolNPtcW8UUwdS0xwRLkdTiZa5GCXcIm5TV8KckRTRP9geOuZ83WRH54s7vX4
 9JKBg5WZok8h94=
Subject: [Buildroot] buildroot.org link Documentation --> HTML-Nightly is
 broken
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

Hello *,

following the link 'HTML-Nightly' from

	https://buildroot.org/docs.html

to
	http://nightly.buildroot.org/manual.html

gives

	404 Not Found

	The requested URL was not found on this server.
	Apache/2.4.48 (Debian) Server at nightly.buildroot.org Port 80

same with all other Nightly links...

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
