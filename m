Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93129D43344
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74F7082356;
	Thu, 11 Dec 2025 19:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iD0pwKF9iB9z; Thu, 11 Dec 2025 19:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1AD280EBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481272;
	bh=tZQOzSA4MRHFy0ezNijaxP9f4/CCvgdM3FoXYaJMEvo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oybE9JAEPV+izvFokT2j8+Y2wIheRg9iWhW5td+R45/w1z2GHhv+CTsMnEFb9usZ1
	 BPfGyO7KGgW2Zc5dZBr36LgwJIowvy729TkP/9IFV4bNkCviUqE7++B1e763Wti5e2
	 dGm5UtMwaCzmls4jyKx7ms04xxdEVEvYG/S/o0Duub3q+uLFVLU6rPXMQVTAGIGg7k
	 fElhWNjavUu7y89HoNuBHMPQjeOCOThjIPHWOvQyo3yhhUiywQ/HKJ/YoPgZmMBLzf
	 4O8tJMkvYCL3vTWI4BazcIE4oHzHa5gs0YPexTe6v1ZRPgOYy2pEaL1NK8xkbUA3JW
	 wF8z0bqqVdE5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1AD280EBF;
	Thu, 11 Dec 2025 19:27:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFDD92EB
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEFDD6073D
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AG4HZqxPo4G for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDC726073C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDC726073C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCCFD86B4C; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:21:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 46a80aa07a56e369d6a7fd7bc7666eae9aa70e88
X-Git-Newrev: 35cd5eb4abff18924da64caf20358b1b36c8435d
X-Patchwork-Hint: ignore
Message-Id: <20251211192746.DCCFD86B4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/softhsm2: update
 SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=35cd5eb4abff18924da64caf20358b1b36c8435d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Original site is down, unchanged tarball can be downloaded from github.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dd2b3607940123a3aa1ab870e55021f454d19fec)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/softhsm2/softhsm2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
index 5e37e42dde..ae44b93bc4 100644
--- a/package/softhsm2/softhsm2.mk
+++ b/package/softhsm2/softhsm2.mk
@@ -6,7 +6,7 @@
 
 SOFTHSM2_VERSION = 2.6.1
 SOFTHSM2_SOURCE = softhsm-$(SOFTHSM2_VERSION).tar.gz
-SOFTHSM2_SITE = https://dist.opendnssec.org/source
+SOFTHSM2_SITE = https://github.com/opendnssec/opendnssec/releases/download/2.1.14
 SOFTHSM2_LICENSE = BSD-2-Clause
 SOFTHSM2_LICENSE_FILES = LICENSE
 SOFTHSM2_DEPENDENCIES = openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
