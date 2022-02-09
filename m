Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2925C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E32560D5D;
	Wed,  9 Feb 2022 20:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0iRe74SnFWfV; Wed,  9 Feb 2022 20:30:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 940EA60D70;
	Wed,  9 Feb 2022 20:30:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4BFE1BF42C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8449960D70
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:30:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RLUEtR3R6Mrt for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:30:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81DE560D5D
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:30:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id v129so2193762wme.2
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 12:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mLray/aWuurbIGe6fCOOdeFpg4ChR0GT6gV1hZwFrWM=;
 b=BzHl/4K6QUF89M660AnTO/PGuy2Fqyqa5g1lVhAM5Kf+PDUQ7lsmXMmUQV60IXG00B
 lf0XCtF7g7uIf3phhYKE6sEYDxX0sfTnWdW7CV2jMKl6zqiarNJ30ZEl6ZFIGz38ZgXv
 tYwtDPOpFp712tH+U9ntR/1XE3H5Yk0CnRg7pp61zjZ1da/K+cKkKMTlAPZVMPuTyK3/
 U0ZaxQpeyt1YkgLqdu33H3R1xUWVWpQhYGnsdd64dhefHoN7ITJhdHxCrM7/Ih1f1X+s
 5fspiI2YxRNGd5H+whf1v1B8q5seGPgXclRVxBiDoP/K9wr3h+WTiu5vZHIu3tHfprK9
 WttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mLray/aWuurbIGe6fCOOdeFpg4ChR0GT6gV1hZwFrWM=;
 b=wMVtKK8cUzigbPry8jXCfw6+BJ3UbaUk+Ymn0Wdu5jo6DSzPx3ZW7zcvh1Zi+kvg4+
 gQC5g6MbeH4e4fRO8QXx8RCvGjppxbSvFDvFE3+YiqD9WDV4vY2mv4GlkS4LJF+rjmzq
 vhsV2JQQAbfW9+0IIpRgKBlgKlunFaIng1W56kWkjGdjK5xyGce7IOOGExV/WsP4mRlP
 77ZsevcozJQOXOsUwgR1bfuzuJKf82RjY2aBYwDUqWTz9hwOZbgH78H9k6y1jILcSHf2
 aQtC6ZWSzOxWyIwC9ZLzIv4NFJWr3sEiafYbIaN85bEK2CQ/BXCZdpwfUdoLw1/w4zDv
 lF0g==
X-Gm-Message-State: AOAM533qg5J2m2o69Uyni95Wnag6t+qCuuQ4WDMkn+fKF6ACJt4rnPta
 HCZcybSpHQgqExRANiZWRgGzpg/4/mo=
X-Google-Smtp-Source: ABdhPJxQspHuS2kdiVnHT7AGHBgH2HItHSu7l5lrJIzgCvs/gPasnom2tdqUG3R51i3o2p0m/Fdqzg==
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr4176098wmq.35.1644438632516; 
 Wed, 09 Feb 2022 12:30:32 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:d4bd:3395:fce0:5749])
 by smtp.gmail.com with ESMTPSA id v5sm19601737wrx.114.2022.02.09.12.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:30:32 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 21:30:26 +0100
Message-Id: <20220209203026.3724993-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/scripts/graph-build-time: add support
 for timeline graphing
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This commit adds support for a new type of graph, showing the timeline
of a build. It shows, with one line per package, when each of this
package steps started/ended, and therefore allows to see the
sequencing of the package builds.

For a fully serialized build like we have today, this is not super
useful (except to show that everything is serialized), but it becomes
much more useful in the context of top-level parallel build.

We chose to order the graph by the time-of-configure, as it is the
closest to the actual cascade-style of a true dependency graph, which is
tiny bit more complex to achieve properly. The actual result still looks
pretty good.

The graph-build make target is extended to also generate this new
timeline graph.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - sort by start-of-configure time
  - re-use existing colorsets (default or alternate)
  - fix python2isms
  - fix check-package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile                         |  3 ++
 support/scripts/graph-build-time | 63 +++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8a4ec4ef85..da2dd8cfba 100644
