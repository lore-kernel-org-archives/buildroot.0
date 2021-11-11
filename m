Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4479DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 12:28:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 994D561057
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 12:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 994D561057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39B1440193;
	Thu, 11 Nov 2021 12:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nVK-jvqrNmx4; Thu, 11 Nov 2021 12:28:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 315DA4015F;
	Thu, 11 Nov 2021 12:28:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5BB91BF9D1
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 12:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E27B2605F8
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 12:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t9-RCY0H5csA for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 12:28:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E8FE605B0
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 12:28:25 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-217-nXGVvPyPP0CrZjzk7Ajqog-1; Thu, 11 Nov 2021 12:28:22 +0000
X-MC-Unique: nXGVvPyPP0CrZjzk7Ajqog-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.24; Thu, 11 Nov 2021 12:28:21 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.024; Thu, 11 Nov 2021 12:28:21 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Add 'IRIX mode' to top.
Thread-Index: AdfW9Kh3+h/zydNvTVmDynuGDijcQQ==
Date: Thu, 11 Nov 2021 12:28:21 +0000
Message-ID: <5cd31e7e638246aeb7321933b088a743@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: [Buildroot] Add 'IRIX mode' to top.
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
Cc: "'vda.linux@googlemail.com'" <vda.linux@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add 'IRIX mode' to top.

On a multi-cpu system 'IRIX mode' displays a singled threaded process
that is spinning as using 100% cpu.
This is generally more useful than the current 'Solaris mode' that
reports 100/num_cpu% cpu.

A multi-threaded program that is busy on multiple cpu will
show a cpu use > 100%.

Enabled by -I on the command line or 'i' on stdin.

Remove some (uint16_t) casts from the 'delta jiffies' value.
With enough cpu, fast enough HZ, and long enough delay I think
64k can be exceeded.
I doubt intended efficiency of 16x16 multiple makes any difference.

Signed-off-by: David Laight <david.laight@aculab.com>
---

It might be worth adding an extra column for processes with a
lot of busy threads on systems with a lot of cpu.

Note that this is a normal diff from an installed tree.
I don't have the git tree.

--- top.c.1.33	2021-11-11 09:49:08.165982660 +0000
+++ top.c	2021-11-11 11:28:50.155674293 +0000
@@ -166,6 +166,7 @@
 #endif
 #if ENABLE_FEATURE_TOP_SMP_CPU
 	smallint smp_cpu_info; /* one/many cpu info lines? */
+	smallint irix_mode;    /* 100% => one cpu busy */
 #endif
 	unsigned lines;  /* screen height */
 #if ENABLE_FEATURE_TOP_INTERACTIVE
@@ -202,6 +203,7 @@
 #define sort_field       (G.sort_field        )
 #define inverted         (G.inverted          )
 #define smp_cpu_info     (G.smp_cpu_info      )
+#define irix_mode        (G.irix_mode         )
 #define initial_settings (G.initial_settings  )
 #define sort_function    (G.sort_function     )
 #define prev_hist        (G.prev_hist         )
@@ -223,8 +225,9 @@
 	OPT_n = (1 << 1),
 	OPT_b = (1 << 2),
 	OPT_H = (1 << 3),
-	OPT_m = (1 << 4),
-	OPT_EOF = (1 << 5), /* pseudo: "we saw EOF in stdin" */
+	OPT_I = (1 << 4),
+	OPT_m = (1 << 5),
+	OPT_EOF = (1 << 6), /* pseudo: "we saw EOF in stdin" */
 };
 #define OPT_BATCH_MODE (option_mask32 & OPT_b)
 
@@ -314,6 +317,13 @@
 	return;
 #else
 	if (!smp_cpu_info) {
+		if (irix_mode && !num_cpus) {
+			jiffy_counts_t dummy_jif;
+			while (read_cpu_jiffy(fp, &dummy_jif) >= 4)
+				num_cpus++;
+			if (!num_cpus)
+				irix_mode = 0;
+		}
 		fclose(fp);
 		return;
 	}
@@ -328,8 +338,10 @@
 				break;
 			num_cpus++;
 		}
-		if (num_cpus == 0) /* /proc/stat with only "cpu ..." line?! */
+		if (num_cpus == 0) { /* /proc/stat with only "cpu ..." line?! */
 			smp_cpu_info = 0;
+			irix_mode = 0;
+		}
 
 		cpu_prev_jif = xzalloc(sizeof(cpu_prev_jif[0]) * num_cpus);
 
@@ -602,6 +614,28 @@
 	return meminfo[MI_MEMTOTAL];
 }
 
