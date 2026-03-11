Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4761125833
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 14:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 402EB422EC;
	Wed, 11 Mar 2026 14:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ShxhKSMcy_o; Wed, 11 Mar 2026 14:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E4D8422E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773237906;
	bh=Kby2jjD62vM1wLBJ+xpMK/9QygwaIJxbCpXPR+32wW8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dLmDvEpWF5vk6IiQNSegz2vDml4zegfAGwtk9X8byNf2Czgq8Zn5RCxLJ3lf7zr+f
	 idiwiOZR2y4s39zXNwSqtWbpH5kcp8WZvgpIdA/TVv1WVAVkugNPPhIev8o4Irxo7c
	 xcIRPKRCJxBeaSjWoYnhM8dgOWAMs7Jir8Mi69yVwJAGOlzjwjUpjUkoi/J1DWpqMv
	 eMG99Yr69qemtGRPHJVuygcTybB3wjs77j+wTYfov/WZyGbkkzyZ4Ziyms3htqQMxZ
	 RNqKL4gU6znc75+jYpvvvaZXIZnLqqhtQ+kjrsmEuI/txzgD3f3KAHz09xGRf7l70t
	 skffS6xgRhR6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4D8422E1;
	Wed, 11 Mar 2026 14:05:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8042228
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE1E9616E1
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BiN_y8NJxWvi for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 14:05:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D911616E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D911616E0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D911616E0
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:02 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439afc58ac7so11493633f8f.0
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 07:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773237900; x=1773842700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rcB1K++v4foEFj5rCc8zuMwuUVFVDBkAVzjb/y6cHc4=;
 b=Up1IbgaXFphb5y6Pr/UhbUpXWG8CCy+kfbFIK1EDamOG9zHkw1sj8HNzSJxU4eCp94
 Daiz8vgbUGM8plskZaS66cRN1M1c9+XRe/DD32Halt4Jv1h4JXIDEP2bseW1eDfAKV40
 lrw+s0kpxg4YxmWbyE/nJPB40MeR1rPF0GpAGOKwfWyd2Unp7/EFBs4e6LZxhr1vjF3d
 VILsq5t6IiX6CL8U0UVbqudrqyW1KQ8n22ZkqPXPA3jatmfMktE3i1UIYYTPybx6GtbQ
 hAne5h93cZ7qRm2zD11jWA6JWZxrBAmfq0o5LjIxQHoumVqAlAlcbLjoHeyJWZYMTUsd
 OBYQ==
X-Gm-Message-State: AOJu0YwiPLUThnny4Gdy/NrnCmivo5LWfD/LD4G2/QztvhLdpt3AX68X
 ToYNpd+gYv93Ra0W37pS4QRfilFmPEQGg9Zf0Y3xdfEc00y99Q7swjgS2yBuOGJ6NvEZCUynTDG
 hHG2V
X-Gm-Gg: ATEYQzx51pn61PGnMbubQJk7WBX+XSS/6JcmR5s2yeBPDatPI9Y4tlovYrj5dEK19GH
 X+nVyw9avtSbZ5VdjlXt10tAJzCpMDWyqowjjxrQ4v8lZLkd4q3v9R01ur8pY+yR5YsOuAhmjy/
 XeGxeE7lzBZr0iA5NZv0aFT1mmv5iad6P2AJ0IecFkssNmfLo7X5eBT+0w5gZHxpX1PQWdkUbMF
 ReC/e1AqtSrg9h9pIDOug1EbhGmkNIKlgryTU22Ijc2g5YRNpvlk+rGZVEVU0IVO1/d7TL743Fk
 8+tQ79ll5guum2Xtww865KQHEqTwoTX7EVGXyw98S/TauK8YOc4+W7XcZr/rWsl4sWBHWcnodYD
 qeJjr6g9+RdM6ydZ6our0u5V07U1IbJrRbtzuQ1l+UYPaMlRcUsZio9S9hKUMmq58NmIWULUnto
 sQk/oHtISyctACQvY=
X-Received: by 2002:a05:6000:2082:b0:439:b541:a092 with SMTP id
 ffacd0b85a97d-439f81bc41emr5043669f8f.8.1773237899825; 
 Wed, 11 Mar 2026 07:04:59 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81f19dbsm7657610f8f.22.2026.03.11.07.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 07:04:59 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 11 Mar 2026 15:04:51 +0100
