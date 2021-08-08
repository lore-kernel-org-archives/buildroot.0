Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4B0C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:26:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4358960F35
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4358960F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD360400AE;
	Sun,  8 Aug 2021 20:26:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFuVq6xDeMAq; Sun,  8 Aug 2021 20:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D63DA401BD;
	Sun,  8 Aug 2021 20:26:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E93D51BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7403401BD
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4OJ8y4VPIse for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:26:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A68D400AE
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:26:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0ED738D2D5; Sun,  8 Aug 2021 20:26:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 22:26:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 521d387640d704f24caee51841388d98bcac739b
X-Git-Newrev: 6f979d4906482147b913585a3b89bffaf29ca554
X-Patchwork-Hint: ignore
Message-Id: <20210808202613.0ED738D2D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iputils: disable tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f979d4906482147b913585a3b89bffaf29ca554
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable tests to avoid the following build failure raised since bump to
version 20210722 in commit b984cba490248e6636b53b4b26b959cda5ed6f6c:

../output-1/build/iputils-20210722/ping/meson.build:38:0: ERROR: Program or command 'ip' not found or not executable

Fixes:
 - http://autobuild.buildroot.org/results/af79d5a8a84f439f4d1d720fad2f3e197923cd4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../iputils/0001-meson-Make-tests-optional.patch   | 218 +++++++++++++++++++++
 package/iputils/iputils.mk                         |   3 +-
 2 files changed, 220 insertions(+), 1 deletion(-)

