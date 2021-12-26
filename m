Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22783C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 18:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C97181495;
	Sun, 26 Dec 2021 18:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hG2sXK1IUdiw; Sun, 26 Dec 2021 18:50:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DC8281497;
	Sun, 26 Dec 2021 18:50:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1CAB1BF391
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE40F81495
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIP3fqZMHkfC for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 18:50:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90D1A81493
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 18:50:12 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id f138so12770273qke.10
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pTkPHHl7UvJV8jGlWgImVWpD0cWuMhRqtjt0kiuFd0U=;
 b=pHasdXY4MvAwK60AHdL2BcunZuuyE8fAQ9YJS2tbpspHpTuyxwAf8JqGLN4YFU3Q/c
 EoIDElF5DxKhauophhEziVtYzxqH8WAstpy8hhkXPKihTZA0YFThGm90i7OK4GftjwUd
 2b6XlxRgt/SJZVYCpFOgtJApWbMadbqeZgWAzsfku8NU5pP85fx78l7bYSP+7cJutkRT
 Ur6c9kNgN5TQikDzuxmR2Rz9HFbQVnqxR5+scgd/TwhzP/5IBUMGr4yVeOzN/S1SCGtn
 6qX+/DC6VGgl7qNlYm1W6aJpG8WbJ1ETJ+IQUdcF1LpD2pBil4CA+1MmTHkhs7MZL36r
 xpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pTkPHHl7UvJV8jGlWgImVWpD0cWuMhRqtjt0kiuFd0U=;
 b=QJqjIDODHSYtMMVBEbZoZPIfGZ332BHmimSmjMVQHC5c/LSeCInyoCU1fHIUocxmtI
 lC9zsGxOz6loRvbY3F6e9FjSvn7rQa4gSNfxLcWVBhtwX9+AU4odiePiwU88V19q9kMN
 Mj4oWqlBoVUrDnFInBNAQQ8pPhb1xV5laafT6fvGv5bX7glWHew3a0KyGkAWauebfMPr
 VOhcfVt9BKAFLnuB/mENkn9Hy41vwgsycacejJAUqRERbjbYSaWa7n35pEf++WzCPug5
 p7PiIII2sEJ45mXzXrULeLs3i3eiQnth9HqMzbbenxRQnatbDtgCj5i1QHcolxwRUZkB
 KFFw==
X-Gm-Message-State: AOAM531UW4kDrJwaeYXRZ9iuqpX8oA7H17EiVEiW4gY7zzMsHVHzrqWe
 6B5hnNP1VkBRiKEi8LC7/llQvVvJ6D0=
X-Google-Smtp-Source: ABdhPJwdq0n3XvHW0Zt4n80po2CBU6Lf9R0kQ3H/11o5VIqYfNYRuABUL39SmlW3kz0vOFvmck8CcQ==
X-Received: by 2002:a05:620a:4087:: with SMTP id
 f7mr10262629qko.56.1640544610882; 
 Sun, 26 Dec 2021 10:50:10 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id j22sm12349717qko.68.2021.12.26.10.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 10:50:10 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 15:49:14 -0300
Message-Id: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/5] check-package for SysV init scripts
 (including shellcheck)
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This small series (called series2 below) is built on top of [1] (called series1)
specially for its patches 1 (check-package unit tests) and 4 (script
utils/docker-run that eases to run locally commands in the docker image in order
to have stable results across machines).

So:
series1 1/4 utils/checkpackagelib: add unit tests
series1 2/4 support/docker: add python3-pytest
series1 3/4 utils/checkpackagelib: run unit tests on GitLab CI
series1 4/4 utils/docker-run: new script
series2 1/5 utils/check-package: prepare to run external tools
series2 2/5 utils/checkpackagelib: warn about executable files
series2 3/5 utils/checkpackagelib/lib_sysv: check SysV init scripts
series2 4/5 support/docker: add shellcheck
series2 5/5 utils/checkpackagelib/lib_sysv: run shellcheck

This series is also related to [2].
Cc: Joachim Wiberg <troglobit@gmail.com>
See an example output for patch [2]:
|$ utils/docker-run utils/check-package -vvv package/inadyn/S70inadyn
|package/inadyn/S70inadyn:24: should be indented with tabs, see package/busybox/S01syslogd
|< tab  >< tab  >< tab  >  -- $INADYN_ARGS
|package/inadyn/S70inadyn:0: This file does not need to be executable, just make sure you use '$(INSTALL) -D -m 0755' in the .mk file
|74 lines processed
|2 warnings generated

This series is also related to [3].
Perhaps if both series are accepted, we can add cross-reference between the doc
and the tool:
- check-package can point to a manual entry
- the doc can mention to use check-package directly for SysV init script
- the doc can mention to use check-package inside docker image using
  utils/docker-run

What this series IS NOT:
 - a complete rework of all SysV init scripts in the tree;
 - an automated way to rework SysV init scripts;
 - the ultimate checker for SysV init scripts that catches all possible errors;
 - something to enable in GitLab CI in the short term.

