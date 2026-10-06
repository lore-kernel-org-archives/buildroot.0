Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC1CCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FB9F60809;
	Tue,  6 Oct 2026 16:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YO4-pH8x2gtn; Tue,  6 Oct 2026 16:30:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 347986081F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304251;
	b=BVK1aHaKHgLh0AdXrNDsfu5NRccJ/Ew8lGRh8Qi2mDR1mpiWng1USs//7AgNlKy9sP4l
	 pb8t7kcB4RfxHYM1ZATlSFCQTPEANL+Vt2gp+2qKedZWxJ1bkGmYphgA0KUh3bbEQcCkT
	 VfMT+iyshbDayW+BJqZgSAmxa1oqQZaFSpF2Dvo5dkdJiMEZWqsWS5Vb/OWuEWws3+WW/
	 K419KmCkSYCfDnMgyN2VB/jA2ulJf2RFkDaBhuv395ywUrVAnf9u523/uyS2MTEYWzlWq
	 4q02UOb99tdkxtpmJjyi/6gP6aOZk4ztBP2o3EeALW1Y8RLK4pGpyqAUZnDjrcvPEmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304251;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pqJl1BnIydgjvbqFkj9EoWrLE6A2z8tgg+C0o6pf8Ns=;
	b=IiVMLpeg1Kpk6cXrFzXD4ex3EZz7wIHxsaRpO2B7i91YCKpicHqnkkzPQejhdX8dsrNH
	 AXujy3AyCk2vA7nbA5x4ecx0sKv41ZLQLH3EINEGMJFiKpPNqXoTJ3sbB0Mndv9FBywcn
	 co5+iVrujEDsGAM8a7v1P9y9DIcgFzL+alHbHAnw4OrSdkMus9FON5yfwDmUESMsyXL+I
	 c9VdMskfEH5nDHaEgwTfxk+seeyTTYKzicpy1C495w/WzMVTYqaCbiGcIVr3RU8M+3Ssh
	 nJU5wSbXcOlC/UPXsKgJFybaXSu+tzf1ci2/0UgcJINWjoyMrWgQNw7GEmJ1sVUxzzA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304251;
	bh=pqJl1BnIydgjvbqFkj9EoWrLE6A2z8tgg+C0o6pf8Ns=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NuxAEfzgrJlXWMVGb1CUTzfKYzu0Pq7/cTnTa+Zhfv6mP2xWFRPd1PvLrtEzpmRXr
	 Azm2wOIFl6dOyfb2cqxZpSVHgsQlMR0SVbylzBCTkCUnHyWOESV64VcVDbMr22FVHK
	 lFVab/6LCq7Bs/g6umW/j1iu4RSKgIJlhxzWsGBVx2HOouqxfZxOQ8lYPA6Z946JpU
	 AQ0j2PJBOs5TydpBifpZ3eSBbGkFRxgmXjnDBF+wH0EVo0m2KGGZXr2ftzDlrHFUeu
	 2zLn4QjdXHcLkR4DyAbpEvNgu3+2yt2jLW9N1fCecML2IlJRuvTM9Jm6n4x7gBReUF
	 gIt8ks4blCdGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 347986081F;
	Tue,  6 Oct 2026 16:30:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7657317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A2EF40448
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5fB2grIRtHY for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7E5E5402F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304041;
 b=RQVudXLGMedqpTjPnHH3Q/+UJmXmZoIEXEdRIJ6wbfC0ezMQwSxhy8w1xYSNxjl7fFup
 4Lom/hAaYj9Mf3tAGLB24NgJwmO1pGNEaPBPaDrAGCpsr5mhFEMirQ7Fo+zxLxNX/x0Ny
 qciQpDeSzhKBBF1wUfx0wg5LEUhYmzft07DAAMYfFLs7FTRIZGhg26e99GHZwI88NwZ1m
 3Z9+43RGCMX3VQxbzI5Wqkedo7jmBD78K+z7+wAdhVlhwIDsrd4avbtIacZsfOGe7lf4b
 anVGbg7wmdg2OEVs0hDUuObc1mfONPaPYAL1yjx2BVOUZk4ptYtQzW1nCDya3DlF5cA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304041;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KPczbJtjGEc2tCwlshsILVPL3ixdG1R0MGNgPgVb/eI=;
 b=eIjiOQ8fwGEzl73YQlIycuLLAUkwXrm+vDEpimGKIb/xLMeGhzLwxfT47eiNTBW+bpvh
 iHeylAXVzGoWq+FfN/1UcMMTEGCbG5cMKjUko6RvOlj/fHj4Wwvvattgo0gzKj0BNNlmX
 uZHRGe5Nsq877FbebazdGCH9Uh6hHx+dNHQT+DYmFPdTdL/sZzXqQpfAJezo1lBTny+Z6
 wt3fHjxE4iBWDtIqIEgSBbsDQUMQ2X8eAQOevGVyGVLRXtbw9cFbirjp+eABMcXJEKw1/
 uG+wpj7M7J6fqwegzDIkNe319rilI5iMnAUOAGxlpJuH5k+fbKtOx/P81RmG/zpBmxA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E5E5402F8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3549C8DA10; Tue,  6 Oct 2026 16:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:53:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85019ddb138ac0531b54506473be292abd6984dd
