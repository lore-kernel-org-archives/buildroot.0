Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21957C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F36440955;
	Tue,  4 Jan 2022 17:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uPNBe0jABupp; Tue,  4 Jan 2022 17:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71EAA4093B;
	Tue,  4 Jan 2022 17:51:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46F2B1BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 451224094D
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0uc2KHgGsqw for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:51:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6617B4094C
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:51:06 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id j6so151389935edw.12
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=P7U6kLcPumB2cTGn2BO5UEL6MiQkOAh688C+GBZdc2U=;
 b=ZmmRr9KD3nqvzTcidVBCzTZ0Q1iRLcRcTEJt/dbq4JQW8SbhBXcqi0uOVhosXEFQXO
 1cuXd4VLBSFlemyR5LfXw7YLoqZod05M4IR3loRpSdup9368ecPfoKO0j1Q6I/zGEou2
 p0wp5mKS7avQ3TU2gXmA/ZYPMGbfncUIwdlUZPr0uxAbSu2bnjj+IHQXVRMCbKkpDcVy
 4LuTW2xcc5BprScFhzYe7ljoxcxv/4ZLYcph/TLnf25KlS2Rt8VkN9uEfUVd7maXP2rX
 vGS+iZUwlc85UKYvlvLOmCe6sx2kni5WZoOwUpwsHmhhxX7kRQboSu3eYiwVfZVWCqFq
 b0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=P7U6kLcPumB2cTGn2BO5UEL6MiQkOAh688C+GBZdc2U=;
 b=t0wdgxJPKynCp1zBwdz26ZcSnj4wkUh1wpOKRtxYrOuXZab3ZD1ji6wQHL34qKxgmF
 idyd8RZTOnaKj5J+PPZvTqNhd+6OWCsZVxMcsDJcYMFZZp1KoIOJ1mDFfdRM1fQ5dwbF
 7Wp3hnBCWyyWUby1+MZKK97IuUfN63AYBxmE+JrtVzpbpORhfA37v//4JD1TrFDXpywq
 aLYphGquU0WHuCgfnqqopu1hKxPBMKcjpmOUFZBUe+2WHPDVqifll7BnLHY4aEqjvojk
 Erkt34ZbX6i7mxTLHevnJlG6vdD4OEzg3rQAdAADYbEuIqnzgqon8+I/skpWqO8AD7hI
 x2rA==
X-Gm-Message-State: AOAM531yVFG2eTQs0HfD/wYOVW39vRU7OfL8S2GV3DCnlmfWdDTflZjH
 VZ/lLJP5zteyUl3DB4BJVSp9Z47ZrBotzA==
X-Google-Smtp-Source: ABdhPJx2YbrLowYeOIEexaKZ/Dc6bJC9j2DeRuAQKznrlCgBKWiQt6bOEIcKg6t+0i2KG8vA2jzp0g==
X-Received: by 2002:a05:6402:1250:: with SMTP id
 l16mr50525300edw.0.1641318664567; 
 Tue, 04 Jan 2022 09:51:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w7sm14888800ede.66.2022.01.04.09.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:51:04 -0800 (PST)
Message-ID: <2cf41923-653d-2e32-c5d3-352338c918ea@mind.be>
Date: Tue, 4 Jan 2022 18:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Erik Larsson <who+buildroot@cnackers.org>, buildroot@buildroot.org
References: <20220101223900.2970405-1-who+buildroot@cnackers.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101223900.2970405-1-who+buildroot@cnackers.org>
Subject: Re: [Buildroot] [PATCH 1/3] package/tpm2-tss: remove unused
 dependency
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 23:38, Erik Larsson wrote:
> The last reference of uriparser was removed in:
> https://github.com/tpm2-software/tpm2-tss/commit/17a670dd4c0e4effc2ac3cdf021c299fa92df70e
> 
> Signed-off-by: Erik Larsson <who+buildroot@cnackers.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tpm2-tss/tpm2-tss.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> index 71aa3feb96..060883c377 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
> @@ -11,7 +11,7 @@ TPM2_TSS_LICENSE_FILES = LICENSE
>   TPM2_TSS_CPE_ID_VENDOR = tpm2_software_stack_project
>   TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
>   TPM2_TSS_INSTALL_STAGING = YES
> -TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
> +TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
>   
>   # 0001-configure-Only-use-CXX-when-fuzzing.patch
>   TPM2_TSS_AUTORECONF = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
