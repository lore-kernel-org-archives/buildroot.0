Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11ADFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:44:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A742760F6F
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A742760F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 756F780D4B;
	Sat, 11 Sep 2021 20:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9X0Cr1Rxies; Sat, 11 Sep 2021 20:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6AB680D44;
	Sat, 11 Sep 2021 20:44:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C12551BF957
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDBB460814
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVLXJKdr58AV for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30D3660617
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:43:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 71EC289156; Sat, 11 Sep 2021 20:42:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 22:33:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c5e3896ef55d48905074eb15a238e3393341112
X-Git-Newrev: eb75d71b8026ff98d632964ac1c6fedeb0433ef7
X-Patchwork-Hint: ignore
Message-Id: <20210911204216.71EC289156@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/getdeveloperlib.py: force
 foward-slash for pattern matching
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb75d71b8026ff98d632964ac1c6fedeb0433ef7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Force relative file path resolution of DEVELOPERS file entries to use
forward-slash separators since pattern matching assumes forward slashes.
This is to help permit uses invoking `get-developers` on Platforms where
`os.sep` may not be a forward slash.

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