--- a/Makefile
+++ b/Makefile
@@ -872,6 +872,9 @@ graph-build: $(O)/build/build-time.log
 				   --type=pie-$(t) --input=$(<) \
 				   --output=$(GRAPHS_DIR)/build.pie-$(t).$(BR_GRAPH_OUT) \
 				   $(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
+	./support/scripts/graph-build-time --type=timeline --input=$(<) \
+		--output=$(GRAPHS_DIR)/build.timeline.$(BR_GRAPH_OUT) \
+		$(if $(BR2_GRAPH_ALT),--alternate-colors)
 
 .PHONY: graph-depends-requirements
 graph-depends-requirements:
diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 742c9a7a50..1edc3b3c00 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -241,6 +241,65 @@ def pkg_pie_time_per_step(data, output):
     plt.savefig(output)
 
 
+def pkg_timeline(data, output):
+    start = 0
+    end = 0
+
+    # Find the first timestamp and the last timestamp
+    for p in data:
+        for k, v in p.steps_start.items():
+            if start == 0 or v < start:
+                start = v
+            if end < v:
+                end = v
+
+    # Readjust all timestamps so that 0 is the start of the build
+    # instead of being Epoch
+    for p in data:
+        for k, v in p.steps_start.items():
+            p.steps_start[k] = v - start
+        for k, v in p.steps_end.items():
+            p.steps_end[k] = v - start
+
+    plt.figure()
+
+    i = 0
+    labels_names = []
+    labels_coords = []
+    # put last packages that started to configure last; this does not
+    # give the proper dependency chain, but still provides a good-enough
+    # cascade graph.
+    for p in sorted(data, reverse=True, key=lambda x: x.steps_start['configure']):
+        durations = []
+        facecolors = []
+        for step in steps:
+            if step not in p.steps_start or step not in p.steps_end:
+                continue
+            durations.append((p.steps_start[step],
+                              p.steps_end[step] - p.steps_start[step]))
+            facecolors.append(colors[steps.index(step)])
+        plt.broken_barh(durations, (i, 6), facecolors=facecolors)
+        labels_coords.append(i + 3)
+        labels_names.append(p.name)
+        i += 10
+
+    axes = plt.gcf().gca()
+
+    axes.set_ylim(0, i + 10)
+    axes.set_xlim(0, end - start)
+    axes.set_xlabel('seconds since start')
+    axes.set_yticks(labels_coords)
+    axes.set_yticklabels(labels_names)
+    axes.set_axisbelow(True)
+    axes.grid(True, linewidth=0.2, zorder=-1)
+
+    plt.gcf().subplots_adjust(left=0.2)
+
+    plt.tick_params(axis='y', which='both', labelsize=6)
+    plt.title('Timeline')
+    plt.savefig(output, dpi=300)
+
+
 # Parses the csv file passed on standard input and returns a list of
 # Package objects, filed with the duration of each step and the total
 # duration of the package.
@@ -277,7 +336,7 @@ def read_data(input_file):
 
 parser = argparse.ArgumentParser(description='Draw build time graphs')
 parser.add_argument("--type", '-t', metavar="GRAPH_TYPE",
-                    help="Type of graph (histogram, pie-packages, pie-steps)")
+                    help="Type of graph (histogram, pie-packages, pie-steps, timeline)")
 parser.add_argument("--order", '-O', metavar="GRAPH_ORDER",
                     help="Ordering of packages: build or duration (for histogram only)")
 parser.add_argument("--alternate-colors", '-c', action="store_true",
@@ -307,6 +366,8 @@ elif args.type == "pie-packages":
     pkg_pie_time_per_package(d, args.output)
 elif args.type == "pie-steps":
     pkg_pie_time_per_step(d, args.output)
+elif args.type == "timeline":
+    pkg_timeline(d, args.output)
 else:
     sys.stderr.write("Unknown type: %s\n" % args.type)
     exit(1)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
