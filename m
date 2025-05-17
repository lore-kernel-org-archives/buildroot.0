Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FEEC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A24DD81ECC;
	Sat, 17 May 2025 09:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enFj1zHPuBOF; Sat, 17 May 2025 09:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D20B581E4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D20B581E4F;
	Sat, 17 May 2025 09:12:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 517AB1DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 424DA40810
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNmXAe74EgkJ for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 975D54079C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 975D54079C
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 975D54079C
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:12:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7ADB61C1134; Sat, 17 May 2025 11:12:28 +0200 (CEST)
Message-ID: <0c590700-bb89-4828-b290-19d902b5dc6b@rnout.be>
Date: Sat, 17 May 2025 11:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <8b83ad421062201ab3387b1133eee53a800b1918.1747241900.git.yann.morin.1998@free.fr>
 <aChB6bwZ007ymPK_@landeda>
Content-Language: en-GB, fr-BE
In-Reply-To: <aChB6bwZ007ymPK_@landeda>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747473148; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=L7Rsgj1+0cmkiuwPIImveeRw/RoxkADzNuRZHXwWhWc=;
 b=SayRD4LTwEvHWTvUc91K2FG5rd0qVvm9vyj81dpD1Gp4kuRAHwvVuKpThGxEoDWRzPDKkf
 FgMnEwxKF0GPnxDLKQpNcEGXk5w4j27sL6ZC4bNWiYk7RA5sE1GWabdicJkm7REhaKPvnu
 b2V1NtDPckzd0X+CEdOvbQmbqoqSKBcqYT5foRdfYC4SzEBtX3rA6I5cE5raPSDoEH4a4M
 V1CkvMbTLJrGzsj43T2Xmev0sG5NTqvLUtetfQrOvCTubYOhsgDfMrDg6vQ35+iOjavMlO
 A+geJWfcjLSVIwleVdNeNoWqT4Kq7IP1meC6ThUbY6IhOekiAKinxZrRTan/Sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SayRD4LT
Subject: Re: [Buildroot] [PATCH 05/13] support/scripts: fix and restrict
 conditions to accept merged dirs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/05/2025 09:59, Yann E. MORIN wrote:
> All,
> 
> On 2025-05-14 18:58 +0200, Yann E. MORIN spake thusly:
>> Currently, we accept that the merged usr is bqckward, i.e. that the
>> /usr/bin, /usr/sbin, and /usr/lib entries be symlinks to, resp., /bin,
>> /sbin, and /lib. We also allow either entries to be symlinks to other
>> parts of the root. Both are accepted despite the comment at the top of
>> the script explaining what should be accepted.
>>
>> However, a properly merged usr is the other way around: /bin, /sbin, and
>> /lib are the symlinks to resp. /usr/bin, /usr/sbin, and /usr/lib, and
>> the latters are actual directories.
> [--SNIP--]
>> @@ -32,12 +29,21 @@ test_merged() {
>>   	local dir2="${3}"
>>   	local inode1 inode2
>>   
>> +	# OK if missing first entry and second entry is an actual directory
>> +	test -e "${root}${dir1}" || { test -d "${root}${dir2}" && return; }
>> +
>>   	inode1="$(stat -c '%i' "${root}${dir1}/." 2>/dev/null)"
>>   	inode2="$(stat -c '%i' "${root}${dir2}/." 2>/dev/null)"
>>   
>> -	test -z "${inode1}" || \
>> -		test "${inode1}" = "${inode2}" || \
>> -			printf '%s\n' "${dir1}"
>> +	# OK if first entry is a symlink, second entry is a directoy, and
>> +	# both have the same inode (once dereferenced)
>> +	test -L "${root}${dir1}" \
>> +	&& test -d "${root}${dir2}" \
>> +	&& test "${inode1}" = "${inode2}" \
>> +	&& return
>> +
>> +	# Otherwise, this directory is not merged
>> +	printf '%s\n' "${dir1}"
> 
> This new test is still quite complex, and is in fact still wrong in
> weird cases. For example, with BASE a custom skeleton or rootfs overlay,
> if BASE/sbin and BASE/usr/sbin ar absolute symlinks to /usr/sbin, the
> test above will accept BASE as being properly merged, while it is in
> fact broken.
> 
> I'm preparing a v2 which greatly simplifies the test, and makes it cover
> more (all, hopefully) cases.

  With that in mind, I'll quickly review the series now and mark it as Changes 
Requested in patchwork, OK?

  Thanks,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>>   }
>>   
>>   test_merged "${root}" "/lib" "/usr/lib"
>> -- 
>> 2.47.0
>>
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
