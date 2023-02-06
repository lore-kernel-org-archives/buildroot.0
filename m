Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AC9C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E16EB60A8C;
	Mon,  6 Feb 2023 11:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E16EB60A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4FBwnE5sj7pm; Mon,  6 Feb 2023 11:12:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F880605A9;
	Mon,  6 Feb 2023 11:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F880605A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEBDA1BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68F0040374
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68F0040374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p71kJBL32v-l for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:12:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 644954039D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 644954039D
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:12:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32CD71C0008;
 Mon,  6 Feb 2023 11:12:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pOzPo-00DpeK-GZ; Mon, 06 Feb 2023 12:12:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
 <20221127130739.1862398-11-ricardo.martincoski@gmail.com>
Date: Mon, 06 Feb 2023 12:12:04 +0100
In-Reply-To: <20221127130739.1862398-11-ricardo.martincoski@gmail.com>
 (Ricardo Martincoski's message of "Sun, 27 Nov 2022 10:07:24 -0300")
Message-ID: <87sffjavzv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [next 10/25] package/pugixml: use explicit build
 options
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Commit upstream 986b7ffd01aedcd4f2aa16e78e4cad9313b6d7b2
 > "Add Cmake options for pugiconfig.hpp" added feature toogles to release
 > v1.12, including PUGIXML_NO_XPATH and PUGIXML_COMPACT.

 > Commit upstream 5f49f2c6575cc2b7d343f8d41581fe92d69d7b52
 > "Mark advanced options and removed redundant ones" removed CMake
 > specific support for PUGIXML_HEADER_ONLY and PUGIXML_HAS_LONG_LONG, but
 > they can still be provided using PUGIXML_BUILD_DEFINES, starting from
 > release v1.12.

 > So use the explicit build options PUGIXML_NO_XPATH and PUGIXML_COMPACT,
 > but keep using PUGIXML_BUILD_DEFINES to set PUGIXML_HEADER_ONLY and
 > PUGIXML_HAS_LONG_LONG.

 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Theo Debrouwere <t.debrouwere@televic.com>
 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > ---
 > local build tests to check size:
 > pugixml-compact/graphs/package-size-stats.csv:pugixml,165216,1.9q
 > pugixml-default/graphs/package-size-stats.csv:pugixml,152928,1.8q
 > pugixml-header-only/graphs/package-size-stats.csv:pugixml,13660,0.2
 > pugixml-noxpath/graphs/package-size-stats.csv:pugixml,95532,1.1
 > pugixml-compact/defconfig:BR2_x86_i686=y
 > pugixml-compact/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
 > pugixml-compact/defconfig:BR2_PACKAGE_PUGIXML=y
 > pugixml-compact/defconfig:BR2_PACKAGE_PUGIXML_COMPACT=y
 > pugixml-default/defconfig:BR2_x86_i686=y
 > pugixml-default/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
 > pugixml-default/defconfig:BR2_PACKAGE_PUGIXML=y
 > pugixml-header-only/defconfig:BR2_x86_i686=y
 > pugixml-header-only/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
 > pugixml-header-only/defconfig:BR2_PACKAGE_PUGIXML=y
 > pugixml-header-only/defconfig:BR2_PACKAGE_PUGIXML_HEADER_ONLY=y
 > pugixml-noxpath/defconfig:BR2_x86_i686=y
 > pugixml-noxpath/defconfig:BR2_TOOLCHAIN_EXTERNAL=y
 > pugixml-noxpath/defconfig:BR2_PACKAGE_PUGIXML=y
 > pugixml-noxpath/defconfig:# BR2_PACKAGE_PUGIXML_XPATH_SUPPORT is not set

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
