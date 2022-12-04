Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3619EC4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 11:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A090415DE;
	Sun,  4 Dec 2022 11:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A090415DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mwau0JI8QmPP; Sun,  4 Dec 2022 11:51:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E72C415DD;
	Sun,  4 Dec 2022 11:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E72C415DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB681BF3B0
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 11:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED643415DD
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 11:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED643415DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOHOikEgZ6dI for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 11:51:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ABFB415DA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ABFB415DA
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 11:51:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d16b:268a:13f6:6145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2EDD919F58D;
 Sun,  4 Dec 2022 12:51:48 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Dec 2022 12:51:47 +0100
Date: Sun, 4 Dec 2022 12:51:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221204115147.GM3302@scaer>
References: <20221203224157.1196944-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221203224157.1196944-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670154712;
 bh=aR4OR0YsujI3/a+ZAlAfPDKoA504NhjUQ+8AvPt4B/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SKfKrl2hmQ0D3exzw7X3+ZptIqh8n98Mz25zOejwqMpXFkQDoY8XJlnV4BWGcFDiD
 GIPotfZRFZFklbDl/a6UH4jx1ZpWsOvthQmNzHYpVeecqSS91Lp0+JnCspGWmGuOxr
 D7VdKeJr087LRDjn577rvnZMSoBCPY+5yJ5XQxDTHTuedT/HmaKxb48Fwlo1kMikWT
 FO9DPY+cB1eNGDgOrmW/FSZZ4FLglu75paWG9Zl91CZKB6arsLLzDLLRFNxBTfpYT7
 atmy2IijgvoYVNXOmSeaMfBXFFlyLM47HSqc0jM46v1D0+dF3+e4YjXOjz+nZ+f5q7
 yLmjDJh1XDdHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SKfKrl2h
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix CVE-2022-37454
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-03 23:41 +0100, Fabrice Fontaine spake thusly:
> The Keccak XKCP SHA-3 reference implementation before fdc6fef has an
> integer overflow and resultant buffer overflow that allows attackers to
> execute arbitrary code or eliminate expected cryptographic properties.
> This occurs in the sponge function interface.
> 
> Python 3.11 and later switched to using tiny_sha3 in GH-32060, so they
> should not be affected.
> 
> https://github.com/python/cpython/issues/98517
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...Fix-buffer-overflows-in-_sha3-module.patch | 101 ++++++++++++++++++
>  package/python3/python3.mk                    |   3 +
>  2 files changed, 104 insertions(+)
>  create mode 100644 package/python3/0034-3-10-gh-98517-Fix-buffer-overflows-in-_sha3-module.patch
> 
> diff --git a/package/python3/0034-3-10-gh-98517-Fix-buffer-overflows-in-_sha3-module.patch b/package/python3/0034-3-10-gh-98517-Fix-buffer-overflows-in-_sha3-module.patch
> new file mode 100644
> index 0000000000..5c50dd16cb
> --- /dev/null
> +++ b/package/python3/0034-3-10-gh-98517-Fix-buffer-overflows-in-_sha3-module.patch
> @@ -0,0 +1,101 @@
> +From 0e4e058602d93b88256ff90bbef501ba20be9dd3 Mon Sep 17 00:00:00 2001
> +From: Theo Buehler <botovq@users.noreply.github.com>
> +Date: Fri, 21 Oct 2022 21:26:01 +0200
> +Subject: [PATCH] [3.10] gh-98517: Fix buffer overflows in _sha3 module
> + (#98519)
> +
> +This is a port of the applicable part of XKCP's fix [1] for
> +CVE-2022-37454 and avoids the segmentation fault and the infinite
> +loop in the test cases published in [2].
> +
> +[1]: https://github.com/XKCP/XKCP/commit/fdc6fef075f4e81d6b1bc38364248975e08e340a
> +[2]: https://mouha.be/sha-3-buffer-overflow/
> +
> +Regression test added by: Gregory P. Smith [Google LLC] <greg@krypto.org>
> +
> +[Retrieved from:
> +https://github.com/python/cpython/commit/0e4e058602d93b88256ff90bbef501ba20be9dd3]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + Lib/test/test_hashlib.py                          |  9 +++++++++
> + .../2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst |  1 +
> + Modules/_sha3/kcp/KeccakSponge.inc                | 15 ++++++++-------
> + 3 files changed, 18 insertions(+), 7 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
> +
> +diff --git a/Lib/test/test_hashlib.py b/Lib/test/test_hashlib.py
> +index 535f4aa3e04c..9aa6c1f0a3b6 100644
> +--- a/Lib/test/test_hashlib.py
> ++++ b/Lib/test/test_hashlib.py
> +@@ -495,6 +495,15 @@ def test_case_md5_huge(self, size):
> +     def test_case_md5_uintmax(self, size):
> +         self.check('md5', b'A'*size, '28138d306ff1b8281f1a9067e1a1a2b3')
> + 
> ++    @unittest.skipIf(sys.maxsize < _4G - 1, 'test cannot run on 32-bit systems')
> ++    @bigmemtest(size=_4G - 1, memuse=1, dry_run=False)
> ++    def test_sha3_update_overflow(self, size):
> ++        """Regression test for gh-98517 CVE-2022-37454."""
> ++        h = hashlib.sha3_224()
> ++        h.update(b'\x01')
> ++        h.update(b'\x01'*0xffff_ffff)
> ++        self.assertEqual(h.hexdigest(), '80762e8ce6700f114fec0f621fd97c4b9c00147fa052215294cceeed')
> ++
> +     # use the three examples from Federal Information Processing Standards
> +     # Publication 180-1, Secure Hash Standard,  1995 April 17
> +     # http://www.itl.nist.gov/div897/pubs/fip180-1.htm
> +diff --git a/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
> +new file mode 100644
> +index 000000000000..2d23a6ad93c7
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
> +@@ -0,0 +1 @@
> ++Port XKCP's fix for the buffer overflows in SHA-3 (CVE-2022-37454).
> +diff --git a/Modules/_sha3/kcp/KeccakSponge.inc b/Modules/_sha3/kcp/KeccakSponge.inc
> +index e10739deafa8..cf92e4db4d36 100644
> +--- a/Modules/_sha3/kcp/KeccakSponge.inc
> ++++ b/Modules/_sha3/kcp/KeccakSponge.inc
> +@@ -171,7 +171,7 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
> +     i = 0;
> +     curData = data;
> +     while(i < dataByteLen) {
> +-        if ((instance->byteIOIndex == 0) && (dataByteLen >= (i + rateInBytes))) {
> ++        if ((instance->byteIOIndex == 0) && (dataByteLen-i >= rateInBytes)) {
> + #ifdef SnP_FastLoop_Absorb
> +             /* processing full blocks first */
> + 
> +@@ -199,10 +199,10 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
> +         }
> +         else {
> +             /* normal lane: using the message queue */
> +-
> +-            partialBlock = (unsigned int)(dataByteLen - i);
> +-            if (partialBlock+instance->byteIOIndex > rateInBytes)
> ++            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
> +                 partialBlock = rateInBytes-instance->byteIOIndex;
> ++            else
> ++                partialBlock = (unsigned int)(dataByteLen - i);
> +             #ifdef KeccakReference
> +             displayBytes(1, "Block to be absorbed (part)", curData, partialBlock);
> +             #endif
> +@@ -281,7 +281,7 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
> +     i = 0;
> +     curData = data;
> +     while(i < dataByteLen) {
> +-        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen >= (i + rateInBytes))) {
> ++        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen-i >= rateInBytes)) {
> +             for(j=dataByteLen-i; j>=rateInBytes; j-=rateInBytes) {
> +                 SnP_Permute(instance->state);
> +                 SnP_ExtractBytes(instance->state, curData, 0, rateInBytes);
> +@@ -299,9 +299,10 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
> +                 SnP_Permute(instance->state);
> +                 instance->byteIOIndex = 0;
> +             }
> +-            partialBlock = (unsigned int)(dataByteLen - i);
> +-            if (partialBlock+instance->byteIOIndex > rateInBytes)
> ++            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
> +                 partialBlock = rateInBytes-instance->byteIOIndex;
> ++            else
> ++                partialBlock = (unsigned int)(dataByteLen - i);
> +             i += partialBlock;
> + 
> +             SnP_ExtractBytes(instance->state, curData, instance->byteIOIndex, partialBlock);
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 2e17104102..b291fcf582 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -16,6 +16,9 @@ PYTHON3_CPE_ID_PRODUCT = python
>  # 0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch
>  PYTHON3_IGNORE_CVES += CVE-2022-45061
>  
> +# 0034-3-10-gh-98517-Fix-buffer-overflows-in-_sha3-module.patch
> +PYTHON3_IGNORE_CVES += CVE-2022-37454
> +
>  # This host Python is installed in $(HOST_DIR), as it is needed when
>  # cross-compiling third-party Python modules.
>  
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
