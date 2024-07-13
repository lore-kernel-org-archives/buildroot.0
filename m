Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF7AC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CC57820A1;
	Sat, 13 Jul 2024 19:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Om-RF9eRvBH1; Sat, 13 Jul 2024 19:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D78DB82085
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D78DB82085;
	Sat, 13 Jul 2024 19:22:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB3251BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D82E0401D8
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v99leW5S_etz for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:22:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 746F7400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 746F7400BF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 746F7400BF
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:22:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.6]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowKc-1s0YVF2gH8-00hE6v; Sat, 13
 Jul 2024 21:22:15 +0200
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 21:22:06 +0200
Message-ID: <20240713192207.873065-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:yMTyxmuViq/opyhhJCZGq/pv2VwwmyCOA8yL4xwVVlXQfAdvyOK
 +Rz5PJlkwfGAH39UPHeerZtAih8NIqcTaZyP+rLogMCzanpVrCV0u/KPxMUaOwhCrI+CHcT
 zpTShgq1U/MM3QNMWSwmwxjkqR6fHx6ji9kTkP/KEZ6MG3LrAtP+Ih2pqtgyLWL99tMgElD
 ZuE6PKUvzqBvCPT6CV6Pg==
UI-OutboundReport: notjunk:1;M01:P0:IJsxO1t0ZeA=;NsoXlrNaL71qD3PB/XXF9AikzpI
 f83Hol9qDbYSlaemLHuL8vZp1l7ePsN6KvLXoXi3UNBTqBR0EfcGjbrhMa8RpNwpWYLxkqYPj
 +WCPUaz+0vHhJaKM52GM4WPifYUHz1VequhBGDKyR+S9Vvq7NfUNQ6X+r4NS/V5Iwtq9vMQQ+
 q59301I8rD1ZSWgwxCjeUUNKKulOvqib+d/bLqWIBGFXotm7SsXQP75WUa2CCeyhBuy4GWK5q
 tjH7E/tb0cU2vAlRIbknVMs3Mg/T9Fdn1XwuVdKzjKjM1wUW0bC5Ann8Awf9xa8SlZ/+o/Zij
 D19FAvGC8GkgBwg6oMCzKuUiI3BaBolUcEpbeh1zQ5T9xp8vFAtKheSluAKFJsOjotdZEtOiZ
 YZm17bdZzk01YQxBSKtUUISYUBlCLmvnhx3bgtqyvG2HqVDyyplTXJw9KWkmY2Ssf7SuSh41i
 71B5GIu7Rb3/vodT37wDABT/L1HmiXdd9Pd+KNWX+8XssVdX+kzW3CXJGqXCFXPqTR1ZE6Ok3
 fVlQCHcynONzFwKBLxxTMoSYpe86IUlq7HxaRGMa04rXabTXXTokVhTZ9r3ee4o7cBIO32oUI
 Ml333HFslnGlDeAbSJCUu4d3ibuW/KB4VO1wv2SA+gqChIU2L6H7V08hxF8TDU2uiiaWVqyyR
 IRo5Da0h3KDn3wHmqfzFmSbp9sb3LFqTrqYggMQmIULdRwxDH6b6bBiY24jZR/h1S8vJ8I1qN
 sWorsG11jt6TqlIJxJ0yl8gQ8KNqGQ39mCe3LHr+4AKP3mwfh1cCCmcE84uTyXOuaDOeaX4We
 kni2SUzyNE+apO2Yz5w7eaqg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720898535; x=1721503335; i=fiona.klute@gmx.de;
 bh=7/edHMCe9EqveKDGs9fiTAyy2NPNVcgTqquTIU+nLCs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=VK8MBFSgY6SENWgvpzPFb6u/0QfgFoVGDZnzYRTdwr6qQvJ7r1VjL+t9ccT3//ht
 Q13F4jvdQQP8BdcARJp+s3xsjs8Lqgrg5j5///t9UX1zHlcCHJvgmthjSuO7heJ1r
 ZCsA/iBzVaazY3DABrMKfPgbTM3ZC5PzTcOpDaiLvQbcLMeUik1WDLRDBxNrpMcbH
 0MiG6RPPQ2rhvQSJOKLbSTBDbv+fdR4bCfTU/r+xgmRSlki4EAj3Xc8ZqPrI+NM/t
 M/pW1k6/VUUei+f/hOXMF0C8mfsJsfLED5ldUpF3eeBRM02LTT0UPKtFB1Bw6g1wm
 rG1XaIMPEG7SI/OD0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=VK8MBFSg
Subject: [Buildroot] [PATCH v3 1/2] utils/docker-run: mount and pass
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
Changes v2 -> v3:
* Use read to make the loop that creates mount options more robust,
  removing pre-exisiting shellcheck override. Suggested by Brandon
  Maier.

Changes v1 -> v2:
* Correctly handle spaces in external tree paths

 utils/docker-run | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index 1adb02d74e..dbb9c45fdd 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -90,10 +90,17 @@ if [ "${BR2_DL_DIR}" ]; then
     docker_opts+=( --env BR2_DL_DIR )
 fi

-# shellcheck disable=SC2013 # can't use while-read because of the assignment
-for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
+if [ -v BR2_EXTERNAL ]; then
+    IFS=":" read -r -a br2_ext_arr <<< "${BR2_EXTERNAL}"
+    for br2_ext in "${br2_ext_arr[@]}"; do
+        mountpoints+=( "${br2_ext}" )
+    done
+    docker_opts+=( --env BR2_EXTERNAL )
+fi
+
+while IFS=$'\n' read -r dir; do
     docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
-done
+done < <(printf '%s\n' "${mountpoints[@]}" | LC_ALL=C sort -u)

 if tty -s; then
     docker_opts+=( -t )
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
