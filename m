Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73BAD374A6
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 21:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6050084CA9;
	Fri,  5 Dec 2025 21:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3HjVUeYu1CS; Fri,  5 Dec 2025 21:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 830BE84CAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764971951;
	bh=jp7SMPLc76Y7ufGoFh6sgXd3C5o40ZXFbdwKYvb9s9A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IqEp+0nkOaHNopQHh0gcHGCPU3LSA39e33/kmHPYFh0keYwiqE1C7p5R0HMwGRIH3
	 v5wdYkRv89CE4Zh75doUm1JvEuWjKxvGX5BVfmin2F5EOdt3HCM6Mh1nqlLYV3fri1
	 w829V5e/zZVIy7lgqsKtrkKE28MJJOYHbIo5Eg3aY6ou2+KYrMV92zUO0xG+CVHd+j
	 prCbY1FJQHZQGpEGYmfSKOZSJES0K2vV75mF9Hw2lSr08Cb3qLCvEwzA7JBgHiCRfn
	 E7SUawOgYewWzeOxpFKXXSGTr7HLSGZi4PlqWBYOV4rDz+kiX6hqg6JNPNHBJREdwk
	 z0BjYnchXa3tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 830BE84CAB;
	Fri,  5 Dec 2025 21:59:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC0DDE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AFBE84CAB
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRXFNvQnXHWr for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 21:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F8784CA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4F8784CA9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:59:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFEE386629; Fri,  5 Dec 2025 21:59:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 22:57:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 00886048b27d7b86d38282a8dbd5ec3c2bcb48f0
X-Git-Newrev: 00cce8c05216e86a4ada4b01a0d5dacfca533649
X-Patchwork-Hint: ignore
Message-Id: <20251205215909.BFEE386629@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcamera-apps: fix
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=00cce8c05216e86a4ada4b01a0d5dacfca533649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Buildroot commit 95c385e2d6b92e7afa2d1fac84ecf2dabfb81d25 in -next
branch bumped libcamera to version 0.6.0 which breaks the build:

../core/options.cpp:405:44: error: conversion from
 'std::basic_string_view<char>' to non-scalar type
 'const std::string' {aka 'const std::__cxx11::basic_string<char>'}
 requested
  405 |                 const std::string cam_id =
 *cameras[camera]->properties().get(libcamera::properties::Model);

Added upstream patch, included since version 1.10.0, to fix the problem.

Please note that since version 1.9.1 this package is incompatible with
the current version of ffmpeg used in buildroot so bumping it is not an
option atm:
https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: fix Buildroot commit id of libcamera bump]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...002-core-Switch-libcamera-string-controls.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch b/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
new file mode 100644
index 0000000000..fcebffe3da
--- /dev/null
+++ b/package/libcamera-apps/0002-core-Switch-libcamera-string-controls.patch
@@ -0,0 +1,46 @@
+From f3011b5fae183a463630b4168626dfefe9b4c74e Mon Sep 17 00:00:00 2001
+From: Naushir Patuck <naush@raspberrypi.com>
+Date: Thu, 16 Oct 2025 14:45:33 +0100
+Subject: [PATCH] core: Switch libcamera string controls to use
+ std::string_view
+
+This is a change to the libcamera API, switch to std::string_view from
+std::string.
+
+Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
+
+Upstream: https://github.com/raspberrypi/rpicam-apps/commit/f3011b5fae183a463630b4168626dfefe9b4c74e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ core/options.cpp    | 2 +-
+ core/rpicam_app.cpp | 3 +--
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/core/options.cpp b/core/options.cpp
+index cf704c2a..d3296548 100644
+--- a/core/options.cpp
++++ b/core/options.cpp
+@@ -418,7 +418,7 @@ bool OptsInternal::Parse(boost::program_options::variables_map &vm, RPiCamApp *a
+ 	std::vector<std::shared_ptr<libcamera::Camera>> cameras = app->GetCameras();
+ 	if (camera < cameras.size())
+ 	{
+-		const std::string cam_id = *cameras[camera]->properties().get(libcamera::properties::Model);
++		const std::string_view cam_id = *cameras[camera]->properties().get(libcamera::properties::Model);
+ 
+ 		if (cam_id.find("imx708") != std::string::npos)
+ 		{
+diff --git a/core/rpicam_app.cpp b/core/rpicam_app.cpp
+index 9e5a2d0c..0f0b5ffa 100644
+--- a/core/rpicam_app.cpp
++++ b/core/rpicam_app.cpp
+@@ -128,8 +128,7 @@ std::string const &RPiCamApp::CameraId() const
+ 
+ std::string RPiCamApp::CameraModel() const
+ {
+-	auto model = camera_->properties().get(properties::Model);
+-	return model ? *model : camera_->id();
++	return std::string(camera_->properties().get(properties::Model).value_or(camera_->id()));
+ }
+ 
+ void RPiCamApp::OpenCamera()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
