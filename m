Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0964606A31E
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WSztoHT+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82EBD4061F;
	Mon, 26 Oct 2026 19:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6s6NL8JnHgDn; Mon, 26 Oct 2026 19:45:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A0FF440602
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793043917;
	b=p4KcwOrS/Z4R3bREa7LTUh/V+Dy+S8iSA1blNwPbmCsACNp7tDQETjlhAVQJdkZ4Rrcy
	 kDFDCkgjTuIiF7kZ6PhE0BKMNruH2P3YeRay6Mklk9nOKsscvYnOw39b6IaLYGzBKCFhH
	 OAOGD1+m6rfawjFNFOKh2lkdKS78vAeTmuZ+rpCvu2i4fQRxg58S4NoFnRDAV0wYjaP4b
	 qhhwRpNXFHlNXO4ooOuwTSvdHMx8Llzxyt1h8b3CM8NvvmnV/Jg62znMrrapp26FxKvFp
	 cdvdzRjQRwPzy9X0Owmq1q7G+l+Glf6PqSg2k4uH1bYwGcDvlrUN+qMER5qrk8C0hbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793043917;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZHlE8+53MoH3ZKgu05gZtrPmqCMD8txaLbtsrERA8DA=;
	b=nSz8dAFe+iIIfOwwPfdcx/ArOlebSbcAQEfSvkCABjY0B5Npv2knB0rMt73c9hNVGDgD
	 L5uPD/NeKifg+6gBXi/t182G+kqhayTk22v6wflXZFWfOYKbpjWB/Sqvl1JXGbw4X8L5V
	 2wUJOgiDR+fawHeQ6CZhO6pZCCNoovSgboYf+Ksmt1jTe8aga6ESXxsg6K/J77n4vm2Jt
	 ky9Yds1kUIQVSKIYZCYlyPT4YGgJuiga/uROcUlEHymX1zIoCP0QGyQ/plMR66GcXtEDC
	 M2jQ68dF5D9gIWCTVZA69MKvrOwXt6bPDHYpebDNMljr5eb8rZYXz3EV1RBKGVozxPw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793043917;
	bh=ZHlE8+53MoH3ZKgu05gZtrPmqCMD8txaLbtsrERA8DA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WSztoHT+DFEW9UD1z9bTeZaGG+21nitk+Isr7SuJdGT/986PsafF4Ztp9D7slS9Qj
	 M0Co4MBYiXNrIEOueOViXqFsFlWZeYS7TuK8UlAZfXzVSpy67cLl7OHsVCdQdRbBrM
	 jwDMVDG7AHoBl3jdr/VCg2QucmDPaA7407chYYWCqqaG6GOFTv4xAxETi1pKUBur2o
	 Ha//5QIYmU6gSTtC2dwSruNkbJXzuuhuKa9+R4IU9fo15X4wSQT2JiijjtK58LtQuu
	 uzOU2buteC72C4AXDZEYpYaYhA4D/Vs9yq1sziQsEewwcFbTVE8evnUk+9NLo3JTau
	 PfRdeXb7yCXbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0FF440602;
	Mon, 26 Oct 2026 19:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E99F9D33
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF03440602
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hPqGyUjhnUl for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:45:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D28E8405B7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793043914;
 b=E4xurmkI4rGWatAxxqWD6ZfFhNcD2sA8dwzP2Ggg18w3S7nixUvbQK1sgNwX6CegOSB4
 sRsqnwqfl02QVV0Z+wBfDiKQz7y5zg+plXbSZU41M43t7E/RNSRWqFd5CHJgIrOXKYr94
 OEyNVeQlIhxtlKfZEHZez24vbq1UIiFj6giyCcnKYoeHyU9XT+CyZczNRyUA2k0CchjQZ
 BH+BpyWIAYwR1fZb33pKYpMXwhKSEbImM+eMvHm6+Ri8HhLNZH8Mcx++2u1ObAZm6Iq4c
 Itd1/7+EK6npD4M/Uk327nGqV1st841ckjNcIoirr9GjW3HDkiTwh2sVlxBrrRPA3vw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793043914;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fG9LU71ixL6fzEr+2V4gKKCuvVovvvnSCsfkioN5+6I=;
 b=Cl82RYF+BuswlCHyj0sT+ndBqbbPxC2vTOdEtX+aUTXCDtPwI1qld8x2UG99ZM84psXO
 VQay0v0g2J8hF1O2BNeMicLZ30+dfgOrLk3w/wvvNRlHwfwrelP8PXR0cXXtfcxMj8Ssm
 8ebMNuBflp3EKAgr2CLOCi7Xh0Zs/hR0HG7WuSoPwTQpT29v8Jn91YuLBXeGYYzVySNL8
 ak8SIit2ufgZoigspuM34Ng+wLcfeDJQ7eybsk+1nVLl+U/tvJ40j0TK/8n/auRaqb1Wr
 6kD+iONRvpQ5goGmHL8igkuGHjQsC7gCgaOYSNJ/RH7ReJECvmZabkqy8K0iktu8Agg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D28E8405B7
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:45:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABFC49CFC5; Mon, 26 Oct 2026 19:43:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 20:33:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00ed3e8ae8acdf197ce25680ce8ed2c5399f5b05
X-Git-Newrev: 1b9281e4a6b7ffba56569ff6166b58d7becd9f8c
X-Patchwork-Hint: ignore
Message-Id: <20261026194348.ABFC49CFC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/trace-cmd: bump to version 3.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b9281e4a6b7ffba56569ff6166b58d7becd9f8c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/tag/?h=trace-cmd-v3.4

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index fa61654fd5..ee63bdc55e 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8ed41f61010998e4a1ba54778f9077ee7afb5311d38dca9781d7a397dd70c9d4  trace-cmd-v3.3.3.tar.gz
+sha256  604085ab395cc2cb84397dc3d209ea0d0b15ae506f8ea91ff45c86e5a050213c  trace-cmd-v3.4.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index a1b17289cd..f976176a5b 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 3.3.3
+TRACE_CMD_VERSION = 3.4
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
