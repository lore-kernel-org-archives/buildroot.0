Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FC6C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 19:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CE1B80FE8;
	Mon,  6 Jul 2026 19:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bs8BJ2JvAJF; Mon,  6 Jul 2026 19:42:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADFB580FEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783366935;
	bh=0UPEvZQUTl7upReMMZm8cciTEH20yf8SLoytlMik57k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=emGBdjglZ+YO32JsCdW4g/SKc+20a2Wp7wNtJkWbAlE1jhBUH5Gnr5vpB9bbLh4a5
	 ioJP4lBNBEhKeXby+0I5CmnqFXFCNB4hU0QElvFjvN0x/htrMIdQ8o/DqXres3g9Hw
	 8m1tyyWweAndtFLA40IeZIFCJtmLWH+nB/raSddV6V+xfjMC8fPcu83lR1bALpK4FN
	 PaN8cOfGosW8/HG+9uvfJlOcgdNYGnpD7EwtEVD//VFqRqJixy4Ke4iQcJr8G4ZYew
	 BsqVYL6T1NAhcqMGYCgbhCUKv/yvX7IL1p43M0TA+H4fzP4MRmcOziKtKy8s80+5qh
	 w6wigVkRpK6QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADFB580FEF;
	Mon,  6 Jul 2026 19:42:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2041316
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93B6580FEF
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyYdjcgDSPcJ for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 19:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881D580FE8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 881D580FE8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:42:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F87B88549; Mon,  6 Jul 2026 19:41:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Jul 2026 21:32:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ebfc351bea9556b35878a4629dc8c34dcfee3fc
X-Git-Newrev: 90add0c09e18e1f7d500f06feb9c9d02d723f8e6
X-Patchwork-Hint: ignore
Message-Id: <20260706194142.7F87B88549@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: security bump to version
 10.4p1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/90add0c09e18e1f7d500f06feb9c9d02d723f8e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.openssh.org/releasenotes.html#10.4p1

Changes since OpenSSH 10.3
==========================

This release contains a number of security fixes as well as general
bugfixes and a couple of new features.

Security
========

 * sftp(1): when downloading files on the command-line using
   "sftp host:/path .", a malicious server could cause the file to
   be downloaded to an unexpected location. This issue was identified
   by the Swival Security Scanner.

 * scp(1): when copying files between two remote destinations, do
   not allow a malicious server to write files to the parent
   directory of the intended target directory.  This issue was
   identified by the Swival Security Scanner.

 * sshd(8): when using the "internal-sftp" SFTP server implementation
   (this is not the default), long command lines were previously
   truncated silently after the 9th argument. If a security-relevant
   option was in the 10th or later position, it would be discarded.
   Reported by Steve Caffrey.

 * sshd(8): add a documentation note to mention that the
   GSSAPIStrictAcceptorCheck option is ineffective when the server
   is joined to a Windows Active Directory. Reported by Yarin Aharoni
   of Safebreach.

 * sshd(8): DisableForwarding=yes didn't override PermitTunnel=yes
   as it was documented to do. Note that PermitTunnel is not enabled
   by default. Reported independently by Huzaifa Sidhpurwala of
   Redhat and Marko Jevtic.

 * sshd(8): avoid a potential pre-authentication denial of service
   when GSSAPIAuthentication was enabled (this feature is off by
   default). This was not mitigated by MaxAuthTries, but would be
   penalised by PerSourcePenalties. This was reported by Manfred
   Kaiser of the milCERT AT (Austrian Ministry of Defence).

 * sshd(8): fix a number of cases where the minimum authentication
   delay was not being enforced. Reported by the Orange Cyberdefense
   Vulnerability Team.

 * ssh(1): fix a possible client-side use-after-free if the server
   changes its host key during a key reexchange. This was reported by
   Zhenpeng (Leo) Lin of Depthfirst.
[...]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 2d242b4a99..297e1c95a1 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.3
-sha256  56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4  openssh-10.3p1.tar.gz
+# From https://www.openssh.com/txt/release-10.4
+sha256  ef6026dd2aea8d56059638d5d3262902c892ceba9f88395835e0d06d3fb63238  openssh-10.4p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 8f46d886dc..2f3088defe 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 10.3
+OPENSSH_VERSION_MAJOR = 10.4
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
