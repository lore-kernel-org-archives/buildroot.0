Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07278EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA0A181B36;
	Thu,  1 Jan 2026 09:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l08t7s1lwkLk; Thu,  1 Jan 2026 09:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBCF381A18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260563;
	bh=68mnD2OzuKnWzCTmvz9NyTSUL7vSs/U4RdMJdY2U6AE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EC71+BI7IpRJRJqbCl7AlNdLMxhjpRn8QMM7TEWiSTo7PUQwWtI5ZBcw57FOVrezW
	 Gm5x3kzker+drpGa2WH20gkgEii4y39cQrL1DqnFJbw+hbVDhdLG/cHimCfPWGOa+3
	 IG76QFniWqsUXDUkM1gJzo+Dd+iuaJEE6RXAvJnYgbZrnQaq1RwSjY3hsWZFiAJ4eS
	 +Q+ftao0pzjvt7cWBA5UJmhGZ8JB2iLG86+zo1RxE2TZYVxYjq1dCXj79wqOls50Ef
	 /xL4cH/T51Qtv059bbZvlglYlZarFVs9rBHkA1JXXODOgc3xVogT1AiNeknXUiTT1i
	 N5c/Ai2k84MBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBCF381A18;
	Thu,  1 Jan 2026 09:42:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C262206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 273088154D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yt65QT4TQOMQ for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55FF381434
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55FF381434
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 548C886FB6; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93785c6a6e0e7e643e084a0f70c201c0fd5d8693
X-Git-Newrev: ab2b94b2224db945d6f849b02fe0002a53218cea
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.548C886FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-coherent-licensed: new host
 package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ab2b94b2224db945d6f849b02fe0002a53218cea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-coherent-licensed/python-coherent-licensed.hash |  5 +++++
 .../python-coherent-licensed/python-coherent-licensed.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/python-coherent-licensed/python-coherent-licensed.hash b/package/python-coherent-licensed/python-coherent-licensed.hash
new file mode 100644
index 0000000000..b23a9db414
--- /dev/null
+++ b/package/python-coherent-licensed/python-coherent-licensed.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/coherent.licensed/json
+md5  5c943470c62e4a7825e783a53816fd18  coherent_licensed-0.5.2.tar.gz
+sha256  d8071403ce742d3ac3592ddc4fb7057a46caffb415b928b4d52802e5f208416d  coherent_licensed-0.5.2.tar.gz
+# Locally computed sha256 checksums
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-coherent-licensed/python-coherent-licensed.mk b/package/python-coherent-licensed/python-coherent-licensed.mk
new file mode 100644
index 0000000000..f827610046
--- /dev/null
+++ b/package/python-coherent-licensed/python-coherent-licensed.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-coherent-licensed
+#
+################################################################################
+
+PYTHON_COHERENT_LICENSED_VERSION = 0.5.2
+PYTHON_COHERENT_LICENSED_SOURCE = coherent_licensed-$(PYTHON_COHERENT_LICENSED_VERSION).tar.gz
+PYTHON_COHERENT_LICENSED_SITE = https://files.pythonhosted.org/packages/cd/e9/63d2dcccb5496cc99d96f29a8a5f3e2c6ed0bba7fedb840862f92816ee17
+PYTHON_COHERENT_LICENSED_SETUP_TYPE = flit
+PYTHON_COHERENT_LICENSED_LICENSE = MIT
+PYTHON_COHERENT_LICENSED_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
