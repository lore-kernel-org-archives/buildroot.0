Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A56EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 20:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 984C340182;
	Mon, 13 Dec 2021 20:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJx62AcaHfwc; Mon, 13 Dec 2021 20:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC9B84038E;
	Mon, 13 Dec 2021 20:21:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3F41BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 20:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8811980BBF
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 20:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgeaSDpTMjHi for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 20:21:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24A2580B9C
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639426877;
 bh=AoVEoMdwVJIpW/WGf879ORYsiV6Pf6yXLCibT4ToB30=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=QdDaNTbx7JzeVxKU1BmC1YeryB6aGwaj5E8mDcHuJpWh9hBWDGW8cMdHrEw4wM6NT
 2msFoDdkh7DUYc2yBzgyIgw3MJwNqDuHM2ZrHchKgR65kftz3Hc9vAX0a5lVPYjAzz
 OhQXwK/IiZH8KdQ/vv3NBttLZKFLLzgRB/GBNO0w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.61]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0X8o-1mZipN0GdY-00wWbD; Mon, 13
 Dec 2021 21:21:17 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 21:21:15 +0100
Message-Id: <20211213202115.21705-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:CRSJte0Vxt4uWSZMzVn7vWVwJ6cLcFRbYta6MbIO4Q8eGco2BwW
 TVwA5Uv60pyZHuX7T7NEPpB8NMY51fGYZvD9qUHgOxIRtaswEyyqOgIl6BEjWJO/eF9LaCh
 hjPH3ZsX/56w9vFhdg3EdTd2tLZ+iI/QaUrNNp04m651IU8W2JgRp6dRMLra0i3dYyxJypC
 WkvDxHc6ROCHei4+ceeTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ot2d5aQU5ks=:QSzHlQt/hJXxunoIVIAnoD
 tz+i82ijMGV8Beh3Izuyx/cOo+JtWwrygKzrsP0elRNl+O9LJVWb8dBaoTeqCBvj2fVJfdeSD
 KM7p3y972yFb3lgvfrEYfPEDp3SltlGB8s87cTKBzASVWLkhw6UWgBHger8BilA9Gp0ZJdEr+
 BTldS/LGmaT1AYwjlC1PPeh2KYwWKlySKqAXdjnupBO97yB9TzWcX+9rDjObQKoa2igaxxAiq
 UU2g1gdab4o0hlkPKqYT+hbtMWH5oCKo57reYEJjEXqMfbIjFwg0kwdXkKddO+pTQJozrcIwM
 FrkyxGNI5MagCjK0YLZtZff2XYmm9M6KtLJEIeN2eOYh1f/UHU38JKjNR0y0nzUwad6kSJ3KW
 LL/Kt9NRp3SVdaMC4PpuuGuzpe3TIE/zC8XWg+C61olA6F0VWI/hif/XxzxuACyjNgKIp3dSL
 xN8aYKf94CPpPnGVE0NCSJ9hx63C+NCGh0xhvF4v9GazKg5e+AYk/lKIb2SJ0MRi8X9KEDpuA
 Tw2p5mgkbTWRtFDopuXd002Qn3tyPoDtQxAsjw2eXkxDlp9/8DsDu9VOAu62Rt/scYxYfCyYA
 To/PJLYbcaTD1xtX1k+Ok5LZgjwXRYEzy0OMt0Fks5ThFfmnGp/mG8s7i+pnBqVrVI2a5r5a5
 E7W1nseMlxEj1uO+jHx4grVWpVosvSXxv9DgXqPbw180FZkJM7X5g0L20AmDmE/NdOaqAilZH
 GmxfRWr9U2XdS1t37NrLxfL7sByFqugYMddwFVdWfiNm3oM9v/9F5CetY/rEKcwnZY8uSKJHy
 ++IPUXfzrsv9I798TC7wZj3gYNTcKoyIG/bsr+EoFspnihtHR08eL5LmuHqqq6PBwqctPDEwb
 noeezMRDqxAGPhaoYD5t0uOVJDRRciHx9Vg9k4FH13HWla2GJzWdbKvt3WpUKlDyTMBrb3hhm
 b7uzvXc6iBzbh8eVMa+uVWWlAbNefdcEwiu9dx97B24DcxJ5ifjdapKt04+HsyXvs9rJ5Mjt7
 yA07LfVSo/W+ZJ1DfjVohRCOeeS8baEk21S/PY/1n9SvW1JuryoNr8WsOLPdw5e7gWbUnhtpK
 G5yOBukWNNqhW4=
Subject: [Buildroot] [PATCH v1] package/iperf: bump version to 2.1.6
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog ([1]):

  - fix tos (-S) regression
  - fix --permit-key regression

[1] https://sourceforge.net/projects/iperf2/files/readme.txt/download

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iperf/iperf.hash | 4 ++--
 package/iperf/iperf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 924d10b3e0..2e1f433dc7 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1  b9d0868a6cdd970c1835d3d1a264dd54907f2c5c  iperf-2.1.5.tar.gz
+sha1  41bd049625cbecda2bf5b6a6cc12a6c5baec549b  iperf-2.1.6.tar.gz
 
 # Locally computed:
-sha256  56ec1312d24bd2c78790e67c96c0a991c82e71bc4c0b0d37171bd89c9fd6ef3e  iperf-2.1.5.tar.gz
+sha256  4a43e44439b95622aebeee55754a17d1c94076032e90620dfc1ab9908cb9e080  iperf-2.1.6.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index a3d95535b3..f999ff4ac2 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.1.5
+IPERF_VERSION = 2.1.6
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
