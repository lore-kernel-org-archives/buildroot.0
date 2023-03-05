Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4724DC6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECA3260E66;
	Sun,  5 Mar 2023 18:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA3260E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOub_rYq_e7I; Sun,  5 Mar 2023 18:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A5660FB9;
	Sun,  5 Mar 2023 18:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A5660FB9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 050F81BF865
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D461E40592
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D461E40592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FV25PKs15I4z for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:57:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A366A400F3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A366A400F3
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:57:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5FCDE0003;
 Sun,  5 Mar 2023 18:57:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYtYQ-001lbC-Pd; Sun, 05 Mar 2023 19:57:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230228221624.59583-1-fontaine.fabrice@gmail.com>
Date: Sun, 05 Mar 2023 19:57:54 +0100
In-Reply-To: <20230228221624.59583-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 28 Feb 2023 23:16:24 +0100")
Message-ID: <87edq358lp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pugixml: drop header-only option
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Header-only option raises the following build failure with gerbera since
 > commit cc3a4a7b1de7b158354c650d234339e8a969a730:

 > /home/thomas/autobuild/instance-2/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.4.0/../../../../nios2-buildroot-linux-gnu/bin/ld:
 > CMakeFiles/gerbera.dir/src/main.cc.o: in function
 > `ConfigGenerator::~ConfigGenerator()':
 > /home/thomas/autobuild/instance-2/output-1/build/gerbera-1.10.0/src/config/config_generator.h:33:
 > undefined reference to `pugi::xml_document::~xml_document()'

 > This build failure can't be fixed by adding a
 > !BR2_PACKAGE_PUGIXML_HEADER_ONLY dependency as it will create the
 > following recursive dependency:

 > package/gerbera/Config.in:1:error: recursive dependency detected!
 > package/gerbera/Config.in:1: symbol BR2_PACKAGE_GERBERA depends on
 > BR2_PACKAGE_PUGIXML_HEADER_ONLY
 > package/pugixml/Config.in:42: symbol BR2_PACKAGE_PUGIXML_HEADER_ONLY
 > depends on BR2_PACKAGE_PUGIXML
 > package/pugixml/Config.in:1:    symbol BR2_PACKAGE_PUGIXML is selected by BR2_PACKAGE_GERBERA

 > Moreover, commit 48b2e50eb8df36e3e3ab18692bd9e0dde3b38702 stated that
 > "Compact and header-only modes are not strictly needed for our use case,
 > but we did the work anyway and may be useful for someone else."

 > So dropping header-only seems to be the right approach

 > Fixes:
 >  - http://autobuild.buildroot.org/results/800537a1ef5f48d24c20aad7a9c96c56dfdc77f5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
