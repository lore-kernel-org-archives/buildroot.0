Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C5DCA0FEC
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 19:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60F5F607A1;
	Fri,  1 Sep 2023 19:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60F5F607A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEYghiO2ooiV; Fri,  1 Sep 2023 19:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABC24606EC;
	Fri,  1 Sep 2023 19:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABC24606EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5924C1BF576
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E75B40914
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E75B40914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r74X-7hc_t09 for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 19:28:33 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F17AC40905
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 19:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17AC40905
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.144]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N2V4J-1pfkc11rwN-013vbA; Fri, 01 Sep 2023 21:28:26 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Fri,  1 Sep 2023 21:27:14 +0200
Message-ID: <20230901192719.102415-6-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230901192719.102415-1-dalang@gmx.at>
References: <20230901192719.102415-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DSijZ41Dk35q1ELbriFJPQJ5TeTpLJ4mLG7WZT6e0GI4ERwjPUY
 d33HVGp2Ux+6JxcgUE22oQRQddybUmczhb3d0YGFbI7AcAUDdvjNNnlkXqnehFI69J9icTo
 YPlzHYa8n3LRTsfzDBWiqLybGWqpzgJCKz40j3yVHPlqp/dF88e+6AkxlIu0VYxbCKvPkhj
 u2w0dAREu7RcIsrTdI1Bg==
UI-OutboundReport: notjunk:1;M01:P0:oksHY7iOh5s=;MJnaGavwWyENqDcNjKXsLhe/G/b
 GKzd3JcQrSa8TZc/T1i/rSul70sDFzZ9lXmSVHMa2iSGpIIE0lr3Mqemov3xcHjeDiKuqmhYy
 WetnyMu54t0rshGH+Ju2jbDkGw1yzX/0XKmOoYGqVaf3X4Mxf0Q4uEe443GmSZxOs2wq4ckcG
 MfZZ9r6pIn9JE+q1aMKGaSz4P9kuCpsFJgAuAPHo1qYmzzhnHU0fX9/oruRXY4nyOv6AjOk1H
 iYMeJAp5bA+/R1yegqbMQOHOtWNuQL2BfzhGwnVYKdz+FSBj+OY5lnkBNboiG3vhJU4OlzsIP
 OdqGFJ+019NwgPeeZmWo96HsxoQCZ2DJFX0gVW8kYHXVTGBWqPFzpmVGvTdlx76lWEN8rnw3h
 x3lfAQqte63lUr+ZQNtPzQU2IdQZMN6kicTluyrA8qtJlhxJv1GWt5eDXfLnuw0rBJDo5Mwu6
 tOFFcfCxc3be0aEeYu77rtG8WtESkq+kTThbpv72UBHIAYc42/4hwh3ajvc944Jgdz8Q/aMTg
 q7tPlbVW2I9sX+sWgext/IWS6vFT8UFWm3Ogtm+7tSATaDLIKyvALgJ6wUMlCEZR+G/cCQF/I
 5Gn/bY16mIGX694gN/mzBZvs6dfERNq+gzIYfC2+ixZGgjiYUNueJj8zATCef2OND6CVsoG1Z
 kL8Uxfk5yObe8v827KtQEDEA+2fOot5WXghsv9//38xWpwEsITVzEJgYMwVh6da5FmrELbg+H
 WzpofhAJKp7CQ2eaLg3KZR7op9D/Tz5ft6fyVPWsEuyyP7KYMLEnzQouF07pUSP2r0IUHT+dP
 x+INJ2hewYiOLnOgdDo5XDMl2xuz6WBN+HROEZWdySZZ5rSUDvRoRBwR5yXMKkxybstzLa6rm
 JMBkW612wjfgwpf3hmHSXbQt37fV71YKoNZtM9A+nW4XbJYW/wuXAAyHerQ14giSyH5z8zTkJ
 X9FSQetfZRiIItlsSg7XOv5RY2A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1693596506; x=1694201306; i=dalang@gmx.at;
 bh=tOwBRAB4IwQOo2f5WGDAPSd+C80ZFq3zJAppJZoP9GQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ezEDWi8XePWfXXMUuXWXuvd3KhkEZlXzZuvlCS2r3ASVpm435aR/sG/2z4nYwjTdeTUGz8J
 82rspOUKAuc8L92t1qpHJAOaxaX35lo5xzhjVfaI3hoiA0OlFO/i5JFyQ3EevLByT9r1vCdTj
 yJcKN26dXuaglF1j5garkmWTUOtiElYLdqmY48NGYlP88NJvP0l8DxW59//cZEUUqKKI1Tkkg
 nilVRJQ3QNjcmCAo8yUCHLmUANICWsBZKaYKrh7orPsppFVQWiz6Kd3MwuxSw4RReWwmf9esu
 bldxMa0+Gqj6jSzMLFNZw0whhpvQitaaDQ6yaVlPAevs7rov0Hhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=ezEDWi8X
Subject: [Buildroot] [PATCH v4 6/6] support/scripts/pkg-stats: Only match
 CPE vendor and product
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of checking if the whole CPE string is known in the database,
only check if a string with the same vendor and product exists.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v1 -> v2:
- patch added
---
 support/scripts/pkg-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3d6c53a353..d48582ea3b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -654,11 +654,12 @@ def check_package_cves(nvd_path, packages):
 
 def check_package_cpes(nvd_path, packages):
     cpe_api = CPE_API(nvd_path)
-    cpes = cpe_api.load_ids()
+    cpe_api.load_ids()
+    cpe_api.generate_partials()
     for p in packages:
         if not p.cpeid:
             continue
-        if p.cpeid in cpes:
+        if cpe_api.find_partial(p.cpeid):
             p.status['cpe'] = ("ok", "verified CPE identifier")
         else:
             p.status['cpe'] = ("error", "CPE version unknown in CPE database")
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
