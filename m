Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20647C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3A6D80DB9;
	Sat, 13 Jul 2024 19:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPS0DD2GnuqE; Sat, 13 Jul 2024 19:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD6CC81E69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD6CC81E69;
	Sat, 13 Jul 2024 19:22:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A17121BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F22860605
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjM3AJ745-Fm for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:22:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22998605F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22998605F5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22998605F5
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:22:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.6]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KTy-1sJBoQ1HqE-00rBsv; Sat, 13
 Jul 2024 21:22:16 +0200
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 21:22:07 +0200
Message-ID: <20240713192207.873065-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240713192207.873065-1-fiona.klute@gmx.de>
References: <20240713192207.873065-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:gGbauvNzDks9CqAEWNL9L1c3iu+T7tEZs+b2N0dgWL6LKv/lUyv
 TUk1FKG08XCSUCcVUVHuFzT3ldeaR3qR5dYoJp9++4ayxX1+XrLKe00Vfo1XuLqcmPoqJpa
 tsvBq3d/vHxJS3sjbn83EXiSzh5jNrvuezCshVMB24Gmx503U6fQbyAQ9ucWH5Fn1BrUVvF
 zOSlOSdaLtuqF+cZ6OSfg==
UI-OutboundReport: notjunk:1;M01:P0:3Pm7QBUsOQg=;fNlD6+rcp/hJRux0rAI+MO3Shbc
 XLt9yTxI1n/Ziq+9N+IseXwHQDsTWCJjibkvmYQQFw3O6onqqCAWnHZJEe9gzvTlX8mCPwbQ8
 XIme6Xdn79M9VVCRAbcVWMxNOJKRo0bW4fYOPuEZogr4uwXiEiNw+jGxReolcqpLVwOqlslzM
 RS+Q/OUdZvRF1V2vODt5LgkXh/xBIVSm200iQpbVXRdnPioHvE79o7PyGG2aot8aRKzZScN1M
 XeG/eWFc5dN/GznTgH5s6+WBpshhGl4sNlJ+t7ldMRl8udUzjrF1GOh7CuLhkKNeEUVVK/7tJ
 xN83+QIfRUdNgGcrWwRYfEpSdIpWOC1OSC4BDKbiYmAasIQl5/Pa7sgCiA0GWyqCi9U56khGd
 eqasC0/0xf4qBjj4PB15XhauswB+Dk5CqAeS3CZf/QizTsE1OWQpSe8pYtkdLnF2iJHA/flya
 lE/eco2EzOkIrEAtYJ3qgmk+eA0wibpfmS5htyW0x9Sd3P9vWEj5XOVBs9xlhvwubOsHyOhYF
 hQV/ur+A+ymNhPALxip8ne7x53vnTUFzwRQkrV3Yp2/zoxtZTBSIElDQ+fxAdlgmzeYFH/p52
 9rfZw6gl9yaxSakoJclrT5oBKuoUWj8sH3Ojo+taDqqdwVMi4LqDFOFd202wI0keprR0HgEgX
 RrC2MR0TkK2nDyHaUUkqUXGJX1JfXk6hxo7ng78vnXPgz8mtANCTha8vhFnrOOeIyVMwlvDxy
 BQTRhGyb3LSLWeqFp1wx1pY66eHeefyke9uQ6/bju5MUkW+UtrbQuAQb6ssbv/Xti17wqRxgZ
 MAKX5sF20HR5N83pbO9iyPEQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720898536; x=1721503336; i=fiona.klute@gmx.de;
 bh=29CreRqaesWH7SwAe6tuFeWmGQOvILnMnJzj7qHAaOA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tn5BleFdtyS3yYq7l2pJC5vBR7dDiVBPuZl5raOwIYnzUL/NcfRcMX4wR4hpKAsD
 gez5gmEBAom7Ui7SROS5EgsHTYv3+fNC0PFqKCo9Yy9SUMqI4oU5Q+/oxiUbaA+pL
 26oEg3+mYhYf7zSnwbQt2gdKPgzYr2NahqiUn43vcCYtt2H8//F2OR6bmCXcfJc80
 C6CoFtjetMCR/Qsm0lhZPfvr1y2xfKuZ7qE3xQh/56VZ9kPPsDHEpjOLhSdvWMGiQ
 KXkPDTH3u2vftE6WNkcv0S3pxOyw/U2hXXJGPwcJKOqM0lFHusiadsn2wdhUxAHe0
 jieMffXygCM3+D1c7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=tn5BleFd
Subject: [Buildroot] [PATCH v3 2/2] support/scripts/br2-external: allow
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
