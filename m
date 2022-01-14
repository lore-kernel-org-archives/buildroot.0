Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6CCC433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 15:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E0F60B52;
	Fri, 14 Jan 2022 15:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJGb885N9F80; Fri, 14 Jan 2022 15:57:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C816160B5A;
	Fri, 14 Jan 2022 15:57:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1D351BF5A2
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C841400FE
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IImku3R5A7mP for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 15:56:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 991ED4040D
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 15:56:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7BA1E83545; Fri, 14 Jan 2022 15:50:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 16:25:36 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: ad12d3f7a3861540c154b0750494babdc6934cb3
X-Git-Newrev: 2762b9fc77dcd3c66af3850e19204dc6c6f40514
X-Patchwork-Hint: ignore
Message-Id: <20220114155011.7BA1E83545@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/python-requests:
 add missing host dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=2762b9fc77dcd3c66af3850e19204dc6c6f40514
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

The following are runtime dependencies for host-python-requests:
host-python-certifi
host-python-charset-normalizer
host-python-idna
host-python-urllib3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b48d10f40aaba5b8e6a6796b78b85ed7522df989)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
