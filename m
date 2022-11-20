Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC517C433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 16:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8605C60BD8;
	Sun, 20 Nov 2022 16:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8605C60BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxumu9XXzLwI; Sun, 20 Nov 2022 16:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 867166066D;
	Sun, 20 Nov 2022 16:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 867166066D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10FB51BF404
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 16:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFA0B400F2
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 16:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFA0B400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ag6ylLhGJ1oO for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 16:45:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83648402F6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83648402F6
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 16:45:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:78ad:17ab:4254:8d91])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 72FFC2003FF;
 Sun, 20 Nov 2022 17:45:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 17:45:06 +0100
Date: Sun, 20 Nov 2022 17:45:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221120164506.GF2516@scaer>
References: <20221120162622.3436538-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120162622.3436538-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668962710;
 bh=90/R8FOrgwF0VFjAt+zn8IrzDC5ye33AebYYqXQ35bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ba8SpbYkyGRVSiU54G1JgjnqS8HIggM8PoV67rs02BD1JxyDZ4UN5RM8ufqHMMIG0
 e917Z+bMHuhRx5GXyb/xyLvmvYS1Eyn0TEsShfS94GJXhIaw3hdUtsP4nfVU9RJO/d
 5xbVAJXKYDKPCHfgd0p9x7SXq3ui/RHElDypE8c8f1iRlpZe16KoujD4K87gKLfl1W
 yevKpztzPQlkWlycEBMTDqawv1KvJzLecmsQGeHcjxWxDZsbWIh7qwdxzOhpVqqwj2
 wHf22It9JY5UQcAqHYdDRFt/7+CNtXlcOJV34VlhK0MJ9+/K67+fjf0PVeOAcMni2h
 5VbGm8WoumL5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ba8SpbYk
