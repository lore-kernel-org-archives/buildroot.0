Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1536DCF58FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 21:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D13083F7C;
	Wed, 19 Nov 2025 21:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdsZFLP3CA_W; Wed, 19 Nov 2025 21:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2E3D83F71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2E3D83F71;
	Wed, 19 Nov 2025 21:32:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E440158
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BC4D40C93
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_xuT_tf3GUV for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 21:32:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B183C40C8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B183C40C8D
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B183C40C8D
 for <buildroot@uclibc.org>; Wed, 19 Nov 2025 21:32:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1vLpmY-0009GN-W2
 for buildroot@uclibc.org; Wed, 19 Nov 2025 22:32:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 19 Nov 2025 22:31:56 +0100
Message-ID: <pan$dbcdc$789265db$cef47ba1$8be22fa6@ID-313208.user.individual.net>
References: <20251102122959.1716666-1-bernd__38908.2921946951$1762086620$gmane$org@kuhls.net>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: Remove -lpthread
 from uuid.pc for non-threaded builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Am Sun,  2 Nov 2025 13:29:59 +0100 schrieb Bernd Kuhls:

> Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped
> util-linux from version 2.40.2 to 2.41.1.
> 
> Upstream release 2.40.3 contains
> https://github.com/util-linux/util-linux/commit/
e143539d30fd18afb3ba6d3c6e50a260d4219895
> which unconditionally adds -lpthread to uuid.pc causing build errors for
> other packages using non-threaded toolchains like erofs-utils.

Hi,

this patch also fixes e2fsprogs build errors:
https://autobuild.buildroot.org/results/
36c4be5e55a0957b3014a7be3bfb7f8f4ccd4a75/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
