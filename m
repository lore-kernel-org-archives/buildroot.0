Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0201FC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 18:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B5224141E;
	Wed, 10 Jul 2024 18:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lljf4vAnWkxD; Wed, 10 Jul 2024 18:39:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 762FA415D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 762FA415D0;
	Wed, 10 Jul 2024 18:39:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B77FF1BF471
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 18:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5D5E81E40
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 18:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXdxtjRRw97h for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 18:39:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5602881D65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5602881D65
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5602881D65
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 18:39:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.32]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1sjgVx2JXa-00Z546; Wed, 10
 Jul 2024 20:39:31 +0200
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 20:39:17 +0200
Message-ID: <20240710183917.387437-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:SmBhDexSijKw9RIDQ01O0v8htwWii7deAchXyIwdwlN9yJc9wUd
 DR/l8xXCWC+wZQ01kbPpbn3Pp1trx0gnABT7bfi43D8vlIeJuqa/ygE6397qUNIuIkCmm+m
 jpbb142eRQQPVjnwOKfWA1FXgoRqsN7CMKa9p46F1mZbm1x3XdiYUaSqbiFi/lvq0xBNXhU
 /EeOfzTC6cPGxGe9n1sMA==
UI-OutboundReport: notjunk:1;M01:P0:AwE/PhMl7Ao=;UJPKhPrzsG4V5kssrgtzp2UkjtE
 sSdEntHYDuWzek+yWbNhXoLcWjOBeclxNe9K91D17o2ELmiH8Ddm6rovwB3vg3scJSmQqudiT
 WVqdngvhHhTlegenWlGOpLPmUDhTBislkJADn7FhXgqTsjuQh62HXl9VEaYgrYUZeGMOIFWJ+
 n80fW5KqsL+tq1FRg+aCMqvOoL8VWIJNwfjCUtWtVZpkX0OAlpqftcYGII0lGKQGes2DMIwYn
 ZF46o9BHs6YcCBdsxnQ+qLgstky+m+0iGiN1MJTmvz7Zdn2pqS93ChxxondkR951aIyN4ND3n
 T99eqC7D5wrFNbmwBB1jEUG3Kiw9U3ekqbcWbdCLwY/8/JraVCuj9jIYD9sVlB+AvMh+r7HJg
 IF5Z1SF7ocsPnapLIAXW766TGoJAF8NJ3hqginasEcD1a0bad3yz+X2brsrH0hgWjdLfxilrN
 CBxs9UUiTYnRCyhvaIhRom/zZ8bVPjhRfOyXe4Z4KJJ42oASXKd/uchcR31+pj/DaSbDC7fFh
 lJllS9lSfKj+jUJlYdaJWdQd2iOVVDxiceZdGCQ34QB0JpBLQ/m2kDsog8zm++i99CdM7X6P7
 2KAx2sreqD/UQqcqxFpR07B9wUdPazX06Vkj4CroQMMVHpmO6zD9JwRDxsp6NBd7YDyHgVjyW
 2mJN0KdzYQUpGh6IPSQu0dpD6FFfwGGFT3WPPVsN8+u7FZWiXiz/2Og1PGoorARMuj5ioht0A
 vvCzxCEZJ9eJqRmQ0HBlnN6AGCoWLl7mv8fO+AzkQ0Y1vaIdyLtSSSJ4kpyYt2Iv0Nup6eTvX
 bADqHXFzRMFz0Stk8OYqL5IQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720636771; x=1721241571; i=fiona.klute@gmx.de;
 bh=6qKw7zn5g4fVwrjcKNsAyobFdDrrQao/T7ke9MRW7HI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=smRBeYIEtGoK+Rp30LDIIP1VpCO/m0fuN4X/Hq64OA/NPOjg2zxQGAkE4HAh0QJl
 sIoUDBAiQB8rh9ic9VRqY6ORPHjCuHJCeKy+UTVrQU0Y1VQaXdRVfP09dd0y0D1Bi
 UatE40YIDV+IAflAx9LyTFF5umQMWjhVJbThMNvAn1Oef5bDkVp7fT+5QZTDZKNZN
 lA+JDXhQ+tCLHQbNT6TOe1zRuNQNxkwdFsume0z94CYwHzqQPC/LKyk/fS8SJ6xQG
 44Hunip/HtEUA1fLqb3/I2K74CxuZQYhG5uPXT5q6k6JgO9qph9B1eifXp/vvcwNy
 gzKfB2HWFprpgyJsPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=smRBeYIE
Subject: [Buildroot] [PATCH 1/1] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The BR2_EXTERNAL environment variable is passed into the container,
and each path listed in it mounted. This allows using external trees
when running a build using utils/docker-run. Testing the existence of
the variable instead of a non-empty value allows passing an empty
BR2_EXTERNAL variable to disable currently set external trees.

Note that splitting multiple paths listed in BR2_EXTERNAL will break
if any path contains spaces, the added code shares that limitation
with the existing code in support/scripts/br2-external.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 utils/docker-run | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 1adb02d74e..dffe784d13 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -90,6 +90,13 @@ if [ "${BR2_DL_DIR}" ]; then
     docker_opts+=( --env BR2_DL_DIR )
 fi

+if [ -v BR2_EXTERNAL ]; then
+    for br2_ext in ${BR2_EXTERNAL//:/ }; do
+        mountpoints+=( "${br2_ext}" )
+    done
+    docker_opts+=( --env BR2_EXTERNAL )
+fi
+
 # shellcheck disable=SC2013 # can't use while-read because of the assignment
 for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
     docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
