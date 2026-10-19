Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69843606A31B
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JgVCXUx/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CE296060B;
	Mon, 19 Oct 2026 17:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fuMZDYBMHgA; Mon, 19 Oct 2026 17:45:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 41217606AA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431948;
	b=RSNMjNZ22/QfrnoiLXFqJhXOLUveq8OSublJpu04rDgao4a9jWV/H1oxy2mFDuNbT5rG
	 JTi8YnobaDIJ3YrB4r4hqPFqe6U46qBFn1Jt/yQlMfL+CoDzC6idDTdiWEwJvtzruliNe
	 YunXBk9FLjHxPgvT1iTdUEu09cO6at820EQg3AlEa5kmCXjpLX46xXD5UYRED1gfYJm4A
	 DGbex/KOUJZ5iiERrH5H1VmCC0mVt2JkiyXjx82crtepoGpHUsM6tv0p3u2M+lxWFtIfC
	 W0RQ7daT50wI2MSAbV1y5wH/AcI+6sBqQfd7QCEQDIH65Ka8pgand3pnu69nNHJrI6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431948;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=38yTf/oII+52vRvNMA/xpS66xpdL7lSIFpcjd3lmhX4=;
	b=E4XLUL1sEYFcPkY6IM2DeW39SBZEQ4WAdSc96mUEtK7XzFV3U8JksIMn0R4eWsUvVEQh
	 uja/H+7F6WO6ALg6Aj9xY26unfvrWLU37nlkB2sCrnjIIoOjyC8tbw87NsOi7pT2+XhAv
	 +hZE2ZDaC+gpIknsAI75w0koD+4YsFgvKoXfo661KHdEtAXcx+L639qk7btPlx6300t8C
	 RyBM5LI4SfcLXBK7xR4NKKqUjTERU4fCiebaSgo4MgDn3hcg/tiTmeIYUlLBn5dfDUsA0
	 NE3CMZmTnH9qE7YhjDI7rT8PF5yVl44y3MylrtRGCPfEhOpnE4LmnIoWWBZvtae8ocg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431948;
	bh=38yTf/oII+52vRvNMA/xpS66xpdL7lSIFpcjd3lmhX4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JgVCXUx/FjNddCaEjDJNmZKo3tf+xOkBWwcFlrFzMEBgPJd9FrWqZ1HtH7aamvPBc
	 KvbRRgb96e5l13FZhhCJv7S3Eb5twCjQ75Zl7HF84ykoVuGJ/FCy1Rsga7gH+SI0OO
	 TtfdxEb9ez8w48dQL+5yE2otYeuHCKQ3nmrod56M8U4+ubAJngz0crub8yWdVN0n00
	 RSBcoRNspqAG+KqfdEyXVBA72aWxKaYCVq1pXgzX7I4faNkbok97TnojvrJmNaZkS0
	 zPVTCLQCZawXy+jLpEXGyspj2dg5KDZDcJKXQIVLrRLTjeuoc80/nM4uw7TPHm22vQ
	 nOcPQBUguzZnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41217606AA;
	Mon, 19 Oct 2026 17:45:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0BFC279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDDB680AC5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4v070fFpgiC7 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1CE1980AA0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431946;
 b=JK/Fyrn4S7fnw3tPtkqlFwQ7tJJYWmw9Eb2xdkJBkUoj1yD1QgLMytliymbneLLsMwFc
 NnutesvrruG84YeYnYBZMUR9mW1p71ivWaa2DOK66xXiZabg8MYwZv4pHKB5FDv1zrqKm
 at3YInbkKYhADoZw9UJE0P2+OtAW23rZiLBKcFP6K1vZtlo64gQv5n5oY8NN19+7qIa12
 kM/OhMfUz+NmJaL4h2awXygobSxuDLWclvVI6RtPppEef6fnPdqu+Qgc43x1U5R41UoCU
 8jN1Aknm9iXebay0O0riYtuf9M0xlN4COskeynL2rinnRUXGC9OgasrkfANgu4wzYaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431946;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=74Wv4eJQDOJmsuG+ZU4CKT4fTHj+0ZsZ9qm5kwQ/QnI=;
 b=QTvzyusddBEmnuCRLH9DkztsKexnNk49jlwXz0BeeRdQYewmDxhCqU9l5DJ3XdrW4ab+
 uF6enBSSMrmo08diKwn5xa4ys2hG0W9DuvSayz4wUIbrwSvD95b1W4jsjYlFucnXcr73o
 30sxak34247KN/ohJw+X36l0oRWdlotd3eszSkCwjaKHqOI7kC+a9/cLRp2AAqHSmqrcA
 Tgu2Mpbfn9TvyFeVN3AAa2GCQ8IKoTKor6F+mgfjm+cBZO9yJS7hTq+mjXlprBvCrXDgW
 T1obEYeJNNXP/OdPZ5MLJIbjOjcCIaIkQ48I4qYf/GV++FPQqqS2Dx1d8x8jJq935Ow==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CE1980AA0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7875298CB1; Mon, 19 Oct 2026 17:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:34:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1332f3f4589b0764b850ff2d0546b2c47b6e4604
