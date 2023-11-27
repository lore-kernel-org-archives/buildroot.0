Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACD4C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 12:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1867740321;
	Mon, 27 Nov 2023 12:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1867740321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtzWe2NeUtn4; Mon, 27 Nov 2023 12:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 733134033D;
	Mon, 27 Nov 2023 12:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 733134033D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A68F1BF3A8
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 12:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D795380E8D
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 12:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D795380E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1ee2XAZhw8d for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 12:05:56 +0000 (UTC)
X-Greylist: delayed 371 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 27 Nov 2023 12:05:55 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4E6980E5C
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4E6980E5C
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 12:05:55 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 9EA88240028
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 12:59:41 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Sf3zd1pyXz6twq;
 Mon, 27 Nov 2023 12:59:41 +0100 (CET)
From: Alexander Egorenkov <egorenar-dev@posteo.net>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 11:59:59 +0000
Message-ID: <20231127115959.25625-2-egorenar-dev@posteo.net>
In-Reply-To: <20231127115959.25625-1-egorenar-dev@posteo.net>
References: <20231127115959.25625-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.net; s=2017; 
 t=1701086381; bh=ZrmTYvlF+xIt4wvJ5UEYYDKOZKmY1I0zNZ9T1KTYZac=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:From;
 b=NYmNvMFOHnTfFhoyH4482y09Ikz0KhtoNTEmBds20hCHU2fo2NFb/1lRI8Fh6EOnh
 r+4YYiqqrYoYZEj0utmNgVKQwsglwWc0gg8YmoyA1nm3h0etWycPBfMCTQlIPBpBZb
 SP2gVY2nVxWMQ3zLeWm5QAEW1QpERkrhhFZmLQFGZo/62u3GY95wuULF9k1TrXe5UF
 xKWiSulT9kf+e0Xjrk2LVyXDmQyxCfA5pXVBhjnmfnGvn+hTZyec+d2hieb8SZFQz8
 peoSqw1Lf/1EIfYN/JcPTlTbE9WG/gW09y6yp1rnx2MzSFiBAxi5tb0swA9Rv1Aot/
 nEU5SKRNNSCQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net
 header.a=rsa-sha256 header.s=2017 header.b=NYmNvMFO
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to version
 0.9.7
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log:
- https://github.com/opensvc/multipath-tools/pull/77

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 package/multipath-tools/multipath-tools.hash | 2 +-
 package/multipath-tools/multipath-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index 06aa5ccc809a..0f51c3884645 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  401c6f6e8dc5d3feaaee76280716aee718579ac024ce4f2fae77c798dc7a0f9f  multipath-tools-0.9.6.tar.gz
+sha256  8f0a7ddc01137d0f90ac3ef5700131dfbd6cf3bbbccdcfa317e8379efa328d59  multipath-tools-0.9.7.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index 7071e1fd1b33..e62e85e14daa 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.9.6
+MULTIPATH_TOOLS_VERSION = 0.9.7
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
