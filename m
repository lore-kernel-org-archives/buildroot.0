Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07BE606A31F
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KpZCAjCn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jh8VJZBm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C17F281C26;
	Wed, 21 Oct 2026 20:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_epI-S5elMh; Wed, 21 Oct 2026 20:34:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9E0FE81CA0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614880;
	b=P3DxzBgYBy/CU0K10G8+JuO/IsVTpnYyf2yUmMMfcOBnqZKBHB+FLH4twIex+P1h8Dcm
	 IEAACSxl38LIbepR8Jf1GOeyl0g+KjIwm9dz7X3KG5gdD4wGrMbKyo21K6XYv3mfdnpXB
	 nv5IQxnQ7hjE533ofj0vcXhvarfBi0kYUBsyc2oIqfYIAWn9IQTitMPusxjB1dKeqynce
	 12KbSpuAlDTahSaNj3190XPDJv72999sl/4YupWyUSVdkLJ4VoyVwFWsPbeLrYI8jW0Ca
	 oli98zfBqTgzoYkbQ1oZz9uk5UrBtsQpdVOuQpvEto/g+X8G9cIQknjubbBbq3zlSkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614880;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ZORIvP16Mj72RWAQx5vH2rAdHlw7O/+JNdK4iNV+TPU=;
	b=V+yJ44xi9mA0P+dvU49ARTszhyJmQ9X6YuBExnublTFD9E/oFZMU0EeGk6G7VsCcSlWa
	 PNEWg2EXL8xw+YDeI35XDc/dnC/OO7SgsifzsNEp0cKS5hVomsKEk8w1wQbjdgZSpC+b2
	 uwOufbj3vNM4uThakoUR98619pQprBD71Y+sDuZZpYPeF6GUo3bQCGto1wnzUH/nnuucj
	 2BgZIBefcf4kktJnFloLIlUI7cjA8TwJifAOj6DWEfZOIXRvUky6ALjXcSIb8k1RLnJOt
	 qyBeysCApiy65XBw/h0W0YIYlcGtaDXZbHrJuofNz2DVvx73RagpnY6YX/1+ZFxr74A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614880;
	bh=ZORIvP16Mj72RWAQx5vH2rAdHlw7O/+JNdK4iNV+TPU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KpZCAjCnTmm/C2nOw/F55GMsluWZJ12kGrFa7K4P4lm9ILG1hvLQGKKOHGH8pulS7
	 60bOe2S0VboTrgt97dQeQDFEs1bp9ygMzu31np/ZyNjcT6UAHIVruLS8eMDfTlQShw
	 5mmi46cnlh2SoaUl+qIYdiI7Qwy2K0TrLUJeoGbCqxsCLTZ4FmritRb6w0ETkFJijM
	 6Ctwjp3MnBFJyzuQdzVV3JT7RO48fT94n1ETszOQchjdlIJ2/8MoQ4dOzL7wyVe1Yp
	 QRiJmm9Ue5MRAQHh+vtSqlbKJnPv44HaxhYBMYPc09E4HhIOs6HO2sFwE/gCH5eoYK
	 jicKvwPNVNpsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E0FE81CA0;
	Wed, 21 Oct 2026 20:34:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 370B8769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3428C40F5F
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjkmxHURPeAj for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0CFAA40F64
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614867;
 b=J2XUovn6KIZ1cIGsW+RRVeBWEzo+CUhzRy3MoOBIZKZMjGtLy4jC9BYx6lBtMj/vBQQa
 DcBYxNrnRdABfKBMiyggOzWQNnxUNYnga897BJoS1jNgd6g1T4XBjxZ+XVTTwGjRfxC/8
 sDPka0qXGRUh/LwT8i0a7LDnPI9Nydlae+BmJWc72Y+lyK7KDdP8mMgspspPNnMyZ2skn
 as5nlFXypLmFdDspz1COhXPzrisPgGKjte3vvStLXs+b1BEN3SkCxyOmWLPqDWfteeCAo
 j4IY7OoS6/t80jkWJmLDeZnYCSADnzu96hy4oDoXPFBCsup/oUY66I3qBtEh2ZVPg2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614867;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=QwBAwBQs6GQpFMMIgnCJbvJMbj6v8H4zsuUzJrPv4mo=;
 b=A0c1ZmwWMQGkpLYDh3bLEra1KX/jv0viO9H6z2+Wp8TXgkoZWXp4JAYCe3bLcHnr0ljZ
 Hf+up5O/It+6OTBV5dlp9tZ64U3XBHBSkDcj+kBaff8bWS9HU330gfDA7zsh5qyo+VWuq
 0EW2Uch4Ro3PTfLk/CEWjtPLK9nKE+0+eXQg4bCUCLBr8lqfqf6eGzB+c2ynWTKZYe1NR
 b1pWEnzYEaFaMrftDLocqQTIQzRXe/bxoZUI5vbVtIqn2/pQVNEJS/W173iASfr7t2yEe
 mVNBFPUikOjMjty/EuQKdA/znhZM3w/Fr4hRg9Zn72+3t0k7IiTXvrBl2TBX5ED0vLg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jh8VJZBm; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jh8VJZBm
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CFAA40F64
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:26 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-4af7283bf83so522346b6e.3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614866; x=1793219666; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QwBAwBQs6GQpFMMIgnCJbvJMbj6v8H4zsuUzJrPv4mo=;
 b=jh8VJZBm7mND+a3GE7xB8JSF6PE5HtItyNt6at6Y/c/uu+Kh23oM18/lC+jIllh6Yq
 34XpBhQ0KPOVEdz+Jtn9/ZMSrV2MMnau96xRdaBGz65ddBsDTFA2DAs8NsMmoWNGMwrG
 kSWkD464qPxMJVm3sWhwpye/sYUZu+1v0gQrFBthBq1omtktlBGgWePs5B+ACZHXXP1g
 +azN85ktYhB2rZD+OLuH/9W3BgDYlqE864uycrhg9fHKJ0dYFRgbDj0cTWbpCUqokS3t
 lEO5aF9OosL5EK1NfBa2+caTpcOswTOkqJHmFRn85SzPZvIBIUZ3UNlvohQXtLy2FTXM
 8jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614866; x=1793219666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QwBAwBQs6GQpFMMIgnCJbvJMbj6v8H4zsuUzJrPv4mo=;
 b=NFF7hLwOFdCM1A2/vkpJo1Bk/cO7F3iyGPRTVpqt/8D+1efFZIvf3w9UUrGo/FTS/p
 JJgkGi6VOdIYyd7dF7Z+YINmCteVkoy/f025ax6k4a2dUpw+cn1oCc+j+fhOGlmvOkF+
 Obc2cR6J18ibJXfsxt4/O02hrQfZxvPB20yCAVNVVhblzFmEitwgJefhS7iOhNdFM2IW
 KuBqaH9daRZ62w4s2nrR4wuRnURvwZ1Rl31ItJsP7TZk8+vtK8m+kg8n9P02qQulJTL2
 ATHCtZwIqXpdxw49PaY+uw6OWRxfGM9WVwAHnzjlmaIi5lupCLxtAC1OtuGNpbf41dx0
 wH1g==
