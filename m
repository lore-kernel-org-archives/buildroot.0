Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FF6606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XUGDZsOt
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43EA660744;
	Thu, 29 Oct 2026 16:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1GXfmqdZXhc; Thu, 29 Oct 2026 16:43:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D12B560709
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793292205;
	b=NdCyfVVQsfcfwGVoljN1oHLYpR54gUiIOhHFl75X6ZJnKXevmLl3jankzLKH825+szAj
	 s+xl4oilGy4PrecyTma7teBmoYi9PmDgMSU2jSD4hnqOZ0OPzrrDQzOZTR1EnuSd4OYiH
	 LlBRApU4wWa6joGFvKn3OChFnYO9/bNGBiKSk7yeJb8rMunJkMQFcbP8SU9PVrDxA18ID
	 7xJqQoJaOb51a8nRKcJ6VDkwua8HJqz31PFf+rajOMKMmox7BTS16BsFolTdHrXYfOk6e
	 1aBIou8hEFoaVGPnfyMvhU89/wg4dU1hWQ4nmlqFsQyJ9gZmDfOlpjVKBX7iw5Ez33Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793292205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Date:To:Cc:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7EbT/Rz2fM+Mk8fTWaCt6MLLt+gPS8FQdwLFJB10ce0=;
	b=F7Th7KabhwyOxDKZpzrsiNtddaTzgfRcSAGNRwP0VwXxkuI7N+1aZNAvx2duEXqB46pm
	 Hehy0oh+a0IgvvBF7IMxoSpOdqLClgfrlufgnhd7EIT++Gke3wQXjw81C5NzeKAgSZ0rE
	 JvgIg1l8++32jwiqJrhqPxZBiinngTn1BzG8dGTx42Iq00SOHMRWO0joUg5HTsQpWqiCf
	 cUPr9f3ccJbxNGzKY9tzA3SWZGGz80Ofgfie/Hv35hTlI3sldmH/BzAQVXjaq1khHEaT3
	 HvH4yz3g8C0zRPml4QlCmSXoa571pN/vPCgcAZ528D5VZ+5qmOaxhkcUscYHFOjDMGw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793292205;
	bh=7EbT/Rz2fM+Mk8fTWaCt6MLLt+gPS8FQdwLFJB10ce0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XUGDZsOt/pz019ybKsOAI7sP5MEowgMe3GvhOZQ6nD5KR+1DDH5XLU4aEG88TzwBj
	 o4hx7R+hPWLythDMm9i4DR0cnYZV6ARIr+MUohcwGOeqth5BuzaAFMqp3Vihvl39Z/
	 Q+7LPh6bP4X1ROyPLfGgJPkKMSZlKGGYXa9b2qukd4NeYAqunw7tgGg5G7YA7Zqiq0
	 v1IF2eBPYg0uH0PJoQsdnuaZUHVv395y31xH80p5t039jrfR9m0P8fh12pFJTbw+lU
	 oO20q/rJVo4/2JUaqjTlpEULK3BAGEpj+uhJ0PMdOkAwtn2YyrbjBLBmkwwZLr48b8
	 55otYww8vksVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D12B560709;
	Thu, 29 Oct 2026 16:43:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCEC4380
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEAF680BF7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTR2RxQgD_tW for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 16:43:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 31AF780BD7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793292203;
 b=PdZihEBkIBUQ5qxYtcQhcuH6QupZaPh3yz3cJIWHlTl4A6zOYepp9EpeBcAEWeIW82Pc
 ivqDG9qubxQO8oBB5Br4XXBnzxfXevIKSQfhHiKXRuraBNGCRGh9XRKRS1przXXyRZf49
 KrsaT1qQNs7R5/8EQqyt19yJb3PJ5OjRLsB8PHDmqJZPj0Cpb3TjrBC8CCBKPtmkm5srl
 FQHWhx5bSqHjybSHPYxT8c4nV3W2bSkwUiKGEhX5o+u+E2wIwDeZNZrKwJAhBpKi25k+r
 YzOkxbJwP7zd/23TUvRrRIs+CyuAtpMyxw87zrhxBoQO9XvdI8BeTCMFlp6UFvwvWCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793292203;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
 Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
 UI-OutboundReport;
 bh=iQA63AeVqgayhqSTL+eMB9JpwkgXB55YtmQ8LPfzjEA=;
 b=HHDVYfdAQmFk3+CBhjL7FtpScAsONiLjqdWnHH1RdXPs2kHypc2yR/1AFPha1t9q3sO3
 GFf80VBerpcaxROU5o8ZVEoh+yAs7/1/cqtHY5EzxZXqDlGU7WTR8j41PoEHXvsFrnQ6o
 onqkGW/DHEEYAPrmzeML6tKXP6Ogzfo8rywE9kNzQzmVgpG/j9B2SEKyd14zOCDRNZPsf
 lZRnP0vNio23s3rSCQ5VGHFnRBGJV8Khf0iefQYclXL+1oegQg+z6d75CwTCnZOAeIK/T
 iVSX7wFQ0sCsSxBsBCOMvlW1IehK0aHpVabw5AqTQj/VN5iOXsgoYogz5tK+c/MUy9w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=VHhsbm1z; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31AF780BD7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:43:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1Ygt-1xNqnT1l1P-005bqO; Thu, 29
 Oct 2026 17:43:20 +0100
