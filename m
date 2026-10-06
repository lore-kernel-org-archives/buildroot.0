Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15A0CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 21:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4521B60B57;
	Tue,  6 Oct 2026 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvZ-WJzEbg0J; Tue,  6 Oct 2026 21:10:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 37E4D60883
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791321012;
	b=rNnGtKx3YfJYYQhPhKYHSUs3pObFh2D196pDMYkQKYhQLi6o6UAnrSuTX6qYohKmomve
	 I5LxBHwCG6crV+Vb2hAjJqChGMMLAXltBgLnqp0OoM5MPf+0wTlcPTr7Sv6vh8g0nmvPR
	 mugB+16LrcoUUXSMiqyIl1afejBOq58EdCsTkJvVspfontKmwf+MICjBD5M96AUZ2Speu
	 7gdnbNENkE44APyQCGWpcEiXW1AxNnIoDlORXhIhXg+WSIbXahJzqr4Or3xLPUVPg4CKM
	 fe+bbSbi9kR1T/VFCPYhUT0/GCnXkCsO0g/UqmIqoHvGmWhZ0LeJ9qn186fZKWntz9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791321012;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=NdJZ+9pmt3ii8voxMwiDpdTq+xNLz1Ako/ulqL9PNsM=;
	b=NUTPmTGzirVumGaG5YmbEWS8NegCUxKN5hXiX7z5S7lWnkRit3B9iJ91+lqZItgeX9wD
	 w6jqs+9HLNrf7Td016vzHdumAWhlnFQyCJIoJXyKkaxS9Dw/gq+egcPRnOTAaC131SvyN
	 RsrEbb+lwUMKVd75YeYJHMXYfQwdW3cdnc9rMuzfrkCAQTYzmfEVcUfHaoD4QEmqnGE9E
	 ntXm91IV48qwDVhbkeht0KuRiE+wZTnFbNVG34y++Yj4UmfbjEraJCSP8GJOa3rx5Z95k
	 28DGa56Qvg39UMCWkja+ieyM5xbbx2sK7oQ1/rEY7gI9cem0U4RqaceU91VmiermXqA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791321012;
	bh=NdJZ+9pmt3ii8voxMwiDpdTq+xNLz1Ako/ulqL9PNsM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cUrjD4ctP8l41nmUm2Xm8JSK/yg1QqEeCweD5OKpNkBfHXsmCTxfZywD4zmgVd/Bm
	 jqwJ5+dkKjhs6yEq4A8c2wc845RDuUdJcrcnjH9TNvwB/108UzflAGaJS7I+0kbHm9
	 4KSmkqaPIAHsD+y23CIkFYUSrDfVnmy8Pq0zuCHAdADS9oGZvARiUbvde0hyeEX3y8
	 rJW+qh++MCZTVKZrcpsgBi4IaB28qNbLbGZjqDh+S7SVadCdbSab0m5EiuQC6mky1u
	 H4Cxy0nqMGk0zrgzK6xy9QitDdKcJVF+p4GvJVZL2HjbMyLOh+Dg/4sixiqE/4Hgyk
	 lmwmzya27Ffwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E4D60883;
	Tue,  6 Oct 2026 21:10:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C46121D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 21:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5B6C607ED
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 21:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5s-mKRsrFKE for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 21:01:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CCC05607C9
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791320496;
 b=EWIcM1Ex9X/Czhrbjt2rS1KpkyAT/qcvYIUMBBw/V7YmGN8y3jj88v7D3JzYh2C9UtjN
 BNOXIx6SEhRKSTA7EH+kpbKBfx/5FLL9mD8uaG0eMi88wcjsoeVrAVyEkpM715zvjAwLy
 spU39QGQ1wxIk7HkifQnITPiAYaDgo3kSw3vjgfpTn0iLlni5PT0fs4btX//NmiSuKkrW
 TnqWdNIPw4T6f6hwROhsbQ5UJIaV2+YLKwIKlq78PjNZZpE+xCVWRKQW2m6JUesMRMfnx
 j4jcqzE/2bHmjs2fDkDbzPWakahGM93rgpR4tlem1OuWMT4I/I/87nvRj8GNp3AZbow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791320496;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hjlTXl20RRtRlaR0DlcyobUex1yKuCV63oK9jWxidAk=;
 b=qwX6Li6Ur7dyxBBDiRYU8dJ6HAiRsn9W0z2n38q+X10kF0uEuDf5/M515i2GYKgDo3XS
 y6SshvwyWT86jS2FEXeLNlbQzXLjrAPRw1KtIXQgDFgagEup5OZ2ZLXs13IataL9mxo3N
 U1EuFO2jVhdJL4uFd5gn4r4wBw6SPgF6tcK/iXYwMwahvUm4MQFugybiYEt7fWu4rnL9S
 nTEFZUsqM9KhVoiE5nip0T/qOVohjgw/mFTYKXMYKN1GTw5z9fHffl8H1bMV4xm/TyeZW
 d6aDmKqVTdAhSXKXdOFVnLQWhwPPxAN5uV0rJmDg2u7NoZwnkNjPsm+ZqhRALEdKFKg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCC05607C9
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 21:01:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 742D08D755; Tue,  6 Oct 2026 21:00:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 23:00:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f51bf05d245a73d61d9a419f44de40de8c1d7424
X-Git-Newrev: 846bdb2222bc03c26be61b4be4101c80f1c21463
X-Patchwork-Hint: ignore
Message-Id: <20261006210020.742D08D755@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: add opengraph image and meta
 tags
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/846bdb2222bc03c26be61b4be4101c80f1c21463
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When linking Buildroot website pages on social media, some platforms will
attempt to display an image. If such an image is not explicitly specified,
then the social media platform will usually take the first "large" image
from that page.

