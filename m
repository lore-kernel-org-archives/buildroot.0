Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74032CF8570
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 09:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01E7160706;
	Thu,  3 Oct 2024 09:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYXJeRAV4Cbf; Thu,  3 Oct 2024 09:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D2F60732
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D2F60732;
	Thu,  3 Oct 2024 09:32:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72D761BF59A
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 09:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62337840C6
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 09:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9z9M01MHZK9l for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 09:32:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3AAA840C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3AAA840C4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3AAA840C4
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 09:32:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EFE01C000D;
 Thu,  3 Oct 2024 09:32:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1swICC-000DVD-2f;
 Thu, 03 Oct 2024 11:32:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240929163752.1493752-1-ju.o@free.fr>
Date: Thu, 03 Oct 2024 11:32:28 +0200
In-Reply-To: <20240929163752.1493752-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 29 Sep 2024 18:37:52 +0200")
Message-ID: <87cykho7kj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] linux: replace host-python3 with
 BR2_PYTHON3_HOST_DEPENDENCY
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Commit abce4a2b3 "linux: add BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3" [1]
 > introduced a Kernel dependency on host-python3.

 > Since the Kernel does not have any specific requirements on host
 > Python modules, or recent host Python version, this commit replaces
 > the host-python3 dependency with BR2_PYTHON3_HOST_DEPENDENCY. This
 > will skip the host-python3 compilation if a sufficient version (3.4 or
 > greater at the time of this commit) is already present on host. This
 > will save build time.

 > This optimization was suggested by Peter, in [2].

 > Note 1: this commit was checked to ensure that Kernel v6.10.9 arm64
 > defconfig (which does require a python3 interpreter to build) is
 > working with Python 3.4.

 > Note 2: BR2_PYTHON3_HOST_DEPENDENCY was introduced in commit b60729784
 > "support/dependencies: add a check for python3" [3].

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/abce4a2b365276a7fa081d327289e5e6d8bdca7e
 > [2] https://lists.buildroot.org/pipermail/buildroot/2024-September/763967.html
 > [3] https://gitlab.com/buildroot.org/buildroot/-/commit/b60729784ab1c2f75dca30f924f4dd3176713ae8

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
