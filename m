Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50B9C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 17:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 796D1401CD;
	Sun,  6 Feb 2022 17:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4OMQFO5AyXr; Sun,  6 Feb 2022 17:29:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46FB34020A;
	Sun,  6 Feb 2022 17:29:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27CB91BF59A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1551C4014E
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 17:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vZEDTt_zP33 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 17:29:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D8E2400C1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 17:29:43 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a8so35599731ejc.8
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 09:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2KorLycEIMYfBhcqGsADGZvqTI4pz/jY9rB5NoCovq0=;
 b=Sz/4mJDs7s1CZlroB6CJulsKhXooZuK6Nz5C74Mlb6kbC6Jc+geXm8xLmA6nw4ifSC
 HVXrj4Xsrw56CqObfdm2bnldu+SidPVDGw2pXOu2e7boawMLYWks/p/rV2y/gNuj+Ozt
 Nx/ztjKVS7ghkIbQzaAAqrdCZGStQ8ZnNSELg2HwE5bZlOoSoqFAAuJLVJFPTzNHgxbp
 D6jYSPLdLcA6I8yMj7fwC1F/nu49xeguTsrOiw0tpIW0gHTs4N7+0IZLaEGUs+OwpFOg
 wQb/DTBfSZD/sOE55rJZfkJjfEO4VleYJdKuiCKUYT0L+7eMwhihBTJm125HN9KghpXH
 OOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2KorLycEIMYfBhcqGsADGZvqTI4pz/jY9rB5NoCovq0=;
 b=5UVdk11U7yYyQMWW+GJwtN5Xtli8JgsBrncEElXN6QNtibiEUpHox/OrFdaXp0OXoO
 xd5mR281OtSDcUvwEbrw235iHtHghcmSkH4cr58E608Rb/S92EtQrNwitNy4OCBlTqPb
 B/FzJ69aa44YynQpGKFvb6cNzsMSGNSbMLtD28M6OORVt2pfJtUQwtMfGXyMVU3w7/IO
 9fHNeIh5uXspr6T4XmhxU4GB4m14XJJG642rvb5SGvuWjLv9D6e8P3ZEGFc3H26Em20N
 UqOS0ge4CpI+PJygo3t4Oqx0gokGivc0r+n0sMSyzQebRblvaSjjZXh9zInhzCx/Ox7Q
 L0Wg==
X-Gm-Message-State: AOAM531KXtbgRoWAubKRydFGjGEuWezzX0uCqaHMPg12Zme1MvSmqZSd
 eci6nIxNTM4VPzfNQoYYPD+sjA==
X-Google-Smtp-Source: ABdhPJyDX8fBfu0ZjLi+dIhZaiBL3Zi8ZQeJNEgpqvK4kdor8YpknvUz73Ae4E93bDnn/ausQNaRiw==
X-Received: by 2002:a17:907:1c8e:: with SMTP id
 nb14mr6903689ejc.323.1644168581758; 
 Sun, 06 Feb 2022 09:29:41 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w6sm3904764edd.50.2022.02.06.09.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 09:29:41 -0800 (PST)
Message-ID: <9d9678b5-3fb1-dc25-65f4-0edf4b27ef3c@mind.be>
Date: Sun, 6 Feb 2022 18:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
Subject: Re: [Buildroot] [PATCH 0/5] check-package for SysV init scripts
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/12/2021 19:49, Ricardo Martincoski wrote:
> Hello,
> 
> This small series (called series2 below) is built on top of [1] (called series1)
> specially for its patches 1 (check-package unit tests) and 4 (script
> utils/docker-run that eases to run locally commands in the docker image in order
> to have stable results across machines).
> 
> So:
> series1 1/4 utils/checkpackagelib: add unit tests
> series1 2/4 support/docker: add python3-pytest
> series1 3/4 utils/checkpackagelib: run unit tests on GitLab CI
> series1 4/4 utils/docker-run: new script
> series2 1/5 utils/check-package: prepare to run external tools
> series2 2/5 utils/checkpackagelib: warn about executable files
> series2 3/5 utils/checkpackagelib/lib_sysv: check SysV init scripts
> series2 4/5 support/docker: add shellcheck
> series2 5/5 utils/checkpackagelib/lib_sysv: run shellcheck

  Series applied to master.

