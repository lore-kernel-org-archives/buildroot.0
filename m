Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B646C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:48:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91394610CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91394610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46B4C4010A;
	Mon, 13 Sep 2021 17:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0rw_LRTaz3M; Mon, 13 Sep 2021 17:48:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AB1740107;
	Mon, 13 Sep 2021 17:48:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50A811BF342
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 409DA402A6
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7xGUpKBm3AM7 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 17:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D734029D
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 17:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7C4808A599; Mon, 13 Sep 2021 17:45:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 19:41:36 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: d79570c40d06ececfe0419011c4a0521bdd2e14f
X-Git-Newrev: 963af0c56ec4cd23276933b63711d0c4e517a517
X-Patchwork-Hint: ignore
Message-Id: <20210913174532.7C4808A599@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] utils/getdeveloperlib.py:
 force forward-slash for pattern matching
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=963af0c56ec4cd23276933b63711d0c4e517a517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Force relative file path resolution of DEVELOPERS file entries to use
forward-slash separators since pattern matching assumes forward slashes.
This is to help permit uses invoking `get-developers` on Platforms where
`os.sep` may not be a forward slash.

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit eb75d71b8026ff98d632964ac1c6fedeb0433ef7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/getdeveloperlib.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index 08abcfed54..ce822320f8 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -251,7 +251,10 @@ def parse_developers():
                 if len(dev_files) == 0:
                     print("WARNING: '%s' doesn't match any file" % fname,
                           file=sys.stderr)
-                files += [os.path.relpath(f, brpath) for f in dev_files]
+                for f in dev_files:
+                    dev_file = os.path.relpath(f, brpath)
+                    dev_file = dev_file.replace(os.sep, '/')  # force unix sep
+                    files.append(dev_file)
             elif line == "":
                 if not name:
                     continue
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
