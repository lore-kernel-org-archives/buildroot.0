Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711EFC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13E8740339;
	Mon,  6 Feb 2023 11:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13E8740339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTVn3axP2fxZ; Mon,  6 Feb 2023 11:09:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92E6A402EB;
	Mon,  6 Feb 2023 11:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92E6A402EB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9611BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7BCF410E4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7BCF410E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4KytvQmeAGl for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:09:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E3BE410E1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E3BE410E1
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:09:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CAC56FF818;
 Mon,  6 Feb 2023 11:09:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pOzNK-00DpWo-TP; Mon, 06 Feb 2023 12:09:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
 <20221127130739.1862398-10-ricardo.martincoski@gmail.com>
Date: Mon, 06 Feb 2023 12:09:30 +0100
In-Reply-To: <20221127130739.1862398-10-ricardo.martincoski@gmail.com>
 (Ricardo Martincoski's message of "Sun, 27 Nov 2022 10:07:23 -0300")
Message-ID: <87wn4vaw45.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [next 09/25] package/pugixml: fix configuration
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

 > Commit upstream 1c5a0bb32583fd294022e68e66b541bf6ff71a67
 > ":sparkles: Update CMake to modern approach" removed all feature
 > toogles, so starting from release v1.11 any flag passed in BUILD_DEFINES
 > was completely ignored during the build.
 > Version 1.11.4 was in use in buildroot since February 2021.

 > Commit upstream 0f1e75a902ef1751dd63a67fe223b5e8daf4c7f1
 > "Re-introduced the custom build defines" added PUGIXML_BUILD_DEFINES to
 > release v1.12, but BUILD_DEFINES is still completely ignored during the
 > build.
 > Version 1.12.1 is in use in buildroot since March 2022.

 > So switch the config options to use PUGIXML_BUILD_DEFINES instead of
 > BUILD_DEFINES.

 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Theo Debrouwere <t.debrouwere@televic.com>
 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > ---
 > NOTE 1:
 > The code below can be useful to verify the statements above, after
 > commenting some lines:
 > |PUGIXML_VERSION = 1.11.4
 > |PUGIXML_VERSION = 1.10
 > |PUGIXML_VERSION = 1.9
 > |define PUGIXML_FORCE_BUILD_ERROR
 > |        echo '#ifdef PUGIXML_COMPACT' >> $(@D)/src/pugixml.cpp
 > |        echo '#error 111' >> $(@D)/src/pugixml.cpp
 > |        echo '#else' >> $(@D)/src/pugixml.cpp
 > |        echo '#error 222' >> $(@D)/src/pugixml.cpp
 > |        echo '#endif' >> $(@D)/src/pugixml.cpp
 > |endef
 > |PUGIXML_POST_PATCH_HOOKS += PUGIXML_FORCE_BUILD_ERROR
 > |PUGIXML_BUILD_DEFINES += PUGIXML_COMPACT
 > |PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
 > |PUGIXML_CONF_OPTS += -DPUGIXML_BUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
 > |PUGIXML_CONF_OPTS += -DPUGIXML_COMPACT=ON

 > NOTE 2:
 > Current version for each branch:
 > $ git grep ^PUGIXML_VERSION \
 >     origin/next origin/master $(git branch -a | grep origin/202) \
 >     | sed -e 's,^remotes/,,g' -e 's,^origin/,,g' | sort
 > 2020.02.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
 > 2020.05.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.10
 > 2020.08.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.10
 > 2020.11.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
 > 2021.02.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
 > 2021.05.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
 > 2021.08.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
 > 2021.11.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
 > 2022.02.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.11.4
 > 2022.05.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.12.1
 > 2022.08.x:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.12.1
 > master:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.12.1
 > next:package/pugixml/pugixml.mk:PUGIXML_VERSION = 1.12.1

 > NOTE 3:
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

 > NOTE 4:
 > build tests on GitLab CI
 > test-pkg config 1:
 >  BR2_PACKAGE_PUGIXML=y
 > https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704564417
 > 44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
 > test-pkg config 2:
 >  BR2_PACKAGE_PUGIXML=y
 >  BR2_PACKAGE_PUGIXML_COMPACT=y
 > https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704755515
 > 44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
 > test-pkg config 3:
 >  BR2_PACKAGE_PUGIXML=y
 >  # BR2_PACKAGE_PUGIXML_XPATH_SUPPORT is not set
 > https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704849811
 > 44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
 > test-pkg config 4:
 >  BR2_PACKAGE_PUGIXML=y
 >  BR2_PACKAGE_PUGIXML_HEADER_ONLY=y
 > https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704851087
 > 44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Committed, thanks. It's great with all these details!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