> 
> This series is also related to [2].
> Cc: Joachim Wiberg <troglobit@gmail.com>
> See an example output for patch [2]:
> |$ utils/docker-run utils/check-package -vvv package/inadyn/S70inadyn
> |package/inadyn/S70inadyn:24: should be indented with tabs, see package/busybox/S01syslogd
> |< tab  >< tab  >< tab  >  -- $INADYN_ARGS
> |package/inadyn/S70inadyn:0: This file does not need to be executable, just make sure you use '$(INSTALL) -D -m 0755' in the .mk file
> |74 lines processed
> |2 warnings generated
> 
> This series is also related to [3].
> Perhaps if both series are accepted, we can add cross-reference between the doc
> and the tool:
> - check-package can point to a manual entry

  This I have done.

> - the doc can mention to use check-package directly for SysV init script
> - the doc can mention to use check-package inside docker image using
>    utils/docker-run

  These two I have not done.

  I've also made a few more changes, and I've put a new docker image to gitlab 
so it can be used by run-docker.

  With this tools thing in check-package, it would be nice if we could move 
flake8 in there as well. I have a post-commit hook that automatically runs 
check-package, but not flake8, and because of that it often happens that flake8 
errors slip by (on this series as well...).

  Same for shellcheck, it would be nice to run it on all scripts (particularly 
in utils/ and support/), not just the init start script.

  Regards,
  Arnout

