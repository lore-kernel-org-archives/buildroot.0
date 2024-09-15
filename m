Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA21C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2811E81E37;
	Sun, 15 Sep 2024 21:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLSFr5-RBAVC; Sun, 15 Sep 2024 21:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5DF581E1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5DF581E1F;
	Sun, 15 Sep 2024 21:37:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15C661BF954
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36B126089B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4yQtVcx2cTX for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0756A60886
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0756A60886
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 002078368C; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 09:35:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a638a990607b14cb0ba1824b2186981e9c2a73dc
X-Git-Newrev: 96f10934763edd7ca781de44c6a7cc9e915e4cff
X-Patchwork-Hint: ignore
Message-Id: <20240915213638.002078368C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: install cmake files
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96f10934763edd7ca781de44c6a7cc9e915e4cff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 4349746dac6f55b0b0faca21a7e609fb67d1471b
which states:
    commit 4349746dac6f55b0b0faca21a7e609fb67d1471b
    Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
    Date:   Thu Apr 18 11:13:50 2019 +0200

    package/boost: don't install boost cmake files

    Since version 1.70.0, boost installs its own cmake files which are
    utterly broken so don't install them otherwise all cmake packages using
    boost (host-thrift, domoticz, i2pd ...) will fail because
    BOOST_INCLUDE_DIRS will be empty

    Fixes:
     - http://autobuild.buildroot.org/results/4ada26bab5c1e6504c7d8c92672326ced1d336df

    Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

However, this has since been fixed upstream in the five years this change
has been in Buildroot. Furthermore, having --no-cmake-config breaks packages
expecting to dynamically link to boost::log with a multitude of `undefined
reference to boost::log` errors.
See: https://github.com/mendersoftware/mender/pull/1663 for one such example.

As the --no-cmake-config is no longer needed because the original problem has
long since been fixed upstream, it is safe to revert the change.

Tested with the following packages as a smoke test:

  - host-thrift
  - domoticz
  - i2pd
  - libcpprestsdk
  - log4cxx
  - mpd
  - libcamera-apps

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/boost/boost.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index bb73edfda6..61284b967a 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -103,7 +103,7 @@ BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MA
 BOOST_DEPENDENCIES += python3
 endif
 
-HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
+HOST_BOOST_OPTS += toolset=gcc threading=multi \
 	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
 	--ignore-site-config --layout=system --prefix=$(HOST_DIR) \
 	--user-config=$(@D)/user-config.jam
@@ -116,8 +116,7 @@ else
 BOOST_ABI = sysv
 endif
 
-BOOST_OPTS += --no-cmake-config \
-	toolset=gcc \
+BOOST_OPTS += toolset=gcc \
 	threading=multi \
 	abi=$(BOOST_ABI) \
 	variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