X-Gm-Message-State: AFq9FYJ4WfUF8JR/XXheDAAO647Pc0i8kl/M5x5Y5ZwbPU8ntvOnMPXg
 eLt8SVW5azsnQg/mJK91ywFvhBDkAAG3G1z9pSpfXzbTkchyqNqSn+K+i7eAdw==
X-Gm-Gg: AYBFou3pQnyHJd1LzZHkxCvHOWLSnvRL1QCqfc6kA+iAsiEpzIwrZV0C9vmtRNEO8RO
 xnyvNB/yCfz5rG6X2Gk0L6ydhUiOxUs8aDek1y4b1cm8uKpvOOTTtRX+678MpD89WlcyDaFhb9q
 EYIIMj9dEzaWL8o4gg2Nq1tb3ZkMCDxAbWdtReVE1QWGPRnwyatEA/pLTiymqDDLW9hAd6EEEbb
 Aa8mv65e1+It0hb5ol+HBRDVMMSi4Z/cTQIqOEY28zudPYkLuXfnvp7mpvQlrHixTy+SQ5sEULI
 CJipcWbaH9KV/RyamrHl/Sn7d7qtZEMOOpOAn/p9XU5rcvwJ1+HTv7HY9ZiPM5+k9LfvKMJ9hL0
 ZMlNlg9XHiIr0VX7fTpzkN/aliaydVC9SRDOjnJ7yjHQtM/fNPpB4k72JwKNo2tmrgfGuqSA7Cs
 +vDo1OOdxB2Fma3hc65j+CdHpWDh9JdW/hMrkBQudJxf3iVFpcaD8RBET7eTcVS4XPnXWfw95gm
 vBILYJFjJBl3Q8EtlKwI/FJFg3DsPY+oFteMFq2efJZKbfLQzRnZ5BKD+jZJZhWv43Kb4saX1ri
 fMTKn8rnzNbjv5YnGGYphHyuQRVTgMHq22tablcHQILrxD5/7Mo2V9t5FstdYFj3GUti0/R+5M3
 iKRdEpiEU2kBrX+ZK0mSZmQfK9hm7TwAWF8M4uIFnMZuXjLyOdsltifK/uahpfjuUFm+T3DqYEj
 EXtihGz+jiiPb1sJuqPwlg4skKDCu8doJks37P/n3wFzwV6Q==
