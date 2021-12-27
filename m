Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C362C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 22:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B627F402AD;
	Mon, 27 Dec 2021 22:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyxRAZz-3VG7; Mon, 27 Dec 2021 22:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AD1040263;
	Mon, 27 Dec 2021 22:47:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB0BF1BF2B7
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 22:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAF2540261
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 22:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7hKHcS6OrCw for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 22:47:39 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AA3240181
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 22:47:38 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 1yfQndwh8hA9y1yfRnNkF6; Mon, 27 Dec 2021 23:40:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640644833; bh=cE/A6ngJNMuICZv/43k6WFHZnd2fmp+hPqNCPvqPB3g=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=CpLKVhYjXWSqeaSK/xf9lHebBq/8MWG5AmAM/pkp7vZE//WLBb+FqY1j3UCDRvaDi
 DkSs2oWsPf4EghFSJ3VPDfxlYZhtSDDvQfPMok7BntZGEQjWQNPQeI6NzkvTIRYfCj
 R63fqMDRtavJNVCkjerUclhN+ckR44UEmhRPSjMH3vVsMg2rd1lx9+DUE6f2NrKRK7
 f7bA3UH7Q0vyT1oTCoglMo8TLFJ0UxQ7L4TfcpsnQl2icd7g6JTEGKElJIWoJqLMxa
 QmjH07koQpDEuZuCMyA52rbOJt9FIdvTQbh9Ec9K0mD7W08tjCPT913WHXG37oPAVg
 nOtLtgqZbNivg==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211225214638.105114-1-giulio.benetti@benettiengineering.com>
 <20211227222435.393248e5@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <cae3c38b-3789-20a2-741c-871b8ddd7024@benettiengineering.com>
Date: Mon, 27 Dec 2021 23:40:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211227222435.393248e5@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfEPlp6OECE7UvS/EoaDYVPgXrGFAThEEpx0RZuqkoF3cYj2YHt428d5x1sU3D7ImZAhju6Lka6mYNAVH45a1nne2bzb7mfbDbPOqwwRSpwQmMWLVqdNO
 hIUVfdxplAIXa5J7iI0gp3soPjtxfGJFwC4s0sALNn8SVZ5nHuo1+UDylxMSGKpXggoq0W1bCx9yKKRH493NY8CXqEKmfFyGHattlL5/FGQussrLu6XBaYM1
 HGl8eDrdDex+cyrC38zV4g==
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: fix host build failure
 due to C++11
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 27/12/21 22:24, Thomas Petazzoni wrote:
> On Sat, 25 Dec 2021 22:46:38 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Package harfbuzz fails to build for host with error:
>> ```
>> ../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
>>     static_assert (std::is_trivially_copyable<K>::value, "");
>> ```
>>
>> Only starting from gcc version 5.0 we have 'is_trivially_copyable' member
>> of std. So let's depend on BR2_HOST_GCC_AT_LEAST_5 for harfbuzz. Let's
>> also depend on it in pango package which is the only one which needs
>> host-harfbuzz.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/89e1194c1659d7e1af9db8ffe5feee770c448f76
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/harfbuzz/Config.in | 6 ++++--
>>   package/pango/Config.in    | 4 +++-
>>   2 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
>> index 2e4219ee22..81acebce46 100644
>> --- a/package/harfbuzz/Config.in
>> +++ b/package/harfbuzz/Config.in
>> @@ -3,6 +3,7 @@ config BR2_PACKAGE_HARFBUZZ
>>   	depends on BR2_INSTALL_LIBSTDCPP
>>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>> +	depends on BR2_HOST_GCC_AT_LEAST_5 # C++11
> 
> It is kind of hard to believe that it would require gcc 5.0 on the
> host, but only gcc 4.9 for the target.
> 
> Could you clarify this?

Sure. This is the first time I get into this kind of situation where 
host gcc must be AT_LEAST and I was unsure if align the target toolchain 
honestly. This patch should have been an RFC.

But yes, thinking while writing it doesn't make sense this way, because 
the C++11 requirement is valid for both host and target toolchain, most 
of all because harfbuzz is built the same way in both host and target 
ways. Maybe in the strange(but possible) case where we use one package 
but with 2 different builds, 1 for host and 1 for target that could made 
sense. But I've just checked and all configuration and build part is 
common for host and target.

So please drop this patch, I will send a v2 with the target version 
aligned to the host one.

Now I've clarified myself :-)
Sorry for the noise.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
