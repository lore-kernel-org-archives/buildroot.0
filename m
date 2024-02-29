Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9B4C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CDE641B4C;
	Thu, 29 Feb 2024 15:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1d-bYIoqBJ32; Thu, 29 Feb 2024 15:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56EC64193D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56EC64193D;
	Thu, 29 Feb 2024 15:53:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CFD81BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 296D960ED8
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ZtAo-zk2C1a for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:29:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24BA260EC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24BA260EC8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24BA260EC8
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:29:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEB89FF809;
 Thu, 29 Feb 2024 15:29:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiLz-004nHE-13;
 Thu, 29 Feb 2024 16:29:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240109211801.565524-1-fontaine.fabrice@gmail.com>
 <20240205184839.3f230f02@windsurf>
Date: Thu, 29 Feb 2024 16:29:47 +0100
In-Reply-To: <20240205184839.3f230f02@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 5 Feb 2024 18:48:39 +0100")
Message-ID: <8734tbgufo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ngrep: fix build with libnet
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
Cc: Wade Berrier <wberrier@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Tue,  9 Jan 2024 22:18:01 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Use pkg-config to find libnet and avoid the following build failure
 >> raised since commit 100ba8351c088fd764effdcaba848cfd92de79dd if
 >> libnet-config is found on the host:
 >> 
 >> /home/autobuild/autobuild/instance-4/output-1/host/bin/mips64el-buildroot-linux-gnu-gcc
 >> -s -o ngrep ngrep.o tcpkill.o -lpcap -lnet -lpcre -L/usr/lib -lnet
 >> mips64el-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'
 >> 
 >> While at it, format Upstream tag of other patches
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/05c916162b9c1027cf53f1699a1f5653151098ed
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> .checkpackageignore                           |  3 --
 >> ...nfigure-in-when-testing-for-use_pcre.patch |  3 +-
 >> ...heck-for-libnet_init-in-configure-in.patch |  3 +-
 >> package/ngrep/0003-fix-disable-tcpkill.patch  |  2 +-
 >> ...ure.in-use-pkg-config-to-find-libnet.patch | 38 +++++++++++++++++++
 >> package/ngrep/ngrep.mk                        |  2 +-
 >> 6 files changed, 42 insertions(+), 9 deletions(-)
 >> create mode 100644 package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
