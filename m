Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407F8EE14C3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD34C82190;
	Wed,  6 Sep 2023 19:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD34C82190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1yup6wDl2lm; Wed,  6 Sep 2023 19:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37BBC8218E;
	Wed,  6 Sep 2023 19:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37BBC8218E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 113C41BF334
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF6EF400D0
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF6EF400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HxqfeLTPRJ7Z for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:50:38 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A68C54059D
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A68C54059D
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.144]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MDQic-1qWroS0y0s-00AXm5; Wed, 06 Sep 2023 21:50:34 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed,  6 Sep 2023 21:49:51 +0200
Message-ID: <20230906194951.280535-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:cMxvkH9mreNArxyY5ZWpkehcO7rm4K9HQKpm1mmHYeZSamQDmvI
 VCp7bBG7xxtiOEmgeO/pT6+R+0I0w3ZEgC7hQupQHtsp+ZDBPDBqfV9P+TlRsay6SJ4EUoD
 UB9KjyPTVYhAxQi+1BjV0WajlF+Rx1CO86s5eRzA80zD3uWmIHzZIoPzkLsms3OVpkT29Cw
 vnur8NmpY/pDyuid5Wutg==
UI-OutboundReport: notjunk:1;M01:P0:NtAUDlRE5Is=;8P1KR2eoRMYBbnHXm7V95/2C+d7
 kxAhogTJBqBCmT1QS6DDvrKAajUH4BhttW0ibq1e9QDUpZeRqyNYhGXWePdG0KKkzlQ8/ty2r
 AJO1CzIUkNTO1iN2ipVB7aCG4uC+LixIL/fWnPnKj0Hg7TiQtJMmX9lNBN0aArg8nV29xzy3c
 tOTYb0TdHW7aItGDAhbjo2IT1LmaujdgnO4MwJqQu3Z3tfTVmSnYRl89jiSmrLjbrymv/Mi7c
 gedL0YMUzpEK5WxayB3fQ7GiHBDxKPkFLzBnSUXIwuInINr+lOMtNzcPdN8kn8pdW4zNze2UW
 QK+LJWvdlvwF00GEt9IPdrHuuPhiw+BRy3HNNlL5tC7KQ8X7kNS3hAp9JI0kID7PG8hGQv0zy
 Rl/AalJlhxfacio15Ezy5wW/QK0vL7rfHLLx1EHszGH1QqijlYz4DpNncCnlT8SMcQFRDcmll
 We9578IB+IPTAdRB1ZuQci95wrYvcOfU1Jbp7gqss8MgrDXAEdD9LDZtKRPq7hh9d9kU9nopq
 USw1YUr2Pb3NxZ2hgUgwwwddDoLvMJ+GDZ/07Zw+uG+BTd7Cmo2dpRDbPei1q97PUjHnOP7ln
 J3fqwOAWB1kn0jPgKlBRKsNjMwtVJbxce+6eCmj88pndxkOgauyVrAI2C78vdG842tWGMOf0/
 eJPpGG/3QsVW1+nZ+OKCA2NeR+33/gJoPewVz+b623Bl+IMdycs/h9znHHOAe3FgWz1RMDZ6p
 KSa4jlO0/+WmQ+4nFkTBN7poVoZMzeogF4XdWnhPwqmkfrmrMiDLcL/kEFFC3Jt3Lit3RC3sj
 kTAJ4Jk+uSI663t3gnFlc/lgg2Jh7q9Hl1IyE4fNRoaAZi40w5Sxq5GGZp6QIj9STQFdqhDir
 KR0aBq3Q27qfki6+/sPU9T+5eTjH2tJBWm9Pv3PBXR4qqyuuPoWJCEXEqYxSWRBRHyTet6LgB
 iyqPz9r0P22JoptCMUOMFJYFB8Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1694029834; x=1694634634; i=dalang@gmx.at;
 bh=3RwxtnTEXjmb2AUgbuGjxto0zsSrIJEUKB/RjrTueXQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ChM4FcbuTSYQr60PvluHBJrBdqjdiYKI3waxMfbFFG08yTo484/Al/xdaHehFNioEHdJZdZ
 m4aZZYU/HCqKkkb+z2dk9ywojxmFtZYPpU4a5GV0OkcfDpBt2MAwdlYmmlSjvRCb1f1xH3g0B
 vXtKZ4TIIdTrh879X+eCnNRYajacWsrzifu+fdRX5drv6I5IDKOnLDV4HEo0L+bF5QxszDvqe
 pdOYZUCozGGPgIpLnZCZvziYVACydOw/kgIIzQLRZK77MyQ2QbiFaiIM/zHfCS87PGSl1duJr
 Q++n5oo3uVBLVJfhf3d9d5FeM98fs7Q6X0Sa8uQINaeOhHd1KQLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=ChM4Fcbu
Subject: [Buildroot] [PATCH] package/libiec61850: ignore CVE-2023-27772
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Segmentation fault in example code can be exploited.
BUILD_EXAMPLES is disabled for all cmake projects.

See https://github.com/mz-automation/libiec61850/issues/442

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/libiec61850/libiec61850.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 9bd55cb76a..4b61e40c6d 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -11,5 +11,8 @@ LIBIEC61850_LICENSE = GPL-3.0+
 LIBIEC61850_LICENSE_FILES = COPYING
 LIBIEC61850_CPE_ID_VENDOR = mz-automation
 LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
+# Examples aren't build
+# https://github.com/mz-automation/libiec61850/issues/442
+LIBIEC61850_IGNORE_CVES += CVE-2023-27772
 
 $(eval $(cmake-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
