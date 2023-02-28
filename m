Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176E9C64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 16:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B878281A33;
	Tue, 28 Feb 2023 16:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B878281A33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehaAzzTUkSAF; Tue, 28 Feb 2023 16:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D21B181C18;
	Tue, 28 Feb 2023 16:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D21B181C18
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFE3C1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA37F40872
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA37F40872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvMCjp92hH4L for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 16:15:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDDB540576
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDDB540576
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 16:15:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D1FA6E000C;
 Tue, 28 Feb 2023 16:15:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pX2dg-009t2T-Rq; Tue, 28 Feb 2023 17:15:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20230208162534.28581-1-ps.report@gmx.net>
Date: Tue, 28 Feb 2023 17:15:40 +0100
In-Reply-To: <20230208162534.28581-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Wed, 8 Feb 2023 17:25:34 +0100")
Message-ID: <87o7pdix5f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Changelog (for details see [1] and [2]):
 >  Changes between 1.1.1s and 1.1.1t [7 Feb 2023]

 >   *) Fixed X.400 address type confusion in X.509 GeneralName.

 >      There is a type confusion vulnerability relating to X.400 address processing
 >      inside an X.509 GeneralName. X.400 addresses were parsed as an ASN1_STRING
 >      but subsequently interpreted by GENERAL_NAME_cmp as an ASN1_TYPE. This
 >      vulnerability may allow an attacker who can provide a certificate chain and
 >      CRL (neither of which need have a valid signature) to pass arbitrary
 >      pointers to a memcmp call, creating a possible read primitive, subject to
 >      some constraints. Refer to the advisory for more information. Thanks to
 >      David Benjamin for discovering this issue. (CVE-2023-0286)

 >      This issue has been fixed by changing the public header file definition of
 >      GENERAL_NAME so that x400Address reflects the implementation. It was not
 >      possible for any existing application to successfully use the existing
 >      definition; however, if any application references the x400Address field
 >      (e.g. in dead code), note that the type of this field has changed. There is
 >      no ABI change.
 >      [Hugo Landau]

 >   *) Fixed Use-after-free following BIO_new_NDEF.

 >      The public API function BIO_new_NDEF is a helper function used for
 >      streaming ASN.1 data via a BIO. It is primarily used internally to OpenSSL
 >      to support the SMIME, CMS and PKCS7 streaming capabilities, but may also
 >      be called directly by end user applications.

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

 >   *) Fixed Double free after calling PEM_read_bio_ex.

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

 >      The functions PEM_read_bio() and PEM_read() are simple wrappers around
 >      PEM_read_bio_ex() and therefore these functions are also directly affected.

 >      These functions are also called indirectly by a number of other OpenSSL
 >      functions including PEM_X509_INFO_read_bio_ex() and
 >      SSL_CTX_use_serverinfo_file() which are also vulnerable. Some OpenSSL
 >      internal uses of these functions are not vulnerable because the caller does
 >      not free the header argument if PEM_read_bio_ex() returns a failure code.
 >      (CVE-2022-4450)
 >      [Kurt Roeckx, Matt Caswell]

 >   *) Fixed Timing Oracle in RSA Decryption.

 >      A timing based side channel exists in the OpenSSL RSA Decryption
 >      implementation which could be sufficient to recover a plaintext across
 >      a network in a Bleichenbacher style attack. To achieve a successful
 >      decryption an attacker would have to be able to send a very large number
 >      of trial messages for decryption. The vulnerability affects all RSA padding
 >      modes: PKCS#1 v1.5, RSA-OEAP and RSASVE.
 >      (CVE-2022-4304)
 >      [Dmitry Belyavsky, Hubert Kario]

 >  Changes between 1.1.1r and 1.1.1s [1 Nov 2022]

 >   *) Fixed a regression introduced in 1.1.1r version not refreshing the
 >      certificate data to be signed before signing the certificate.
 >      [Gibeom Gwon]

 >  Changes between 1.1.1q and 1.1.1r [11 Oct 2022]

 >   *) Fixed the linux-mips64 Configure target which was missing the
 >      SIXTY_FOUR_BIT bn_ops flag. This was causing heap corruption on that
 >      platform.
 >      [Adam Joseph]

 >   *) Fixed a strict aliasing problem in bn_nist. Clang-14 optimisation was
 >      causing incorrect results in some cases as a result.
 >      [Paul Dale]

 >   *) Fixed SSL_pending() and SSL_has_pending() with DTLS which were failing to
 >      report correct results in some cases
 >      [Matt Caswell]

 >   *) Fixed a regression introduced in 1.1.1o for re-signing certificates with
 >      different key sizes
 >      [Todd Short]

 >   *) Added the loongarch64 target
 >      [Shi Pujin]

 >   *) Fixed a DRBG seed propagation thread safety issue
 >      [Bernd Edlinger]

 >   *) Fixed a memory leak in tls13_generate_secret
 >      [Bernd Edlinger]

 >   *) Fixed reported performance degradation on aarch64. Restored the
 >      implementation prior to commit 2621751 ("aes/asm/aesv8-armx.pl: avoid
 >      32-bit lane assignment in CTR mode") for 64bit targets only, since it is
 >      reportedly 2-17% slower and the silicon errata only affects 32bit targets.
 >      The new algorithm is still used for 32 bit targets.
 >      [Bernd Edlinger]

 >   *) Added a missing header for memcmp that caused compilation failure on some
 >      platforms
 >      [Gregor Jasny]

 > [1] https://www.openssl.org/news/cl111.txt
 > [2] https://www.openssl.org/news/vulnerabilities.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