> 
> What this series IS NOT:
>   - a complete rework of all SysV init scripts in the tree;
>   - an automated way to rework SysV init scripts;
>   - the ultimate checker for SysV init scripts that catches all possible errors;
>   - something to enable in GitLab CI in the short term.
> 
> What this series IS (hopefully):
>   - a helper for developers willing to rework one SysV init script at a time;
>   - something that can be extended to check more common mistakes when reworking a
>     SysV init script with package/busybox/S01syslogd as base;
>   - a few years from now we can eventually enable the check in GitLab CI when all
>     SysV init script got reworked.
> 
> In [4] one can see an example of all warnings that would be generated for all
> scripts in the tree.
> NOTICE that no warnings are generated for package/busybox/S01syslogd, as
> expected.
> At the end see some extracts from [4] with some interesting results (thanks to
> shellcheck).
> 
> NOTICE that as a consequence of using shellcheck, there will be cases that will
> need shellcheck disables, just like S01syslogd already does:
> |	# shellcheck disable=SC2086 # we need the word splitting
> 
> [1] http://patchwork.ozlabs.org/project/buildroot/list/?series=275236
> [2] http://patchwork.ozlabs.org/project/buildroot/patch/20211205102907.2836980-3-troglobit@gmail.com/
> [3] http://patchwork.ozlabs.org/project/buildroot/patch/20211205102010.2834942-1-troglobit@gmail.com/
> [4] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/1921130201
> 
> Regards,
> Ricardo
> 
> Extracts from [4] with some interesting results:
> |board/intel/galileo/rootfs_overlay/etc/init.d/S09modload: ignored
> |
> |package/pigpio/S50pigpio:4: For PIDFILE use the same pattern found in package/busybox/S01syslogd
> |PIDFILE="/var/run/pigpio.pid"
> |PIDFILE="/var/run/$DAEMON.pid"
> |
> |package/pigpio/S50pigpio:0: filename should be S<number><number><deamon name>, see package/busybox/S01syslogd
> |expecting S<number><number>pigpiod
> |
> |package/motion/S99motion:5: Do not include path in DAEMON, see package/busybox/S01syslogd
> |DAEMON=/usr/bin/$NAME
> |DAEMON="$NAME"
> |
> |package/motion/S99motion:23: should be indented with tabs, see package/busybox/S01syslogd
> |  start)
> |
> |package/motion/S99motion:0: run 'shellcheck' and fix the warnings
> |In package/motion/S99motion line 13:
> |< tab  >printf "Stopping $NAME: "
> |               ^----------------^ SC2059: Don't use variables in the printf format string. Use printf "..%s.." "$foo".
> |
> |package/mender/S42mender:0: run 'shellcheck' and fix the warnings
> |In package/mender/S42mender line 13:
> |< tab  >     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]
> |             ^-- SC2166: Prefer [ p ] && [ q ] as [ p -a q ] is not well defined.
> |In package/mender/S42mender line 29:
> |< tab  >[ $? = 0 ] && echo "OK" || echo "FAIL"
> |          ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.
> |
> |package/eudev/S10udev:45: consecutive empty lines
> |
> |package/mrp/S65mrp:0: filename should be S<number><number><deamon name>, see package/busybox/S01syslogd
> |expecting S<number><number>mrp_server
> |
> |package/bluez5_utils/S40bluetooth:0: filename should be S<number><number><deamon name>, see package/busybox/S01syslogd
> |expecting S<number><number>bluetoothd
> |
> |package/bluez5_utils/S40bluetooth:0: This file does not need to be executable, just make sure you use '$(INSTALL) -D -m 0755' in the .mk file
> |
> |package/netatalk/S50netatalk:33: empty line at end of file
> |
> |package/iptables/S35iptables:0: run 'shellcheck' and fix the warnings
> |In package/iptables/S35iptables line 5:
> |IPTABLES_ARGS=""
> |^-----------^ SC2034: IPTABLES_ARGS appears unused. Verify use (or export if used externally).
> |
> |package/rpcbind/S30rpcbind:38: empty line at end of file
> |
> |In package/dhcp/S80dhcp-relay line 31:
> |DHCRELAYPID=/var/run/dhcrelay.pid
> |^---------^ SC2034: DHCRELAYPID appears unused. Verify use (or export if used externally).
> |
> |package/busybox/S10mdev:9: consecutive empty lines
> |
> |package/busybox/S10mdev:0: run 'shellcheck' and fix the warnings
> |In package/busybox/S10mdev line 11:
> |< tab  >echo -n "Starting $DAEMON... "
> |             ^-- SC2039: In POSIX sh, echo flags are undefined.
> |
> |In package/targetcli-fb/S50target line 7:
> |< tab  >local ret
> |        ^-------^ SC2039: In POSIX sh, 'local' is undefined.
> |
> |package/oracle-mysql/S97mysqld:0: run 'shellcheck' and fix the warnings
> |In package/oracle-mysql/S97mysqld line 28:
> |< tab  >< tab  >< tab  >kill `cat /run/mysql/mysqld.pid`
> |                             ^-------------------------^ SC2046: Quote this to prevent word splitting.
> |                             ^-------------------------^ SC2006: Use $(...) notation instead of legacy backticked `...`.
> |Did you mean:
> |< tab  >< tab  >< tab  >kill $(cat /run/mysql/mysqld.pid)
> |
> |package/dbus/S30dbus:0: run 'shellcheck' and fix the warnings
> |In package/dbus/S30dbus line 58:
> |        if [ -f /var/lock/subsys/$servicename ]; then
> |                                 ^----------^ SC2154: servicename is referenced but not assigned.
> |                                 ^----------^ SC2086: Double quote to prevent globbing and word splitting.
> |Did you mean:
> |        if [ -f /var/lock/subsys/"$servicename" ]; then
> |
> |package/smcroute/S41smcroute:0: This file does not need to be executable, just make sure you use '$(INSTALL) -D -m 0755' in the .mk file
> |package/c-icap/S96cicap:0: run 'shellcheck' and fix the warnings
> |In package/c-icap/S96cicap line 12:
> |< tab  >[ $? == 0 ] && echo "OK" || echo "FAIL"
> |          ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.
> |             ^-- SC2039: In POSIX sh, == in place of = is undefined.
> |
> |package/polkit/S50polkit:0: This file does not need to be executable, just make sure you use '$(INSTALL) -D -m 0755' in the .mk file
> |
> |package/polkit/S50polkit:0: run 'shellcheck' and fix the warnings
> |In package/polkit/S50polkit line 43:
> |< tab  >start|stop|restart|reload)
> |                           ^----^ SC2221: This pattern always overrides a later one on line 45.
> |In package/polkit/S50polkit line 45:
> |< tab  >reload)
> |        ^----^ SC2222: This pattern never matches because of a previous pattern on line 43.
> |
> |package/restorecond/S02restorecond:0: run 'shellcheck' and fix the warnings
> |In package/restorecond/S02restorecond line 52:
> |< tab  >< tab  >echo $"Usage: $0 {start|stop|restart|reload}"
> |                     ^-- SC2039: In POSIX sh, $".." is undefined.
> |
> |package/earlyoom/S02earlyoom:0: run 'shellcheck' and fix the warnings
> |In package/earlyoom/S02earlyoom line 10:
> |start() {
> |        ^-- SC1009: The mentioned syntax error was in this brace group.
> |In package/earlyoom/S02earlyoom line 11:
> |< tab  >printf() 'Starting %s: ' "$DAEMON"
> |        ^-- SC1073: Couldn't parse this function. Fix to allow more checks.
> |                 ^-- SC1064: Expected a { to open the function definition.
> |                 ^-- SC1072:  Fix any mentioned problems and try again.
> |
> |package/watchdogd/S01watchdogd:0: This file does not need to be executable, just make sure you use '$(INSTALL) -D -m 0755' in the .mk file
> |
> |package/brltty/S10brltty:0: run 'shellcheck' and fix the warnings
> |In package/brltty/S10brltty line 17:
> |restart() {
> |^-- SC2120: restart references arguments, but none are ever passed.
> |
> |package/audit/S02auditd:0: run 'shellcheck' and fix the warnings
> |In package/audit/S02auditd line 13:
> |CONFIG=/etc/audit/auditd.conf
> |^----^ SC2034: CONFIG appears unused. Verify use (or export if used externally).
> |
> |package/network-manager/S45network-manager:40: consecutive empty lines
> |package/network-manager/S45network-manager:41: consecutive empty lines
> |package/network-manager/S45network-manager:41: empty line at end of file
> |
> |package/tftpd/S80tftpd-hpa:0: run 'shellcheck' and fix the warnings
> |In package/tftpd/S80tftpd-hpa line 11:
> |PIDFILE=/var/run/$NAME.pid
> |^-----^ SC2034: PIDFILE appears unused. Verify use (or export if used externally).
> |
> |package/owfs/S60owfs:0: run 'shellcheck' and fix the warnings
> |In package/owfs/S60owfs line 1:
> |NAME="owfs"
> |^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang.
> |
> |package/owfs/S55owserver:0: run 'shellcheck' and fix the warnings
> |In package/owfs/S55owserver line 1:
> |NAME="owserver"
> |^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang.
> |
> |package/transmission/S92transmission:0: run 'shellcheck' and fix the warnings
> |In package/transmission/S92transmission line 50:
> |DAEMON=$(which $NAME)
> |         ^---^ SC2230: which is non-standard. Use builtin 'command -v' instead.
> 
> Ricardo Martincoski (5):
>    utils/check-package: prepare to run external tools
>    utils/checkpackagelib: warn about executable files
>    utils/checkpackagelib/lib_sysv: check SysV init scripts
>    support/docker: add shellcheck
>    utils/checkpackagelib/lib_sysv: run shellcheck
> 
>   support/docker/Dockerfile              |   1 +
>   utils/check-package                    |  39 ++++++--
>   utils/checkpackagelib/base.py          |  11 +++
>   utils/checkpackagelib/lib_config.py    |   1 +
>   utils/checkpackagelib/lib_hash.py      |   1 +
>   utils/checkpackagelib/lib_mk.py        |   1 +
>   utils/checkpackagelib/lib_patch.py     |   1 +
>   utils/checkpackagelib/lib_sysv.py      |  67 +++++++++++++
>   utils/checkpackagelib/test_lib_sysv.py | 131 +++++++++++++++++++++++++
>   utils/checkpackagelib/test_tool.py     | 112 +++++++++++++++++++++
>   utils/checkpackagelib/tool.py          |  23 +++++
>   11 files changed, 382 insertions(+), 6 deletions(-)
>   create mode 100644 utils/checkpackagelib/lib_sysv.py
>   create mode 100644 utils/checkpackagelib/test_lib_sysv.py
>   create mode 100644 utils/checkpackagelib/test_tool.py
>   create mode 100644 utils/checkpackagelib/tool.py
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
