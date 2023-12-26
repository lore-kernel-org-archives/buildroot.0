Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B23C46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 13:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F94C40906;
	Tue, 26 Dec 2023 13:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F94C40906
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgh-jlPpHbvy; Tue, 26 Dec 2023 13:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3DD140900;
	Tue, 26 Dec 2023 13:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3DD140900
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0DDD1BF489
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14DED408E5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14DED408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2vC8ZEjVauik for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B68E54038E
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B68E54038E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A4C4835AD; Tue, 26 Dec 2023 13:13:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 14:13:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f9709f803667956c58b79b4ea13e10ebace4f47
X-Git-Newrev: 3cc18e40856868f24e933a24dfa2ce0708d0f793
X-Patchwork-Hint: ignore
Message-Id: <20231226131330.8A4C4835AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httpx: add CPE variables
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3cc18e40856868f24e933a24dfa2ce0708d0f793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:encode:httpx is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/0B9D7A81-3934-40D1-A7E4-FD8132304152

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-httpx/python-httpx.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
index 4227acec59..88166ad242 100644
--- a/package/python-httpx/python-httpx.mk
+++ b/package/python-httpx/python-httpx.mk
@@ -10,6 +10,8 @@ PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/8c/23/911d93a022979d
 PYTHON_HTTPX_SETUP_TYPE = pep517
 PYTHON_HTTPX_LICENSE = BSD-3-Clause
 PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
+PYTHON_HTTPX_CPE_ID_VENDOR = encode
+PYTHON_HTTPX_CPE_ID_PRODUCT = httpx
 PYTHON_HTTPX_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
