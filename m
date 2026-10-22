Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D2D606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aE6PCnTM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 962F481757;
	Fri, 23 Oct 2026 12:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrZ2WUS-1HT5; Fri, 23 Oct 2026 12:32:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 78FF48174B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758768;
	b=bZ8A+lJ3B/EUZvF3SNNLMVFUROuEooQk13H8QasZFzsBumb3rI1Uk4jN+KUWn/NLP2Bh
	 67TAkVcx27cZu/ACrNEmEEI8eIUrBd81JEwiIx+y9av3TpsDRttykg9G4fIf+D2TipvZk
	 2nq7xqiCFnJghD7St2iezcz5KRNOKj21vGaT6LWsO+FAyhg3r1niKd+HOhWoiImFyliW2
	 /MrYMU5F/SVWse09SVhJwstQIoDMovMDZlsbdBvg33TGt8PHwmosJ31Cxo+4E3L+RPX52
	 1ZbhciYU3O5Ng8AEMJOx0cEtQ1dvaCFG3MQNzzKRQT3QVDmqhxhpbjQ6BZwCAg/O1ow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758768;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=cxaYJm6YxYhyUfT00KEy/jtiUY8D0hIDfioXfQvSZ14=;
	b=J4mHvOcVNobyayqL8oxwc6Ic7LNu/nIKDixXt4fr1/pOwq1iefRGl5D/9tzrZn/ANPEZ
	 QqP1h4dIp2uxkmIcSHxMK5p5TPNZ8TOPnXjTaFpY+xYvtipDFEnCfR/wPqKuCKAWvreGT
	 PTJUGzcR03/xvrR3sTqDW4/8mssuJRW5Xk3i1+IV25GW8hTTGmec4DeTxcPQAetz84nrW
	 Q/j+VjnEM2M3y1iJrkJE7c3osFVQViQIbiJ5nINpuheoNW3Noc3pvI1gzUfOzrSJ8Ytvt
	 +u0jGzkUS+bqaG1i2h0Hc1cWQ2c5FeS2iHsfViwhD/iN+4GYxts4Jecf6NNjoIknZzg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758768;
	bh=cxaYJm6YxYhyUfT00KEy/jtiUY8D0hIDfioXfQvSZ14=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aE6PCnTMwwY9Q6xHqiq5OGs0q7vkL2ynxHVqWhm+qsygLuzXJsC+tQqEC8aKreR36
	 Jr7f4cYtOjflkD8wMcay/89irCW30rXQaIujrjD5COupe9rkEPO9I9WmNBWuntJVh/
	 DI+1n7sns1UDu72AAM7h9bTmYl8sbU9MhFtgU1Q56E87zV7NAQiEnqt855SW8oCJOc
	 zsH7TIJsgHKA1RUrYK3SqUH6Biqt/zzzQBO3elg3PpLmUCIeBaHJgNpxD25Mu1ZqI1
	 p5MDDVtKCfesmTPVOiDxQ5aAOyit78pntxklh6t4sRNC5DGZBOjintLdhQ1fzH0QFR
	 VzIoGn+dBiPaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78FF48174B;
	Fri, 23 Oct 2026 12:32:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D58F212C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB77C40119
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tarM4kaNPu8X for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D51C6400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758727;
 b=ToAkBA+vMaPwe90TYimWN655F8m9HmyTRM6rY/lJwbunkAUm+cD2peKeHZ+h/gpzMXgp
 Gqm6ZI6VaeV2v6jRB2l7TvqpXw6QxRFQ7pOJLZAyW6JU80xLZBmq3ai3hG5i3FsRRwMfT
 d47eNnNWAFsSiqAMccIsm895aP808ivcc6YhQlluAynkTxUWBMLdxgrO0RmO+mDCgL4Mn
 oP8O8D9sI5vY81jlPnnCqjG6C7ovfaCVddQVMeSQdsqOF3gqSiKiH7PC6WrBjRqNNfu54
 ee4rq8yDXshi7fzLhHxuEwl0iuI1Nl7c4s0p45wISttNsrbtuCzruyTLjHJaEviWFqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758727;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=E+CofNNQxdkfChX2V8xCQcl1Iax+IKw0iaJ7Gxu9VHo=;
 b=SOI7b+GDnK7n3opAaMzqy52pxkQd22/kQqehXIuLPg/hDqjoynrbi+vM8aQa2z+Y6ADY
 krHfjL7QZXKeceuq8qxrL8nwOliDaIGi80o2eRwUeDy/k52iEpyYqHwBWC8zb466vylJG
 q2/4FkDAtZKYOBTfSY0T9zXRWVmBqN/5o0ZW+iqCQf84tpQOeOxM+1JVOxhXbHS5JzlnW
 PvppYpG75rkdQI0w88NzmIeytSWN3rbaX0/XcR0O3TFRjKgR+oivOmefo1JtI3GOs0mVz
 MPxyoSWfLmFaTkY4qoVsQikke7Yttb1unYaRRwvd+CDznzGRIojidJoltqen3bVMNOg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D51C6400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 689C09C669; Fri, 23 Oct 2026 12:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:29 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b100bc0a91aa656846e839a688f457ea7467f6f7
X-Git-Newrev: bf7b5b7ae1ada12b1ac9ab138da117e8b3b76863
X-Patchwork-Hint: ignore
Message-Id: <20261023123043.689C09C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/uboot-tools: fix
 target FIT signature support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8216251094754867790=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8216251094754867790==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf7b5b7ae1ada12b1ac9ab138da117e8b3b76863
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Commit 928cc5dc5cb82e6f2cb43f853488309eb806ef89 ("package/uboot-tools:
fix host FIT signature support") fixed building host-uboot-tools with
FIT signature support after upstream changes to the config included
since v2026.04, added to Buildroot with commit
e049f6fef1fd1e1b0b6095e0ff9113312a7d7f81 ("package/uboot-tools: bump
to version 2026.04"). This commit applies the same fixes to
configuration for target uboot-tools.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/uboot-tools/uboot-tools.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index b5924f6954..32fe9f1d7b 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -33,7 +33,10 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/generated
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
-	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_RSASSA_PSS 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >> $(@D)/include/generated/autoconf.h)
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
@@ -50,7 +53,7 @@ UBOOT_TOOLS_DEPENDENCIES += dtc
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_LIBCRYPTO=y CONFIG_FIT_SIGNATURE=y
 UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
 endif
 

--===============8216251094754867790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8216251094754867790==--
