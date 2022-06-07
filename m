Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B9FC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 23:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C75160F1A;
	Tue,  7 Jun 2022 23:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0WThUigG700W; Tue,  7 Jun 2022 23:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9926E60F06;
	Tue,  7 Jun 2022 23:12:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0908A1BF3FC
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 23:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB5A260F06
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 23:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-RyB2r1WD8B for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 23:12:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5310160B3B
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 23:12:35 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id z197so12967697iof.1
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 16:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9WRTk2qKZSHAajCuCCXxk0XLdeN2b2VtRN5am9g+/30=;
 b=l7eX29qtoAESoWSKv1xGLIYs5Q1WRi6EHyP0nCcjY8MK0Qq1f9akRzoAbCVY5b3BXj
 J0f9ns3qH5UpG0ap43V/hKZtKmPmba46AaT/4wWy+bO4s1QQ9Q8eTwlCFSfQhYfJaqTZ
 xY+xkTp+k7NCan8U8ZWX1kuRuy7oxLLdxxSMzDxDDXU/Y3g7rtW1Mi4RI9mzwv6aUx4S
 Fi+hpDcS5pUR0IFCECr+Y+2RRtOOHj/PsF+VutsXeTwMiWU1bdbE3Y0bd3j7ttCo9SXx
 m5K9GUwDVN903ci6ohn5HXrxYRdCQ5jAIc5pk5uu3iUZGwqP/pQm9sbVsjZl6H9PQV5K
 5WxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9WRTk2qKZSHAajCuCCXxk0XLdeN2b2VtRN5am9g+/30=;
 b=oqjEcy6bvD5DgkiqwASWrGOQY4d5Feq32eRVwtjCHg6LH/RLG5kqf0BVnl6LA9R//d
 nah2vl8OoodgQP9LpJQpkD6HQhrYtnt9GDd4Pg+SI9m85ViUqwiteSIBZBt5NPXKgyNN
 y/stOlP7r8CzAM5EZTsHWo8oeDQqO/tWdZgf7oq4LhPHbP+V8l7+tMZPdfIRdBA0b6ce
 ck8bvM/kRgwBVVgdP4hI/FF+ssJGJkP1m+6Ftbfi85Her0cPpbbDx2zVV2FzmCldaKbg
 7gDeFQFrKdfrJfmTj0N4C0BcynLYsXZXCG8vXE4clZ/1nzwQ7L4l3qnPaTLhAWhm9YAU
 U+JA==
X-Gm-Message-State: AOAM532VLCVJjbpEYmG91D6vkKHn5ym3FLond+AtGZTM8C7gk7HaR8Gd
 tv5kc0EQxiRvM2OU0yFps62RbBDP/8g=
X-Google-Smtp-Source: ABdhPJxuo9ZraRcrSQgT6ElwLdIuFOS63oyFW+L0Y/9a9JWxNd70eLSwy8Luxts0yBncVUImUtqXzw==
X-Received: by 2002:a05:6638:3287:b0:331:ec7b:5883 with SMTP id
 f7-20020a056638328700b00331ec7b5883mr214267jav.19.1654643554013; 
 Tue, 07 Jun 2022 16:12:34 -0700 (PDT)
Received: from james-x399.localdomain (71-218-113-86.hlrn.qwest.net.
 [71.218.113.86]) by smtp.gmail.com with ESMTPSA id
 p10-20020a92740a000000b002d1f0d4a9eesm7783317ilc.19.2022.06.07.16.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 16:12:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 17:12:11 -0600
Message-Id: <20220607231211.533086-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH buildroot-test 1/1] scripts/autobuild-run: add
 support for --branch option
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In some cases it only makes sense to run tests against a specific
branch, such as when testing new genrandconfig flags.

Add a config option to override the branch selection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 scripts/autobuild-run | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 337644f..ceb9daf 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -207,7 +207,7 @@ class SystemInfo:
 class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
-                 submitter, make_opts, nice, toolchains_csv,
+                 submitter, make_opts, branch, nice, toolchains_csv,
                  repo, upload, buildpid, debug):
         self.instance = instance
         self.njobs = njobs
@@ -217,6 +217,7 @@ class Builder:
         self.http_password = http_password
         self.submitter = submitter
         self.make_opts = make_opts
+        self.branch = branch
         self.nice = nice
         self.toolchains_csv = toolchains_csv
         self.repo = repo
@@ -264,6 +265,8 @@ class Builder:
         list. This way, branches with a higher weight are more likely to
         be selected.
         """
+        if self.branch:
+            return self.branch
         csv_branches = []
         with urlopen_closing(urlparse.urljoin(self.http_url, 'branches')) as r:
             for l in r.readlines():
@@ -802,6 +805,11 @@ def main():
                         help="string of extra options to pass to Buildroot "
                              "make, such as specific command wrappers",
                         type=str)
+    parser.add_argument("--branch",
+                        help="Restrict builds to a specific branch. "
+                             "Useful for situations where it only makes sense "
+                             "to run tests on a specific branch.",
+                        type=str)
     parser.add_argument("--pid-file",
                         help="path to a file where to store the PID",
                         type=pathlib.Path, default=pathlib.Path("/tmp/buildroot-autobuild.pid"))
@@ -890,6 +898,7 @@ def main():
             http_password = args.http_password,
             submitter = args.submitter,
             make_opts = (args.make_opts or ''),
+            branch = args.branch,
             nice = (args.nice or 0),
             toolchains_csv = args.toolchains_csv,
             repo = args.repo,
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
