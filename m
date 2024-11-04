Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A535D111AE
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C96AF80D1E;
	Mon,  4 Nov 2024 21:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQFQL91SdmxE; Mon,  4 Nov 2024 21:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C638080B4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C638080B4F;
	Mon,  4 Nov 2024 21:40:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D546E3B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C244240526
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYIU6M8-xnx3 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:40:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B6D6404E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B6D6404E9
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B6D6404E9
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:40:39 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 84oOt4erJ0w3U84oOtiHVc; Mon, 04 Nov 2024 22:40:37 +0100
Message-ID: <f511cfac-5e6a-4de0-9f36-28b23bd45af7@benettiengineering.com>
Date: Mon, 4 Nov 2024 22:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>
References: <20241026221347.22f27cad@windsurf>
 <20241104202319.2193487-1-giulio.benetti@benettiengineering.com>
 <20241104211655.GA1423113@pevik>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20241104211655.GA1423113@pevik>
X-CMAE-Envelope: MS4xfCIrm+i7MXHrUSyBtXAptRCO3EyNchYZ6yBYvDMT3bW+uB23s0HO3AyWWWxre9mHucKPFrs3Q8sD5V10zgE2EQzivbHRSFT7L1hzxN4U6mSUDNNxmUbq
 6NkdrO6tJYoMUvmJ9ZoKER7T4L6X3BoQDfRZnVx/c5R6xBJvX/LouHzauBVdOfFoNtm5fwxC+61boMWtKZotcE3ICXADcMc0Zjdz1ZbgaOLuGMZy7pglOD9y
 JrBEGD5izfhjvjROJc9EpyJEI+eBnimdiRvfBDP3VHnUZp/X6KlQqa4fsGutMic34FoyXWyIBWG7pKYh0yAzt4/+aDoAlnCA865m2PNeW4k0pSrtEYoJ+B1e
 yLzOVCVz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1730756437; bh=4fTXkAaQmg/QQ0DNljTc1AJsxjd3ha/VGF7kGMvf0Mc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=clO4o+4REyO6v6SXLcwlQ1Ex4p+Nu9/6aoPGI6rzEL065IVr9RbP7ro9+tH5VBdDB
 EvvUuDkfIkDXIjyu3Fw3trTVGsnqJARd1VDyPJNu+l+zf8VQql4vMS7is155bX7sVn
 5jpnktD+eXb1EXdmxJKojwvmBg+DcbqbFHeI1cm/Qij7AnmjtJMLAoMINo9CvWfjMt
 vyBl+tV2TsOWGdfg7Ll9SRbdgIs/2XBK99/mF/wpfChb/pwDw18AEl47yfa5fjiAq4
 DP5Dxh26NZdCjJQ26Ln6TVoi94wEjwtEUp3WI1QaToG/Rw//IUIj52d3yR6PPgiXMG
 lyk4DmkuFLPUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=clO4o+4R
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.1
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Petr,

On 11/4/24 22:16, Petr Vorel wrote:
> Hi Giulio,
> 
> Thanks for the update!
> 
>> * disable junction and nfsdctl by default
> ...
>>   NFS_UTILS_CONF_OPTS = \
>>   	--enable-tirpc \
>>   	--enable-ipv6 \
>> +	--disable-junction \
>> +	--disable-nfsdctl \
>>   	--without-tcp-wrappers \
>>   	--with-statedir=/run/nfs \
>>   	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
>> @@ -30,6 +32,8 @@ HOST_NFS_UTILS_CONF_OPTS = \
>>   	--disable-gss \
>>   	--disable-uuid \
>>   	--disable-ipv6 \
>> +	--disable-junction \
>> +	--disable-nfsdctl \
>>   	--without-tcp-wrappers \
>>   	--with-statedir=/run/nfs \
>>   	--disable-caps \
> 
> What was the reason to disable them? Shouldn't be at least nfsdctl enabled?

nfsdctl has been added with nfs-utils commit 
8c32613d5311930c17c056d93996bcd8e00e0fa4

so between version 2.7.1 and 2.8.1 and with this bump I've tried to keep
things as they were.

> 
> man nfsdctl(8) "control program for the Linux kernel NFS server" [1]
> That sounds useful.

Yes it is. But I think it deserves a separate patch since it's not about
bumping the version. Feel free to provide one for it.

> 
> man nfsref(8) "manage NFS referrals"
>         ...
>         A junction is a file system object on an NFS server that, when an
>         NFS client encounters it, triggers a referral.  Similar to a
>         symlink, a junction contains one or more target locations that
>         the server sends to clients in the form of an NFSv4 referral.
> 
> I'm not sure how much useful this is, but it's enabled by default. Also Debian
> explicitly enables it. Do we have a good reason to disable it?

To keep it enabled we need libxml2 dependency, so I've preferred to keep
it disabled as pointed by Thomas on patch to bump to version 2.7.1

This can be enabled as an option too, so here again you can send a patch.

Kind regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> 
>> * drop 2 local patches that have been committed.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> 
> Kind regards,
> Petr
> 
> [1] https://manpages.debian.org/testing/nfs-kernel-server/nfsdctl.8.en.html
> [2] https://man7.org/linux/man-pages/man8/nfsref.8.html
> [3] https://salsa.debian.org/kernel-team/nfs-utils/-/blob/master/debian/rules?ref_type=heads

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
