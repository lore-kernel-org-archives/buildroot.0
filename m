Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047B7606A31A
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CKWPEqFY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D76F14060A;
	Mon, 19 Oct 2026 17:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwNCT_oGHL1Q; Mon, 19 Oct 2026 17:47:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EBC5D4062E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792432040;
	b=o4OioJMthuOap3hHvDqhaCJOK3Hq2QCB4tUGCSrKIKDhIAv4Q9Zg2RDkD6BIPtkd0xHt
	 S3lz3NcMIXn6CEL7xu9VpohKJglVN9mXS6Mg9Cq4dVOvUlwPTbmrx0EF+ZaScldb8tuU7
	 55Hwe5X4dcHbRaNUO2iCzNwHauFyRdge8BVJL7sxz1rnktpKZWf4pEF74Z1XNgsMEMXHd
	 2Ef+4R9JN17gaOStJQTozzY0nmFixmGLewUN/oEadWz8q8cQeCdZDvkHcraa/5xu6bQRr
	 f4mduic5PnznYHK/l5G66/nw59LzOr8SzHvsBI5PU3qTLesuI37PkWl7WyO/OuIrNjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792432040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tVkzbl4B5KrTd6rgBwMBZqy++pJSp1OSkFcLj1edRXc=;
	b=aaE/WHBQsdrRfso5s2lLdTcxOJ5LHB6mHS5Fo35a2WctuQGN0xDPcTEthvrkgDNW06Oc
	 RuL6gnbvm/R8DTzDlMHp9cH+jFmbNwtqfSmqUptq88vVeMG5YoK0lt8QgQ7G41A1MM2pw
	 0y6IwKhapkcPvgM9cxmYgxze/yJHGXrV/wKR1/Sadkc5gqcJLjunxG+REq2pUVNHJ/1vg
	 HUS1SvPFk+Wm0b0RjFQXwuURMMpYuXXbTYP3DV5Khbm9P93IS009Dwu5/C5ucuFp3lFi7
	 g9u5bD8addwpIdVBjcP/jEfoGy11xheCV4EA+L6ztJXNMetxRUkwredbYCdVK73w+ig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792432040;
	bh=tVkzbl4B5KrTd6rgBwMBZqy++pJSp1OSkFcLj1edRXc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CKWPEqFYKiLfuu5d0tVAFI8KmlaKPtOl/tPdBaZo6aXK1qgXzsnTOQBN5Gfjp8SQg
	 xX6NLqaVc2O2x7g9gVyIVFv2PYhJGpgCqN3ItJm3nofex/gLhj60+wXUmr34Sh0KaY
	 Ld7rlfEh+TnIs11ueDQe2Du1ADc5w8Hyn4v6aS2vqMfEWLckV72Jkv0tbwdgqSa3+U
	 IB53AuRtoGKE4gp4pzMoT01nrdozeNnYhm2067EI+Ng4EWVlDPk2wnycL9CFURM6CJ
	 RCCBh5K4LXQqgTKXsgPmKZuXsj1/AZcOYmq8bqeaP5EhQOyvaVcSxQLni2xK4qpExe
	 LfC3OLrqZqfKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBC5D4062E;
	Mon, 19 Oct 2026 17:47:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EAB92279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D062E400B4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsFB6m9XsWjf for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:47:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1FCE64008C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792432037;
 b=s0r71A+tQIPzLHZJj/b+hUyXNLoa6NZLdGnPPJ8vjrTe0IleodQWlaZNV3XO3Cg2sKJz
 R8PrH2BqsV+/XnK+Fut6MPNwQHcnItxbD7apDzYVI2remw8kNKbRBH6+P4SSHFmfobcGD
 JWFwFtv2SUy2udv0FYhOuZZfl5HrK/BDe2AkE2WWEVe22xEL7MqBiQ0cn+ixkLFCFXpuk
 XeOKwgI6DO4/hpbOgFCFfVMzFpQni9I3132mDAWtknjKCvS1loGFd4ALrJ/tVepWp0McZ
 sE0XWdDmfLIkcENwrl6mKHgZP2QowUjf4n4nQShwsjPM9koXF9UcqOE8Nh1mHjhzBaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792432037;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7k3YgbweedfeL4X2h+ns8eMx62MAcUDLn87SKytWSXM=;
 b=lcB/si0CE0ZYcYbISQXg46+xHMdhToWE43rojiYu3fOqcps3TVuTLu/d+KFU3IxC90tA
 +9Sw2emXg/xZD165W4v6mDvRCQbOkkY43DDrTo/OxoIaBUr6xCJjiDHjo8XQnXwimuBPI
 VPcnRr8q84Ukkyx1jVlClcwDyabrMsvuE+1CcHGf5dz37C/lCQlDxSIR8ctRcL2W1/q/y
 ThHgg6Gs+U/QB9vog8mmXYcw7fMhE3UdfLIfi3PZrPW+XEpwfhfX6ks+dhF+SXaRavTvn
 MXnVbYBhcFmNsgaDBzcn1Ge62wblsanfXmVMmQLLCRf1w6182ytdlAxvodjxFXwVOmw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FCE64008C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:47:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CA839933F; Mon, 19 Oct 2026 17:45:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:47:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79ab24a7e4414f7a23d6e8106fabb2867f9b0bf5
X-Git-Newrev: 4eeec84c3341715e0436e40f94b31379f227000f
X-Patchwork-Hint: ignore
Message-Id: <20261019174554.5CA839933F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsnmp: add option for a
 read-only agent
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4eeec84c3341715e0436e40f94b31379f227000f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

net-snmp can be built with --enable-read-only, which removes all SET
support from the agent.  For a device that is only ever polled this is
a stronger guarantee than withholding write access through VACM, since
a mistake in the access control configuration can no longer result in a
writable agent.

The client applications are unaffected.  Default off, so existing
configurations build as before.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsnmp/Config.in  | 12 ++++++++++++
 package/netsnmp/netsnmp.mk |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index dff0f18bee..9a740c2db2 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -43,6 +43,18 @@ config BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES
 	help
 	  Specify which MIB modules to exclude.
 
+config BR2_PACKAGE_NETSNMP_ENABLE_READ_ONLY
+	bool "Read-only agent"
+	depends on BR2_PACKAGE_NETSNMP_SERVER
+	help
+	  Remove all SET support from the agent, so it can be queried
+	  but never written to. Access control still needs to be
+	  configured, but a mistake there can no longer result in a
+	  writable agent.
+
+	  The client applications are unaffected, snmpset is still
+	  built when clients are enabled.
+
 config BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING
 	bool "Enable debugging code"
 	help
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 55e5997734..18b5ac36e1 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -96,6 +96,10 @@ NETSNMP_CONF_OPTS += --disable-mib-loading
 NETSNMP_CONF_OPTS += --disable-mibs
 endif
 
+ifeq ($(BR2_PACKAGE_NETSNMP_ENABLE_READ_ONLY),y)
+NETSNMP_CONF_OPTS += --enable-read-only
+endif
+
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
 NETSNMP_CONF_OPTS += --disable-debugging
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
