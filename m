Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE7D606A325
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OGtppg+/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E47C8167E;
	Fri, 20 Nov 2026 10:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2d6aYsF_sCbd; Fri, 20 Nov 2026 10:25:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 920F2815FD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795170349;
	b=Re+SK2mGO7oPifZlFZlTr9+Cdm/FH/Aza0Gq9LDnsTsmq6lcUDvuOFZSgoC3o27BYfAv
	 aochQ75HZm1GaeQrL70d6Ao69FWZe82P20xe9568O3aJvD+QNeB9Kvuq79Xn/7SDDfcKo
	 PfcEqdh4mEIjq3XLJaClrAS/JZwKYuB78oXCXZH/qI/A7Wi2Zt+MXe9OzwXqQy6TbSe0m
	 r2IuiERp12doIW+QxJjadl7nt2GSaKM+W5g9nQ37qPu9VEQvocI9RJ6F5FWb2XyZRfey/
	 eIVubxtcbqxK9IHQxD/kJe3gaLMmU8tX+G/sflGrviz6TQ+fEtTz8EPU7GVLoGyBuew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795170349;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BRzNj2NA9vmbxVB4tX4prdy1pwsHDLJrpEOW8CF68oA=;
	b=LGyIxmQDNvwHCdsPOd4GzL4s5Xa77VBw7UEkrxBPjZX2dHCIKjcR0BkIj9TPaRE7OnBB
	 FqMnMf5seNy8rW5ftWIXqgzKF5PgyaK1Q8u+Xhx5tbr44207bkbT54MDsVHuHdxr/YIoW
	 pP7DsnTtUeN/+e4TazdNs+7eJdD4CP8BYj/YlKz9kGHGvbcU6RgRhSRQukaX77y0XB9NN
	 YIUWbC+s9OLepe1m5DNsDK74C+b7M0xsJW48gqKQttnlo7SyC9SeUuHHeSjXUAXj1r/73
	 bUHgjAMfBK+D8GVcnKUptEglH3rLT9CaA6rtxGTaHjjEQ7jUCLs44PCaebTK2TPSyIw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795170349;
	bh=BRzNj2NA9vmbxVB4tX4prdy1pwsHDLJrpEOW8CF68oA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=OGtppg+/Kk77brCBymGybOKEVAsMK65CnQx2QWwj2URkS3W/l3V/muCi5Psn416O8
	 S3HNGG3vJ31eC6t8sL9FevNlSngpUO+/5iV4Kkz7v4L0c8VTmZV0So56wa6ggCJ9vv
	 /bpLeMR0ROdGJq1SNfMEvNEKOcPW0aXFHFvZPpeL9bvS7KtlSOAH4HNCaEglgJoe6U
	 er0aLEDpX7xY5lsjxMC1JccfymXNou2IBZy/MMFHUtB3YfrvURoipI1/6tBg/YN9lP
	 KHTIgA0E1xPby2f1CC5qsjCi/PXruoV5/spUDUTe9IMkMISM3RcpLyt9V4PwEVBlqO
	 OdChDKnsyv6sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 920F2815FD;
	Fri, 20 Nov 2026 10:25:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 258C21C9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1739C40CE8
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mV8xAZmMfzuo for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:25:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D2BCF40A4B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2BCF40A4B
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:25:46 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795170344; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:Bm9SCvJxS6Mxv7FyQGfKgwxQ5rMh
 ATywyOqXds/+H041AO2o6mh5ezEBGBm6JYa70jnk7/aFsXL6lyQn2LC1ExUTUUsWG4stZmsNnEC
 NB00YBgleib5nGhC+YwQ6JeyevKaP/BIqaAsyFHt0eCt696lP/PKTgrSb0idy9KtyjVkqDYn8tq
 jfU/qPG1mk5S6xjvZzCHOeZC36nfSjzV72wzTji0oJrFxq/99eU26JQWJSDA3eUMmJOoqiOmVPe
 +EZDhbPcCOiS+hEJuNDEpjVMS5pF/A3CP5LTEFnMAYgwWFJjt5pPYhUOwBneFtZ2uYvVF0XhZoT
 +N3FHNcyvkyNoQ==;
Message-Instance: m=1; h=sha256: P+rLMdWO1wtcCfmNaaqsmmmEBLMOHlWn2xIdzXAKq2o=:
 uB0mZiDwKBTOhYex8kMyiJNE6z4RI/qf11HMRpbJ0Us=, sha512:
 xwK51ZiF9BU51Edf/t7HFNDrMULMMxNLwn3WNUDK039zzv3vU58rCELTEJl46HX6jpWAHP3WbiMzW2Kw9fAhNg==:
 Zn1P2Ho1e2ADEWTJ1wVl47GdyeYR8QBmuBNysTkpHtMi9jsgaNhQCHcuT/NV1u2pOmJaCnkTAmbkxXvqbYK6Tg==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAONX-1xg9Va3guB-006AMf; Fri, 20
 Nov 2026 11:25:38 +0100
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 20 Nov 2026 11:25:23 +0100
Message-ID: <20261120102523.543165-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:3ybBRK1xzMLbW8JU10fN2EJQSlwET6qEORSBcqWj9035WA86Jl0
 zdDPInqQWumaPCWpWHE04B5wZLeBOuQnH65BVp5nY7ywxbuPE2qY/ybfsU8gsS1AHWWBXLw
 N/uFSZGeYCR8GNpzbXRFfOLKnt/CIqlLL1F32Rv0D72ew/eJ2Rx/7DdOjtLdqzwnUK4zECd
 TPBwUat71Jg8I+g7kYVww==
UI-OutboundReport: notjunk:1;M01:P0:xaQLnA5eXI8=;rLjrgdebT057ViDQSXu8yjndYdl
 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
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix
 <pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS for host package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Host packages already default to using <pkg>_OVERRIDE_SRCDIR from the
matching target package. However, this did not apply to
<pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS. This meant the host package
might rsync files that should be excluded (typically build artifacts)
to the build directory, and users need to define both
<pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS and
HOST_<pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS to avoid that.

Fix that, so both <pkg>_OVERRIDE_SRCDIR and
<pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS are the same for target and
host package, unless different values are explicitly set for the host
package.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4e2ce2e7a0..c11afe1068 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -512,6 +512,9 @@ $(2)_HASH_FILES = \
 ifdef $(3)_OVERRIDE_SRCDIR
   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
 endif
+ifdef $(3)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS
+  $(2)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS ?= $$($(3)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS)
+endif
 
 $(2)_BASENAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
 $(2)_BASENAME_RAW = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
