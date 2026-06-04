Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69C6CD6E75
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 20:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6837C6F8CE;
	Thu,  4 Jun 2026 20:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KECFY9TKvzGh; Thu,  4 Jun 2026 20:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CD836F8CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780603550;
	bh=otXGZmhVbZuwPDJXOoFbMGDZjlRZT4jJoqVi7vk3r6Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GJUlWQ/vQMg0Yna9O99ohkQ6Z7T3eiZ6KlyoWwoiUT7HgoXY/58oqNm5JjJ0eqBSo
	 Q+HWdCp94FlBzu8tNjFckoz5LrO3p+RiEF3XeqmmXYlNPI/+K1EYDWketnEV2xCq9V
	 o4Sd0RP5BHHnl7xPyMOal47S7/QjGIimGBZ+0tGTm4kvzy3EB7C6jQ93YuyYcAxAOv
	 9yi2UHHncJPPMavDHePSqiUFGGT3QJARUYQlsBnMZMYL4XWQU9eMz5KMeIuD8LYkTL
	 y1Q3DDCZZP2OugjFSOWwqekVZBktiFahhpRsas8qpMyVD5xkVBm4aHdl+QnyA8FF7X
	 37U3OFotaTFJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CD836F8CF;
	Thu,  4 Jun 2026 20:05:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97F6B26A
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DE5F6F8D0
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTiqBExLDmRQ for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 20:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 945076F8CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 945076F8CE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06DCC87A98; Thu,  4 Jun 2026 20:05:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 21:53:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67ec0e9c202a1d0f3cd2d4780a23950ca64a1745
X-Git-Newrev: d4be78ccb572f9e44271becb7af3c1987718456e
X-Patchwork-Hint: ignore
Message-Id: <20260604200532.06DCC87A98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: add upstream security
 patch for CVE-2026-8328
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d4be78ccb572f9e44271becb7af3c1987718456e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://mail.python.org/archives/list/security-announce@python.org/thread/ITF2BAPBQEPYK3LDMPRSY435JGNHYNDP/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...51-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch | 123 +++++++++++++++++++++
 package/python3/python3.mk                         |   3 +
 2 files changed, 126 insertions(+)

