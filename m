Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A371C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 19:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 287DB4171A;
	Tue, 29 Mar 2022 19:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jY5NT3Swuij; Tue, 29 Mar 2022 19:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 124D0409DA;
	Tue, 29 Mar 2022 19:56:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43EAB1BF83B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31241600B4
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bErFX5w1WanH for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 19:56:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B99EE60011
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 19:56:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C31FA20002;
 Tue, 29 Mar 2022 19:56:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZHxL-00G001-UF; Tue, 29 Mar 2022 21:56:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220315205918.2211690-1-fontaine.fabrice@gmail.com>
Date: Tue, 29 Mar 2022 21:56:43 +0200
In-Reply-To: <20220315205918.2211690-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 15 Mar 2022 21:59:18 +0100")
Message-ID: <878rssa5xg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rygel: fix g_ir_compiler calls
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since bump to version 0.40.2 in
 > commit 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3:

 > [108/298] Generating src/librygel-core/RygelCore-2.6.typelib with a custom command
 > FAILED: src/librygel-core/RygelCore-2.6.typelib
 > /home/giuliobenetti/autobuild/run/instance-3/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler
 > --output src/librygel-core/RygelCore-2.6.typelib
 > /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir
 > Could not find GIR file 'GUPnP-1.2.gir'; check XDG_DATA_DIRS or use --includedir
 > error parsing file
 > /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir:
 > Failed to parse included gir GUPnP-1.2

 > Fixes:
 >  - http://autobuild.buildroot.org/results/2b8956818f03f66a53480f7ed5fc0abb4f05288d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
