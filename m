Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937B606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 20:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lGbS1YV/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B419606DC;
	Mon, 19 Oct 2026 20:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugOkmLSs78jM; Mon, 19 Oct 2026 20:06:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 10C0C60749
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792440408;
	b=nAqsNIrk851lxb/XOvfYQ2SHGxbN1sXL67wAOmt2rPOhFZKDq7qs6Sdi9ZToXytdxKLV
	 Tf8HgbfzzjAdUi5mr0aLVp6mmpKIUW4d5xme8kxozasKV9c40Sn0SQ56M4QEAEdCcsM6F
	 KtpFditgXVf/3hTdB4GID9PxiPqkZMnk6zNUdqwuiwp9+sxRHd3M4acv0kuMTQiggL4n5
	 8Ea8U/i6Q86E4Ncpa7rjWrVa7dLkt2a3BuUY+tQFrWy1AigHVrIDjNRiOVXW5zdWwR0j+
	 EXAdg4xi0SrXComAivrUza41k6iXVScyK6fHSDh8F+/4dvCUsXk2jomoasSSG7Jo2YQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792440408;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=J4LVkPp9EUqz+kEjCw+lSXJEuKPpDJUko+U0lxm0Otw=;
	b=TOikfno/dqEIvo07Qp7UtfBu5VBeF3EKNMge/Lr4pCC5bT7RciGdBqhT4RG7Zx24PH4Y
	 diyB92sGZ2HFipkFdxv23GQfqcMhGqfcd9xTC56PEJssS//Jqp/Wyt/BOIBa8MQ/KxnMv
	 ZE17xei4LwzvhYM1id/Zt12Tp/RcF0lKvOSILZwIg1G132S6xgnzj6XHxtgHTwUEu+DP2
	 O/q2zq9KB9PQSnBV7DCS2RVKH+hwVxXmf22VXAcdWzLrQbWQRisyUnQItvjvfkDLvHIz7
	 UoCR4x6KpN6HXS4tGSRtEddoZbbW26u8DWUVLQn/k8gx8q/CYvRAGYUeS8eB8oBhlSg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792440408;
	bh=J4LVkPp9EUqz+kEjCw+lSXJEuKPpDJUko+U0lxm0Otw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lGbS1YV/a3UGvtM2DA1o9sAndoTDD7ENhgcckZlyRSG+CyQb/T55beMuQWVPpE9Xk
	 S+Oj2fmuaVYMQOoyw3XYhAvk7I3F6jrG65coo1vxrIYgbw/OUCm5XW9+qhf9Y8bTE3
	 BgOBUhzH18rmtphfskI0wBYNpIMLGMIazGjJOb9EKbmYxCwix4lTRIgI39qRol7Wch
	 5igL7iUT13Spc6nmMw2Xh0CxrDQQKuCFX9Ho+XpG9ADAZ13XKuj1ofY0OMZ46KpXB6
	 pe2Ch95XXFQR+y3l8kksdyRxvE48uPAoEEMEzxvwyCQnPAMhzh2AMUtEUx/MMwM8Wk
	 1CKCfZYebVk8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10C0C60749;
	Mon, 19 Oct 2026 20:06:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71ED811CB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5773C606DB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TO-SwpJGtVm for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 20:06:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 66438606B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792440401;
 b=M7jyNaYCkDeI6buNxh7vCKwfClDrhAG1BK08ktM6zbRwlutZSzcr3LiCxf6XwKTbIKA7
 bST9cah/qG02B86hc0EM0s+wifAvzawe30ghmvMZAn5j/FnHWOBi5z7qPmUnIks0CSq9Q
 YJH9swJhskhk4GwylizdsgvyGmYZ/X/xhN0Jt2aeG+yUTx6doMS5W82lzxvBx6PfwdLF2
 wKO1A0KzoZWmCJVt8FHrLJMreP3dwTrDoYYA8g3EwwZsfsdtzBlfQM3xhGFFrZX+wpxel
 YJkWFMDHz0TA3rQN/APC8pcIfGCsIFAxHRz5DkhljZV8YbYe1xu7g1tWzUvRYedcHPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792440401;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PexsM9KUYZ5u0lPYHnn0x76uJhNaYZ1RiyvXzZqpCIs=;
 b=Irt+Sey7ZHXWcWpF1EzArXC8D4PcFIX/u7OmT2Z7ZmNw4k21kgIGvbUfBqzP3Z4p/hTV
 7brHNeHZA20X4yTHJUyOjVyeIfxA19MF0OWwekRzZUQKC2+sE7dNVLbkTlMKxGf+mnHma
 GlBcZf/hTd9gBXzs20UZg6qycjXdXYGnFal4OzAFB9aQF2QVxkyXGadcqG8Gc+hOyfBOD
 5Ms9Av9B1SpVSFNly4qJsO8T5Sm2hENUVX3cX0prD08FiNTa72FkEmd0SzrA4zvuqWx6z
 uh/qvZOq1fW0AMyjkRS7UFg1TDw4rGz/Oa2AzhNah6EnuoiXfUiTPtZZEsagpO0PO2g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66438606B1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:06:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5B77995D5; Mon, 19 Oct 2026 20:05:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 22:06:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47cffe76f391863199e9c2ef577bdc7a0137832a
X-Git-Newrev: 8ffe8dbee5ead58c29fcee1d4e8304b80c836c43
X-Patchwork-Hint: ignore
Message-Id: <20261019200518.A5B77995D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uv-build: new host package
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ffe8dbee5ead58c29fcee1d4e8304b80c836c43
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-uv-build/python-uv-build.hash |  5 +++++
 package/python-uv-build/python-uv-build.mk   | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/python-uv-build/python-uv-build.hash b/package/python-uv-build/python-uv-build.hash
new file mode 100644
index 0000000000..bd0644a72e
--- /dev/null
+++ b/package/python-uv-build/python-uv-build.hash
@@ -0,0 +1,5 @@
+# Locally calculated after vendoring
+sha256  6b2b5c814e6ecf61a0f3743362d3399fd7578324a1b59b12e242cb6051881dc0  python-uv-build-0.12.23-cargo6.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
+sha256  860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c  LICENSE-MIT
diff --git a/package/python-uv-build/python-uv-build.mk b/package/python-uv-build/python-uv-build.mk
new file mode 100644
index 0000000000..1a4cf5a4c5
--- /dev/null
+++ b/package/python-uv-build/python-uv-build.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-uv-build
+#
+################################################################################
+
+PYTHON_UV_BUILD_VERSION = 0.12.23
+PYTHON_UV_BUILD_SOURCE_PYPI = uv_build-$(PYTHON_UV_BUILD_VERSION).tar.gz
+PYTHON_UV_BUILD_SITE_PYPI = https://files.pythonhosted.org/packages/b4/65/672d5c1e7fff2a602b51758cd96c379ea80c0c20d9d10aae5139bfde9877
+PYTHON_UV_BUILD_SITE = $(PYTHON_UV_BUILD_SITE_PYPI)/$(PYTHON_UV_BUILD_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_UV_BUILD_SETUP_TYPE = maturin
+PYTHON_UV_BUILD_LICENSE = MIT or Apache-2.0
+PYTHON_UV_BUILD_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+PYTHON_UV_BUILD_CARGO_MANIFEST_PATH = crates/uv-build/Cargo.toml
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
