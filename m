Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D6AC001DF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 05:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F3C60F17;
	Fri, 28 Jul 2023 05:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5F3C60F17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKQlz5N5Kn-v; Fri, 28 Jul 2023 05:25:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 109E760F48;
	Fri, 28 Jul 2023 05:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 109E760F48
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 057E81BF3AF
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 05:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D305483C76
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 05:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D305483C76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6cZ0O_rwvWc for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 05:25:35 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C1F383C59
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 05:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C1F383C59
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bb84194bf3so10814725ad.3
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690521934; x=1691126734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e30OjKunJCp89fsmRPN9wD8X9XnRf4wKxirJay2JXtg=;
 b=hBEUoeM4TssQgaRwZTFnLx4ufSLkd4TBl9Rd84InWaPVDw1YkrRcpKLet9OudQJ6jp
 wWiXo8rRqCZ4SVuTZpPW8Ap9oAywSIfeEd1gEtEIRxTtgRDyEYIpECYgdOUdN/fSq8xe
 fjiHNZQLnsh4OOxhCpz/GcKmNmU8Ilgeo7H8a1QNtmQNnjNr3Avg3BrYLlN0e7EvVoL4
 yunwW/EHlZzeHMTD4jnQy3vZ79sedLDYOGdXvHKo/iRnaUZaXGnwX1N7WPSg/oQ8y3Qm
 snOEgLWth2peNQ0Y9Ry+wIofeVC9BVJhFX1VOuxYqLcmw6RJt0Qaw7B8xUiMj1iU0NQC
 Kjyg==
X-Gm-Message-State: ABy/qLbEZR1NoN/L8XqKjFI039pLZC0czRKLc9qKZYelvmjT7UIFqxXO
 guGrdy7+bxsQHZjAZ3RIMXICS1nUabVoRTFK9xAFAEtNUhX32w==
X-Google-Smtp-Source: APBJJlGbps4JMU6bKK4/99KJDDcMgkM81GDQcRES5d6Y2TQAExr9BsTMyAWHpLtQkWyWYURycnhoXA==
X-Received: by 2002:a17:903:41cf:b0:1b8:ae8c:7bfb with SMTP id
 u15-20020a17090341cf00b001b8ae8c7bfbmr643163ple.17.1690521933619; 
 Thu, 27 Jul 2023 22:25:33 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 b11-20020a170903228b00b001b8943b37a5sm2592749plh.24.2023.07.27.22.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 22:25:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 22:25:30 -0700
Message-ID: <20230728052530.1122268-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690521934; x=1691126734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e30OjKunJCp89fsmRPN9wD8X9XnRf4wKxirJay2JXtg=;
 b=LBDHj2HfPZYAj8z14uBn92VIBscsGWc7bkSitKQxVLeN6kLKkgTz+ZkN8lo1vVO7e4
 HbpNIrhp/GSOdMq4PGKuONGVvHeO1hQqLr/ZlEGPR6VSQ+34nj9C8cBP/EAZo1pf2EWs
 pxhp7wsFtmABVRX4UE3WpNmCA78PhUi+B0H0KMqRok4uON2hrHhyBpH3bu/cQrptmikg
 HoiCCIMJ0vejQ5pZfzsx4Q0e/GlVOHTr959KMctEbLRFF/xm7uG+u6EcOtrHuMw93nUM
 5nYkbAepPHaRSW5qDaeQQh8RJgIOyDCPqLfjyBQwb1NI1kEzuETvExPS3EMS+dD7HxIW
 M3SA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=LBDHj2Hf
Subject: [Buildroot] [PATCH v1 1/1] package/go: add toolchain as dependency
 of host-go
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Running "make host-go" in a clean Buildroot tree causes a build failure:

Building Go cmd/dist using /host/lib/go-1.19.10. (go1.19.10 linux/amd64)
go tool dist: cannot invoke C compiler ["/host/bin/arm-linux-gcc"]:
fork/exec /host/bin/arm-linux-gcc: no such file or directory

Go needs a system C compiler for use with cgo.
To set a C compiler, set CC=the-compiler.
To disable cgo, set CGO_ENABLED=0.

Despite the fact that we're compiling the Go compiler and not compiling anything
for the target system, the Go compiler make.bash still attempts to call the
target C compiler during the build process.

The dependency on toolchain is necessary only for host-go and not the other
host-go-bootstrap packages as we only pass the path to the target compiler to
the final host-go compiler package make.bash.

Fix the issue by adding toolchain to the host-go package dependencies.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index efa47e5781..ada343f766 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -12,7 +12,8 @@ GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
 GO_CPE_ID_VENDOR = golang
 
-HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2
+# Go requires the target toolchain to build the compiler.
+HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2 toolchain
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