Recently, there was a post on LinkedIn announcing the new sponsorship from
Texas Instruments, linking to https://buildroot.org/sponsors.html [1].
However, because the first "large image" on that page is the logo from
another sponsor (EVS), this is the one that got displayed and it looks
awkward.

To avoid this situation, let's implement the OpenGraph protocol [2], which
is adopted by LinkedIn. Explicitly specify the image, which is the Buildroot
logo with text, exported from the Gimp (.xcf) original image. To avoid
rendering issues due to transparent background on social media platforms,
the logo is exported with a background color.

[1] https://gitlab.com/-/project/2648174/uploads/5e518b0ec5a2f48d154466aaf117e6ab/image.png
[2] https://ogp.me/

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/header.html        |   7 +++++++
 docs/website/images/logo-og.png | Bin 0 -> 123359 bytes
 2 files changed, 7 insertions(+)

diff --git a/docs/website/header.html b/docs/website/header.html
index 8d610bb442..0219ea18b4 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -8,6 +8,13 @@
 	<meta name="angelo.compagnucci@gmail.com" content="">
 	<link rel="icon" href="favicon.png">
 
+	<meta property="og:site_name" content="Buildroot">
+	<meta property="og:title" content="Buildroot - Making Embedded Linux Easy">
+	<meta property="og:description" content="Buildroot is a simple, efficient and easy-to-use tool to generate embedded Linux systems through cross-compilation.">
+	<meta property="og:type" content="website">
+	<meta property="og:image" content="https://buildroot.org/images/logo-og.png">
+	<meta property="og:image:alt" content="Buildroot logo">
+
 	<title>Buildroot - Making Embedded Linux Easy</title>
 
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/paper/bootstrap.min.css" integrity="sha256-LxKiHTQko0DUCUSgrIK23SYMymvfuj8uxXmblBvVWm0=" crossorigin="anonymous">
diff --git a/docs/website/images/logo-og.png b/docs/website/images/logo-og.png
new file mode 100644
index 0000000000..c8f893b7d4
Binary files /dev/null and b/docs/website/images/logo-og.png differ
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
