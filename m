Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0127C43219
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 17:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D65D400CD;
	Mon,  3 Jan 2022 17:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQ-FMg_4jMVg; Mon,  3 Jan 2022 17:11:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 130E3400E3;
	Mon,  3 Jan 2022 17:11:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7C271BF289
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 17:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94CBB400E3
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 17:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sdPRtB_kZUsx for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 17:11:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09E43400CD
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 17:11:52 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id f5so138339191edq.6
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 09:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MdmNaJkgH8rben9pQJ8MnUtjwXts2Jd/Y4pwmhcFdBA=;
 b=Q+gG4knfx9i7n2CCRoQU/7CsTJlHPtiQmCXS2wy4+M9mn2ZjNHO987QWnjbSNQKNNR
 1dSy9Ca/DNbcnP/f8qe0FXdO2qbaxVQ9SLDC9Wmnu54q+PF7l7VTag83wlXZCzvUMUp+
 qJ30yuZKTm1hLzVVj7/xymzRAB6lICYXHuAU/JfW2eLpnSqxyAaQpPgrCJ3dpmDr0BW6
 XSjJlY2dw9FEC9aLog1zhjMndWhhvsA7NM6zTlC4Kj8tkmfo0Hd+GZJAf+0kS/Th2Uia
 LnHcmxhxR8Qp/6Y0088yeluEsBngMzU8sU2lwE+jvrtFqzipQDBNptb7PsWHyIrv3+Ha
 +AkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MdmNaJkgH8rben9pQJ8MnUtjwXts2Jd/Y4pwmhcFdBA=;
 b=M72Ys/m2f/v+CeOoKDgJJQEmH6j1R5Tb2LoTLB/bJaMeQB6+ua0ofVIacG1r9tTxUq
 nnPFvfoMIIKj5qUpJtdtDwXo+iVjnRQ4okfGBqil5W+6fb2EwjUiG3R1QUfv2MH7VLCH
 ND0IWDQi6t0E+ISZt3sC1agJ9gyM3LC7CFZo0i6Xep13R+kZv8zi+tjDdLFlErie/9zE
 qt0bRzkGanuIc2uNPRpvYjcwbmsnhL+oyQWR74PeXsxg0BBwKYhI08YyuWKnp7edWPyU
 Ja2wX3qU4vtPewU4LKPMoUHFBQzMt/EtPIVfMuCH8yjMR7s+lG53HqnP9VxwMUhI6kry
 9ghA==
X-Gm-Message-State: AOAM5311Au+EUo0Nj3uBufPq68Q/jgWlDe9d373GlQ2FtZtO/8pHP8N9
 xKud6TvqfRs/y+sRkhd30Tdf2A==
X-Google-Smtp-Source: ABdhPJwF7dwG6N9roax2o9g0jjq4HCMT3lxk7T9Id+NSuJv97DcLEXN09pLJi5LMYKIbX2d3+w2HyA==
X-Received: by 2002:a17:906:af82:: with SMTP id
 mj2mr35549910ejb.33.1641229911028; 
 Mon, 03 Jan 2022 09:11:51 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qw4sm10845828ejc.55.2022.01.03.09.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 09:11:50 -0800 (PST)
Message-ID: <63439c64-530d-4d2f-67e5-91a854501a5c@mind.be>
Date: Mon, 3 Jan 2022 18:11:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Andrey Nechypurenko <andreynech@gmail.com>
References: <20211214125510.13654-1-andreynech@gmail.com>
 <20211230214722.GJ3390456@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211230214722.GJ3390456@scaer>
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/: remove -E flag from
 patch call
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



On 30/12/2021 22:47, Yann E. MORIN wrote:
> Andrey, All,
> 
> On 2021-12-14 13:55 +0100, Andrey Nechypurenko spake thusly:
>> -E flag instructs patch to remove empty files. However, in some cases
>> empty files are essential. If they are missing, build could be broken
>> or other bad things can happen.
> 
> Do you have an example of a publicly accessible package that has this
> issue?
> 
>> Signed-off-by: Andrey Nechypurenko <andreynech@gmail.com>
> 
> I was going to apply this, but then I was wondering; what about patches
> that actually *want* to remove files?
> 
> It turns out that we do have a few patches that remove files:
> 
>      $ git grep -E '\+\+\+ /dev/null'
>      board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch:+++ /dev/null
>      board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch:+++ /dev/null
>      board/roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch:+++ /dev/null
>      boot/grub2/0033-verifiers-Move-verifiers-API-to-kernel-image.patch:+++ /dev/null
>      boot/grub2/0034-efi-Move-the-shim_lock-verifier-to-the-GRUB-core.patch:+++ /dev/null
>      boot/lpc32xxcdl/0002-delete_redundant_files.patch:+++ /dev/null2012-01-01 16:39:47.918907000 +0100
>      boot/lpc32xxcdl/0002-delete_redundant_files.patch:+++ /dev/null2012-01-01 16:39:47.918907000 +0100
>      package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch:+++ /dev/null
>      package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch:+++ /dev/null
>      package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch:+++ /dev/null
>      package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch:+++ /dev/null

  Have you actually tested this? With modern patch, the /dev/null indicates 
exactly what we want: that the file must be removed. So even without -E, the 
file gets removed.

  What -E does is remove a file in the following case:

--- a/foo
+++ a/foo
@@ -1,1 +0,0 @@
- foo


git grep -B1 '+0,0 @@' only yields /dev/null cases, so I think it's OK.


  So I think the only real concern is: will a patch version that supports 
renames always behave like this? I *think* the answer is yes, but it's hard to 
be sure of course.

  Regards,
  Arnout



>      package/gcc/10.3.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch:+++ /dev/null
>      package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch:+++ /dev/null
>      package/gcc/9.4.0/0003-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch:+++ /dev/null
>      package/openpgm/0001-Rename-openpgm-5.2.pc.in.patch:+++ /dev/null
>      package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch:+++ /dev/null
>      package/screen/0005-rename-sched_h.patch:+++ /dev/null
> 
> While a few of them could be rewriten so that the are actual renames
> (now that we require a patch version that supports renames), some really
> do want to remove files; that's notably the case with the uboot patch
> for the roseapplepi board, or the babeltrace2 patch, as well as the gcc
> patches...
> 
> Furthermore, some users may have alaready relied on this behaviour, that
> empty files get removed, for their packages in theor br2-external
> trees...
> 
> So we have an antagonist situation: some patches will want to rem ove
> files, and some patches will want to not remove files. We can't satisfy
> both, obviously.
> 
> So, unfortunately, it is not possible to apply your patch.
> 
> If your package really requires that the files be present and empty, you
> should then use a post-patch hook to touch those files.
> 
> Unless someone comes up with a better idea...
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>   support/scripts/apply-patches.sh | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
>> index e5a2fdd09e..6da83f6826 100755
>> --- a/support/scripts/apply-patches.sh
>> +++ b/support/scripts/apply-patches.sh
>> @@ -114,7 +114,7 @@ function apply_patch {
>>           exit 1
>>       fi
>>       echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
>> -    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E --no-backup-if-mismatch -d "${builddir}" -t -N $silent
>> +    ${uncomp} "${path}/$patch" | patch -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
>>       if [ $? != 0 ] ; then
>>           echo "Patch failed!  Please fix ${patch}!"
>>           exit 1
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