+#if ENABLE_FEATURE_TOP_DECIMALS
+# define UPSCALE 1000
+# define FMT "%s"
+# define SHOW_STAT(name, buf_id) fmt_proc_pc(name, buf_id)
+static NOINLINE const char *fmt_proc_pc(unsigned value, unsigned buf_id)
+{
+	static char bufs[2][16];
+	char *buf = bufs[buf_id];
+
+	if (value >= 1000)
+		snprintf(buf, 16, "%5u", value/10);
+	else
+		snprintf(buf, 16, "%3u.%c", value/10, '0' + (value % 10));
+	return buf;
+}
+
+#else
+# define UPSCALE 100
+# define FMT "%4u%%"
+# define SHOW_STAT(name, buf_id) name
+#endif
+
 static NOINLINE void display_process_list(int lines_rem, int scr_width)
 {
 	enum {
@@ -627,17 +661,6 @@
 		" COMMAND");
 	lines_rem--;
 
-#if ENABLE_FEATURE_TOP_DECIMALS
-# define UPSCALE 1000
-# define CALC_STAT(name, val) div_t name = div((val), 10)
-# define SHOW_STAT(name) name.quot, '0'+name.rem
-# define FMT "%3u.%c"
-#else
-# define UPSCALE 100
-# define CALC_STAT(name, val) unsigned name = (val)
-# define SHOW_STAT(name) name
-# define FMT "%4u%%"
-#endif
 	/*
 	 * %VSZ = s->vsz/MemTotal
 	 */
@@ -664,14 +687,18 @@
 	 * we assume that unsigned is at least 32-bit.
 	 */
 	pcpu_shift = 6;
-	pcpu_scale = UPSCALE*64 * (uint16_t)busy_jifs;
+	pcpu_scale = UPSCALE*64 * busy_jifs;
 	if (pcpu_scale == 0)
 		pcpu_scale = 1;
 	while (pcpu_scale < (1U << (BITS_PER_INT-2))) {
 		pcpu_scale *= 4;
 		pcpu_shift += 2;
 	}
-	tmp_unsigned = (uint16_t)(cur_jif.total - prev_jif.total) * total_pcpu;
+	tmp_unsigned = (cur_jif.total - prev_jif.total) * total_pcpu;
+#if ENABLE_FEATURE_TOP_SMP_CPU
+	if (irix_mode && num_cpus)
+		tmp_unsigned /= num_cpus;
+#endif
 	if (tmp_unsigned != 0)
 		pcpu_scale /= tmp_unsigned;
 	/* we want (s->pcpu * pcpu_scale) to never overflow */
@@ -692,9 +719,9 @@
 		char vsz_str_buf[8];
 		unsigned col;
 
-		CALC_STAT(pmem, (s->vsz*pmem_scale + pmem_half) >> pmem_shift);
+		unsigned pmem = (s->vsz*pmem_scale + pmem_half) >> pmem_shift;
 #if ENABLE_FEATURE_TOP_CPU_USAGE_PERCENTAGE
-		CALC_STAT(pcpu, (s->pcpu*pcpu_scale + pcpu_half) >> pcpu_shift);
+		unsigned pcpu = (s->pcpu*pcpu_scale + pcpu_half) >> pcpu_shift;
 #endif
 
 		smart_ulltoa5(s->vsz, vsz_str_buf, " mgtpezy");
@@ -706,9 +733,9 @@
 				" ",
 				s->pid, s->ppid, get_cached_username(s->uid),
 				s->state, vsz_str_buf,
-				SHOW_STAT(pmem)
+				SHOW_STAT(pmem, 0)
 				IF_FEATURE_TOP_SMP_PROCESS(, s->last_seen_on_cpu)
-				IF_FEATURE_TOP_CPU_USAGE_PERCENTAGE(, SHOW_STAT(pcpu))
+				IF_FEATURE_TOP_CPU_USAGE_PERCENTAGE(, SHOW_STAT(pcpu, 1))
 		);
 		if ((int)(scr_width - col) > 1)
 			read_cmdline(line_buf + col, scr_width - col, s->pid, s->comm);
@@ -1034,6 +1061,10 @@
 			get_jiffy_counts();
 			continue;
 		}
+		if (c == 'i') {
+			irix_mode ^= 1;
+			continue;
+		}
 #  endif
 # endif
 		break; /* unknown key -> force refresh */
@@ -1120,7 +1151,7 @@
 
 	/* all args are options; -n NUM */
 	make_all_argv_opts(argv); /* options can be specified w/o dash */
-	col = getopt32(argv, "d:n:bHm", &str_interval, &str_iterations);
+	col = getopt32(argv, "d:n:bHIm", &str_interval, &str_iterations);
 	/* NB: -m and -H are accepted even if not configured */
 #if ENABLE_FEATURE_TOPMEM
 	if (col & OPT_m) /* -m (busybox specific) */
@@ -1145,6 +1176,10 @@
 		scan_mask |= PSSCAN_TASKS;
 	}
 #endif
+#if ENABLE_FEATURE_TOP_SMP_CPU
+	if (col & OPT_I)
+		irix_mode = 1;
+#endif
 
 	/* change to /proc */
 	xchdir("/proc");

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
