Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B65C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 16:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41DF483BD3;
	Sun, 12 May 2024 16:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGhg4lzoB2zC; Sun, 12 May 2024 16:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53A2F83BDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53A2F83BDB;
	Sun, 12 May 2024 16:33:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 689D11BF3C6
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 16:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EC8283BDC
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 16:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnczHAFu3K5b for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 16:33:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F21883BBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F21883BBE
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F21883BBE
 for <buildroot@uclibc.org>; Sun, 12 May 2024 16:33:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1s6C8L-0007Cu-4f
 for buildroot@uclibc.org; Sun, 12 May 2024 18:33:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 12 May 2024 18:32:38 +0200
Message-ID: <pan$22dbf$25f6b8c4$eca8fb19$83cc3976@ID-313208.user.individual.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
 <Zj-5PSfeoyinMtHy__4477.17188378505$1715452261$gmane$org@landeda>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH v2 00/20] package/kodi: bump version to
 21.0-Omega
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

Am Sat, 11 May 2024 20:30:21 +0200 schrieb Yann E. MORIN:

>     /usr/bin/grep: /builds/buildroot.org/toolchains-builder/build/
aarch64--glibc--bleeding-edge-2024.02-1/aarch64-buildroot-linux-gnu/
lib/../lib64/libatomic.la: No such file or directory

Hi Yann,

first of all I could reproduce the build error with your defconfig.

Reverting the kodi part of buildroot commit 
7333207eaf2900076185cba6641c6406d61c235e "fixed" the problem.

But since Kodi added libatomic detection already in version 20.0-Nexus (I 
haven't noticed) with commit https://github.com/xbmc/xbmc/commit/
1673f476b802da1da942cef256cae6272fdf9a4b we can remove our code, sent 
patch: https://patchwork.ozlabs.org/project/buildroot/patch/
20240512163159.999251-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
