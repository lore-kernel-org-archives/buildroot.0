Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A66606A32D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fB8LX3RE
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F8140B82;
	Fri, 30 Oct 2026 14:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7S6nmXgB4zD; Fri, 30 Oct 2026 14:06:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B877640B66
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369200;
	b=MCNqoSgX+//mmrP9gaDlId8yXj++f/13Yb8mdbzxFfJ9DlY0YXvgsmMC3yvqArJVnYjY
	 MUz/PYmsA2d0iup1kkzNnZpxHDF2LuipY9V7SeJ2Pm9aRTLeIF4e1VJ4+puMNWvg/954H
	 dTBK/D89g+y1VJx3Vhq+A7KEQ6tggeaQfF5Fz83yIXIVNbwCmD5pMbi+9Kztj83+X6hGJ
	 /0Q2xlMZQn63xh/kc5/n6WZO3/yJRb02MhjeKgPrMmBsio79YJHJt2RCXEguN/9ejD/YH
	 tsC0Loax8RIrpr6hY/teI8dY01sYHagR5LHuhFKS95qBkWwBudwgniibqzKHpNWJfJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=bLaSeNy+B4D3uvi8dujWP8l7IYwGP6sTlQmL2rWk2wk=;
	b=FNlQe4VIQpja0RwAjDzSFYfpcDw0epcQHt4Pp0U7vm7EtcPUNg6th6fWyzrSmuZ11Ej1
	 SuvJmRVcyM8pa+seDYhO2tPvJv8iLeUNrF87H9juDnkY2LlOU+/bKyOpfOfPbzUucgC8D
	 fzYHnae81Ad/h5n9/NpmcgldqFy26kxNxXc7HLLWjOSF6ONUyTbsWprPqnICEiq6SbMFW
	 pdN6Ld7WxESnUn+BmbP8x2tGagTK5n7WLwtH5UervjbTFh+B0EBTldvmVMrBDcTVRuqIx
	 iZ+AnlUApH4NkzZ8xB0YvKTQUKLOiUP+DxcYZMD95jlq9BNXPGP6WPg8LxrxMqV65+g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369200;
	bh=bLaSeNy+B4D3uvi8dujWP8l7IYwGP6sTlQmL2rWk2wk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fB8LX3REorMxeefChcauxSL7UAm6xwd+v/dK/gA0G6kWaxiZD0vwCzkUgf5p/wgtW
	 0yZbuSTct11rbt2zPkbb456GaR4/BtVtXhVHM/96Nfgpk0xhGmbsTZtuLG5OvWB7A1
	 JfG43+I/KHYsPaTkMKHf3+oFBzEB12GeGYzI8WwLt+eZPJRD3+QIAs5R2iwuqwZgOd
	 6eiY98/HJzeq89+4ljZGSlM79+NrOS4Qvn+0iK1wTr+ZhOb4fmIuYCa3wqc1yqqZG8
	 3gzN3jgfaIUOvtsPLC4YW39hqpMPnSpXHqu9sYDn0lWRRemJRQiySxiqIlg/aKgX0w
	 ZnfBRSgbctAyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B877640B66;
	Fri, 30 Oct 2026 14:06:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9D2FD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA5FE40B18
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cm-tsU9adBp for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 032E740AFD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369159;
 b=Jv6ajrnMpveY4bkGkbjscsKj096n00yjYcUNQgy5OCK7IKjDnYZQG5E0TBTrsp1jBklT
 a4vE3KIaZYHRreRDTecoqy7G2bKbaC+jCCVobfFaUA2/KehA8vJpGNIOYfseaMIRvLM5D
 +hX+Ld7Vj06Q+afHHhoWKomlK5lMC/yXM2gX3RdzHIwV9tfwxwWZptAmehU0CYaED9pBr
 DHvdbwDIQKHSBG33MRw7KIVshTM/vkz57DIOtXg7KVkQkktZXRBvycHXGbsFFcyiva4fY
 vm2dBb3xlEVYnv9JUUKbjEB3kGffw8xHHubpqSxB0Yj+1+FHmSkY596uVR+zuDeLbgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369159;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gbF1FCfoEqeMyelUUNuJk1tG6K/P6QKvM8FsyrErocU=;
 b=lOiwY45KD9HxHmn3I5xxBl2i7eGoVoSTWdPmb7MrgcZns3IpX+RlBFHYmj2KVqB0SWkm
 dzIwjOOsF/GdRdlasIjcMsZhxWwvsU3XNVq4gN958ZzEmT2buDALkyL7VUwV2AlDokXVa
 4hRMWx9U8WM23z2oy5XXgi/k5I9YP8I1sSDWKDCZ0MOm+7OTgQr8+CbUomsnsjjnKGsAt
 fBeQA596F8llD8uyFfiJSIEUO2+Iq/DfRIyIiaHkN3HIPIqZA8p68gEhL3P00IiEDSOod
 BHuiaSSOdEasV8/hD7WzfKWbBto+2BDNNHJhcfUWVlJMQIk6chprusRFh+kKhz3GQzA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 032E740AFD
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 227A59D388; Fri, 30 Oct 2026 14:04:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 64a251de22022e35515f72e277fb89f5f6a2c9ac
X-Git-Newrev: 973fb2ead89f9bbf24ea7b7ff79039716db71488
X-Patchwork-Hint: ignore
Message-Id: <20261030140431.227A59D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gauche: disable
 TLS support in host-gauche
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
Content-Type: multipart/mixed; boundary="===============4727232421240135887=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4727232421240135887==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/973fb2ead89f9bbf24ea7b7ff79039716db71488
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

