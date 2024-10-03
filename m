Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB63CF8572
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 09:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10BD760732;
	Thu,  3 Oct 2024 09:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SamXIeCYk78Z; Thu,  3 Oct 2024 09:32:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E5A960743
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E5A960743;
	Thu,  3 Oct 2024 09:32:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C2611BF59A
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 09:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ABEF60743
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 09:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhkVWDFuznar for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 09:32:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E57660732
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E57660732
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E57660732
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 09:32:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E11AA20008;
 Thu,  3 Oct 2024 09:32:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1swICK-000DVI-14;
 Thu, 03 Oct 2024 11:32:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240929165343.1570582-1-ju.o@free.fr>
Date: Thu, 03 Oct 2024 11:32:36 +0200
In-Reply-To: <20240929165343.1570582-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 29 Sep 2024 18:53:43 +0200")
Message-ID: <878qv5o7kb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: replace host-python3 with
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Commit 86bb1b236 "boot/grub2: needs host-python3" [1] introduced a
 > dependency on host-python3.

 > Since grub does not have any specific requirements on host Python
 > modules, or recent host Python version, this commit replaces the
 > host-python3 dependency with BR2_PYTHON3_HOST_DEPENDENCY. This will
 > skip the host-python3 compilation if a sufficient version (3.4 or
 > greater at the time of this commit) is already present on host. This
 > will save build time.

 > This optimization was suggested by Peter, in [2].

 > Note 1: this commit was checked to ensure that grub is building with
 > Python 3.4.

 > Note 2: BR2_PYTHON3_HOST_DEPENDENCY was introduced in commit b60729784
 > "support/dependencies: add a check for python3" [3].

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/86bb1b2360bdaed069cd087541f4edad1d5ce925
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
