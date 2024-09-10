Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87719EDE9AB
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 19:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F95840659;
	Tue, 10 Sep 2024 19:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pMXkOq5w7Ii; Tue, 10 Sep 2024 19:01:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D92B4067C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D92B4067C;
	Tue, 10 Sep 2024 19:01:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B53B1BF228
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 19:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9D6280B30
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 19:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zz6rQ1Fb6qHK for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 19:01:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 393FB80AFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 393FB80AFB
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 393FB80AFB
 for <buildroot@uclibc.org>; Tue, 10 Sep 2024 19:01:18 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1so671-0003VG-6D
 for buildroot@uclibc.org; Tue, 10 Sep 2024 21:01:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 10 Sep 2024 19:01:10 -0000 (UTC)
Message-ID: <vbq51m$cnj$1@ciao.gmane.io>
User-Agent: slrn/1.0.3 (Linux)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: [Buildroot] How to control host gcc version?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I'm trying to build a root filesystem using a vendor-supplied copy of
buildroot 2020.02.07.

Unfortunately, some of the packages that buildroot wants to build for
the host (e.g. m4) are so old they won't compile with my host's
version of gcc (13.3).  [I've got m4 installed on the host, but
buildroot still wants to build its own.]

I can install older versions of gcc, but I can't figure out how to
tell buildroot what host toolchain to use. There must be an option for
that, but I've been searching through the manual and haven't found it.

How do I tell buildroot what host gcc to use (e.g. 'gcc-11' instead of
'gcc')?

--
Grant

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
