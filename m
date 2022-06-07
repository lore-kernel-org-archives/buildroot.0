Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB14C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 23:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A95EB405F3;
	Tue,  7 Jun 2022 23:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngmkUkXZ1OyM; Tue,  7 Jun 2022 23:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5DAA403F7;
	Tue,  7 Jun 2022 23:28:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86E751BF3FC
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 23:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83D1684484
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 23:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPVXH-YJkNzw for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 23:28:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA39C8447C
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 23:28:09 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id d6so4579653ilm.4
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 16:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=viWOQiPFFhxj5p9Qc2TcMYQDWW/adNPeplj9ad7ZBLw=;
 b=oUncxFdtD8E3QKQQpKHCydfjzldw5QxRh5R+krHRAQMNyNG591V6PE5XrgH3PQg8kA
 IKbQVZo73Q4yrDo/LJjfAELGLtsH8remXTX/JbaX4ShXisDDC8efTj4rrEtnuN/VUS5D
 mXq/VUOCqWBrfHWBH/y0NkbIuFYwrASFzO4RDPlsFMd0gnvU1A1jVl3pQbdhk9RXCn8W
 VRYwVigSWNLcEIAE/OeFxwg1EIXabVgrEle5RLuIY4Lr/4AXwVcbpmEhLBulemFA+1Nv
 PFDs49VljsfU0l2LD/hypUMMsyAt25ElcG1Ff2rz3AMiiAmTaV/Z4Q2smPE3S42uSciX
 aLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=viWOQiPFFhxj5p9Qc2TcMYQDWW/adNPeplj9ad7ZBLw=;
 b=GBxv2rVFHQgs0yQ8bbkTu3RA1cn6OB4CY2wcnAGcYcFnnC7I7tC/xfXvMSHMwOmQON
 ARoC/pMa19zxRkvERJElJCU8iraxC4SVSeFsmv5/4SXdBrd4RGBr5sH+/gIic+9+YAgA
 h3E9ELC4dUGaGSc/IxKcE0TEsttYq5yZydzURgbnspk3omPFVSA3qBqN7zBk2cWg8QVc
 3zkcBKY1TScdCyAjwGaloY53Itt9D9XT+n65Z8Uv8Jxhl83JxfAqlfWmcDAkDFej+8k/
 WwmTcUCNFGWytPiqRyrk+1GSOCHT6yhC/k8bBrnBj9IqDC9H0xH47D4OpdUXxEF0aUrJ
 NzDQ==
X-Gm-Message-State: AOAM533QTFzDaF8BRo48/5mzPzZ9Xad8qw0Y67NSy7aCgeicoyyxoDdS
 y34/YtTIcthu+Iidsv68OLuyqeMDj2o=
X-Google-Smtp-Source: ABdhPJx89yDtkOw2dw1HDaiKuCfjJyX76dhjkFu7W2DS3d4Yj+kYaBBGo+5m2iZfA1oDrWLf3pPe7w==
X-Received: by 2002:a05:6e02:17c9:b0:2d1:a85f:7bd3 with SMTP id
 z9-20020a056e0217c900b002d1a85f7bd3mr18498983ilu.92.1654644488642; 
 Tue, 07 Jun 2022 16:28:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-113-86.hlrn.qwest.net.
 [71.218.113.86]) by smtp.gmail.com with ESMTPSA id
 g10-20020a02a08a000000b003314eada5b9sm7123338jah.14.2022.06.07.16.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 16:28:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 17:27:44 -0600
Message-Id: <20220607232744.971937-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH buildroot-test 1/1] scripts/autobuild-run: make
 hung build timeout configurable
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

A reasonable value for this may vary depending on system load, specs
and how many parallel builds are being run, so we should make it
configurable.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 scripts/autobuild-run | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 337644f..cfd49ec 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -120,9 +120,6 @@ else:
     decode_bytes = _identity
     encode_str = _identity
 
-# A number of packages can take > 60mins of build time (e.g
-# gst-ffmpeg, qt5webkit, mimic)
-HUNG_BUILD_TIMEOUT = 120 # mins
 VERSION = 1
 
 def rm_ro(f, p, _):
@@ -208,7 +205,7 @@ class Builder:
     def __init__(self, instance, njobs, sysinfo,
                  http_url, http_login, http_password,
                  submitter, make_opts, nice, toolchains_csv,
-                 repo, upload, buildpid, debug):
+                 repo, upload, buildpid, debug, hung_build_timeout):
         self.instance = instance
         self.njobs = njobs
         self.sysinfo = sysinfo
@@ -223,6 +220,7 @@ class Builder:
         self.upload = upload
         self.buildpid = buildpid
         self.debug = debug
+        self.hung_build_timeout = hung_build_timeout
         self.build_parallel = False
 
         # frequently needed directories
@@ -388,7 +386,7 @@ class Builder:
             if os.path.exists(build_time_logfile):
                 mtime = datetime.datetime.fromtimestamp(os.stat(build_time_logfile).st_mtime)
 
-                if mtime < datetime.datetime.now() - datetime.timedelta(minutes=HUNG_BUILD_TIMEOUT):
+                if mtime < datetime.datetime.now() - datetime.timedelta(minutes=self.hung_build_timeout):
                     if sub_proc.poll() is None:
                         monitor_thread_hung_build_flag.set() # Used by do_build() to determine build hang
                         log_write(self.log, "INFO: build hung")
@@ -811,6 +809,11 @@ def main():
     parser.add_argument("--debug", "-d",
                         help="Send log output to stdout instead of log file",
                         type=str)
+    parser.add_argument("--hung-build-timeout",
+                        help="A number of packages can take > 60mins of build "
+                             "time (e.g gst-ffmpeg, qt5webkit, mimic), sets "
+                             "timeout in minutes",
+                        type=int, default=120)
     toolchains_csv = parser.add_mutually_exclusive_group(required=False)
     toolchains_csv.add_argument("--toolchains-csv",
                                 dest="toolchains_csv",
@@ -895,7 +898,8 @@ def main():
             repo = args.repo,
             upload = upload,
             buildpid = buildpid,
-            debug = args.debug)
+            debug = args.debug,
+            hung_build_timeout = args.hung_build_timeout)
         p = multiprocessing.Process(target=builder.run_instance)
         p.start()
         processes.append(p)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