What this series IS (hopefully):
 - a helper for developers willing to rework one SysV init script at a time;
 - something that can be extended to check more common mistakes when reworking a
   SysV init script with package/busybox/S01syslogd as base;
 - a few years from now we can eventually enable the check in GitLab CI when all
   SysV init script got reworked.

In [4] one can see an example of all warnings that would be generated for all
scripts in the tree.
NOTICE that no warnings are generated for package/busybox/S01syslogd, as
expected.
At the end see some extracts from [4] with some interesting results (thanks to
shellcheck).

NOTICE that as a consequence of using shellcheck, there will be cases that will
need shellcheck disables, just like S01syslogd already does:
|	# shellcheck disable=SC2086 # we need the word splitting

[1] http://patchwork.ozlabs.org/project/buildroot/list/?series=275236
[2] http://patchwork.ozlabs.org/project/buildroot/patch/20211205102907.2836980-3-troglobit@gmail.com/
[3] http://patchwork.ozlabs.org/project/buildroot/patch/20211205102010.2834942-1-troglobit@gmail.com/
[4] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/1921130201

Regards,
Ricardo

Extracts from [4] with some interesting results:
|board/intel/galileo/rootfs_overlay/etc/init.d/S09modload: ignored
|
|package/pigpio/S50pigpio:4: For PIDFILE use the same pattern found in package/busybox/S01syslogd
|PIDFILE="/var/run/pigpio.pid"
|PIDFILE="/var/run/$DAEMON.pid"
|
|package/pigpio/S50pigpio:0: filename should be S<number><number><deamon name>, see package/busybox/S01syslogd
|expecting S<number><number>pigpiod
|
|package/motion/S99motion:5: Do not include path in DAEMON, see package/busybox/S01syslogd
|DAEMON=/usr/bin/$NAME
|DAEMON="$NAME"
|
|package/motion/S99motion:23: should be indented with tabs, see package/busybox/S01syslogd
|  start)
|
|package/motion/S99motion:0: run 'shellcheck' and fix the warnings
|In package/motion/S99motion line 13:
|< tab  >printf "Stopping $NAME: "
|               ^----------------^ SC2059: Don't use variables in the printf format string. Use printf "..%s.." "$foo".
|
|package/mender/S42mender:0: run 'shellcheck' and fix the warnings
|In package/mender/S42mender line 13:
|< tab  >     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]
|             ^-- SC2166: Prefer [ p ] && [ q ] as [ p -a q ] is not well defined.
|In package/mender/S42mender line 29:
|< tab  >[ $? = 0 ] && echo "OK" || echo "FAIL"
|          ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.
|
|package/eudev/S10udev:45: consecutive empty lines
|
|package/mrp/S65mrp:0: filename should be S<number><number><deamon name>, see package/busybox/S01syslogd
|expecting S<number><number>mrp_server
|
|package/bluez5_utils/S40bluetooth:0: filename should be S<number><number><deamon name>, see package/busybox/S01syslogd
|expecting S<number><number>bluetoothd
|
|package/bluez5_utils/S40bluetooth:0: This file does not need to be executable, just make sure you use '$(INSTALL) -D -m 0755' in the .mk file
|
|package/netatalk/S50netatalk:33: empty line at end of file
|
|package/iptables/S35iptables:0: run 'shellcheck' and fix the warnings
|In package/iptables/S35iptables line 5:
|IPTABLES_ARGS=""
|^-----------^ SC2034: IPTABLES_ARGS appears unused. Verify use (or export if used externally).
|
|package/rpcbind/S30rpcbind:38: empty line at end of file
|
|In package/dhcp/S80dhcp-relay line 31:
|DHCRELAYPID=/var/run/dhcrelay.pid
|^---------^ SC2034: DHCRELAYPID appears unused. Verify use (or export if used externally).
|
|package/busybox/S10mdev:9: consecutive empty lines
|
|package/busybox/S10mdev:0: run 'shellcheck' and fix the warnings
|In package/busybox/S10mdev line 11:
|< tab  >echo -n "Starting $DAEMON... "
|             ^-- SC2039: In POSIX sh, echo flags are undefined.
|
|In package/targetcli-fb/S50target line 7:
|< tab  >local ret
|        ^-------^ SC2039: In POSIX sh, 'local' is undefined.
|
|package/oracle-mysql/S97mysqld:0: run 'shellcheck' and fix the warnings
|In package/oracle-mysql/S97mysqld line 28:
|< tab  >< tab  >< tab  >kill `cat /run/mysql/mysqld.pid`
|                             ^-------------------------^ SC2046: Quote this to prevent word splitting.
|                             ^-------------------------^ SC2006: Use $(...) notation instead of legacy backticked `...`.
|Did you mean:
|< tab  >< tab  >< tab  >kill $(cat /run/mysql/mysqld.pid)
|
|package/dbus/S30dbus:0: run 'shellcheck' and fix the warnings
|In package/dbus/S30dbus line 58:
|        if [ -f /var/lock/subsys/$servicename ]; then
|                                 ^----------^ SC2154: servicename is referenced but not assigned.
|                                 ^----------^ SC2086: Double quote to prevent globbing and word splitting.
|Did you mean:
|        if [ -f /var/lock/subsys/"$servicename" ]; then
|
|package/smcroute/S41smcroute:0: This file does not need to be executable, just make sure you use '$(INSTALL) -D -m 0755' in the .mk file
|package/c-icap/S96cicap:0: run 'shellcheck' and fix the warnings
|In package/c-icap/S96cicap line 12:
|< tab  >[ $? == 0 ] && echo "OK" || echo "FAIL"
|          ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.
|             ^-- SC2039: In POSIX sh, == in place of = is undefined.
|
|package/polkit/S50polkit:0: This file does not need to be executable, just make sure you use '$(INSTALL) -D -m 0755' in the .mk file
|
|package/polkit/S50polkit:0: run 'shellcheck' and fix the warnings
|In package/polkit/S50polkit line 43:
|< tab  >start|stop|restart|reload)
|                           ^----^ SC2221: This pattern always overrides a later one on line 45.
|In package/polkit/S50polkit line 45:
|< tab  >reload)
|        ^----^ SC2222: This pattern never matches because of a previous pattern on line 43.
|
|package/restorecond/S02restorecond:0: run 'shellcheck' and fix the warnings
|In package/restorecond/S02restorecond line 52:
|< tab  >< tab  >echo $"Usage: $0 {start|stop|restart|reload}"
|                     ^-- SC2039: In POSIX sh, $".." is undefined.
|
|package/earlyoom/S02earlyoom:0: run 'shellcheck' and fix the warnings
|In package/earlyoom/S02earlyoom line 10:
|start() {
|        ^-- SC1009: The mentioned syntax error was in this brace group.
|In package/earlyoom/S02earlyoom line 11:
|< tab  >printf() 'Starting %s: ' "$DAEMON"
|        ^-- SC1073: Couldn't parse this function. Fix to allow more checks.
|                 ^-- SC1064: Expected a { to open the function definition.
|                 ^-- SC1072:  Fix any mentioned problems and try again.
|
|package/watchdogd/S01watchdogd:0: This file does not need to be executable, just make sure you use '$(INSTALL) -D -m 0755' in the .mk file
|
|package/brltty/S10brltty:0: run 'shellcheck' and fix the warnings
|In package/brltty/S10brltty line 17:
|restart() {
|^-- SC2120: restart references arguments, but none are ever passed.
|
|package/audit/S02auditd:0: run 'shellcheck' and fix the warnings
|In package/audit/S02auditd line 13:
|CONFIG=/etc/audit/auditd.conf
|^----^ SC2034: CONFIG appears unused. Verify use (or export if used externally).
|
|package/network-manager/S45network-manager:40: consecutive empty lines
|package/network-manager/S45network-manager:41: consecutive empty lines
|package/network-manager/S45network-manager:41: empty line at end of file
|
|package/tftpd/S80tftpd-hpa:0: run 'shellcheck' and fix the warnings
|In package/tftpd/S80tftpd-hpa line 11:
|PIDFILE=/var/run/$NAME.pid
|^-----^ SC2034: PIDFILE appears unused. Verify use (or export if used externally).
|
|package/owfs/S60owfs:0: run 'shellcheck' and fix the warnings
|In package/owfs/S60owfs line 1:
|NAME="owfs"
|^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang.
|
|package/owfs/S55owserver:0: run 'shellcheck' and fix the warnings
|In package/owfs/S55owserver line 1:
|NAME="owserver"
|^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang.
|
|package/transmission/S92transmission:0: run 'shellcheck' and fix the warnings
|In package/transmission/S92transmission line 50:
|DAEMON=$(which $NAME)
|         ^---^ SC2230: which is non-standard. Use builtin 'command -v' instead.

Ricardo Martincoski (5):
  utils/check-package: prepare to run external tools
  utils/checkpackagelib: warn about executable files
  utils/checkpackagelib/lib_sysv: check SysV init scripts
  support/docker: add shellcheck
  utils/checkpackagelib/lib_sysv: run shellcheck

 support/docker/Dockerfile              |   1 +
 utils/check-package                    |  39 ++++++--
 utils/checkpackagelib/base.py          |  11 +++
 utils/checkpackagelib/lib_config.py    |   1 +
 utils/checkpackagelib/lib_hash.py      |   1 +
 utils/checkpackagelib/lib_mk.py        |   1 +
 utils/checkpackagelib/lib_patch.py     |   1 +
 utils/checkpackagelib/lib_sysv.py      |  67 +++++++++++++
 utils/checkpackagelib/test_lib_sysv.py | 131 +++++++++++++++++++++++++
 utils/checkpackagelib/test_tool.py     | 112 +++++++++++++++++++++
 utils/checkpackagelib/tool.py          |  23 +++++
 11 files changed, 382 insertions(+), 6 deletions(-)
 create mode 100644 utils/checkpackagelib/lib_sysv.py
 create mode 100644 utils/checkpackagelib/test_lib_sysv.py
 create mode 100644 utils/checkpackagelib/test_tool.py
 create mode 100644 utils/checkpackagelib/tool.py

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