host-gauche fails to build on build machines that have mbedtls 4.x
installed, e.g. Arch Linux:

  checking for mbedtls/version.h... yes
  ...
             tls/ssl: mbedtls
  ...
  ./tls-mbed.c:41:10: fatal error: mbedtls/ctr_drbg.h: No such file or directory
     41 | #include <mbedtls/ctr_drbg.h>
        |          ^~~~~~~~~~~~~~~~~~~~

Since version 0.9.6, Gauche's configure enables mbedtls support by
default whenever it finds mbedtls on the system. For host-gauche, this
means the mbedtls of the build machine is used, and mbedtls 4.x no
longer provides mbedtls/ctr_drbg.h, which Gauche 0.9.12 needs.

host-gauche only provides the gosh interpreter used to build the target
gauche, so it doesn't need TLS support at all. Pass --with-tls=no to
not depend on whatever mbedtls the build machine has.

This issue has been present since commit 73e836e13982 ("package/gauche:
bump to version 0.9.8"), which bumped Gauche from 0.9.5 (no mbedtls
support) and thereby made host-gauche auto-detect the build machine's
mbedtls. It therefore affects 2019.11 and later, including all
maintained branches.

Fixes:
https://autobuild.buildroot.org/results/14af1c847c09fd8df35c8923194c75931d8a568d

Fixes: 73e836e1398293abc1ec2b4297e1e680d2b29e32 ("package/gauche: bump to version 0.9.8")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 333517125c1ae1798a39415292f1d242bf3f598c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gauche/gauche.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index b635c488fe..c63a663ddd 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -11,7 +11,10 @@ GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
 
-HOST_GAUCHE_CONF_OPTS = --without-zlib
+# host-gauche is only used to build the target gauche, so it doesn't
+# need TLS support. Disable it so that configure doesn't pick up an
+# incompatible mbedtls from the build machine.
+HOST_GAUCHE_CONF_OPTS = --without-zlib --with-tls=no
 GAUCHE_CONF_OPTS = --with-libatomic-ops=none
 
 # Enable embedded axTLS

--===============4727232421240135887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4727232421240135887==--
