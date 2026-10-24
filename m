Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD75606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Drd1IxQ6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EBD160AC3;
	Sat, 24 Oct 2026 11:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcF0C_V_2emG; Sat, 24 Oct 2026 11:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 97DDE60A9B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842849;
	b=IhrQDexCOBz48dFLITC7BWcc1AdlwUtx3++eTXi9UtGLpEz0Ea6lfpanDHxWf9zK3BZO
	 EyqaEKWWcsJk7l9iYuAWVRsQB2WkIltD2CT4zIips+cas4jc8Psj6vDChlnbBvD3iWMSz
	 vCqv5OylkIo/LvTaAUibGOMga4yQv6zMb4BPGJVQJrS8GEMmikgcEcV5ODayk9qEKDm5E
	 AxDAv9USf2xI5eIYRTtUK23gCpkYyvRrsIn7VnLMsnsx55YNg/kOzr2poCTDoZXzjPTkO
	 dyyjoChqn1Nu//2Aw5amHcKF5weTg6PIT5cZAmFUQFfz8tSEjVkcIVtdqepY+of4ieg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842849;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3ySQbznxX1z+IkdFXSg6Mj/lreitCW9oqrn4aqTHU/o=;
	b=LkrQkbpIbyZeICY12PbYX+NvtBHB80B0G4qxw7xdjohY5BFkZlPYuXyAHbdOVmk+jVYl
	 QFsfnzLktWRZdNnGZY+IBAxJ2GH9+azOxBO7pDQSLid1TwwdYFpJafNTCC3zQZ1KLonwF
	 VQ7ZVcCr45f0jwxZpmGAQO/U4PZBglGGlufCDzDYrjzjyUXofq8ZskQOOfouMo+4trNIg
	 YEaVqn5TRYk6F1Wd5mkxO/NJTW0tpiEwOAzVV0u4AqFHAPvqbe5IAEbBFrQXgnJuvT4fF
	 GwW4FVSmv6q0PjxPfnfJRMak1q2EFZYAmV5+ukElMQBEjYGeJfa6D98yvEeDYZ0+UIA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842849;
	bh=3ySQbznxX1z+IkdFXSg6Mj/lreitCW9oqrn4aqTHU/o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Drd1IxQ6t8yew6k6twfz9JVT7eKXIxGmq0cUuUh4U1MrncXBKJ1FDOdP5I7HbIhiy
	 q+d/TrJCE6qWlPeOecenY/F4b4F0IKw93DrrWHTqknSZZkxMkcEpJg+eoyr8FlN78I
	 Xt9R+JDo7Fk9K3jBnCA0fjJ/uUbYYo4CjN3dDSZjVbzxebbaG2rxEBRCsoKGSOd8WT
	 l9Lrmo2v1hhao+NRZd6uKd6BogMH3gKZpHp1iLlJIr7nnN8D3yJVT3pZTIm1McMAGa
	 5aYAG/KVkqxQN0Pi2Qqd/sKFOxw9o0Xcf8OAiqTBy/k3mR0RR1xYrRsBax4m3fpP+6
	 CBg/rVn3YoIIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97DDE60A9B;
	Sat, 24 Oct 2026 11:54:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08DC2D38
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC0564007B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDufDicob4wn for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 47DFD400EF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842832;
 b=rnnPBAUKi6BKhmbaL+QZ29kYIqNke9LgftMSsbUOW88sIOt4CB8lSawbT8ieszhx+Rkh
 9dfkFOSg7+eeVl1gotY4eGd/wL1bswtrTSCDrM+OHkPFhifrnJ0+mxEber667D49ck157
 S+TB97t+qvt68wrxT3HZilVA+gpbTjf0o/9iokRgWAK+K9zG0O6jS5drDqod1K5u+DwNb
 zi4fJASleZOzbONzpHXvWTZcKdMJUUxm+kWqOyZ+EBAnlKj45d3wJG6CYlQ90+525iZn2
 2jDh9IY8xzEqOp2iykxL6MTHAUbiZmyVEGcm2fbWZjPpjKuh/V0V+P4CcujENugf8mQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842832;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dkS+UrjHiFzhHVcyA2YGmlMCqC1Mj4F4biQ0ZxHaKYs=;
 b=c5GsseACTJpjmcy5pjKm7hefXYTx8GLdtbatWfwqlIFNrc+kunv7qlXcI2uOOD+10mWI
 rlkIRqsYBWdm1KuLz93xiM0MqD88pBX5aM5JoqFra931vb/pHmxYNbRWci2M0OWo+aABM
 gZ6AjNjR+M4EB0YeI5w6n8cIltmZYQeqKBpWTP/IMomiAXUVmQK4eKs/brNV0ZUgk+GAP
 ncsda4hQm7S28SHVb+iFkG2sG5dErT/uW5pUdpqc97oNrQhYkT4f0Rpyv8nSLGdiIQNq3
 FhCJb6XmhUpSKDqjJ6yMKE0aJWy5HxVOsuFliK6j5kXG2uoxOvtiE/6TPGxpS8x3Vvw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47DFD400EF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CC6598327; Sat, 24 Oct 2026 11:52:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:11:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74355c8b1fecb6039592b7074dd28ff979c65ee4
X-Git-Newrev: c95eef456f6adc8a3df6f0e5fde3da0e6892bf79
X-Patchwork-Hint: ignore
Message-Id: <20261024115227.5CC6598327@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wcwidth: bump to version
 0.9.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c95eef456f6adc8a3df6f0e5fde3da0e6892bf79
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wcwidth/python-wcwidth.hash | 4 ++--
 package/python-wcwidth/python-wcwidth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index a0aa0d902a..ecf1ce3d7c 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wcwidth/json
-md5  114dfecbe7ccc3aced0243ce93b04daa  wcwidth-0.9.2.tar.gz
-sha256  ae0ef90b90f6af38b54f1fe6d58662ec33b3cb4b8391958a62416d654231727b  wcwidth-0.9.2.tar.gz
+md5  5679851d1447f3c3690cf67e09300c3d  wcwidth-0.9.3.tar.gz
+sha256  dfe7cfbd4cb59db9fe0931bd6091ab4a95b3acc5d56bfb50fa9fef0ccba5dc5c  wcwidth-0.9.3.tar.gz
 # Locally computed sha256 checksums
 sha256  70b98a95a2144eb70af8017fa8c6d95ce247e40867436e8bc649e137fe13d21a  LICENSE
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index 260f150a58..60914a4855 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WCWIDTH_VERSION = 0.9.2
+PYTHON_WCWIDTH_VERSION = 0.9.3
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/f0/b4/7830542634bb2d3e62aa3b586a72d5b3b6c91c3168929e7000ef3fed041d
+PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/69/4a/82d61476a1ccc20d43d0805724c5de4baa4971131a8db1816705ef53fe16
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
 PYTHON_WCWIDTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
