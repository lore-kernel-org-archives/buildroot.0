Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50780CD3431
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 12:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E09400FC;
	Wed,  4 Sep 2024 12:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFZZkHpt3YSd; Wed,  4 Sep 2024 12:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A72D9400FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A72D9400FF;
	Wed,  4 Sep 2024 12:04:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46C721BF47A
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3331D400FF
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kj9AvR4CBngh for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 12:04:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FD12400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FD12400FC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FD12400FC
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 12:04:43 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.86.110])
 by gzga-smtp-mta-g3-3 (Coremail) with SMTP id _____wDn74hJSdhmXhFPBw--.4952S2; 
 Wed, 04 Sep 2024 19:49:29 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 04:49:03 -0700
Message-ID: <20240904114903.4020-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDn74hJSdhmXhFPBw--.4952S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCry5CF4fZr18GFyUWw17Jrb_yoW5Xry7pF
 WkCrWfGw48trySkFsrJayxXry5WrWkJF1UAw4xJa1vya4DtFyFvr1Ikrn5AFy7CrZ3Cw1U
 Xr15AF4Uu3yUJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR_HUhUUUUU=
X-Originating-IP: [223.102.86.110]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBhBJQjWV4IOXqTgAAs3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=S546H
 v6BBrMJeIM6fm3MUsKMZn4QEmV4Yyo6LFo7Jrk=; b=Su0dyO+B155x50Ja+idMI
 1KS+T3CRt2Om5EQxFWY0lEeD90ND3bH2Pl5Ho+yne/DG2h6hRUGJu8wlHB6XZZ2B
 nuZX0hggXNa3je6f3Y5+Kj9V7HN9eyj1yU33MRLSzQbn04QPfSc49MjNrYjlH2tw
 LryuhXIATm+NqCRbi9lfso=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Su0dyO+B
Subject: [Buildroot] [PATCH 1/1] package/ntp: add a patch to fix crashes
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes a regression [1] introduced in ntpd 4.2.8p18 [2].

  ntpd[200]: Listen normally on 3 lo [::1]:123
  ntpd[200]: bind(20) AF_INET6 [fe80::bf3d:254d:dee0:d345%3]:123 flags 0x811 failed: Cannot assign requested address
  ntpd[200]: unable to create socket on enp0s3 (4) for [fe80::bf3d:254d:dee0:d345%3]:123
  ntpd[192]: daemon control: got EOF
  ntpd[192]: daemon child died with signal 11
  systemd[1]: ntpd.service: Control process exited, code=exited, status=70/SOFTWARE
  systemd[1]: ntpd.service: Failed with result 'exit-code'.
  systemd[1]: Failed to start Network Time Service.

If the IPv6 link-local interface was not ready for binding on the first
attempt, ntpd would segfault in update_interfaces(). The segfault would
only occur when ntpd was started as part of the boot sequence. Most
- but not all - boots were affected. Evidently it could happen that the
timing of ntpd's start up was delayed enough that the IPv6 link-local
interface was ready for the bind() call when it was first issued by
open_socket() via create_interface().

[1]: https://bugs.ntp.org/show_bug.cgi?id=3928
[2]: https://bugs.ntp.org/show_bug.cgi?id=3913

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-Fix-crash-when-binding-IPv6-address.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/ntp/0003-Fix-crash-when-binding-IPv6-address.patch

diff --git a/package/ntp/0003-Fix-crash-when-binding-IPv6-address.patch b/package/ntp/0003-Fix-crash-when-binding-IPv6-address.patch
new file mode 100644
index 0000000000..0219132891
--- /dev/null
+++ b/package/ntp/0003-Fix-crash-when-binding-IPv6-address.patch
@@ -0,0 +1,33 @@
+Fix crash when binding IPv6 address
+
+Reference:
+  https://bugs.ntp.org/show_bug.cgi?id=3928
+
+Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
+---
+ ntpd/ntp_io.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+Index: ntp-4.2.8p18/ntpd/ntp_io.c
+===================================================================
+--- ntp-4.2.8p18.orig/ntpd/ntp_io.c
++++ ntp-4.2.8p18/ntpd/ntp_io.c
+@@ -1917,15 +1917,15 @@ update_interfaces(
+ 			}
+ 			new_interface_found = TRUE;
+ 			DPRINT_INTERFACE(3,
+-				(ep, "updating ", " new - created\n"));
++				(ep2, "updating ", " new - created\n"));
+ 		}
+ 		else {
+ 			DPRINT_INTERFACE(3,
+-				(ep, "updating ", " new - FAILED"));
++				(ep2, "updating ", " new - FAILED"));
+ 
+ 			msyslog(LOG_ERR,
+ 				"cannot bind address %s",
+-				stoa(&ep->sin));
++				stoa(&ep2->sin));
+ 		}
+ 		free(ep2);
+ 	}
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
