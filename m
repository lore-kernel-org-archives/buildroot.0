Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5B4C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 11:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA3176068D;
	Tue, 22 Sep 2026 11:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXSLy7fNFmdC; Tue, 22 Sep 2026 11:46:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B8C2E60711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790077596;
	b=q9fl9soXgWm3rZ1N0Osv5E7Os+PQD1CyLvtqxIl7OQWnWmNsBNG+1D6BZm8LIUiVD0ns
	 TRlbMxpI4cMfSwZEWwediGeYjfIhfIGHvUkePN/rOcBcQyMh0j1AEPTAL1Xq0KBTZ0QlC
	 k05BtDxmiGAiqBgFI12lAZiCdtcsiZMRWL70yPkguxklsfuOfXX6GVrlvtfBrwIcYDOxQ
	 VeP6P7ukI1zuKZVMA39IvUf4la3xO/aKbX1u6frj9Z2NbFT4FmofbSgqcAmLxUzzUNElq
	 FdH3fAqRG7AdE+NRZ7f64Y6wQMSTQLTOZ/TtR+87bzMlqSXXQxCUngxgE9s361S250w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790077596;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=u8iqAL7DFCDcjgo4Ga6ZsU93pji+LBUYN5Keu6CR3ng=;
	b=gd6GM6zhpZZhbsbeal7r+rlnr28ZbIUMtNjvoLIdt78Jv41KA2kNd4EGKHygBb4bykza
	 U5wKtd0O4u+XDg9ZP4U8SVETVkOBQ24FtDJcLeOomryRmeYt21cE+Yq3m/uRJ7+GIPtY2
	 plQON0hTcBQkh7+NZU8BsKUokNVaR0nirs4Z5JllMAp0dlboD+IfBVfFhjQP/e3PdQFL4
	 CGcutRf9SLa7qlQiRRzfY9b2p8IKjT/InVAqLxyOpqZWoSZgYLN3LyYbEY77dPdpl1hce
	 Pi+4kEFx5RrfnedEFYOkGB02qQsJf03GHAjIn24z+zZ59YAGn7MdvFtD5NhZNtPGRAg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790077596;
	bh=u8iqAL7DFCDcjgo4Ga6ZsU93pji+LBUYN5Keu6CR3ng=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=SAmhH2uujtyQN+S0wO2DWtgACvoTq7EKmRLN14UfSt42Z7u7nvjrsYkTXyMPklWX5
	 1RfAXq0xhj56ak/F5xLGgyrOvqoSZQguKKDv09rUHW2Cm9SeazKv1VUk+RaEu6pDnb
	 eewqQP82T0/wqMkiqwWo/6lfrHT4VBMsLM9QTXZxXxmSCA7++oC8t+/9dGxRWsYPLb
	 LwPucsmRQWW0RvuAVfpBkPMaS90kXgfYVL9u98vz4wcpDHqt+qhEr7baH5bh2FZnYw
	 bVw/P8OnXmKPDt1K6DrMDIT2WpGvc0iBxki02NjRVLbd3m0trRKUakgTy5GEE9OyiS
	 7I0/OGTCHAGGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8C2E60711;
	Tue, 22 Sep 2026 11:46:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35DAA9D1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27873407B7
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usy7nlnK0FxL for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 11:46:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8779140778
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790077594;
 b=ryUSyrEyzn+eL28xJtxJAp1r5UbxVjARuVsemIw98RBZ411OX2NPfpGPvXPr6sCGfYzr
 zOrGf01EqdbqUnYLKE/par92oYvVihCOlgb7+jstSiR9beY1H7B2NThSjQ8EPVX3r07jb
 O2isLexhBfaa0f3ek0J6Zf7ESwwNLCFuqRmwDTYR/zOyyc6oM8lkpep1QSKDApCARY25P
 TezLWbn6xuEXiXrWzWlZpcP9EOEnHB5PPZbsfAtG9b5I3lhomC7p7DXLLbeUAA8GNZA2K
 NFSBwwMN2cTXr0aiH8Zv+n0+kMrxJh48v1ghrh1ZiEsl7hIGFM8wchhH5RjqloH1UIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790077594;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=mkm6yrKSBPTvEq3dgyqOkofdjE4i+rk94dAHDkVjAIM=;
 b=OpohDv2F/JVsRwcruL2nnNQz59ZwSOAU/1+sEADFONZ0GTbIw3u+4X1QvlYrIwX1ifjP
 wPXW6BDAEGrIuLaL+z/q+u/Ct3ZWU0INqXdO+I/KL1NK26LPHQrhC0I3HxWr3JUKw1cU6
 Ee7qnnmHkKg/zGsBn36NlxpS0nnOCuQU4go+CDamv5OU9RzO4wZw/5AUg+7B72ESeqdS1
 g4uLBV5lju5bRA62ya2HrGY3crn/pKdcEW/FnAByLPaYdniwIAmw2T06Wx5IIY8o38qx/
 v8tH3POwK5hmgs8i7smtPaBDxc/Kzvx6cZ1LOMeKwdw8XEvSz/3UEd0qz+MjO1IW7Vg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=D7BNF2uN; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8779140778
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8hV5-1x4sLf0iI5-006xGm; Tue, 22
 Sep 2026 13:46:30 +0200
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Tue, 22 Sep 2026 13:46:10 +0200
Message-ID: <20260922114613.805843-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:rcywYEubfEZa1mB6E0px8SlDAXOaaQ96EfBYujCDUtlF/EwA0az
 B9lQVRKnV8PafQ00gYQCB+YPdv1yj31EMC4MRfi9pEpBrdRnmQZgKyJ/ciiZCaTQ2VPi4y7
 iabMNbIpFIaOQ4DWd/ZRCt1t0yrDvljR3CtKyu5NI4bgswPUx8s56TbYP1tKN1GQhJoKdU3
 Gn1vdv7ze0k+uveyMP7ug==
