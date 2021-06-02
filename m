Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8309EC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:54:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 552A260F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 552A260F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B44183ADD;
	Tue,  3 Aug 2021 22:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJZnVI3HSc30; Tue,  3 Aug 2021 22:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BE5583B1F;
	Tue,  3 Aug 2021 22:54:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB161BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D830405F5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XD6j5-41W-im for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F12A4046D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 766F8843F5; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 2 Jun 2021 19:59:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cb3b89e4cdabb2046b2cb1b2cacdf3feac98b777
X-Git-Newrev: 16600cde239a39c3d13b66271d0c3b3238f858cf
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.766F8843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/iftop: fix static build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=16600cde239a39c3d13b66271d0c3b3238f858cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
 - http://autobuild.buildroot.org/results/eb53ff6b031c654daec57050dec376b5c9134a81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...2-Rename-pcap_filter-to-iftop_pcap_filter.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/iftop/0002-Rename-pcap_filter-to-iftop_pcap_filter.patch b/package/iftop/0002-Rename-pcap_filter-to-iftop_pcap_filter.patch
new file mode 100644
index 0000000000..92eedccab7
--- /dev/null
+++ b/package/iftop/0002-Rename-pcap_filter-to-iftop_pcap_filter.patch
@@ -0,0 +1,51 @@
+From 64a185ce2017e4523f4bc39a36c7aebd6d68549a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 Jun 2021 08:21:04 +0200
+Subject: [PATCH] Rename pcap_filter to iftop_pcap_filter
+
+Rename pcap_filter to iftop_pcap_filter to fix the following static
+build failure:
+
+/home/buildroot/autobuild/run/instance-3/output-1/host/bin/riscv64-linux-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static   -static -o iftop addr_hash.o edline.o hash.o iftop.o ns_hash.o options.o resolver.o screenfilter.o serv_hash.o sorted_list.o threadprof.o ui_common.o ui.o tui.o util.o addrs_ioctl.o addrs_dlpi.o dlcommon.o stringmap.o cfgfile.o vector.o  -lpcap -lpcap -L/home/buildroot/autobuild/run/instance-3/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/bin/../../../../bin/../riscv64-buildroot-linux-musl/sysroot/usr/lib -lnl-genl-3 -lnl-3 -lpthread   -lcurses
+/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/bin/../../../../bin/../riscv64-buildroot-linux-musl/sysroot/usr/lib/libpcap.a(bpf_filter.o): in function `pcap_filter':
+bpf_filter.c:(.text+0x4a8): multiple definition of `pcap_filter'; iftop.o:iftop.c:(.bss+0x1a8): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/eb53ff6b031c654daec57050dec376b5c9134a81
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ iftop.c      | 6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/iftop.c b/iftop.c
+index aaec6aa..f89eee3 100644
+--- a/iftop.c
++++ b/iftop.c
+@@ -74,7 +74,7 @@ int history_len = 1;
+ pthread_mutex_t tick_mutex;
+ 
+ pcap_t* pd; /* pcap descriptor */
+-struct bpf_program pcap_filter;
++struct bpf_program iftop_pcap_filter;
+ pcap_handler packet_handler;
+ 
+ sig_atomic_t foad;
+@@ -679,12 +679,12 @@ char *set_filter_code(const char *filter) {
+         sprintf(x, "(%s) and (ip or ip6)", filter);
+     } else
+         x = xstrdup("ip or ip6");
+-    if (pcap_compile(pd, &pcap_filter, x, 1, 0) == -1) {
++    if (pcap_compile(pd, &iftop_pcap_filter, x, 1, 0) == -1) {
+         xfree(x);
+         return pcap_geterr(pd);
+     }
+     xfree(x);
+-    if (pcap_setfilter(pd, &pcap_filter) == -1)
++    if (pcap_setfilter(pd, &iftop_pcap_filter) == -1)
+         return pcap_geterr(pd);
+     else
+         return NULL;
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