Subject: Re: [Buildroot] [PATCH] package/systemd: security bump to version
 v250.8
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-11-20 17:26 +0100, Peter Korsgaard spake thusly:
> Fixes the following security issue:
> 
> - CVE-2022-3821: An off-by-one Error issue was discovered in Systemd in
>   format_timespan() function of time-util.c.  An attacker could supply
>   specific values for time and accuracy that leads to buffer overrun in
>   format_timespan(), leading to a Denial of Service.
>   https://github.com/systemd/systemd/issues/23928
> 
> Drop now upstream 0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> ./support/testing/run-tests -k -o output-systemd tests.init.test_systemd
> 15:35:09 TestInitSystemSystemdRwNetworkd          Starting
> 15:35:09 TestInitSystemSystemdRwNetworkd          Building
> 15:43:20 TestInitSystemSystemdRwNetworkd          Building done
> Downloading to /var/lib/downloads/tmpw7by1nt7
> Renaming from /var/lib/downloads/tmpw7by1nt7 to /var/lib/downloads/kernel-vexpress-5.10.7
> Downloading to /var/lib/downloads/tmpxhcetjfv
> Renaming from /var/lib/downloads/tmpxhcetjfv to /var/lib/downloads/vexpress-v2p-ca9-5.10.7.dtb
> 15:43:43 TestInitSystemSystemdRwNetworkd          Cleaning up
> .15:43:43 TestInitSystemSystemdRwIfupdownDbusbrokerDbus Starting
> 15:43:43 TestInitSystemSystemdRwIfupdownDbusbrokerDbus Building
> 15:52:10 TestInitSystemSystemdRwIfupdownDbusbrokerDbus Building done
> 15:52:34 TestInitSystemSystemdRwIfupdownDbusbrokerDbus Cleaning up
> .15:52:34 TestInitSystemSystemdRwIfupdownDbusbroker Starting
> 15:52:35 TestInitSystemSystemdRwIfupdownDbusbroker Building
> 16:00:40 TestInitSystemSystemdRwIfupdownDbusbroker Building done
> 16:01:04 TestInitSystemSystemdRwIfupdownDbusbroker Cleaning up
> .16:01:04 TestInitSystemSystemdRwIfupdown          Starting
> 16:01:05 TestInitSystemSystemdRwIfupdown          Building
> 16:09:19 TestInitSystemSystemdRwIfupdown          Building done
> 16:09:43 TestInitSystemSystemdRwIfupdown          Cleaning up
> .16:09:43 TestInitSystemSystemdRwFull              Starting
> 16:09:43 TestInitSystemSystemdRwFull              Building
> 16:21:53 TestInitSystemSystemdRwFull              Building done
> 16:22:21 TestInitSystemSystemdRwFull              Cleaning up
> .16:22:21 TestInitSystemSystemdRoNetworkd          Starting
> 16:22:22 TestInitSystemSystemdRoNetworkd          Building
> 16:30:55 TestInitSystemSystemdRoNetworkd          Building done
> 16:31:18 TestInitSystemSystemdRoNetworkd          Cleaning up
> .16:31:18 TestInitSystemSystemdRoIfupdownDbusbrokerDbus Starting
> 16:31:19 TestInitSystemSystemdRoIfupdownDbusbrokerDbus Building
> 16:39:50 TestInitSystemSystemdRoIfupdownDbusbrokerDbus Building done
> 16:40:13 TestInitSystemSystemdRoIfupdownDbusbrokerDbus Cleaning up
> .16:40:13 TestInitSystemSystemdRoIfupdownDbusbroker Starting
> 16:40:14 TestInitSystemSystemdRoIfupdownDbusbroker Building
> 16:48:58 TestInitSystemSystemdRoIfupdownDbusbroker Building done
> 16:49:22 TestInitSystemSystemdRoIfupdownDbusbroker Cleaning up
> .16:49:22 TestInitSystemSystemdRoIfupdown          Starting
> 16:49:23 TestInitSystemSystemdRoIfupdown          Building
> 16:58:00 TestInitSystemSystemdRoIfupdown          Building done
> 16:58:24 TestInitSystemSystemdRoIfupdown          Cleaning up
> .16:58:24 TestInitSystemSystemdRoFull              Starting
> 16:58:25 TestInitSystemSystemdRoFull              Building
> 17:13:14 TestInitSystemSystemdRoFull              Building done
> 17:13:40 TestInitSystemSystemdRoFull              Cleaning up
> .
> ----------------------------------------------------------------------
> Ran 10 tests in 5911.589s
> 
> OK
> 
>  ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 -------------------
>  package/systemd/systemd.hash                  |  2 +-
>  package/systemd/systemd.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 35 deletions(-)
>  delete mode 100644 package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
> 
> diff --git a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
> deleted file mode 100644
> index 0934886acb..0000000000
> --- a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 16c132a6a0389e0eaea70c4ad95dbfd1637ec5ba Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Fri, 7 Jan 2022 22:25:23 +0100
> -Subject: [PATCH] missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
> -
> -MOVE_MOUNT_T_EMPTY_PATH has been added to systemd 250 by [1]
> -but it's defined in kernel headers since version 5.2.
> -
> -[1] c7bf079bbc19e3b409acc0c7acc3e14749211fe2
> -
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ----
> - src/basic/missing_syscall.h | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
> -index 8267b1a90c..793d111c55 100644
> ---- a/src/basic/missing_syscall.h
> -+++ b/src/basic/missing_syscall.h
> -@@ -569,6 +569,10 @@ static inline int missing_open_tree(
> - #define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
> - #endif
> - 
> -+#ifndef MOVE_MOUNT_T_EMPTY_PATH
> -+#define MOVE_MOUNT_T_EMPTY_PATH 0x00000040 /* Empty to path permitted */
> -+#endif
> -+
> - static inline int missing_move_mount(
> -                 int from_dfd,
> -                 const char *from_pathname,
> --- 
> -2.31.1
> -
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 3572b25965..3b98566f32 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
> +sha256  638a2fc78828765fc97bc73f428205b6dc1d359149b6c6bfe4d2a649cba2cca8  systemd-250.8.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>  sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b42f6a502b..30a75b7a40 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 250.4
> +SYSTEMD_VERSION = 250.8
>  SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>  	LGPL-2.1+, \
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