UI-OutboundReport: notjunk:1;M01:P0:P4flTRKrbwM=;3wLpAIks2amOcVkVXutwxhfu8Mw
 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
Subject: [Buildroot] [PATCH v3 1/4] package/systemd: add ukify fix to find
 systemd-keyutil using --tools
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

The ukify command from host-systemd needs to be told where to search
for systemd-internal tools using the --tools option, because they are
installed in $(HOST_DIR)/lib/systemd/, not the default
/usr/lib/systemd/ location. Without that it will use tools from the
host system if available, or fail. However, ukify ignores options when
searching for systemd-keyutil, which is needed to create signed PCR
policies, e.g. with "ukify --pcr-private-key=...". Add an upstream
patch that fixes the issue.

The issue already existed in systemd when ukify was enabled for the
host build in 9668821a48d176d9b3373b7edd70846255a6c8a4, with systemd
version v257.10 [1].

[1] https://github.com/systemd/systemd/blob/v257.10/src/ukify/ukify.py#L1166

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
This is technically a standalone bugfix, and could be applied without
the rest of the series. I've included it here because without it the
expected PCR values provided by systemd-measure can't be signed.

Changes v2 -> v3:
* fix backport (patch didn't apply cleanly)

Changes v1 -> v2:
* patch added

 ...001-ukify-systemd-keyutil-tools-path.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/systemd/0001-ukify-systemd-keyutil-tools-path.patch

diff --git a/package/systemd/0001-ukify-systemd-keyutil-tools-path.patch b/package/systemd/0001-ukify-systemd-keyutil-tools-path.patch
new file mode 100644
index 0000000000..f5e75d7cd5
--- /dev/null
+++ b/package/systemd/0001-ukify-systemd-keyutil-tools-path.patch
@@ -0,0 +1,27 @@
+From 9d02f0d9a7cdf8bd7f05e2303f7b7784485ebee3 Mon Sep 17 00:00:00 2001
+From: xiahualiu <49677912+xiahualiu@users.noreply.github.com>
+Date: Tue, 14 Jul 2026 08:07:29 -0700
+Subject: [PATCH] Honor options when searching systemd-keyutil
+
+Options includes --tools, the directory in which to search internal tools.
+
+Upstream: https://github.com/systemd/systemd/commit/9d02f0d9a7cdf8bd7f05e2303f7b7784485ebee3
+[Fiona: rewrite commit message for clarity, backport to v258.7]
+Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
+---
+ src/ukify/ukify.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ukify/ukify.py b/src/ukify/ukify.py
+index da156d31b3a9..e6f35ee86bab 100755
+--- a/src/ukify/ukify.py
++++ b/src/ukify/ukify.py
+@@ -1374,7 +1374,7 @@ def make_uki(opts: UkifyConfig) -> None:
+ 
+     pcrpkey: Union[bytes, Path, None] = opts.pcrpkey
+     if pcrpkey is None:
+-        keyutil_tool = find_tool('systemd-keyutil', '/usr/lib/systemd/systemd-keyutil')
++        keyutil_tool = find_tool('systemd-keyutil', '/usr/lib/systemd/systemd-keyutil', opts=opts)
+         cmd = [keyutil_tool, 'public']
+ 
+         if opts.pcr_public_keys and len(opts.pcr_public_keys) == 1:
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