diff --git a/package/python3/0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch b/package/python3/0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch
new file mode 100644
index 0000000000..7605e40722
--- /dev/null
+++ b/package/python3/0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch
@@ -0,0 +1,123 @@
+From 7d95a1dc7382b55cba7fdd6a110336077584a4f0 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 13 May 2026 19:59:11 +0200
+Subject: [PATCH] [3.14] gh-87451: Apply CVE-2021-4189 PASV fix to
+ ftplib.ftpcp() (GH-149648) (#149793)
+
+gh-87451: Apply CVE-2021-4189 PASV fix to ftplib.ftpcp() (GH-149648)
+
+ftpcp() called parse227() directly and passed the source server's
+self-reported PASV IPv4 address to the target server's PORT command,
+bypassing the CVE-2021-4189 fix that was applied only to FTP.makepasv().
+A malicious source FTP server could use this to redirect the target
+server's data connection to an arbitrary host:port (SSRF).
+
+ftpcp() now uses the source server's actual peer address, honoring the
+existing trust_server_pasv_ipv4_address opt-out, the same as makepasv().
+
+Thanks to Qi Ding at Aurascape AI for the report. (GHSA-w8c5-q2xf-gf7c)
+(cherry picked from commit eac4fe3b2c77693790a5ef7dfab127c1fee81bf9)
+
+Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com>
+Upstream: https://github.com/python/cpython/commit/7d95a1dc7382b55cba7fdd6a110336077584a4f0
+CVE: CVE-2026-8328
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Lib/ftplib.py                                 | 11 +++++-
+ Lib/test/test_ftplib.py                       | 36 ++++++++++++++++++-
+ ...6-05-10-18-05-32.gh-issue-87451.XkKB6M.rst |  6 ++++
+ 3 files changed, 51 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
+
+diff --git a/Lib/ftplib.py b/Lib/ftplib.py
+index 50771e8c17c..73882a38dce 100644
+--- a/Lib/ftplib.py
++++ b/Lib/ftplib.py
+@@ -883,7 +883,16 @@ def ftpcp(source, sourcename, target, targetname = '', type = 'I'):
+     type = 'TYPE ' + type
+     source.voidcmd(type)
+     target.voidcmd(type)
+-    sourcehost, sourceport = parse227(source.sendcmd('PASV'))
++    # Don't trust the IPv4 address the source server advertises in its PASV
++    # reply: a malicious source could otherwise point the target's data
++    # connection at an arbitrary host (SSRF).  A caller that needs the old
++    # behavior can set trust_server_pasv_ipv4_address on the source FTP
++    # object.  See FTP.makepasv(), which applies the same rule.
++    untrusted_host, sourceport = parse227(source.sendcmd('PASV'))
++    if source.trust_server_pasv_ipv4_address:
++        sourcehost = untrusted_host
++    else:
++        sourcehost = source.sock.getpeername()[0]
+     target.sendport(sourcehost, sourceport)
+     # RFC 959: the user must "listen" [...] BEFORE sending the
+     # transfer request.
+diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
+index c864d401f9e..f1eff9430f7 100644
+--- a/Lib/test/test_ftplib.py
++++ b/Lib/test/test_ftplib.py
+@@ -16,7 +16,7 @@
+ except ImportError:
+     ssl = None
+ 
+-from unittest import TestCase, skipUnless
++from unittest import mock, TestCase, skipUnless
+ from test import support
+ from test.support import requires_subprocess
+ from test.support import threading_helper
+@@ -1145,6 +1145,40 @@ def testTimeoutDirectAccess(self):
+         ftp.close()
+ 
+ 
++class TestFtpcpSecurity(TestCase):
++    """ftpcp() must not trust the host a source server advertises in PASV.
++
++    A malicious source server can otherwise redirect the target server's
++    data connection to an arbitrary host:port (SSRF), so ftpcp() uses the
++    source server's actual peer address instead, the same as FTP.makepasv().
++    """
++
++    def _make_pair(self, *, advertised_host, real_host, trust=False):
++        source = mock.Mock(spec=ftplib.FTP)
++        source.trust_server_pasv_ipv4_address = trust
++        source.sock.getpeername.return_value = (real_host, 21)
++        # PASV replies give the host as comma-separated octets, not dotted.
++        advertised = advertised_host.replace('.', ',')
++        source.sendcmd.side_effect = lambda cmd: (
++            f'227 Entering Passive Mode ({advertised},1,2).'
++            if cmd == 'PASV' else '150 ok')
++        target = mock.Mock(spec=ftplib.FTP)
++        target.sendcmd.return_value = '150 ok'
++        return source, target
++
++    def test_ftpcp_ignores_untrusted_pasv_host(self):
++        source, target = self._make_pair(advertised_host='10.0.0.5',
++                                         real_host='198.51.100.7')
++        ftplib.ftpcp(source, 'a', target, 'b')
++        target.sendport.assert_called_once_with('198.51.100.7', 258)
++
++    def test_ftpcp_trust_server_pasv_ipv4_address(self):
++        source, target = self._make_pair(advertised_host='10.0.0.5',
++                                         real_host='198.51.100.7', trust=True)
++        ftplib.ftpcp(source, 'a', target, 'b')
++        target.sendport.assert_called_once_with('10.0.0.5', 258)
++
++
+ class MiscTestCase(TestCase):
+     def test__all__(self):
+         not_exported = {
+diff --git a/Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst b/Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
+new file mode 100644
+index 00000000000..21a79c3e0e7
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
+@@ -0,0 +1,6 @@
++The :mod:`ftplib` module's undocumented ``ftpcp`` function no longer trusts
++the IPv4 address value returned from the source server in response to the
++``PASV`` command by default, completing the fix for CVE-2021-4189.  As with
++:class:`ftplib.FTP`, the former behavior can be re-enabled by setting the
++``trust_server_pasv_ipv4_address`` attribute on the source :class:`ftplib.FTP`
++instance to ``True``.  Thanks to Qi Deng at Aurascape AI for the report.
+-- 
+2.47.3
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index e14ddf4f20..931ad3bae6 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -19,6 +19,9 @@ PYTHON3_IGNORE_CVES += CVE-2026-3276
 # 0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
 PYTHON3_IGNORE_CVES += CVE-2026-7774
 
+# 0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch
+PYTHON3_IGNORE_CVES += CVE-2026-8328
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
