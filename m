Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9481EC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 11:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EF45400DD;
	Sat, 13 Jul 2024 11:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0KkkRlJDY-t; Sat, 13 Jul 2024 11:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDC67403AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDC67403AF;
	Sat, 13 Jul 2024 11:53:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 862BB1BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7288E40105
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEhuo7S0_vj9 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 11:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06669400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06669400DD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06669400DD
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 11:53:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.6]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7R1T-1sJ1a241TJ-00yYK1; Sat, 13
 Jul 2024 13:53:00 +0200
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 13:52:43 +0200
Message-ID: <20240713115244.848755-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:jse7kg62NjGhTXknFUXxh6Y5Ip02yA7VmrT1UkgIVNszY7r6mSo
 YsH1d8o6UQmrZozygD9oFv/idE/8lSHAPw4wtfjOEtBD5cG8g5wq4e3Y5cGb3i6qD/LTzjS
 GD5GHLGYngBwRDT1XMYBy7d6xJ8SNCCUbowoA/Mshkc11hafypYT9F0nWzaIS91EFDAtacW
 zKwrCl6LhcxpXMzV24w8Q==
UI-OutboundReport: notjunk:1;M01:P0:dU0sj1aIT8E=;jQewHCJQwIMrWBcaa79F+SZavdL
 Kzc1zAnB9PMd4hbu4Mz1ax+9QRsGAysa0sYIDimfdcSyFOBlbpBRjTjvf2Q8b/Z8Y5Y03R+eR
 vrw8tiQ6AU0DfJKMhnorYbk4TEbSdJA+WxKzkX0tTBfgMhRFlmFRM4ab2uAcd02Dn/yrVwa0y
 SHFh17GZzj758wqsYmduarBd3IjIzqED0+fOoouYyZc+9fPrcazD1ueyOypm7rzFcTPFuhCor
 TxEWdjjC4nzPk3AcK0eRH84bPbmYzF1s3Jtgo+rSCKuWMOO8dMVprkyrSdYDEngyhLdUM4Z3w
 O+9xu3Qhree8xUh0r2r7maue0EDwxt+R6SLO407oztaTudl4gSC9jJrQ9eGtNuXYQ/nNES/4q
 mRx1rc5No78OCHENYyAS0TPHZDTQ8IfBwJJkkZ8MtA7loUuyGlPgEsWCfKdnKSl1/6Aagp27b
 rYLTlj/xFTJblTn1muj9utHYFt/EqtLSjPYzMlAYcxAHV15+kW70eXwxiQ3a9uwpQ+KrGytuB
 w2NCuhOJT1y+WPBwZzQTxUk5Nc4QKRsXcthdii7gxZ+T4ah5nrJoAps4HlUqqK5KAS+pGqc4J
 ePCMDkIXT5hCJksECkzyEKa6QNzIb28YpUC979dKvf/lawZy78cVOTQ3A7/tiv3wA9qzVHKga
 ncv/1W5QKxP6BHtlISvp6R1Vl+GWXVQsRO9FUXwSGmBsm60o4hc/LDop9O85jukck5wi0qLw8
 nUOIgPbUjB2OHmqzL4e+tkaG8F36FQY/pCkljlla4jblZn1eCB5Ui3Yl4xncIhE7Jdpfcb+Ka
 qCgAzePJEWL6JjMcOncodSoQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720871580; x=1721476380; i=fiona.klute@gmx.de;
 bh=640WpFEJWO50fm9wVv5RvA1dtsTxN4gmHLI78XZ6n6c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=av4ykUvX44LUbFSTo5orlFov+lS5332Cck+LPM2eyhbfD9rI14eHMJMF0/ds4cwL
 PsO1fMNIFq4u+1rth2egK/mXq320YYl8wbsaeoAh2tzYfChQjdpJ0MuP3UPsJwURm
 QCS6DpcSRzROXl1lnAJH9EHpZYT1U0+aRyGMLNhXqpvFpyiO0DSgkyKvsQ745FpY7
 RHxxMiqubZoT0ZcUgyAspGxU2oflLqhCoqQR/yPmJcgKcM3VIr9XpvcfjDclQM3wl
 BBkNe6Dc8+5hDpNl9U+Dh6xiCR+kmvaDI9sLTb0AK6YsfXQ63GH0X+1BPaPxLToiW
 4j5mwP2Jjk4Tdc3nbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=av4ykUvX
Subject: [Buildroot] [PATCH v2 1/2] utils/docker-run: mount and pass
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
 Brandon Maier <brandon.maier@collins.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
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

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Correctly handle spaces in external tree paths

 utils/docker-run | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 1adb02d74e..8024c2d3a3 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -90,10 +90,21 @@ if [ "${BR2_DL_DIR}" ]; then
     docker_opts+=( --env BR2_DL_DIR )
 fi

+if [ -v BR2_EXTERNAL ]; then
+    IFS=":" read -r -a br2_ext_arr <<< "${BR2_EXTERNAL}"
+    for br2_ext in "${br2_ext_arr[@]}"; do
+        mountpoints+=( "${br2_ext}" )
+    done
+    docker_opts+=( --env BR2_EXTERNAL )
+fi
+
+# dir names might contain spaces, so split only on linebreaks for this loop
+IFS=$'\n'
 # shellcheck disable=SC2013 # can't use while-read because of the assignment
 for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
     docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
 done
+unset IFS

 if tty -s; then
     docker_opts+=( -t )
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
