Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC8EC07CB1
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 21:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B03615D3;
	Wed, 29 Nov 2023 21:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43B03615D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60e6x7hCB7e2; Wed, 29 Nov 2023 21:27:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9916B615CE;
	Wed, 29 Nov 2023 21:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9916B615CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE901BF969
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 449CB4025D
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 449CB4025D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZHfE9fG3blt for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 21:27:19 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5313440137
 for <buildroot@uclibc.org>; Wed, 29 Nov 2023 21:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5313440137
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1r8S5S-0003jW-KE
 for buildroot@uclibc.org; Wed, 29 Nov 2023 22:27:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 29 Nov 2023 22:26:28 +0100
Message-ID: <pan$c6447$9e02fed2$b5658855$c64dce11@ID-313208.user.individual.net>
References: <20231016180855.69848-1-bernd@kuhls.net>
 <20231101223659.3daf8e1a@windsurf>
 <8734xgtp1w.fsf__14670.3781488881$1699446027$gmane$org@48ers.dk>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.19.2
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

Am Wed, 08 Nov 2023 13:19:55 +0100 schrieb Peter Korsgaard:

> From the looks of it, this only affects 4.19.x and not the 4.18.8 we
> have in 2023.02.x / 2023.08.x, right?

Hi Peter,

sorry for answering late, but yes, I think you are right:
https://ubuntu.com/security/CVE-2023-5568
"appears to be 4.19 only"

But 4.18.9 is out now which fixes CVE-2018-14628
https://www.samba.org/samba/history/samba-4.18.9.html

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