Message-ID: <20260311140457.140041-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311140457.140041-1-thomas.perale@mind.be>
References: <20260311140457.140041-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773237900; x=1773842700; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcB1K++v4foEFj5rCc8zuMwuUVFVDBkAVzjb/y6cHc4=;
 b=AoypE9KKYZCKCECrPt3vLR6lk9MtjyzJzpKieWa+XDsstZmDL1pmY8t53ix56vDJW/
 D7oaF9U9VxZQvr1wlD/Dawabf7xw+/mpEKLr2cEDUj7Y6OFQbdnJgun2B2KFQNA4YM2X
 BHgtXWE4dvCDEhc43NeuoGOJDRMHeH4AFxCSaeXV1B8gWdexzKQaC96C7UdEqKAD7FEn
 wIHRnuW22QursL2wVYjvKeJaB0RhHNbh91pUUoZrBpmjn26tcXStVxBXXzCOjSuHY4oV
 RK6OEVAQyEPm+Yn+krcKF4gO+UUJpurKrHW3Eg7buJdLozMsoiKAx8e1K9/YYWDx3SHq
 cuVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AoypE9KK
Subject: [Buildroot] [PATCH v5 2/8] utils/generate-cyclonedx: move license
 download in a function
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move the code that retrieve the SPDX licenses into a function instead of
doing it top-level.

This allows to pass the CycloneDX version as a function argument instead
of defining it as a top-level constant.
In next commit, the CycloneDX spec version might not be known when the
top-level code is executed.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 49 +++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index eff55bf598..52fb8cc3e9 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -18,15 +18,14 @@ import urllib.request
 import subprocess
 import sys
 import re
+from typing import Tuple
 
 
 CYCLONEDX_VERSION = (1, 6)
-SPDX_SCHEMA_URL = "https://raw.githubusercontent.com/CycloneDX/specification/{}.{}/schema/spdx.schema.json".format(*CYCLONEDX_VERSION)
 
 brpath = Path(__file__).parent.parent
 
 cyclonedxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "cyclonedx"
-SPDX_SCHEMA_PATH = cyclonedxpath / "spdx-{}.{}.schema.json".format(*CYCLONEDX_VERSION)
 
 BR2_VERSION_FULL = (
     subprocess.check_output(
@@ -41,20 +40,42 @@ BR2_VERSION_FULL = (
 # 'resolved_with_pedigree'.
 VULN_WITH_PEDIGREE = set()
 
+# List of supported SPDX license expression.
 SPDX_LICENSES = []
 
-if not SPDX_SCHEMA_PATH.exists():
-    # Download the CycloneDX SPDX schema JSON, and cache it locally
-    cyclonedxpath.mkdir(parents=True, exist_ok=True)
-    urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
 
-try:
-    with SPDX_SCHEMA_PATH.open() as f:
-        SPDX_LICENSES = json.load(f).get("enum", [])
-except json.JSONDecodeError:
-    # In case of error the license will just not be matched to the SPDX names
-    # but the SBOM generation still work.
-    print(f"Failed to load the SPDX licenses file: {SPDX_SCHEMA_PATH}", file=sys.stderr)
+def br2_retrieve_spdx_licenses(version: Tuple[int, int]):
+    """Populate the list of supported SPDX licenses for a given CycloneDX
+    version. If the list is not present locally it will be downloaded
+    externally.
+
+    Args:
+        version (str): CycloneDX version
+
+    Returns:
+        None
+    """
+    SPDX_SCHEMA_URL = "https://raw.githubusercontent.com/CycloneDX/specification/{}.{}/schema/spdx.schema.json".format(
+        *version
+    )
+
+    ret = []
+    path = cyclonedxpath / "spdx-{}.{}.schema.json".format(*version)
+
+    if not path.exists():
+        # Download the CycloneDX SPDX schema JSON, and cache it locally
+        cyclonedxpath.mkdir(parents=True, exist_ok=True)
+        urllib.request.urlretrieve(SPDX_SCHEMA_URL, path)
+
+    try:
+        with path.open() as f:
+            ret = json.load(f).get("enum", [])
+    except json.JSONDecodeError:
+        # In case of error the license will just not be matched to the SPDX names
+        # but the SBOM generation still work.
+        print(f"Failed to load the SPDX licenses file: {path}", file=sys.stderr)
+
+    return ret
 
 
 def split_top_level_comma(subj):
@@ -404,6 +425,8 @@ def main():
         parser.print_help()
         sys.exit(1)
 
+    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
+
     show_info_dict = json.load(args.in_file)
 
     # Remove rootfs and virtual packages if not explicitly included
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
