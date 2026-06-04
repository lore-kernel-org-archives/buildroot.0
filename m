Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B18CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42CBF8227B;
	Fri,  5 Jun 2026 12:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeTrvwHuTIiW; Fri,  5 Jun 2026 12:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A92F8226F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663247;
	bh=zzQYyW6JufyHXdrqCWg1f/2KkFxpvhIt+rRbQXhalD4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o03hYhkY9dVcuAKvtk6Dx0/pkAHi6fSoCCEqpJhFqLeM+GMtiEHi71aicC7cWqbh8
	 AS2zDqaLJE1USQSJ/PJ4znFLfaC+o2sGLXGfYcjB64+bdvkTojxvhyVQ7/mxt8hQoW
	 tfXPnFc4+YhNc5w0Ixle5T/nEhuMjYDSGeCm/z7lCsB31AK/wbYb/JcESuk2zK9Fu9
	 9QuALNJ2uaXiEpwp2Nh6gk/GiWYjaGi5j27BdFK8W+GyMoNPvqHxd+KMbz5I6kgFGF
	 UAE54DC2mCDtZMWhvaYrAFObab8HalAqbbvh2YqtY9nwU//4Afzs6AFBx0Xi0wk9S/
	 e0Xgz59YiQKEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A92F8226F;
	Fri,  5 Jun 2026 12:40:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDF03B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ED4881F34
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vua8HVol2aAS for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36C5A82012
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36C5A82012
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 609F087B05; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:07:46 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 7c7b4e3333e05cf03f6171244b1a4915edc24ca7
X-Git-Newrev: ce4a8e5d075937cd59f161d718ee3f1001e18222
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.609F087B05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] utils/generate-cyclonedx:
 better error message when host Python is built without ssl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce4a8e5d075937cd59f161d718ee3f1001e18222
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 3e2df83809ee200d1134f9a7a54fe7fe79b49cf9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
