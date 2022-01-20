Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B151AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 17:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512E760F17;
	Thu, 20 Jan 2022 17:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UUgn8ypj4bbF; Thu, 20 Jan 2022 17:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2F2B60E0F;
	Thu, 20 Jan 2022 17:21:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1113B1BF40D
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 17:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C74740151
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 17:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IrpmHNnVcygI for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 17:21:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4237400B9
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 17:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642699300;
 bh=a73UbLuX3f9+G8ezMxrjShgpBXTEefI1gwWZH1PXB+g=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=FWgKkqzVtp8Tuzqk1Ou35JNsleJQT0BZJ5yEgUFVEa41udTQKqZxMxfRYpn8WuRWU
 2Rb9RdZLw07DUexgocCed1Y2fMFW2kuSFYTDZ2QpwcSEWHk3VaTOXBnIaBLh5I5IlA
 gs7ISqVJuHvX4L5wAPfqyTBOh+FZHEC4DWW64MJE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MYvcG-1mogYW2E9Q-00UulF for <buildroot@buildroot.org>; Thu, 20 Jan 2022
 18:21:40 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jan 2022 18:21:39 +0100
Message-Id: <20220120172139.25705-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:i9JjqdqtZZ3mwASoH9J0FKtn19zQHGgyqb63TQlvGvWznSyum7S
 BZQgm5A2hPfzI/WDSw4epqp//yhDwxI/R+0AZxp75sGKiEkgT6/SPUj9AZuodF5L8aw8MOE
 GTcZEN4QOWQzRPJqCjpLCrEE4DQ74ohKHMH9dMmMWJqgldhfifKQ1oB+EvvNOLnECg2+Meb
 eGGptMiwyDpdgIYl6ydNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mmh6m/+wdLY=:cyOOFyB/KwNI8ncL6Vcwi4
 /ga8zqRHRo41uW0vVQB93dQtpcHEto9RVkZO5E0C4XJw+J5UC3+PbhdF5xxGb3cY0bFTgvK4o
 lSm9qod6jbF1mGKtOOpXsfX0SUkGou5sU8cnlKakda6ekjX4S0TeQzibCOxmwtxmDgsvaMqZ+
 8IOPmes0jhaj3tHpUbGF91oNF5Zkd9xYUjQRIN0vL3muGV3+I3Nab9PE2RGxmWTGFqVrEnn1X
 XEP1rzuUuMbN7Wil7/GehB57xdLp1bqP+xXW9WYG67vJoPHpEopuAMxl2IS7L+igvkwR/HIvt
 BQT6/GS64ma6Jk0rm5PGDw1IZxnjA+Cff2i2AqsjO0NZR/geGU4dd5VSWoYWE2zMjLvdB8gsp
 n+a6X+ub8d80X4wZETKIsALJ6xGg8EMDBNajBxFFYEIRl7JVoXOhgaLkk5lFZRSfju+HPFPmW
 3Mmqk0Miu2jjS9Fk9irNAUSNxRqaHi1m0UrCihgtRbJrGU34xcGY7lDBFN1SB1OCe6RDeQEWo
 nd3y1xC9LUsRl4xv7hIHX/evlnqr/Gk+Ic0soNXEiYKLV0MNCginjgwWTdnSRVk4l/ORzmffp
 EMOpfDGGbFv/he0qkF/ZmUwexgV5rHepO2Uasre0e1zZLj8OWDR5hy4F3y+vopDALkkhRfXa8
 72TZf6rE70fMwhxLKE7RiKZWaqqQZXcdgCzaOX0oP0PXLBVJ8/qPNP8TkJA0oEjydLCfbb3mM
 obNJORPz79ewFbQfOK4NAhe/wjRxax2ZP10p24u2RzmNlnNfMt9xUwFE171+WzWd0TJxsSShG
 92nGaS16/JbrpQtl4ABzi8ZuEw0JDXbTZdqlek6wkGn6ACbenyNH8umwW/ZPlTsMy1KUj2+7Q
 2KyxdVVsyihztm6dl3YSxouVCsyn+6a25Fk9clIH/8EbOsXRuO0BbUxToJjhbBTitfoOrrWlS
 DkgWADTFfTrTuJyd6SkkmqvoIJyHV6UhMjRY9Sl1ASkDPKf580a565Sc5cJTWhzvTnKHPg9QG
 5KJjcRZvgeq1W+C0F/MfvVZnYXUezpEGco34FrJazkTA/fuPNu+c3nYYcbaftfkPyp48INSpX
 wD/ACUBWOX78wc=
Subject: [Buildroot] [PATCH v1] package/hwdata: bump version to 355
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 43cca03b06..7861106859 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ed9a2c8b90371ccf4f0ff88972d87770c1c644e63ca44d2ac72c33200642cdde  hwdata-0.354.tar.gz
+sha256  0d3d21af57822f35141b524808fd9e4823dbb413df338606195010dc0aa1c935  hwdata-0.355.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 71b59b95ed..4dd9c9e28e 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.354
+HWDATA_VERSION = 0.355
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
