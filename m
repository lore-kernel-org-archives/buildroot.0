Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CC4C48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 16:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A64CC41E05;
	Fri,  9 Feb 2024 16:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v81q_C9WT1Dl; Fri,  9 Feb 2024 16:11:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B8C941C34
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B8C941C34;
	Fri,  9 Feb 2024 16:11:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40CA41BF389
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 16:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E5704061B
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 16:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkNhMqkR0yDx for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 16:11:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CBE040613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CBE040613
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CBE040613
 for <buildroot@uclibc.org>; Fri,  9 Feb 2024 16:11:14 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1rYTT4-0000Co-CR
 for buildroot@uclibc.org; Fri, 09 Feb 2024 17:11:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 09 Feb 2024 17:10:29 +0100
Message-ID: <pan$a29b1$235b0aec$c06a1ff$d5539253@ID-313208.user.individual.net>
References: <20240206222231.8950D87481@busybox.osuosl.org>
 <CALAjcgVd0VGDZCRpH3cpeikpNH0ZZOkV9c667cH6GQhMa8qtTg__833.063844923743$1707444930$gmane$org@mail.gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [git commit] package/python3: bump version to 3.12.1
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

Am Thu, 8 Feb 2024 21:14:52 -0500 schrieb James Knight:

>         import math
>     ImportError: /lib/x86_64-linux-gnu/libm.so.6: version `GLIBC_2.38'
> not found (required by
> /builds/buildroot/output/build/python3-3.12.1/build/lib.linux-
x86_64-3.12/math.cpython-312-x86_64-linux-gnu.so)

Hi James,

same here on Debian 12.4/bookworm, try this patch:
https://github.com/bkuhls/buildroot/commit/
dca8b5bee7742ffedf81a027affadd4b7e18fc3f

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
