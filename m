Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105C8CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D04B160684;
	Sat,  3 Oct 2026 15:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CsfnpCSVuyh; Sat,  3 Oct 2026 15:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CCE456064E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042880;
	b=S6EQza5QaK9eonvKCnu8XwlqJc9T6BF19RgSNx7vrhasviCUvNCbM7DhBs+5OYYf0356
	 Kcsb+iQ/YkWXkpajZ7soEXACvonMW5NnaAWTsQ0ZHJWXUUQObEY7RoBQgUSUoOSbJEc6n
	 NFLKBMFZ7X2iqrNOdzmBYC2NsvMQ3V3kzstktw/62C3i380WwIUzxGVG8N9jn/QmddduU
	 wueyNkC3UL8nUSo8JLFqlUJN3kwHjoJqd/J5ewf3oFyY0avJZck3Q7XDj7eRNrYHvZADM
	 47Yt41xZkFuza5obfoT0SvNvm+qCgwzrw7L+06UBvQCbt4L7h2bZrPCnp9Y5jdwtnfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042880;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TKJWQNucLWDjN80uo48zX2e3jf8osMx/+fMWdi7bWZE=;
	b=J8DyWY3m5x8rXSytHJa4E60l04Z0zUx4OVHMjqX+4JBAvrL0I7tEYjoT2ijs9cxzZjZr
	 7D5qi3mGH68CuhHkjECu0xpzMsnMZaExCBnbWSJ0/qmKdOxIYOoei/k4X3Y75KsziQkUc
	 X/KWYpJuf5B4nIDVh6dECXNaKmJpdtDr9wXMKHdHEAs/IyxD429JxMrCoUyMzxYVJMiQc
	 EL3HEt9BabiV4karT63/jUs8njBNHzrohfWQq+ZF4YI3q6LRCuWsHlG3fLXUF36Y8ctpL
	 3QE6CYp0gElrO1CxstFB/cUtczCyTvfZ3cBK6LAxu/eSTTrFAHsrhWC03ASKMmr59Iw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042880;
	bh=TKJWQNucLWDjN80uo48zX2e3jf8osMx/+fMWdi7bWZE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U3JIgps5zcxi8Xf9edCtg+JTbG6CS0Iv7ag8y6UlDqzFh9rPdzQpnGJwtkHWVq2m2
	 dKH8iu6MuugINV3d6RAHFaXV0wucINneR6WyrJBjWfpLY+WkzI/To27xEH5khqSSf2
	 g20iAoJhdOnYkSPWVU2/DOSGOvkvCS004WlGEuTXuDrvBTxkGn+MvbuvpOwEfc7vTn
	 MuJxXFgCqjFomppCfOGxlqQe0ic1zJXTWDyfLJc+fu2zcRQNsMHwfiTC8Yx0fv3gfC
	 1JwmW37g5fTHRrnTgkvG6eojCao/qczPpGD+/5Ek9wN1jfoASreGcSEgnBGzO3VU6f
	 rqrklmVo7B8EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCE456064E;
	Sat,  3 Oct 2026 15:54:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 505DEA0F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 353EA6064D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0v8Y-7TGDia for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EB5BE60672
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=r2TwOQiNSEZtTYtjiqosOnvwM4RJLkFKoeG+9gcgMDBit2pQBTcgEpjhFf4L+sO/s7Rv
 MoSkkhpxvN6M8faWu4TyydfogxkScFDBpBabuk4zVz29rX/uoDFQ1fiIf2KMqdYHgvYEx
 b5Ri5uh+T57fxYo14HqeuMZMqm6d2oD4SEzi9tsf19bVvZes6DpFRpBlETkEtfZiJjuSt
 4Fu12rQBQJ1YE8PCNnxit+Mnkt4vfYmhFe0bwChWzv6uHsy+XywwTa4NGJESViOnOnnIA
 mN1Fu7OAPscN/XLxFgLMcJsIjAMDNeQjdKxDJwZn3va9VFXeaWK2S26gzLbY5PcICXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qWgWWr7gjxD6ZwpritrIQnpXECT1am3nWsPagkGDWZM=;
 b=OnhvTeLwpuqV8+u8FnXI3Q0hteRDo2lnfj7GfL0PYkGeY49Nv26rudormaKv0WpTMwU+
 GtzNc/37Qvi+cpnPuNVSnJg1m8FygQqeCMG7d2Nuyih5uHJnZeWLACoRfvei5hXqSEfm7
 9a7z2xVal4Tn2SUFoffWTEyLJH9o7OqjNPz3+HeDPKrqnQjV/a6iehtg07+rZ2nuXZNUi
 kKv1xC8OPnO44U3bKafez2WD6Etk7ttcfP3tZCAofvm5VmuIYHRpVFa7ftY6Zg7GUL7gv
 DToToCUZL/DTGwWawssWliXRDZ0CIouJzcApOm7jZFz5WSN5v38mT/HaHdxwiq538lw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB5BE60672
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3893F886F7; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e9f8e060f71b7ae32d69db5db1495399660139c
X-Git-Newrev: fcf1782664b853932794080126f98ca1e7bd257a
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.3893F886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pure-eval: bump version to
 0.2.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fcf1782664b853932794080126f98ca1e7bd257a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pure-eval/python-pure-eval.hash | 4 ++--
 package/python-pure-eval/python-pure-eval.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pure-eval/python-pure-eval.hash b/package/python-pure-eval/python-pure-eval.hash
index 1ce4d3738f..197de309d9 100644
--- a/package/python-pure-eval/python-pure-eval.hash
+++ b/package/python-pure-eval/python-pure-eval.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pure-eval/json
-md5  d545186f2c899d9dd273c03d71b7ffb7  pure_eval-0.2.3.tar.gz
-sha256  5f4e983f40564c576c7c8635ae88db5956bb2229d7e9237d03b3c0b0190eaf42  pure_eval-0.2.3.tar.gz
+md5  2618825f897cc23016c4efb6e67ff0d1  pure_eval-0.2.4.tar.gz
+sha256  260c2774686e651b79f8b8e7fc9d80b3599ea6a66334b47d5f4abb69fc2c0ea1  pure_eval-0.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-pure-eval/python-pure-eval.mk b/package/python-pure-eval/python-pure-eval.mk
index 721640eabd..12f34a9980 100644
--- a/package/python-pure-eval/python-pure-eval.mk
+++ b/package/python-pure-eval/python-pure-eval.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PURE_EVAL_VERSION = 0.2.3
+PYTHON_PURE_EVAL_VERSION = 0.2.4
 PYTHON_PURE_EVAL_SOURCE = pure_eval-$(PYTHON_PURE_EVAL_VERSION).tar.gz
-PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/cd/05/0a34433a064256a578f1783a10da6df098ceaa4a57bbeaa96a6c0352786b
+PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/da/9f/abfd2959e9261dd5217ca8551d4de211ca6ab26fe9b72cf44731ff6c4442
 PYTHON_PURE_EVAL_SETUP_TYPE = setuptools
 PYTHON_PURE_EVAL_LICENSE = MIT
 PYTHON_PURE_EVAL_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
