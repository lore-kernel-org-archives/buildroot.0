Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C76FCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D56C760D80;
	Fri,  5 Jun 2026 12:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NY5Wzr4EqntU; Fri,  5 Jun 2026 12:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC47C60E14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663201;
	bh=KpaTdUqPzjVyuHbRnL9NuqliLv5BIbqTZ/fsovZFdK0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HWmX4FJ5jz76EcyLWWc7XRsiFM8q01xYDtOeVhl5aZ7rxRERJOxDvA4xmB1ZLnWv0
	 ThBuxrbUc1DkHnanRw6cIFBxfezI7DLkryTT0AI3ajEAXeIAxBE4jYe8zTe4qS6D9E
	 IrLHnZb7WkWD9g2yyQgeWRKM8EnKU26QIXlGB6123tLJle9dUUOiJC/Mr9Dx4/Zk69
	 Pk6/8YbTJuzfqsbQ9i6yW5Xtsjt7keQO8oRcgcnjHCgU8e3hJ9iIx6jyNEbN0QCM/H
	 aRN21e41lNIQrvx0ocX97JDtX8EfsEnSTq2MADlOwO/l2ccXOQmTb6y/MQM4zP8gx8
	 yTTh1yz63kOyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC47C60E14;
	Fri,  5 Jun 2026 12:40:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E2FF3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F51641081
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNZOLQ4kApFB for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0280F41028
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0280F41028
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BF4887B22; Fri,  5 Jun 2026 12:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:46:01 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 2ebef53381b306047b44828007f6bdae47ffb7f0
X-Git-Newrev: 5096c7df41e30b5e1df2465efa8eb3c21c505e1d
X-Patchwork-Hint: ignore
Message-Id: <20260605123836.2BF4887B22@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 support/dependencies/dependencies.sh: reject buggy uutils install
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5096c7df41e30b5e1df2465efa8eb3c21c505e1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

uutils install 0.8.0 as used in Ubuntu 26.04 has a bug in the install
applet, breaking a number of packages:

https://github.com/uutils/coreutils/pull/11505
https://bugs.launchpad.net/ubuntu/+source/rust-coreutils/+bug/2151454

The fix has been merged upstream but not yet released or packaged in Ubuntu,
so detect and reject the buggy version and explain how to change to the
coreutils version. Once fixed the version output will hopefully change.

For simplicity, only check for the exact 0.8.0 version string. Hopefully
when it is fixed in Ubuntu, they also update the version string. Note
that earlier versions of uutils have the same issue of course, but those
versions were never the default "install" on Ubuntu (or anywhere else).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 64cb69f1559bc56761c17045fef9b55838a2cbca)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/dependencies/dependencies.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 9c2aeaf23f..8e97f0912d 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -190,6 +190,17 @@ if test "${missing_progs}" = "yes" ; then
 	exit 1
 fi
 
+INSTALL_VERSION="$(install --version | sed -n 's/^install \(.*\)/\1/p')"
+if [ "${INSTALL_VERSION}" = "(uutils coreutils) 0.8.0" ]; then
+	echo
+	echo "You have an uutils 'install' version installed which is affected by:"
+	echo "  https://github.com/uutils/coreutils/issues/12166"
+	echo
+	echo "Please change to coreutils install with:"
+	echo "update-alternatives --install /usr/bin/install install /usr/bin/gnuinstall 100"
+	exit 1
+fi
+
 PATCH_VERSION="$(patch -v 2>/dev/null | sed -n 's/^GNU patch \(.*\)/\1/p')"
 if [ -z "${PATCH_VERSION}" ] ; then
 	echo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