X-Received: by 2002:a05:6808:1798:b0:510:3f21:164f with SMTP id
 5614622812f47-55358195c17mr2079546b6e.31.1792614865612; 
 Wed, 21 Oct 2026 13:34:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:34:09 -0600
Message-ID: <20261021203410.3114473-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 15/16] package/python-pkg-resources: new host
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Setuptools 82 removed pkg_resources, but older U-Boot Binman versions
still use it. Package the standalone PyPA snapshot so these consumers
can keep working when setuptools is updated.

Add a small setuptools pyproject.toml to build the module from its
repository-root layout, and include the license addition proposed
upstream. Supply packaging, jaraco.text and platformdirs explicitly,
as the standalone module imports all three at runtime.

Add a host runtime test covering resource access, dependency resolution
and cache lookup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-LICENSE-copy-from-setuptools.patch   | 39 +++++++++++++++++++
 ...-metadata-for-the-standalone-package.patch | 39 +++++++++++++++++++
 .../python-pkg-resources.hash                 |  3 ++
 .../python-pkg-resources.mk                   | 17 ++++++++
 .../package/test_python_pkg_resources.py      | 14 +++++++
 5 files changed, 112 insertions(+)
 create mode 100644 package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
 create mode 100644 package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
 create mode 100644 package/python-pkg-resources/python-pkg-resources.hash
 create mode 100644 package/python-pkg-resources/python-pkg-resources.mk
 create mode 100644 support/testing/tests/package/test_python_pkg_resources.py

