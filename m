Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBB0C433EF
	for <buildroot@archiver.kernel.org>; Fri, 26 Nov 2021 07:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 674EB403F8;
	Fri, 26 Nov 2021 07:43:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id imsgYhP5csHe; Fri, 26 Nov 2021 07:43:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B204C40309;
	Fri, 26 Nov 2021 07:43:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B2531BF395
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 07:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B13A40309
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 07:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5k8HLM67AvE for <buildroot@lists.busybox.net>;
 Fri, 26 Nov 2021 07:43:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8A654013A
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 07:43:46 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z5so35275793edd.3
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 23:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=i0c7hTO8NzC47jX4imm5urSwSQQ5YrCrzo1g14AIB3Y=;
 b=PP9ctRzv6e2hI5Do0sq8YdtvJoXK3fnzTxSfv4DoX2O5y7Wjl0uSGWQGkE+BafUK8h
 TnBtNRQUJwzk4+50Hb8QPLrSA1qAAXd30+EeovlfxpQkV6sEsvWza7cyhADe1WMMKejD
 rrx62IcNka95Uw38aAcPAp6MvPaGEoXzppyjNtnNkCwQ5FjUl715nzSxZwUVNbghICb/
 VYpcAEBQYSN/1xbOtJxst6yUnuu1yCISyKG4hcPbJx07wG58gKncG28rrd/nGxW4hsOy
 NeQe4CGQWVjjD/YUw9VzA6hS14Kd/yf4BBAv5vrKDtY3Ycy7tvWc76ROjvAktJ4PBnrB
 ihHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=i0c7hTO8NzC47jX4imm5urSwSQQ5YrCrzo1g14AIB3Y=;
 b=6oSR85X3t3A5PCZV5m8T98ryQTE2zuJ8L37TPDznf/5K9wKpygWJ2h45HrldvVXo1L
 iT6tibZ0FNdstWIRGg+VX05ZG6+xAH+Lp+XgA2A2QH3NgtNqWZ3x3B5flmrexwdjz6Z1
 w3KmpVGNm/mT+GMUymVBmcZJaF9NHWfKnYcu92ZCuKx3zucZTeLGlMiEXfsN0q5mmfK0
 p6KnzHkn1SM+tVNdMCOKCMyOESi5aoHkuoVppRdvuBOkgbRstUBR/RAlzjG7QeyDoFwq
 EIS4VVjXblzGN28dQekQ5rk3G/abdICqRonYvcCQUGgS6HjQNP/FVBNqhcpPiUF6w83/
 b5Iw==
X-Gm-Message-State: AOAM530ED8VMqhvmv1z5FjS++1bwWQ0MFhwow+ta+mpQSgrW/wn8ldyv
 a/pazHiqCjwrJBCghcsfN2boYCBNjnF+6w==
X-Google-Smtp-Source: ABdhPJw/TfsRBJgFaLgF/Ec1vF6D1JiWi+sEYirecg6zU878FNwXbUNvyEnKQJbMJIfhWfNmwva/tw==
X-Received: by 2002:a17:907:118d:: with SMTP id
 uz13mr38451546ejb.334.1637912624822; 
 Thu, 25 Nov 2021 23:43:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e8sm873373edz.73.2021.11.25.23.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 23:43:44 -0800 (PST)
Message-ID: <7e4e5e36-0098-7590-9fbf-890b6a740543@mind.be>
Date: Fri, 26 Nov 2021 08:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: "kelly.devilliv" <kelly.devilliv@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <DA4933D9-0555-4EE2-9423-A697BFDEA99B@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <DA4933D9-0555-4EE2-9423-A697BFDEA99B@gmail.com>
Subject: Re: [Buildroot] How to uninstall packages that already installed in
 output/target
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



On 26/11/2021 08:33, kelly.devilliv wrote:
> Dear friends,
> 
> There is a problem which confused me for a long time. When I firstly compile 
> buildroot with package 'A' enabled, then it will install all 'A' related files 
> (libs, bin, e.g.) into output/target directory. Then I disable 'A' in menuconfig 
> and rebuild, but the pre-install files still remain in output/target directory 
> and are being packed into the rootfs. How can I uninstall all 'A' related files 
> after I disable that package? For now I can only delete them manually or clean 
> the whole project and rebuild it again.

  That is indeed the only thing you can do: clean the whole project and rebuild 
it again.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
