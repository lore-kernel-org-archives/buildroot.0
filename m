Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFFDCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A6CF42D00;
	Sat, 30 May 2026 15:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytgZCbtR6dXJ; Sat, 30 May 2026 15:37:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 949ED42D05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780155462;
	bh=qK4fj/ec8rDJTZPEx3Bdr8v7TRKAG2X9ulwKCeVILhc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=plSJngt1RsXI/vc30RWEG5tNeVRDl7vPkbGJg/DPc1l9g0rCKEdqqHgfr/NjZAqmT
	 +5eBdIvQsV8kLjMzQun0t7yWXXYJTOa16Miy9pd5Yjn1bg4Lzz38PzOExo0ZGsUODa
	 a5v8lwoSTVevQz61dULec4TarUfL7kcstBIqBJ0tMZ9bKdi2KCsY6Nye9Nq1gNbhrD
	 lnx42dOHrD2/17WqpDuduBGkW7o3bhspF6QSy6l8cN5TDqCXnYJzYc35I3STCEh9u/
	 YJvtKY0J8gRVRxN9mwuh7HUj9Hl3Z1Xa/sKCH2MeJJF/sKE+eyJ0wwGdFQYE0Tulix
	 A/uNDEO3N16mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 949ED42D05;
	Sat, 30 May 2026 15:37:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0B2DD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE27B42CF8
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeaNGmrLNZr4 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 080BD42CF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 080BD42CF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:37:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E401387527; Sat, 30 May 2026 15:37:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 17:08:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b70e16d5a7fbcca61553c1b504da3d6f6de4307
X-Git-Newrev: 3e2df83809ee200d1134f9a7a54fe7fe79b49cf9
X-Patchwork-Hint: ignore
Message-Id: <20260530153725.E401387527@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: better error
 message when host Python is built without ssl
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e2df83809ee200d1134f9a7a54fe7fe79b49cf9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

urllib will eventually complain that it does not know what https is:
Traceback (most recent call last):
  File "/buildroot/utils/generate-cyclonedx", line 53, in <module>
    urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 212, in urlretrieve
    with contextlib.closing(urlopen(url, data)) as fp:
                            ~~~~~~~^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 187, in urlopen
    return opener.open(url, data, timeout)
           ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 487, in open
    response = self._open(req, data)
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 509, in _open
    return self._call_chain(self.handle_open, 'unknown',
           ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            'unknown_open', req)
                            ^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 464, in _call_chain
    result = func(*args)
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 1397, in unknown_open
    raise URLError('unknown url type: %s' % type)
urllib.error.URLError: <urlopen error unknown url type: https>

It's quite confusing really but what it means is that host Python was
built without ssl support.

This adds an additional check importing _ssl and if the module is not
found, tell the user what to do. This still doesn't make Buildroot's
host Python3 fully usable for utils/generate-cyclonedx as it'll then
fail when trying to validate certificates, this will be handled in the
next few commits.

Note that ssl Python library is always built in CPython, but itself
imports the _ssl module which is the one that may be disabled with
py_cv_module__ssl=n/a (which is what happens when
BR2_PACKAGE_HOST_PYTHON3_SSL is not enabled), hence why _ssl is checked
and not ssl.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/generate-cyclonedx | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 611a20127d..7cfeefbc5b 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -9,6 +9,7 @@
 
 
 import argparse
+import importlib.util
 import json
 import os
 from pathlib import Path
@@ -44,6 +45,11 @@ VULN_WITH_PEDIGREE = set()
 SPDX_LICENSES = []
 
 if not SPDX_SCHEMA_PATH.exists():
+    if not importlib.util.find_spec("_ssl"):
+        print(f"ssl module required for downloading {SPDX_SCHEMA_URL}. Try enabling BR2_PACKAGE_HOST_PYTHON3_SSL.",
+              file=sys.stderr)
+        exit(1)
+
     # Download the CycloneDX SPDX schema JSON, and cache it locally
     cyclonedxpath.mkdir(parents=True, exist_ok=True)
     urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