diff --git a/package/iputils/0001-meson-Make-tests-optional.patch b/package/iputils/0001-meson-Make-tests-optional.patch
new file mode 100644
index 0000000000..e9ed1d77e8
--- /dev/null
+++ b/package/iputils/0001-meson-Make-tests-optional.patch
@@ -0,0 +1,218 @@
+From 3163c49f9f4ad473a00d8a345ee334a028376011 Mon Sep 17 00:00:00 2001
+From: Heiko Becker <heirecka@exherbo.org>
+Date: Fri, 23 Jul 2021 16:32:46 +0200
+Subject: [PATCH] meson: Make tests optional
+
+Now can be disabled with -DSKIP_TESTS=true.
+
+It allows to avoid meson error during build when ip isn't installed.
+
+Closes: #359
+
+Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
+Signed-off-by: Heiko Becker <heirecka@exherbo.org>
+[ pvorel: Rename variable TEST => SKIP_TESTS, default false, adjust
+the description ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+
+[Retrieved from:
+https://github.com/iputils/iputils/commit/3163c49f9f4ad473a00d8a345ee334a028376011]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson_options.txt     |  3 ++
+ ping/meson.build      | 84 ++-----------------------------------------
+ ping/test/meson.build | 81 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 86 insertions(+), 82 deletions(-)
+ create mode 100644 ping/test/meson.build
+
+diff --git a/meson_options.txt b/meson_options.txt
+index ac5f5d98..517667f4 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -72,3 +72,6 @@ option('INSTALL_SYSTEMD_UNITS', type: 'boolean', value: false,
+ 
+ option('USE_GETTEXT', type: 'boolean', value: true,
+ 	description: 'Enable I18N')
++
++option('SKIP_TESTS', type: 'boolean', value: false,
++	description: 'Skip tests during build')
+diff --git a/ping/meson.build b/ping/meson.build
+index 1e678ec8..83ea353c 100644
+--- a/ping/meson.build
++++ b/ping/meson.build
+@@ -27,86 +27,6 @@ if (setcap_ping)
+ 	)
+ endif
+ 
+-##### TESTS #####
+-
+-# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
+-
+-# GitHub CI does not have working IPv6
+-# https://github.com/actions/virtual-environments/issues/668
+-ipv6_dst = []
+-ipv6_switch = []
+-r = run_command('ip', '-6', 'a')
+-if r.stdout().strip().contains('::1')
+-  message('IPv6 enabled')
+-  ipv6_dst = [ '::1' ]
+-  ipv6_switch = [ '-6' ]
+-else
+-  message('WARNING: IPv6 disabled')
++if not get_option('SKIP_TESTS')
++	subdir('test')
+ endif
+-
+-run_as_root = false
+-r = run_command('id', '-u')
+-if r.stdout().strip().to_int() == 0
+-  message('running as root')
+-  run_as_root = true
+-else
+-  message('running as normal user')
+-endif
+-
+-foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
+-  foreach switch : [ '', '-4' ] + ipv6_switch
+-	args = [ '-c1', dst ]
+-	should_fail = false
+-
+-	if switch != ''
+-	  args = [switch] + args
+-	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
+-		 should_fail = true
+-	  endif
+-	endif
+-
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : should_fail)
+-  endforeach
+-endforeach
+-
+-ping_tests_opt = [
+-  [ '-c1' ],
+-  [ '-c5', '-i0.1' ],
+-  [ '-c1', '-I', 'lo' ],
+-  [ '-c1', '-w1' ],
+-  [ '-c1', '-W1' ],
+-  [ '-c1', '-W1.1' ],
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_opt
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args)
+-  endforeach
+-endforeach
+-
+-ping_tests_opt_fail = [
+-  [ '-c1.1' ],
+-  [ '-I', 'nonexisting' ],
+-  [ '-w0.1' ],
+-  [ '-w0,1' ],
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_opt_fail
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : true)
+-  endforeach
+-endforeach
+-
+-ping_tests_user_fail = [
+-  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
+-]
+-foreach dst : [ '127.0.0.1' ] + ipv6_dst
+-  foreach args : ping_tests_user_fail
+-	args += [ dst ]
+-	name = 'ping ' + ' '.join(args)
+-	test(name, ping, args : args, should_fail : not run_as_root)
+-  endforeach
+-endforeach
+diff --git a/ping/test/meson.build b/ping/test/meson.build
+new file mode 100644
+index 00000000..43aed758
+--- /dev/null
++++ b/ping/test/meson.build
+@@ -0,0 +1,81 @@
++# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
++
++# GitHub CI does not have working IPv6
++# https://github.com/actions/virtual-environments/issues/668
++ipv6_dst = []
++ipv6_switch = []
++r = run_command('ip', '-6', 'a')
++if r.stdout().strip().contains('::1')
++  message('IPv6 enabled')
++  ipv6_dst = [ '::1' ]
++  ipv6_switch = [ '-6' ]
++else
++  message('WARNING: IPv6 disabled')
++endif
++
++run_as_root = false
++r = run_command('id', '-u')
++if r.stdout().strip().to_int() == 0
++  message('running as root')
++  run_as_root = true
++else
++  message('running as normal user')
++endif
++
++foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
++  foreach switch : [ '', '-4' ] + ipv6_switch
++	args = [ '-c1', dst ]
++	should_fail = false
++
++	if switch != ''
++	  args = [switch] + args
++	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
++		 should_fail = true
++	  endif
++	endif
++
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : should_fail)
++  endforeach
++endforeach
++
++ping_tests_opt = [
++  [ '-c1' ],
++  [ '-c5', '-i0.1' ],
++  [ '-c1', '-I', 'lo' ],
++  [ '-c1', '-w1' ],
++  [ '-c1', '-W1' ],
++  [ '-c1', '-W1.1' ],
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_opt
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args)
++  endforeach
++endforeach
++
++ping_tests_opt_fail = [
++  [ '-c1.1' ],
++  [ '-I', 'nonexisting' ],
++  [ '-w0.1' ],
++  [ '-w0,1' ],
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_opt_fail
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : true)
++  endforeach
++endforeach
++
++ping_tests_user_fail = [
++  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
++]
++foreach dst : [ '127.0.0.1' ] + ipv6_dst
++  foreach args : ping_tests_user_fail
++	args += [ dst ]
++	name = 'ping ' + ' '.join(args)
++	test(name, ping, args : args, should_fail : not run_as_root)
++  endforeach
++endforeach
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index af93909edf..6e182e6a70 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -26,7 +26,8 @@ IPUTILS_CONF_OPTS += \
 	-DBUILD_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
 	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
 	-DBUILD_TRACEROUTE6=$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),true,false) \
-	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false)
+	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
+	-DSKIP_TESTS=true
 
 # Selectively select the appropriate SELinux refpolicy modules
 IPUTILS_SELINUX_MODULES = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