X-Git-Newrev: 44f77c2dc6715e68c9aa0b4dc1084b7c8bf67079
X-Patchwork-Hint: ignore
Message-Id: <20261019174423.7875298CB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typer-slim: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44f77c2dc6715e68c9aa0b4dc1084b7c8bf67079
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                |  1 +
 package/python-typer-slim/Config.in              |  7 +++++++
 package/python-typer-slim/python-typer-slim.hash |  5 +++++
 package/python-typer-slim/python-typer-slim.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fd7ec64333..d041291bcb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1500,6 +1500,7 @@ menu "External python modules"
 	source "package/python-typeguard/Config.in"
 	source "package/python-typepy/Config.in"
 	source "package/python-typer/Config.in"
+	source "package/python-typer-slim/Config.in"
 	source "package/python-types-python-dateutil/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-typing-inspect/Config.in"
diff --git a/package/python-typer-slim/Config.in b/package/python-typer-slim/Config.in
new file mode 100644
index 0000000000..b7ebd275ff
--- /dev/null
+++ b/package/python-typer-slim/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TYPER_SLIM
+	bool "python-typer-slim"
+	select BR2_PACKAGE_PYTHON_TYPER # runtime
+	help
+	  Compatibility package that depends on Typer.
+
+	  https://github.com/fastapi/typer
diff --git a/package/python-typer-slim/python-typer-slim.hash b/package/python-typer-slim/python-typer-slim.hash
new file mode 100644
index 0000000000..a28241beac
--- /dev/null
+++ b/package/python-typer-slim/python-typer-slim.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/typer_slim/0.24.0/json
+md5  14f8007acf188b8e8c3d41f9f4e00be9  typer_slim-0.24.0.tar.gz
+sha256  f0ed36127183f52ae6ced2ecb2521789995992c521a46083bfcdbb652d22ad34  typer_slim-0.24.0.tar.gz
+# Locally computed sha256 checksums
+sha256  58992cebcf8dfb6e40c4e2112ed12126c243666dca3912a3d78b7ecac4859d49  LICENSE
diff --git a/package/python-typer-slim/python-typer-slim.mk b/package/python-typer-slim/python-typer-slim.mk
new file mode 100644
index 0000000000..0be49b20e8
--- /dev/null
+++ b/package/python-typer-slim/python-typer-slim.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-typer-slim
+#
+################################################################################
+
+PYTHON_TYPER_SLIM_VERSION = 0.24.0
+PYTHON_TYPER_SLIM_SOURCE = typer_slim-$(PYTHON_TYPER_SLIM_VERSION).tar.gz
+PYTHON_TYPER_SLIM_SITE = https://files.pythonhosted.org/packages/a7/a7/e6aecc4b4eb59598829a3b5076a93aff291b4fdaa2ded25efc4e1f4d219c
+PYTHON_TYPER_SLIM_SETUP_TYPE = pep517
+PYTHON_TYPER_SLIM_LICENSE = MIT
+PYTHON_TYPER_SLIM_LICENSE_FILES = LICENSE
+PYTHON_TYPER_SLIM_DEPENDENCIES = host-python-pdm-backend
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
