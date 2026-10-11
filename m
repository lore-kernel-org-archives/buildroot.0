Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79201CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208BE4059A;
	Sun, 11 Oct 2026 13:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTZjJNm50Tc2; Sun, 11 Oct 2026 13:42:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1DF29405A2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791726163;
	b=ELIqIuMLFdgxXYR4akNhRnK78XlnomdjTeMdxxA7we7XmSGSCj6VdG2smuD7uFHKnHtW
	 A+Wt9nFe0Ib89js34MVECwXn58O0vL1cXO+h+tSmL7Vcr/z71FZo5x6ro9sqphfcwscbL
	 8rJS4IyegbF6keJZKSA7TARg+7tO01DsWHxb4+KQVt+R1KHZvr1jSe0DDXQUI39WF2+LF
	 DK1CASj98CZQYgIYAglhddL04Juc9nQYCm6/Zcdq3czSBiDErngla3tzYvYSz6c1bwCaU
	 Fnp5loF0avdz9/9wP8kBPmmT64/gHZ1wUZC7VF3d/OuvdoiYEWXh1T1V38ByRkR0Cpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791726163;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6yE/vDeL/P0RhwUq7HxK46CDTtdVneFzUpHm83ZHeNo=;
	b=ok9q7Uh3i6EzPvA0gd3WTFOiB67uLtZGO58L0Xi5PJL992xPowN4fIHMzkItrE/HV869
	 U+hDHhpl6dTERBYD1lk86SAMr9K+rwduWMwlwxbdq3kovkQOmccJZPsGK/PELUvYFKHKb
	 jDefmdQ+yugfQWgmJGpbSpvBcRQxOLfhyK0wAYoRreYyz1MIHdnnjfb5cNdUBpoqf0Zj1
	 Ri4Ht96ub6cc7ORxi5KW8KI1dIj7Z+X5Z9XG11slcVgizicOYOsua9sWbSmRn+xocahqN
	 en7aOIDZCNGj89jHoznCXGf3UmXx6XctdYNMN0tlBl7vLbrPxDzg5JgZStvu//7LWKA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791726163;
	bh=6yE/vDeL/P0RhwUq7HxK46CDTtdVneFzUpHm83ZHeNo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hv15ZXiuboMeaas1Dul6Hq6xYv/Z5DqMECc5IAlGiHLXH2eM4fNCl/8Kiw3Yvts4P
	 S36wwJmBvaf5WCswUfQ8DSLvhEA9iJ0uvBlQ7dhJOpzVUyXhUZ94lGYdTolX+O7Idu
	 5WuHTTOtJ+2BhVz/gX5tMvdOkqnXeemJLEP6LEqyU/4Hn048sm3fMtrhO9LZv2l17a
	 IoMcVD3Q2NHbCMKmckp2Hxodd8W+0UUbbWpjz2cU8g5n0cWFEOM1R2bNBSqIgKWFgK
	 1Qn6VMMXpP7gaFq8rHMY1NKVpgg49XIn1yXiGPVZR5p1/+6DOf4hs/c8FC5HFxSGyD
	 Wd92VlMPwRSFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DF29405A2;
	Sun, 11 Oct 2026 13:42:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 718631A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 582DB60622
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ax5uq2bIZSM7 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:42:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 952596060B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791726159;
 b=m8Oq8E6go9oC5+0HFr+wCD57pAggpNcySogbVZzszPwG3PBB5DOwWVAEUAHg0CTZzbgm
 8TKBM9/kfI6NNzFRPy9gq+/eJI3bygW7mXCMSnbELKW9o4/892fInITw4Ws1N4zEOUrQV
 zqcKfoHXQTlNd7tGstncq9krIzHWn6WuIcMALZZLzkvlXU2I7Ikzm9qDIxnacIsDhg07C
 t/MlyHVeqzTnJHB2C4e2Q5mTPWyG1xwS/AETkWti64mF123P++kMN0v+uHoGk4QWPjrdc
 LN7z+IsV2uRcIADxI4wDcKYfKEd3rEfvZMBLhR7f5iYP4mejRu/DvtpaiuZvCo3JJfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791726159;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AqKP848ptTmH1JADnEjriQ1XLMK4IEni1wRJvbCc+3s=;
 b=Sa7eHDm3vtnPlhbipxR4hRIbpYeaesFr61GJkfShALsas+88WvQAM6tgExUhFo3If3IH
 QsclxslWwY6Mel4WefRo+JEmBFAeD5bT+8RecEVfjMgXpo2OAJgEz4cnknwehzFDpuCvZ
 esfkzNFXPSO01Ga1TRLxDaaFINcA3RnwzCbPrk5pqusCvTlNsXsA/7WUKRtVQ86SmnBhj
 U/GQY06d5pyTq2mZe9KpPtrE95yMvJrEjvOaD9hxf8vtlmivD/I6I4IV7INmYMzajgsS+
 EvDu3WDOf/WTy95MiuY3BlqrPHZu4MjQ9cngLLRum5cPqQCpalfzdVuWYR41ljLJGHA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 952596060B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0DA9937B6; Sun, 11 Oct 2026 13:41:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:41:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68a0b32df9f62fe4ee0ea2cc0225029af5a2f05e
X-Git-Newrev: 31fd7de7a84f3859b007b5b6a20a72e74238a9e7
X-Patchwork-Hint: ignore
Message-Id: <20261011134120.D0DA9937B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uv-dynamic-versioning: new
 host package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31fd7de7a84f3859b007b5b6a20a72e74238a9e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-uv-dynamic-versioning.hash                  |  5 +++++
 .../python-uv-dynamic-versioning.mk                    | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.hash b/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.hash
new file mode 100644
index 0000000000..75589ba4d2
--- /dev/null
+++ b/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/uv-dynamic-versioning/json
+md5  31b72e92d7109418ce8cfbcdf0abb042  uv_dynamic_versioning-0.14.1.tar.gz
+sha256  8642db686ce5c50417035e7a257ac73b7e5c3a7a32c33e45bd7e36ba22eeb648  uv_dynamic_versioning-0.14.1.tar.gz
+# Locally computed sha256 checksums
+sha256  42de23e93562f776f8cfd25fd5ef60f1637504133e4eef42c3a120b4e7e07163  LICENSE
diff --git a/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.mk b/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.mk
new file mode 100644
index 0000000000..f9e07de4a3
--- /dev/null
+++ b/package/python-uv-dynamic-versioning/python-uv-dynamic-versioning.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-uv-dynamic-versioning
+#
+################################################################################
+
+PYTHON_UV_DYNAMIC_VERSIONING_VERSION = 0.14.1
+PYTHON_UV_DYNAMIC_VERSIONING_SOURCE = uv_dynamic_versioning-$(PYTHON_UV_DYNAMIC_VERSIONING_VERSION).tar.gz
+PYTHON_UV_DYNAMIC_VERSIONING_SITE = https://files.pythonhosted.org/packages/6f/c8/fa500ee29af69cfeeea5ff6d6597919f1989b2e3f1a236c3006bdb21d320
+PYTHON_UV_DYNAMIC_VERSIONING_SETUP_TYPE = hatch
+PYTHON_UV_DYNAMIC_VERSIONING_LICENSE = MIT
+PYTHON_UV_DYNAMIC_VERSIONING_LICENSE_FILES = LICENSE
+HOST_PYTHON_UV_DYNAMIC_VERSIONING_DEPENDENCIES = \
+	host-python-dunamai \
+	host-python-jinja2 \
+	host-python-tomlkit
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
