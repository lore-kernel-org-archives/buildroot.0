Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A7BCD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5687760EFE;
	Fri, 12 Jun 2026 11:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FP_U6qJpyrNi; Fri, 12 Jun 2026 11:23:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D1A46106F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263385;
	bh=62dAzkrXQAedr3qTQnfxItq338S8X6KNaJSMzW3vyFY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iR4msrm3XCtZxz4HLF7cVqIqNmkBVEZceTr8ISRFZ9aFTu9/gZxqvo757EXsK8ps6
	 yWgcouHYWi7WtzIEpwsO+CKAQNGPNRA1dZctFtGEVG0+ZWbcz5Xr8B9OD8MY/yeBCR
	 8f3pL7D0Bv0/H/l6EjHP1bRlhG4Vmz/iK9sSyxSFFqm9RSp9sNqFh/UP7lA+Bobu0j
	 91rBd0oMVXskcavNv8VjgOoCS+4oMY+3SwhapqChaqCQhM05vbl9HilAX+1Msgpd8g
	 +5sJRYR1bMAI/hh8a4v6362H1LgPGEPi3xfVndoHSlcfOcCu9yh44v1gJGSm56Pjt5
	 8eepOAr0sDiIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D1A46106F;
	Fri, 12 Jun 2026 11:23:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E6DDF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1370560F4B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1MVBwGnP1lO for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48D1E60F46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48D1E60F46
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15B84880E9; Fri, 12 Jun 2026 11:22:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:46:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fce79a74f14810c4bbc33125c12a6ef2ba81470e
X-Git-Newrev: 4a741d4b1ae989f5749785bea950ea7a104a26eb
X-Patchwork-Hint: ignore
Message-Id: <20260612112215.15B84880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: add
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4124327875050152778=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4124327875050152778==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a741d4b1ae989f5749785bea950ea7a104a26eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerability:

- CVE-2026-8328:
    The ftpcp() function in Lib/ftplib.py was not updated when
    CVE-2021-4189 was fixed. While makepasv() was patched to replace
    server-supplied PASV host addresses with the actual peer address
    (getpeername()[0]), ftpcp() still calls parse227() directly and passes
    the raw attacker-controllable IP address and port to
    target.sendport(). This patch is related to CVE-2021-4189.
    https://www.cve.org/CVERecord?id=CVE-2026-8328

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ly-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch | 118 +++++++++++++++++++++
 package/python3/python3.mk                         |   2 +
 2 files changed, 120 insertions(+)

diff --git a/package/python3/0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch b/package/python3/0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch
new file mode 100644
index 0000000000..c39ebfa1c3
--- /dev/null
+++ b/package/python3/0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch
@@ -0,0 +1,118 @@
+From b026be60f7e023719a4d8de89ae3c3248b7c5d40 Mon Sep 17 00:00:00 2001
+From: "Gregory P. Smith" <68491+gpshead@users.noreply.github.com>
+Date: Wed, 13 May 2026 10:33:43 -0700
+Subject: [PATCH] gh-87451: Apply CVE-2021-4189 PASV fix to ftplib.ftpcp()
+ (GH-149648)
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
+
+Upstream: https://github.com/python/cpython/pull/149795
+CVE: CVE-2026-8328
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ Lib/ftplib.py                                 | 11 +++++-
+ Lib/test/test_ftplib.py                       | 36 ++++++++++++++++++-
+ ...6-05-10-18-05-32.gh-issue-87451.XkKB6M.rst |  6 ++++
+ 3 files changed, 51 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
+
+diff --git a/Lib/ftplib.py b/Lib/ftplib.py
+index 10c5d1ea08ab115..463da58de85d721 100644
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
+index 204a77d14f03a50..7542f015f78c421 100644
+--- a/Lib/test/test_ftplib.py
++++ b/Lib/test/test_ftplib.py
+@@ -16,7 +16,7 @@
+ except ImportError:
+     ssl = None
+ 
+-from unittest import TestCase, skipUnless
++from unittest import mock, TestCase, skipUnless
+ from test import support
+ from test.support import threading_helper
+ from test.support import socket_helper
+@@ -1142,6 +1142,40 @@ def testTimeoutDirectAccess(self):
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
+index 000000000000000..21a79c3e0e7db74
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
+@@ -0,0 +1,6 @@
++The :mod:`ftplib` module's undocumented ``ftpcp`` function no longer trusts
++the IPv4 address value returned from the source server in response to the
++``PASV`` command by default, completing the fix for CVE-2021-4189.  As with
++:class:`ftplib.FTP`, the former behavior can be re-enabled by setting the
++``trust_server_pasv_ipv4_address`` attribute on the source :class:`ftplib.FTP`
++instance to ``True``.  Thanks to Qi Deng at Aurascape AI for the report.
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 96be4bd651..52f06e08df 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -17,6 +17,8 @@ PYTHON3_CPE_ID_PRODUCT = python
 PYTHON3_IGNORE_CVES += CVE-2026-3276
 # 0014-tarfile-data_filter-validate-written-link.patch
 PYTHON3_IGNORE_CVES += CVE-2026-7774
+# 0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch
+PYTHON3_IGNORE_CVES += CVE-2026-8328
 
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.

--===============4124327875050152778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4124327875050152778==--
