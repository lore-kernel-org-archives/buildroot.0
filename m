Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10365C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD75B61145;
	Wed,  8 Feb 2023 16:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD75B61145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mR22GM51WvE; Wed,  8 Feb 2023 16:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE4A96113C;
	Wed,  8 Feb 2023 16:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE4A96113C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6311BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5894061136
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5894061136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5oPsn5gVMUwE for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:43:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC0A861142
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC0A861142
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:43:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0DA9720008;
 Wed,  8 Feb 2023 16:43:05 +0000 (UTC)
Date: Wed, 8 Feb 2023 17:43:05 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230208174305.1af25bae@windsurf>
In-Reply-To: <20230208162534.28581-1-ps.report@gmx.net>
References: <20230208162534.28581-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675874586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ah8q7nG97Vq9Oi/37ri8hWLDN0eMSyMQSGwMuJNzvk=;
 b=QPq51mGHgUS7Y3FjkuXQ2W7uLXXh5bBipeglP6fSBj1VE9HW3IONInzRoETK2g8hVLDl4p
 6m3crzWfdQRmgdratmBJUncr88bGQaeyZyxWh96/g7RHdb72B0f1pCR9Aqkp7QPeMtHX0M
 cEdandhjWbWvKuegFBrcDCJzcdCo6dyyyEXnTjKFOIlvHSlUEclYJFhbLF3tlO8vyyOXzA
 Idds109ybqOOYi+f0cYelcozIGQQvOAl0W31AbWoXPHM5ypQPpcuybad0BXMPo7LQPfUbp
 hqPtnmSXWGPtnImijRBaLJVJkxKF0NSwrDf+IfHQaWFAIK3ugBMe30eRgJDe+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QPq51mGH
