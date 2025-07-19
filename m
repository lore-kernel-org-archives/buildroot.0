Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A73C83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 12:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3732681E0A;
	Sat, 19 Jul 2025 12:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeAA8O10VPZh; Sat, 19 Jul 2025 12:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A7481FC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38A7481FC2;
	Sat, 19 Jul 2025 12:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6950A117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B66840414
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20SvhStTtTpp for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 12:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58B454013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58B454013F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58B454013F
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:55:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id ECDEC19F73F;
 Sat, 19 Jul 2025 14:55:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 14:55:01 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 14:55:01 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250718145745.79845-1-titouan.christophe@mind.be>
References: <20250718145745.79845-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <757e8e9b75cdb0861c6f2f083bef6c1e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752929704;
 bh=WW4cJgnfBJ9bgqAEAeHWC4U7lWOe/RSkboFia5f37Tg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T8zxp7AxFI7aKwh7lxstNaVTEl5+KLBWpmA2AizDTPunL6UfFgZH6QqUStSwDoF+s
 jtbe+ogreGryLyYnLauM/Xxea/enyInYEgqN1Y48X44XNc0GGDQ25EhSgcpApgsIYD
 fOj/elybY3HJjfChq7dqVxx5iEqXDzDdCZrXl83hGfTGOh+GtDXm2b6p1Afienspep
 sT/9ruAlm9tGruQ0tzFDse+EQ1ti35LuRfPvWEyTLlrcvQFHiEkM5UWfCKuawvJxE/
 8e4xHYIxZiOR79bcTg+vM12Rjxo+Yu0xd8QHtThFQJ9v8kY6Wr9poinlt9/A95Rzcv
 pReTv26x2lUyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T8zxp7Ax
Subject: Re: [Buildroot] [PATCH] package/mbedtls: security bump to v3.6.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/07/2025 16:57, Titouan Christophe via buildroot wrote:
> This is a security release of the Long Term Support branch, see release 
> notes:
> https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4
> 
> Also update the download location, because upstream changed the tag 
> naming
> scheme from v<...> to mbedtls-<...>
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2025-47917
>     Fix possible use-after-free or double-free in code calling
>     mbedtls_x509_string_to_names(). This was caused by the function 
> calling
>     mbedtls_asn1_free_named_data_list() on its head argument, while the
>     documentation did no suggest it did, making it likely for callers 
> relying
>     on the documented behaviour to still hold pointers to memory blocks 
> after
>     they were free()d, resulting in high risk of use-after-free or 
> double-free,
>     with consequences ranging up to arbitrary code execution.
>     In particular, the two sample programs x509/cert_write and 
> x509/cert_req
>     were affected (use-after-free if the san string contains more than 
> one DN).
>     Code that does not call mbedtls_string_to_names() directly is not 
> affected.
> 
> - CVE-2025-48965
>     Fix a bug in mbedtls_asn1_store_named_data() where it would 
> sometimes leave
>     an item in the output list in an inconsistent state with val.p == 
> NULL but
>     val.len > 0. This impacts applications that call this function 
> directly,
>     or indirectly via mbedtls_x509_string_to_names() or one of the
>     mbedtls_x509write_{crt,csr}set{subject,issuer}_name() functions. 
> The
>     inconsistent state of the output could then cause a NULL 
> dereference either
>     inside the same call to mbedtls_x509_string_to_names(), or in 
> subsequent
>     users of the output structure, such as mbedtls_x509_write_names(). 
> This
>     only affects applications that create (as opposed to consume) X.509
>     certificates, CSRs or CRLs, or that call 
> mbedtls_asn1_store_named_data()
> 
> - CVE-2025-49087
>     Fix a timing side channel in the implementation of PKCS#7 padding
>     which would allow an attacker who can request decryption of 
> arbitrary
>     ciphertexts to recover the plaintext through a timing oracle 
> attack.
> 
> - CVE-2025-49600:
>     In MbedTLS 3.3.0 before 3.6.4, mbedtls_lms_verify may accept 
> invalid
>     signatures if hash computation fails and internal errors go 
> unchecked,
>     enabling LMS (Leighton-Micali Signature) forgery in a fault 
> scenario.
>     Specifically, unchecked return values in mbedtls_lms_verify allow 
> an
>     attacker (who can induce a hardware hash accelerator fault) to 
> bypass
>     LMS signature verification by reusing stale stack data, resulting 
> in
>     acceptance of an invalid signature. In mbedtls_lms_verify, the 
> return
>     values of the internal Merkle tree functions 
> create_merkle_leaf_value
>     and create_merkle_internal_value are not checked. These functions
>     return an integer that indicates whether the call succeeded or not. 
> If
>     a failure occurs, the output buffer (Tc_candidate_root_node) may
>     remain uninitialized, and the result of the signature verification 
> is
>     unpredictable. When the software implementation of SHA-256 is used,
>     these functions will not fail. However, with hardware-accelerated
>     hashing, an attacker could use fault injection against the 
> accelerator
>     to bypass verification.
>     https://www.cve.org/CVERecord?id=CVE-2025-49600
> 
> - CVE-2025-49601:
>     In MbedTLS 3.3.0 before 3.6.4, mbedtls_lms_import_public_key does 
> not
>     check that the input buffer is at least 4 bytes before reading a
>     32-bit field, allowing a possible out-of-bounds read on truncated
>     input. Specifically, an out-of-bounds read in
>     mbedtls_lms_import_public_key allows context-dependent attackers to
>     trigger a crash or limited adjacent-memory disclosure by supplying 
> a
>     truncated LMS (Leighton-Micali Signature) public-key buffer under 
> four
>     bytes. An LMS public key starts with a 4-byte type indicator. The
>     function mbedtls_lms_import_public_key reads this type indicator
>     before validating the size of its input.
>     https://www.cve.org/CVERecord?id=CVE-2025-49601
> 
> - CVE-2025-52496:
>     Mbed TLS before 3.6.4 has a race condition in AESNI detection if
>     certain compiler optimizations occur. An attacker may be able to
>     extract an AES key from a multithreaded program, or perform a GCM
>     forgery.
>     https://www.cve.org/CVERecord?id=CVE-2025-52496
> 
> - CVE-2025-52497:
>     Mbed TLS before 3.6.4 has a PEM parsing one-byte heap-based buffer
>     underflow, in mbedtls_pem_read_buffer and two mbedtls_pk_parse
>     functions, via untrusted PEM input.
>     https://www.cve.org/CVERecord?id=CVE-2025-52497
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