Date: Thu, 29 Oct 2026 17:43:19 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20261029174319.15472f34@pc-1>
In-Reply-To: <b7b835979b3c6f9caad24d9050257e21@free.fr>
References: <20261027194859.2166161-1-ps.report@gmx.net>
 <b7b835979b3c6f9caad24d9050257e21@free.fr>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:RlypvPq/3iu0FpqiXMLEXnO92fMmi0CcuqwXcGBcDRcZE7PFixj
 kwP5kNFehfAqtYO/Es9h/Wl59L9y92fTmaqzXZKP4gd1wrc4HUzMuD+F1tCJ8pcAGCQQ1Ou
 TWmvOLj6Ok5nCle5eNeHa/WwBLsn0c/wUrYAwXQMO3DivghXRrpjXNjCwpNjoaVNLdCuTM0
 T+LXK2leoLuNIc8gq1yHQ==
UI-OutboundReport: notjunk:1;M01:P0:jrtdmszegXw=;o+6tA4yHmDdIswl6N8YDRTdz+in
 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
Subject: Re: [Buildroot] [PATCH v1] package/libressl: bump version to 4.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Julien,

On Wed, 28 Oct 2026 21:07:26 +0100, Julien Olivain <ju.o@free.fr> wrote:

> Hi Peter,
> 
> Thanks for the patch.
> 
> On 27/10/2026 20:48, Peter Seiderer via buildroot wrote:
> > - bump version to 4.4.0 (for details see [1])
> > 
> > [1] 
> > https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.4.0-relnotes.txt
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/libressl/libressl.hash | 2 +-
> >  package/libressl/libressl.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/libressl/libressl.hash 
> > b/package/libressl/libressl.hash
> > index b64df284fc..e3978baa63 100644
> > --- a/package/libressl/libressl.hash
> > +++ b/package/libressl/libressl.hash
> > @@ -1,4 +1,4 @@
> >  # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> > -sha256  
> > 57c8b2f8c6f9505587abaeddab003ea243d615edb7ed71957968121fc6316bd6  
> > libressl-4.3.4.tar.gz
> > +sha256  
> > 7d02522ad5070b9adb32eb253ecabce181184a3750cf65abac0675ee908687c1  
> > libressl-4.4.0.tar.gz
> >  # Locally computed
> >  sha256  
> > 9853507b8821c3f277aa60bf554eade41441ef06b2df538d247183ad28789b7f  
> > COPYING
> > diff --git a/package/libressl/libressl.mk 
> > b/package/libressl/libressl.mk
> > index 6d6de78213..82de944fa5 100644
> > --- a/package/libressl/libressl.mk
> > +++ b/package/libressl/libressl.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  
> > ################################################################################
> > 
> > -LIBRESSL_VERSION = 4.3.4
> > +LIBRESSL_VERSION = 4.4.0  
> 
> This new version is introducing build failures. See:
> https://gitlab.com/jolivain/buildroot/-/pipelines/3000952124

The
  bootlin-x86-i686-musl
  br-arm-basic
  br-arm-full-static

ones can be fixed by:

  # Avoid linking problem: "undefined reference to `__stack_chk_fail_local'"
  ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
  LIBRESSL_CONF_OPTS += -DENABLE_HARDENING=ON
  else
  LIBRESSL_CONF_OPTS += -DENABLE_HARDENING=OFF
  endif

The bootlin-aarch64-glibc-old one by:
  
  LIBRESSL_CONF_OPTS += -DENABLE_ASM=OFF

The error log is:

  bootlin-aarch64-glibc-old/build/libressl-4.4.0/crypto/sha/sha1_aarch64_ce.S: Assembler messages:
  build/libressl-4.4.0/crypto/sha/sha1_aarch64_ce.S:105: Error: unknown architectural extension `sha2'
  bootlin-aarch64-glibc-old/build/libressl-4.4.0/crypto/sha/sha1_aarch64_ce.S:156: Error: selected processor does not support `sha1c q18,s19,v28.4s'
  [...]

But not sure which dependency (gcc-version, binutils-version,
target-cpu architecture) to add for this...

Regards,
Peter

> 
> For reference, the previous version is building correctly:
> https://gitlab.com/jolivain/buildroot/-/pipelines/3000975082
> 
> >  LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
> >  LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original 
> > OpenSSL code)
> >  LIBRESSL_LICENSE_FILES = COPYING
> > --
> > 2.56.0  
> 
> Could you have a look, please?
> 
> Best regards,
> 
> Julien.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
