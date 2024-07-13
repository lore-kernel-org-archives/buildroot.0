Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08156C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 11:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F0BA403B4;
	Sat, 13 Jul 2024 11:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaAfLnGjOrSW; Sat, 13 Jul 2024 11:53:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 288644043C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 288644043C;
	Sat, 13 Jul 2024 11:53:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D598A1BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C375283F5D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXWapxNFjBQp for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 11:53:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05F37820C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05F37820C3
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05F37820C3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 11:53:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.6]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MulqD-1sAnJH1qGR-0109pn; Sat, 13
 Jul 2024 13:53:00 +0200
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 13:52:44 +0200
Message-ID: <20240713115244.848755-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240713115244.848755-1-fiona.klute@gmx.de>
References: <20240713115244.848755-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VZIcmzJgWEFxZTuu798IoOD9Oyfa4cdri/K7mfhfK4gGqtnw/zd
 OYU9hD5KV6Bcj9rLU6yZik9RFgOTUAd2MPkqqI+K5nel4KFJfyE3zTlbdQLsa3r8zrQmMlZ
 7nzK+QAhIdQOw5mWhMte3YjSZQLIzjkV7Jdx1Py3TFQIKAIyWnPfBoraxGmMzTQlpvs3faz
 MmzfGT9o0Ddu/GAnpPiJw==
UI-OutboundReport: notjunk:1;M01:P0:BT2LVf3CArM=;H6Rqk2IIJGN+Kc12Kii8b+X7fCh
 6wp1dMk+tBeROOp/z2ONYaXcGAw8abrn+R6a8ioGivwejdctQtBxMeKdDJdPGT4dgqHuBj+GE
 3JZ7GsWQvSBVXUgkAoU7T0998T3SeJi4RxztBgrstEEj9LyOkfoblo/cNlzKmCxTI9CdLZlNo
 2UJkqeAddmMJrLNsLfTZmzo5kuL+ugTO2PXWjpkwHSOeh6iO1GFqJXeQFryESorf9S2bXs/n1
 FYm1ZITG3eCrKxCHO6fSlruEqdnY9TO+19kRedJ7Rho2DLYleMK3U1qYpIUN15RrzjMCZhYVx
 ivO2OwYt2o9/FytQvdTCHN9yf0G9nFZ1qIhgz8Y3uIRE/fVhiIg0N2+s3/Zut4IM7peDdqhOb
 y+2Ymdxuj1RTDT4mNiLJEomGgKZtfBRQLPPAXem0fvsdsrFMJ5ZZzttLPdpO4yuhj52uyadKC
 ipdTBz55Z8/YlN2vu2S0n5xEBl5zfx5oczGMvvvznE00ETf6WVzO/bDvmfzEcfGXiih2yEz6A
 M4FneCsvWegHOFa7StoMosUMfGsurG7Utge0HtnGGIirptWBUYqn706miMtIQCLSFo0b2Vd+W
 8fCIMpPEHVnWtDstm6UfT4CPxPc9p6v630XEKxjBJbwIpiQAJnHFeJy3B18zh5U3W2azmsJzp
 u0YMcD8GwGCs4BmrH45z1jH1rtOtVccgGH+C/Bw/gLa1YkzqFZmyMxozBeBCGSc7B9Pl7aM01
 /kGE0PtCxqmucIhW0abyQURccEJz7yIE4GKcF3IPnXrBCfwW68UREWqILger3BMZd5Y0davP7
 tpZWKSvMtfFhAiHNNjRHgreg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720871580; x=1721476380; i=fiona.klute@gmx.de;
 bh=29CreRqaesWH7SwAe6tuFeWmGQOvILnMnJzj7qHAaOA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BRABA/P8R2plJ+3MZvmALP06Nfm51rS8BjP6moD6aqJ6l4X9wTtNNEIaDzFyp6wO
 l2jVfjAdV6Tn2a4v1Sl5vx7xHE+t0U54gLBpKSSfmLHm9umzu9rxfKLT/gINyIjSO
 fVj2YjfbwSlg2any8PV8Xh9hLzsUzQij2g3bEfh7bueBgztQphQyMu2bK+LrSOvUD
 UFU1hKOxXOj/p7UxNOiWL5mdm4EZhSq4yFq3ApkloIXmQ+fQ1pi3AwXj/7Hwp9v2T
 TANJNZNj5CKaGoILMCjgLny1ISzZtVhzy1lXd5q6e0j9fwkxUIOmpAmoAJLkdb+9e
 6z9vBHZqTsg0mbSrzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=BRABA/P8
Subject: [Buildroot] [PATCH v2 2/2] support/scripts/br2-external: allow
 spaces in dirname
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

"make list-defconfigs" and "make nconfig" work in the container used
by utils/docker-run with external trees with spaces in the directory
name. Other build steps may or may not work.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
This is mostly a proof-of-concept to show the previous patch works,
there might still be things that break in other parts of the build. I
have not checked if "printf '%q'" works in Bash 3.1 (like a comment
claims the script needs to support, not sure if still current).

Changes v1 -> v2:
* Added this patch

 support/scripts/br2-external | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 8aea479d20..b8b6179aa8 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -34,7 +34,8 @@ main() {
     trap "error 'unexpected error while generating ${ofile}\n'" ERR

     mkdir -p "${outputdir}"
-    do_validate "${outputdir}" ${@//:/ }
+    IFS=":" read -r -a br2_extdirs <<< "${@}"
+    do_validate "${outputdir}" "${br2_extdirs[@]}"
     do_mk "${outputdir}"
     do_kconfig "${outputdir}"
 }
@@ -144,9 +145,9 @@ do_mk() {
             eval br2_ver="\"\${BR2_EXT_VERS_${br2_name}}\""
             printf '\n'
             printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
-            printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
-            printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
-            printf 'export BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
+            printf 'BR2_EXTERNAL_DIRS += %q\n' "${br2_ext}"
+            printf 'BR2_EXTERNAL_MKS += %q/external.mk\n' "${br2_ext}"
+            printf 'export BR2_EXTERNAL_%s_PATH = %q\n' "${br2_name}" "${br2_ext}"
             printf 'export BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
             printf 'export BR2_EXTERNAL_%s_VERSION = %s\n' "${br2_name}" "${br2_ver}"
         done
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
