Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A12C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 18:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F1942CA2;
	Fri,  7 Feb 2025 18:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DIxtZlGhjeZ; Fri,  7 Feb 2025 18:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D8142CB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D8142CB4;
	Fri,  7 Feb 2025 18:35:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5395CE4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35CD1704FC
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lztJ0UCRt1VP for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 18:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E810704F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E810704F2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E810704F2
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:35:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.179]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEV3I-1tdkAZ46ws-008qNv; Fri, 07
 Feb 2025 19:35:18 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Michael Walle <mwalle@kernel.org>
Date: Fri,  7 Feb 2025 19:34:54 +0100
Message-ID: <20250207183455.1468220-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250207183455.1468220-1-fiona.klute@gmx.de>
References: <20250207183455.1468220-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Tv9ZrV66aU2e9ceW7gWXI0V3hkppv9gTAIhRp2fa3ny1Lon+jGD
 Kc8GxnkWlw8EJgYtstJHYgTHmDEzzh4OJVZiBSw/mctAYEaiOqASyCvOPUqGD5SyvsVtWhB
 qs0nLR+//lQUhhxhXdb46K2LavUfz/qx2jqpzt7pUbkVSIHBUju7FEI+e+NSY3PaFUIhFbp
 hX98zrSlT+eKJ3t9xtzvg==
UI-OutboundReport: notjunk:1;M01:P0:YN4OGSEGCm0=;WRRKc+U2V6oiOd093pGrNqQn9dQ
 l7H2OFBe3bqFNk3s202/hcimPuNfDxqyOSol7BmhprLao7yByOBEkaIjefE0ffLCHl1vLLgPQ
 FFmSAUqMWszwY0JJtUiQkaY8yJa8tKTorX83xfkoEwi/7W7oXp2t6xynjCgHaSaI1vsq/pToG
 pPryVF0SGeAOEvdiBwllh5yIFYO2QXZUuxs5/SDOXgqrjQLrtwtowfBBOhK0bayi2etGuxblU
 e/YGUZzbv1y6f/1h5JyvUYVvOtxs7Kk2zD7jSZmHXvmmMnzNkzsxeZwNVrsnMDREwbKXpPWnx
 30bY5iehOZPLk1Xm/wnVj35wFc0PaSTdQXELIw9EWL84kIJ3MLtJ05lV2LnI5kL60Dj1B0aEj
 3Xuyh9kD1p3JNDor9eG5isF+Rb2GkZfef16tCVcH1QrSUfSI5uHoQ8UrafBEa2NG3kj34i5K7
 FVnbmpox1C/1EEGbvZHkwiHG9oFr0qcg3RJzPItRTeFJ+wcoP5lII0cpwA7cy0MvsKrbVuddi
 nXL2xd/xjuBX0w5DbFD/P3PkjJyCanw7IpmNQVTJWy/ff1mHnedDSQjRi+hRl0WEUsfjBuxSY
 vH7G7ar30JlVAdEburdEuQnBVL5qarNRqGZX6bHUo2FlLpEpwo2HQ+5alu5mZgzHFUBs2PiLV
 iRfEYsrrDM2heEmNNclvO0nbelsJzOU67pyC/0YuRJdULkT1rn7xGuKG7oLL93PyEteiZb2Oo
 +vPpMDCA5F9oIdPD7BIubNI99H8u3djzAr+A8vHK+NNWY2GN2n5dDngdp0yIr3thiGE3Jt0Cz
 32TN2TA+DeMUpHw6WfFlP8qe3KOWKRNisHw4FUfkArqT5K5a9JG2pLXvWEiUu8XgnL8pxGOl/
 3Obu8F3tcMitBZ4NdwKuUlUH18GCpWiHd7heBFZttWa1RP//tMLvVDnvD+VwfCo4W40mqiRws
 7hzxmelLDlrFPvbXylYobLCJghh6JqO4lnTiEEFS9e1PP7xTzcBGjIwWBFBjNfwgbIdbGeWig
 aa0qRQWzpqha2uvuBFlYQ8GWaEK+5bZ96sRvFtYVK8UzuYo+rQkksSMcODUOMkgWrsZbrCJEN
 5ITCRFEDt8lYl7ng6SK4djuBwBeX/jTey+v7MYBwrHI4VpDUrvt5PsnRXFbNu9EwvE1zve7z0
 WdpM6lAfu4FvU7am+d/RVU2+S58a9cW5zxSwtcofKxdlUFlUz9BPtjoh8Zf0zj+hq/vAuUSvQ
 wllXxExJCkSdNQUKzgogWCQAuBW5F7PENdnLhcjdMXiKz3swiNP5lHvFpu2y/U7ULqa3OT2Gr
 EVlddtpEJ/jffnfEZAt6QPIw/Ebz5ME/7w+cyrE/6Sxx7KunXbxQQf5ShKTtsmkj+/tiSqMUY
 PRjJZWwSMrAAysKxI06SrXWGVfTd5AACotS6oTk4Qcynh3ykc05cCU/oAowNIx+0lFnCPW45z
 qVScK3w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738953318; x=1739558118; i=fiona.klute@gmx.de;
 bh=ouOTFYbcaoMOFE/7RJ8tdaOodtAcpQdx8B5FFNBqMeQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XCuAY13IgklX2is12dMMyebtAa1iNGule2w7/pPcX0/26EfaEhA3Ym4LHykUezmi
 U96ksLs8QY/sVw15BPESynpsQifmgsaqBtyA6EEgXwOKKk3zDq/v1AK6HrmoeZCGz
 RREmaVOIOEBxNJ74EYk/Mp4JlmSOYQeMa+7zY2IKD6HhVmMz37etbAPWtqcUNBoD7
 zJV46qZdOaMEVTdSuSsK0f2ArghkoEKPtXcERweBIXQH+C4tsj2ekFi3iWKK6NdvL
 P55FdIdBuqzMdSKZnb8qgIaNKuUwaAF6Xd7QviA0sINO+i5Vq5/1Ivr93skYP5ijG
 pWmwciHz5GyqVyFTfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=XCuAY13I
Subject: [Buildroot] [PATCH v2 2/3] board/raspberrypi/post-image.sh: include
 ${BINARIES_DIR}/overlays in boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This supports overlays built outside package/rpi-firmware, e.g. using
package/custom-dtbs.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Patch added in v2. This change is required to include the dtb(o) files
built using package/custom-dtbs in the boot partition of sdcard.img so
they can be used.

 board/raspberrypi/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index a3a2d8d620..067524df7f 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -12,7 +12,7 @@ if [ ! -e "${GENIMAGE_CFG}" ]; then
 	GENIMAGE_CFG="${BINARIES_DIR}/genimage.cfg"
 	FILES=()
 
-	for i in "${BINARIES_DIR}"/*.dtb "${BINARIES_DIR}"/rpi-firmware/*; do
+	for i in "${BINARIES_DIR}"/*.dtb "${BINARIES_DIR}"/overlays "${BINARIES_DIR}"/rpi-firmware/*; do
 		# ignore literal globs that didn't match anything
 		[ -e "${i}" ] || continue
 		FILES+=( "${i#${BINARIES_DIR}/}" )
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