diff --git a/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch b/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
new file mode 100644
index 0000000000..3ecd63fc8c
--- /dev/null
+++ b/package/python-pkg-resources/0001-LICENSE-copy-from-setuptools.patch
@@ -0,0 +1,39 @@
+From a5315eb2caffc9b4a43439df81e6a0d7f7647352 Mon Sep 17 00:00:00 2001
+From: Achill Gilgenast <achill@achill.org>
+Date: Sun, 15 Feb 2026 15:58:35 +0100
+Subject: [PATCH] LICENSE: copy from setuptools
+
+Copy the same MIT license from setuptools, just like the rest of
+pkg_resources that is compied from that repository.
+
+Upstream: https://github.com/pypa/pkg_resources/pull/20
+Signed-off-by: Achill Gilgenast <achill@achill.org>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ LICENSE | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+ create mode 100644 LICENSE
+
+diff --git a/LICENSE b/LICENSE
+new file mode 100644
+index 0000000..1bb5a44
+--- /dev/null
++++ b/LICENSE
+@@ -0,0 +1,17 @@
++Permission is hereby granted, free of charge, to any person obtaining a copy
++of this software and associated documentation files (the "Software"), to
++deal in the Software without restriction, including without limitation the
++rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
++sell copies of the Software, and to permit persons to whom the Software is
++furnished to do so, subject to the following conditions:
++
++The above copyright notice and this permission notice shall be included in
++all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
++AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
++IN THE SOFTWARE.
diff --git a/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch b/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
new file mode 100644
index 0000000000..e9982cd1a0
--- /dev/null
+++ b/package/python-pkg-resources/0002-Add-build-metadata-for-the-standalone-package.patch
@@ -0,0 +1,39 @@
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 13 Oct 2026 16:36:30 -0600
+Subject: [PATCH] Add build metadata for the standalone package
+
+Build the extracted pkg_resources module as a standalone wheel, mapping
+the package to the repository root. Use a static version for this snapshot
+so building an archive does not need setuptools-scm or Git metadata.
+
+Upstream: Not applicable [Buildroot snapshot metadata]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ pyproject.toml | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+ create mode 100644 pyproject.toml
+
+diff --git a/pyproject.toml b/pyproject.toml
+new file mode 100644
+--- /dev/null
++++ b/pyproject.toml
+@@ -0,0 +1,19 @@
++[build-system]
++requires = ["setuptools>=77"]
++build-backend = "setuptools.build_meta"
++
++[project]
++name = "pkg_resources"
++version = "0.0.0+git.7fa76c17"
++requires-python = ">=3.9"
++license = "MIT"
++license-files = ["LICENSE"]
++dependencies = [
++    "packaging>=24.2",
++    "jaraco.text>=3.7",
++    "platformdirs>=4.2.2",
++]
++
++[tool.setuptools]
++packages = ["pkg_resources"]
++package-dir = {pkg_resources = "."}
diff --git a/package/python-pkg-resources/python-pkg-resources.hash b/package/python-pkg-resources/python-pkg-resources.hash
new file mode 100644
index 0000000000..e80a20de6f
--- /dev/null
+++ b/package/python-pkg-resources/python-pkg-resources.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5fc3f3fd8e23438a83d366897ce4389d2983d977b4339303359a0ffa0a33c15e  python-pkg-resources-7fa76c17eacf8a67c6932c9c2dd97861f42439cf.tar.gz
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-pkg-resources/python-pkg-resources.mk b/package/python-pkg-resources/python-pkg-resources.mk
new file mode 100644
index 0000000000..35076514f4
--- /dev/null
+++ b/package/python-pkg-resources/python-pkg-resources.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-pkg-resources
+#
+################################################################################
+
+PYTHON_PKG_RESOURCES_VERSION = 7fa76c17eacf8a67c6932c9c2dd97861f42439cf
+PYTHON_PKG_RESOURCES_SITE = $(call github,pypa,pkg_resources,$(PYTHON_PKG_RESOURCES_VERSION))
+PYTHON_PKG_RESOURCES_SETUP_TYPE = setuptools
+PYTHON_PKG_RESOURCES_LICENSE = MIT
+PYTHON_PKG_RESOURCES_LICENSE_FILES = LICENSE
+HOST_PYTHON_PKG_RESOURCES_DEPENDENCIES = \
+	host-python-jaraco-text \
+	host-python-packaging \
+	host-python-platformdirs
+
+$(eval $(host-python-package))
diff --git a/support/testing/tests/package/test_python_pkg_resources.py b/support/testing/tests/package/test_python_pkg_resources.py
new file mode 100644
index 0000000000..72acde3dcd
--- /dev/null
+++ b/support/testing/tests/package/test_python_pkg_resources.py
@@ -0,0 +1,14 @@
+import infra.basetest
+
+
+class TestHostPythonPkgResources(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-python-pkg-resources"]
+
+    def test_run(self):
+        cmd = ["host/bin/python3", "-I", "-c",
+               "import pkg_resources; "
+               "assert '__init__.py' in pkg_resources.resource_listdir('pkg_resources', ''); "
+               "assert pkg_resources.resource_string('pkg_resources', '__init__.py'); "
+               "assert pkg_resources.require('pkg_resources'); "
+               "assert pkg_resources.get_default_cache()"]
+        infra.run_cmd_on_host(self.builddir, cmd)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