Subject: Re: [Buildroot] [PATCH v1] package/libopenssl: security bump to
 version 1.1.1t
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 Feb 2023 17:25:34 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Changelog (for details see [1] and [2]):
> 
>  Changes between 1.1.1s and 1.1.1t [7 Feb 2023]
> 
>   *) Fixed X.400 address type confusion in X.509 GeneralName.
> 
>      There is a type confusion vulnerability relating to X.400 address processing
>      inside an X.509 GeneralName. X.400 addresses were parsed as an ASN1_STRING
>      but subsequently interpreted by GENERAL_NAME_cmp as an ASN1_TYPE. This
>      vulnerability may allow an attacker who can provide a certificate chain and
>      CRL (neither of which need have a valid signature) to pass arbitrary
>      pointers to a memcmp call, creating a possible read primitive, subject to
>      some constraints. Refer to the advisory for more information. Thanks to
>      David Benjamin for discovering this issue. (CVE-2023-0286)
> 
>      This issue has been fixed by changing the public header file definition of
>      GENERAL_NAME so that x400Address reflects the implementation. It was not
>      possible for any existing application to successfully use the existing
>      definition; however, if any application references the x400Address field
>      (e.g. in dead code), note that the type of this field has changed. There is
>      no ABI change.
>      [Hugo Landau]
> 
>   *) Fixed Use-after-free following BIO_new_NDEF.
> 
>      The public API function BIO_new_NDEF is a helper function used for
>      streaming ASN.1 data via a BIO. It is primarily used internally to OpenSSL
>      to support the SMIME, CMS and PKCS7 streaming capabilities, but may also
>      be called directly by end user applications.
> 
>      The function receives a BIO from the caller, prepends a new BIO_f_asn1
>      filter BIO onto the front of it to form a BIO chain, and then returns
>      the new head of the BIO chain to the caller. Under certain conditions,
>      for example if a CMS recipient public key is invalid, the new filter BIO
>      is freed and the function returns a NULL result indicating a failure.
>      However, in this case, the BIO chain is not properly cleaned up and the
>      BIO passed by the caller still retains internal pointers to the previously
>      freed filter BIO. If the caller then goes on to call BIO_pop() on the BIO
>      then a use-after-free will occur. This will most likely result in a crash.
>      (CVE-2023-0215)
>      [Viktor Dukhovni, Matt Caswell]
> 
>   *) Fixed Double free after calling PEM_read_bio_ex.
> 
>      The function PEM_read_bio_ex() reads a PEM file from a BIO and parses and
>      decodes the "name" (e.g. "CERTIFICATE"), any header data and the payload
>      data. If the function succeeds then the "name_out", "header" and "data"
>      arguments are populated with pointers to buffers containing the relevant
>      decoded data. The caller is responsible for freeing those buffers. It is
>      possible to construct a PEM file that results in 0 bytes of payload data.
>      In this case PEM_read_bio_ex() will return a failure code but will populate
>      the header argument with a pointer to a buffer that has already been freed.
>      If the caller also frees this buffer then a double free will occur. This
>      will most likely lead to a crash.
> 
>      The functions PEM_read_bio() and PEM_read() are simple wrappers around
>      PEM_read_bio_ex() and therefore these functions are also directly affected.
> 
>      These functions are also called indirectly by a number of other OpenSSL
>      functions including PEM_X509_INFO_read_bio_ex() and
>      SSL_CTX_use_serverinfo_file() which are also vulnerable. Some OpenSSL
>      internal uses of these functions are not vulnerable because the caller does
>      not free the header argument if PEM_read_bio_ex() returns a failure code.
>      (CVE-2022-4450)
>      [Kurt Roeckx, Matt Caswell]
> 
>   *) Fixed Timing Oracle in RSA Decryption.
> 
>      A timing based side channel exists in the OpenSSL RSA Decryption
>      implementation which could be sufficient to recover a plaintext across
>      a network in a Bleichenbacher style attack. To achieve a successful
>      decryption an attacker would have to be able to send a very large number
>      of trial messages for decryption. The vulnerability affects all RSA padding
>      modes: PKCS#1 v1.5, RSA-OEAP and RSASVE.
>      (CVE-2022-4304)
>      [Dmitry Belyavsky, Hubert Kario]
> 
>  Changes between 1.1.1r and 1.1.1s [1 Nov 2022]
> 
>   *) Fixed a regression introduced in 1.1.1r version not refreshing the
>      certificate data to be signed before signing the certificate.
>      [Gibeom Gwon]
> 
>  Changes between 1.1.1q and 1.1.1r [11 Oct 2022]
> 
>   *) Fixed the linux-mips64 Configure target which was missing the
>      SIXTY_FOUR_BIT bn_ops flag. This was causing heap corruption on that
>      platform.
>      [Adam Joseph]
> 
>   *) Fixed a strict aliasing problem in bn_nist. Clang-14 optimisation was
>      causing incorrect results in some cases as a result.
>      [Paul Dale]
> 
>   *) Fixed SSL_pending() and SSL_has_pending() with DTLS which were failing to
>      report correct results in some cases
>      [Matt Caswell]
> 
>   *) Fixed a regression introduced in 1.1.1o for re-signing certificates with
>      different key sizes
>      [Todd Short]
> 
>   *) Added the loongarch64 target
>      [Shi Pujin]
> 
>   *) Fixed a DRBG seed propagation thread safety issue
>      [Bernd Edlinger]
> 
>   *) Fixed a memory leak in tls13_generate_secret
>      [Bernd Edlinger]
> 
>   *) Fixed reported performance degradation on aarch64. Restored the
>      implementation prior to commit 2621751 ("aes/asm/aesv8-armx.pl: avoid
>      32-bit lane assignment in CTR mode") for 64bit targets only, since it is
>      reportedly 2-17% slower and the silicon errata only affects 32bit targets.
>      The new algorithm is still used for 32 bit targets.
>      [Bernd Edlinger]
> 
>   *) Added a missing header for memcmp that caused compilation failure on some
>      platforms
>      [Gregor Jasny]
> 
> [1] https://www.openssl.org/news/cl111.txt
> [2] https://www.openssl.org/news/vulnerabilities.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
