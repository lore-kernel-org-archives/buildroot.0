Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20190CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD4076063E;
	Sun,  4 Oct 2026 15:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMn8rKklylrD; Sun,  4 Oct 2026 15:59:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 00C166069D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129582;
	b=nOrwFOmiZFDPUfDLHQPdfpo7HTOpS7ywYM/81cIUAxJi7NJ9ALOJBp7JOq9p14g9wtZg
	 FSm+rRx/9agQMEOJfxmrwjuRxDmDxDGd8GFkOwUKORZJk6ZupfMxzOzmJC3KUrVxBLVSc
	 JOMBSF8treNxufd+fdiqJu99oJzC+VgrIuO9/QK34Mab6uDVlZohSON/hKhNNFhmT617B
	 PKkKcsCuvb/Duo4dYAuCdNr0q/MIHM2+MK/K9FFfpSBq8xPP0w70jBtOp++q3rcAC3Zww
	 e3eju3y/pD6h7AuNwiZ6VgnM9D3t4uEmiX7PMkNX1DfE03ZEiD/YbFrGkW4Axd07/Nw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129582;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TnYgIlVbFfbcYxLNhrluFPn6ZhuCxgrk2z3rWUEUEiI=;
	b=HZaPQqeGcwXpq3Pmfw7/I2eUUp5ibQ4TJO7gQQ/muxkSiieeI/jydoazvNdHlAh3EmFl
	 E+uTBzwEZ820PKTJOPTUeDGUNrIDu2PGrAQ9tdgV+pxK6E/HI5A8Y4Gx5PujtkAfkZM6d
	 Lv7wF32On10FIZz46NlcV4uroUEMz4rn0qL2uriicmuLiMKQDwgJqO7Dp5HHbWHWaQWBh
	 xsNJLLf2zjagm9Wt0J/wrkEP6fW/Rqiq3FjvY/NEBrz6D+ZB1DByNWtG51MnGNIVi6ZYZ
	 DZLg0knBHNtHYtWYWeK0HzdGuNlSDK/xRugE3R3HaPkkpPZF5Z99RY9gJrnD2CbkdSg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129582;
	bh=TnYgIlVbFfbcYxLNhrluFPn6ZhuCxgrk2z3rWUEUEiI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aQz7YODQA8YeL6LomABxx8dFn1wWvRXNyv1kws1g3quXVg1sPcqoPJkKOSHwoONdl
	 ahqElSlJr9PStIkxlKHzY4sgbH+lmfnxSXAaEza12+tDnifeTSZATfAiHOa3sPjf/s
	 k3KnVuhH0c5antxoUD5I8EjW+V4fVBmkE2EOg8LYj1tBt2oRmMQtNLkLg7aGsioTdh
	 1lrRBLmruIqViq24fVsSFwXoPg+eJ96D9FqHdXhKViHIlQA2U+C9BtvhY9X/MlTch2
	 Mayt2mdR+WFJj/DrQhgFC/ae5J54bLmH2wQFU6+ZSZ4AkY6bM+XfrrfwrMdqsLrRVq
	 hr2XqeV7KM28w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00C166069D;
	Sun,  4 Oct 2026 15:59:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69A7834E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 656F7405A4
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0NA2jrWLeG6 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AEDB5405A5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129573;
 b=UjvI4JcWRQwxNOdgr5cllF9SNVfrgc6CDOG8RTyTTFGvLtNSULF/H4lOdtHB+gCTb3h9
 u5TCuGC3Qklpt0Ko4NmyF6t2d53gIZZIKKcLa7WJ8hbFC2ijEJBt18e4DY+NaI9I5YsbT
 5Nzen6PacVWUV9mBt/cV5bIC9S/vB488+DHGdiAhgt9IyG17fnauKH6T4swh00uRHwGwQ
 NcVnVYCfvKg5i+v2rwvFEemXOAvCb4l7HY9MKXAtuGamzlcRXHCNdKiY9Sq5BKgLfUURI
 HX4bBRjd2t+zDqVt1ZUfY0jIhxUaWk+qvlujaFGDEOcWrBW7e6VO7kMJfUda07iecCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129573;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LgMBlNABV5XRS2SCt6xklfyA1RB3vnhHrMgbbpqX43s=;
 b=lt6e/NVxFZHCErXH8SqIRdD05cfeqVp0Y7sUaZXvI+xD2LFRo8DYhlnJ1Y5ehTK+8hBd
 XtSmQAjDa7J95NUE207P3K5vGbOQ2J6qAUKHYQmZFX3w3sfwL4uEWI6rwwd/0AoKkZU50
 lJcSg4RUePPU8JGAROzP1HdIQhfxIoE9EmRCvkck9nXwYahltExRaMzSY0K21svVkWN+8
 SaVeCfasI9MlN9+um+KfdKtR2KbIRcBytp0htuZ6BE/iXOxWT2m02YwW7CxEe60xnafGJ
 2SEmvHEztFZOenI9CYMrx138H7CxM6TSjqzS7ujCfXcHIr7TNvMrZQ0FrF4bp/Bs8Zg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEDB5405A5
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 755C88B562; Sun,  4 Oct 2026 15:58:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:57:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f885a61a1dab70ab2e74a4fc81fa96d8aa1d2ee
X-Git-Newrev: a42589856a80a422fdf9201c846c77021f957d17
X-Patchwork-Hint: ignore
Message-Id: <20261004155818.755C88B562@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-meson-python: bump to
 version 0.22.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a42589856a80a422fdf9201c846c77021f957d17
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-meson-python/python-meson-python.hash | 4 ++--
 package/python-meson-python/python-meson-python.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-meson-python/python-meson-python.hash b/package/python-meson-python/python-meson-python.hash
index 2f84b61808..b39edeecbe 100644
--- a/package/python-meson-python/python-meson-python.hash
+++ b/package/python-meson-python/python-meson-python.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/meson-python/json
-md5  eb572c5384b20e0c3bfad88fb66ae0b3  meson_python-0.22.0.tar.gz
-sha256  9c819d0d4efa746edadfaae4663c0e9c75659186ef7e5bab12330bfe22964dfc  meson_python-0.22.0.tar.gz
+md5  afd1035a4c4116bead1338a15e3516f1  meson_python-0.22.1.tar.gz
+sha256  52c88628b0e5671592dc2306613fb5f6f3615fd24def059b9894f143b7f9a139  meson_python-0.22.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8f82ea9ef9a55b47f4170536d02e48b5bc33fc5135e5b4a1b5f8d6404833ec9b  LICENSE
diff --git a/package/python-meson-python/python-meson-python.mk b/package/python-meson-python/python-meson-python.mk
index be9b1fefb0..ca49f05e4a 100644
--- a/package/python-meson-python/python-meson-python.mk
+++ b/package/python-meson-python/python-meson-python.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MESON_PYTHON_VERSION = 0.22.0
+PYTHON_MESON_PYTHON_VERSION = 0.22.1
 PYTHON_MESON_PYTHON_SOURCE = meson_python-$(PYTHON_MESON_PYTHON_VERSION).tar.gz
-PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/82/14/1bafca9db7691ff05767570686cd775bddec57c7358e78504cbfd35ec996
+PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/b4/40/343ae23722d5d66a7b94b752d1b194202640995296379333b274b1860871
 PYTHON_MESON_PYTHON_SETUP_TYPE = pep517
 PYTHON_MESON_PYTHON_LICENSE = MIT
 PYTHON_MESON_PYTHON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
