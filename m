Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9803BC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A9CA406C3;
	Sat,  8 Jun 2024 07:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcH0q1oAIPYu; Sat,  8 Jun 2024 07:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25979408A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25979408A7;
	Sat,  8 Jun 2024 07:21:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19F051BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 067F4401B7
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFlnu_Sp4Ojp for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:21:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98CFA400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98CFA400FE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98CFA400FE
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:21:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60E691C0005;
 Sat,  8 Jun 2024 07:21:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFqOX-00GG2F-2U;
 Sat, 08 Jun 2024 09:21:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240307143227.548555-1-fontaine.fabrice@gmail.com>
 <20240510233329.149a2e5e@windsurf>
Date: Sat, 08 Jun 2024 09:21:45 +0200
In-Reply-To: <20240510233329.149a2e5e@windsurf> (Thomas Petazzoni via
 buildroot's message of "Fri, 10 May 2024 23:33:29 +0200")
Message-ID: <87msnvaohi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8189fs: bump to latest git
 commit
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Thu,  7 Mar 2024 15:32:27 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> Bump to latest git commit to fix the following powerpc64 build failure
 >> raised at least since commit 25956b29e4d63f599b9baf7298f69538ba2f22fa
 >> thanks to
 >> https://github.com/jwrdegoede/rtl8189ES_linux/commit/c7bf7590bc0d7252005fd0496898ad420a85e1ae:
 >> 
 >> In file included from /home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./include/drv_types.h:30,
 >> from /home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./core/rtw_cmd.c:17:
 >> /home/autobuild/autobuild/instance-7/output-1/build/rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786/./include/wifi.h:459:32: error: conflicting types for 'get_ra'; have 'unsigned char *(unsigned char *)'
 >> 459 | __inline static unsigned char *get_ra(unsigned char *pframe)
 >> |                                ^~~~~~
 >> 
 >> Fixes: 25956b29e4d63f599b9baf7298f69538ba2f22fa
 >> - http://autobuild.buildroot.org/results/83153ed38a583ce2712df9b142ac3fc55a8413e3
 >> - http://autobuild.buildroot.org/results/63186c7adb5ecc8b8a16a6ae641ecfb9c03478bd
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/rtl8189fs/rtl8189fs.hash | 2 +-
 >> package/rtl8189fs/rtl8189fs.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