X-Git-Newrev: c630855cd93e518c472455f0f8c9d433e6a58ab7
X-Patchwork-Hint: ignore
Message-Id: <20261006162605.3549C8DA10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyqt5-sip: bump to version
 12.20.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c630855cd93e518c472455f0f8c9d433e6a58ab7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyqt5-sip/python-pyqt5-sip.hash | 4 ++--
 package/python-pyqt5-sip/python-pyqt5-sip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.hash b/package/python-pyqt5-sip/python-pyqt5-sip.hash
index 65882779dc..d09a28a7bb 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.hash
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyqt5-sip/json
-md5  30996db30ec078362cce4920dafdd08b  pyqt5_sip-12.19.0.tar.gz
-sha256  71cacf1879da2cd3e50cb239e21673cfe02d358af70ab6768817c960428868c3  pyqt5_sip-12.19.0.tar.gz
+md5  0e5e480e619f926f1368f176838d4272  pyqt5_sip-12.20.0.tar.gz
+sha256  93e0622791f8d22cd4a32a29edfdd2ef6d6680f4c47f59b03ebf1c5da3c3e896  pyqt5_sip-12.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e6f5b427c36f94ecf86bc01698af7030a1ed6eb3748110d5dbb8d142d804611  LICENSE
diff --git a/package/python-pyqt5-sip/python-pyqt5-sip.mk b/package/python-pyqt5-sip/python-pyqt5-sip.mk
index 74e1f28eb5..c4ff9746c2 100644
--- a/package/python-pyqt5-sip/python-pyqt5-sip.mk
+++ b/package/python-pyqt5-sip/python-pyqt5-sip.mk
@@ -14,8 +14,8 @@
 # recorded in the PyPI source file "sip.h", in the SIP_VERSION_STR
 # macro. For example, PyQt5-sip 12.15.0 was generated with Python-SIP
 # 6.8.6.
-PYTHON_PYQT5_SIP_VERSION = 12.19.0
-PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/0d/9d/5179b8e619fe084218a87f963f1648cba4c5aa5bb98dd5661d2cbb9eb1e4
+PYTHON_PYQT5_SIP_VERSION = 12.20.0
+PYTHON_PYQT5_SIP_SITE = https://files.pythonhosted.org/packages/cd/ab/835df8e6fb06a618a4b8664765c5598e933c8113e90448e294549c9447f7
 PYTHON_PYQT5_SIP_SOURCE = pyqt5_sip-$(PYTHON_PYQT5_SIP_VERSION).tar.gz
 PYTHON_PYQT5_SIP_LICENSE = BSD-2-Clause
 PYTHON_PYQT5_SIP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
