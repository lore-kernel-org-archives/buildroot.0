Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48202606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 12:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gAza5AyZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2072C40919;
	Thu, 26 Nov 2026 12:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_PNoSjcJr_k; Thu, 26 Nov 2026 12:26:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5582D4090D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795695976;
	b=Wgh7ejhX66KnpGwS3I0j5aeFQpQEuLskEktQ2WezOtejjVCFO1/1oJ9viecmc6jamCae
	 dRd9ZtohRmb4UqfhGXs0Oew1rZudQVbPV7VsaX8XZqynazwX8SVr3/8jPB+7/yvcZ71W8
	 GLj1ylKZMkNNS2zXwCI6tr4ZJegrYwB72YFOgd0dBpHJ9C/JqsT7pBMwVY9441U40AKZM
	 yBQxDFkB9yTi9ewjiOX01sQq0rKIQmBSlrhmBGVSrXi8NIaFHHr4lEQQ5ANE9qurlwwc7
	 I28ajVdXg9bEAsDdAxCerF+F9v9cGXboChAnGbL2rHXNRPzLyRXb1Ya8/NBQbt3Z2eA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795695976;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=b7PlJ68A6/x3USHYA64xrIeWeibVW4PBNgrCtj55aDA=;
	b=Cup+lRIf4CfvYnuXbUw9TkG0wohU1r8nBBL+I8UNGCz8Fs3Ec2AKJC+Foo8TrUsq0XAL
	 kFubN5Kb0xybU/2r9h7lPBG59FixFPfoW7guuIFDXGciOquTnjbK4hOXTqNScmljxm3Z2
	 pdzwnBFy+JekFW7bwe8ET6gFjTzCp810gaBBYiwYOsuSmTzQS3OGZ7Q7EsYefKNA61qXE
	 cE3sjAm1pKx5GoYueQyVP9h0EmVWd0GFb74VqIlSFgMFEKltUpRmgENleSpVVfc5FyAcl
	 5fLIpfxwMg0DtqvG9BYZ61gfzNvGOLs8KcfAIx7KSfy37L/vS3t7+Z4Wduopb9xbumg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795695976;
	bh=b7PlJ68A6/x3USHYA64xrIeWeibVW4PBNgrCtj55aDA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=gAza5AyZo26uOduziXaMeAThccenxfCYZurpTcVNQEmXe3GpeD2iEQLbx2MpDBynO
	 vTmyF8AKlgKzo/KUqDhOt3R6o+ZfL1f7ZvkzMor+Hyczs+L1Ohqw8uUIbII1DGPE4Q
	 sbA3asSNZJ5gQL+Nt0xQlkhHmFsKJB2SuQVGmXO7Kn8Ii2Cm8vmVu9+0A51VZwNsdB
	 Jkucv9DudLnc4Ih6LguKjMRDqcJneHBcvNcDv4/qNjMKVmC3q4qxIfBh/AohVEfCwf
	 9jRzLJjVScdNf9ATHOA15hx9iSReaywSYwF0lem/TxL0eb5Fm54ZUcmI6pDe3lXRNd
	 DEjQRLga3OJkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5582D4090D;
	Thu, 26 Nov 2026 12:26:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71E5910B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 12:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63607404C5
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 12:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gz2wzdTlGMPy for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 12:26:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5362B40474
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5362B40474
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 12:26:12 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id F17542C85103;
 Thu, 26 Nov 2026 13:26:10 +0100 (CET)
Message-ID: <0c288f2a-e770-4dfe-8a70-0a053d438f3e@bubu1.eu>
Date: Thu, 26 Nov 2026 13:26:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20261126112000.573729-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20261126112000.573729-1-chakrabortyshubham66@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/dos2unix: bump to version 7.5.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/26/26 12:19, Shubham Chakraborty wrote:
> For change log, see:
> https://waterlander.net/dos2unix/doc/NEWS.txt
> 
> 2026-08-27: Version 7.5.7
>   * Detect a missing UTF-16 low surrogate at the end of a file.
>   * Fixed the processing of files containing only half a BOM.
>   * unix2dos: Fixed conversion of a DOS line break immediately
>     after a Mac line break.
>   * mac2unix/unix2mac: Fixed counting line breaks in verbose
>     mode of files with mixed line break types.
>   * Code cleanup.
> 
> 2026-05-28: Version 7.5.6
>   * New homepage https://waterlander.net/dos2unix/
>   * Updated translations of the manual.
> 
> Tested using:
>   utils/test-pkg -p dos2unix
>   (Result: 6 builds, 0 skipped, 0 build failed)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
Applied to master due to this being a bugfix release, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
