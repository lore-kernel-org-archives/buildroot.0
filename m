Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44309C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC346404B9;
	Mon,  6 Dec 2021 21:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p5NVYqgdmgtg; Mon,  6 Dec 2021 21:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2208A404BD;
	Mon,  6 Dec 2021 21:24:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0BE1BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CCF28316A
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnjpQBGrX04d for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 751058308D
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B964F81773; Mon,  6 Dec 2021 21:19:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 22:12:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dccfefafd442f908acd44f521b2311281d18ca13
X-Git-Newrev: b48d10f40aaba5b8e6a6796b78b85ed7522df989
X-Patchwork-Hint: ignore
Message-Id: <20211206211935.B964F81773@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-requests: add missing host
 dependencies
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b48d10f40aaba5b8e6a6796b78b85ed7522df989
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following are runtime dependencies for host-python-requests:
host-python-certifi
host-python-charset-normalizer
host-python-idna
host-python-urllib3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-requests/python-requests.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 474d2033ac..74cc91ef01 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -13,6 +13,11 @@ PYTHON_REQUESTS_LICENSE_FILES = LICENSE
 PYTHON_REQUESTS_CPE_ID_VENDOR = python
 PYTHON_REQUESTS_CPE_ID_PRODUCT = requests
 HOST_PYTHON_REQUESTS_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_REQUESTS_DEPENDENCIES = \
+	host-python-certifi \
+	host-python-charset-normalizer \
+	host-python-idna \
+	host-python-urllib3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
