Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B927FA3722
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34A780F19;
	Thu,  1 Jan 2026 21:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8oh3lSNGclx; Thu,  1 Jan 2026 21:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E72E180F35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304373;
	bh=XGMUv0NqwBhyR978db2yvLdx+CxnQUdSrs9/aNhtLeE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lqbQvfvIbe+fVOoi4J6TLwsZqsfSTytfoAg2IQjPA3SByTdW06bqaDXoWQnaMQIEN
	 z4pzk64A8gx7vTDysSnx55T8YzsuSQPrHU3z7E0EpSoC2eNEN77j14kHgxLaS0b/xu
	 yqmiYKxy7j3bfXWl2eHVhr8q19yGFoQY6wbnDkGa/Axda0WmeQ6ejzt1aaIccR3PxE
	 rrJ2xMuP91ytAgG0dH8+mm4RJ6zx1AkXMFTAFREHBY8Ljb6Y8nVkbyFBisvbO0mI+d
	 abOc/7DpF+IVmWEceclbQ23HV69G9JQDHLjux2uwIg2yvlhQZYtiOjTfYF3DJ3fAUT
	 4S+MumJBA3P+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E72E180F35;
	Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD3D8206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A31B16071C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xn7tLS2kA8jq for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFDAA60686
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFDAA60686
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AEBB87F13; Thu,  1 Jan 2026 21:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4befa9ff66bcdef2de9e765dd330a6bb87bd61b
X-Git-Newrev: ca4d9af913c8f88abda8a0f216fc7eb642b1648e
X-Patchwork-Hint: ignore
Message-Id: <20260101215250.9AEBB87F13@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/migrating.adoc: document static JS
 library
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca4d9af913c8f88abda8a0f216fc7eb642b1648e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds information on how to provides static JS libraries in
Buildroot with the release of the 2025.08.x version.

Because the way JavaScript project development is working the chances that your
project is using the same version of the buildroot package, and you provide
this library from `/var/www` to your users is actually really low ...

If you want to bundle JavaScript libraries in your project you should probably
either use a cdn, handle the package version and location of your choice in
your external or overlay, or just bundle it in your assets from a NPM workflow
to benefit from some minifications from your bundler.

Historically many of those JavaScript libraries were added in the 2010 eras
where it could make sense for them to be part of Buildroot.

Most of them are also way outdated/not maintained.

For more informations see https://elinux.org/Buildroot:DeveloperDaysELCE2025

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/migrating.adoc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 9ded46bfa2..eabaaa80a7 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -228,3 +228,17 @@ your kernel or use an alternative network manager.
 In 2025.11, the +FOO_INSTALL_BINS+ variable for golang packages is no longer
 supported; the list of binaries to install is automatically derived from
 the +FOO_BUILD_TARGETS+ variable.
+
+[[migrating-js-libs]]
+=== Migration to 2026.02
+
+Starting 2025.08, JavaScript libraries that were just copied to `/var/www` on
+the target filesystem are not part of the Buildroot packages.
+If you want to provide such libraries either:
+
+- Use a CDN to target the library version of your choice.
+- Serve it by adding the package to your external and installing the content to
+  the destination of your choice
+- Serve it by adding the library to your overlay.
+- Install the libraries from your project with NPM and bundle with a JavaScript
+  bundler.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
