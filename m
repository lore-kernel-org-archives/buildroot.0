Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16463CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCBC3851B5;
	Sun, 31 May 2026 06:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIAladw1y1cp; Sun, 31 May 2026 06:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9605851B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780210368;
	bh=Nfusi2+7PIKiWR9cjChQMvMBLTTeN/zxpnM0NWZACHY=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IyAHHY3RtvnRaeaR50ZnHkfVfA+bn+A6J+T5WscJpTn0RUfAABq4bg011xt0tInrf
	 j7kuOkHTdAIZxIgWh6bcIxqZd9BY8oNC6fAeZc9sxHUHtiHjbKghXlJf/IVOg0xKd8
	 iA6PfXlirhlL9LASp0NdznPFyLP960lkBC1gB717z8SCqzmqp+CH55p4WDsVnRUrL1
	 4XN+SMgkWc3p5MEQjqhNU5IRAWhfZh81IC99b5vweT9iw57or8TxMz+qzIYfsNbOgD
	 DqVGvxWPiCKAajh7hov1rjo/hT/+StvIYCD+LeoGp4uM/VmkpoirBJCrCcL6RdZ+lp
	 qAn69/HrMgGiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9605851B8;
	Sun, 31 May 2026 06:52:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD8A389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00D74851B8
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOb1X03OvrYW for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:52:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24FA8851B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24FA8851B5
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24FA8851B5
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:52:44 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-842307473b5so586937b3a.2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 23:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780210364; x=1780815164;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pKKA6JR7t44RGjLKA9XUT7R3E0k0Sm6L2jXhxpLOLUE=;
 b=kXN921qcvYjnSP0xHnSlfoxraSg5XSGR05wXhsWKlKs5C3LRBS+yG8Bv2c0gL0+E2n
 2SkTHJLIurChG7mNdXlHm0tDKxK0TqqzaDGAnLszm0j4nN2H8NzBc0ASppbI83RusIYL
 X6Hrg8/0souzXKjqAvYsQNadYmGi7zduK7KfV9KOqaPr4NYlobmh8d0HynaqOwvYnsEB
 djG+SgcCKh4MTD0osJibgbodpqqV0MzyG/yX+xzEG6SDXsYwtfHfKaNthpCBZvvsgRnW
 vXzLtOtcm3yGNm251xDwo6hhfFMlGjOx8knh9K+js+wwEMYJMuQYi1cDAZ/qQT78GBqo
 bWhw==
X-Gm-Message-State: AOJu0YzuOoSeo6autuclKCZne4vIZXgLlPq1ugqpHSIPO7UxJ5h0y0Tz
 Udb6bnq//eNuWHv9/pCQAgyhmqh2pDDEfm1G5i7AbOC2axLpsNODf/9QLtChuINf
X-Gm-Gg: Acq92OExHbwSwAg85uAGJcer/3pmiuZcGLV/1rpOZ+m8cqu4vS6myMtsm6IxozOvcu2
 EuncvtKGVwSufvvCEoewdyY1vobqDJ9oYR93aMZn9rn39Y9y4Z5bL8Nbqx8kt7rbzOaozI8DsNf
 HJaJqgWbDodmisBr+AlNl9xQp1fHwLWnS1+vHSubxsF/X2tEayKXKTsryJokn0X9e+RIjFG2JFV
 eplsOXrFeYFlUVE5RtAbMd9fexVp+PRLj0LuzI4BZhe/eCpeqE/ZjEmoszcHr6bBL1lEflwIsnt
 +M5zt1mAM5ErL86P5ik3Av5P09TbBRxA/LqmZqnEbMsckclgc8xOj3hRMpOALM80Y61emgZseOP
 lbw1ofpj+0TfJsT5/Gg4kzpfGM0YMYB2xnCeI0Z/N9h3jZdJIoQM10+2rg8T2dHL6tC/CW5aYXb
 L87OT34oU2xmHz3NVAKoBvgPhx7V/zDXXcJmlE9liXzeXxKg==
X-Received: by 2002:a05:6a00:340c:b0:823:1c5f:1c43 with SMTP id
 d2e1a72fcca58-842258a1f7fmr5819980b3a.36.1780210364131; 
 Sat, 30 May 2026 23:52:44 -0700 (PDT)
Received: from fedora ([2409:40e5:104a:da47:4380:deff:ea92:2138])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8423a790c04sm2112722b3a.16.2026.05.30.23.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 23:52:43 -0700 (PDT)
Date: Sun, 31 May 2026 12:22:38 +0530
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <ahvO8oJniQoAzSPz@fedora>
Mail-Followup-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 buildroot@buildroot.org
References: <20260502173806.2666814-1-chakrabortyshubham66@gmail.com>
 <ahte4jnN6VBRtafn@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahte4jnN6VBRtafn@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780210364; x=1780815164; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pKKA6JR7t44RGjLKA9XUT7R3E0k0Sm6L2jXhxpLOLUE=;
 b=NpCU8bS2kOhNeB4ChIxRkPlTaiB69wtm8PG9O974pq8kH7H2CntXeremCRhwBb7jh+
 CntnQaXDdLAnntnBuroiQe/iDLsHh5CAHaaEswgvOd3ICKoR7RnzsBBAUwlLup2JQFG3
 2TwwaBychwLqpLdhVikqZjbt7VjCperdvDtHKKxpQyBxIiuGa7C/y/UfSsY7sjauGNP/
 J/5KZj0l+Ck6Xj2mg9yHfOWOZfbwcpCVgO9gLxovvgonoDfJZE5bi1BdyvmTFVmddWcy
 f0DE32UdQNUTZHHtXN0QkmkUNiwWhxRQA0ZqRsOd1n9SwPVIJaGjlk8VllPBofplUYcU
 mGxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NpCU8bS2
Subject: Re: [Buildroot] [PATCH] package/ncurses: bump to version
 6.6-20260425
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2026-05-31 00:05, Thomas Petazzoni wrote:
> On Sat, May 02, 2026 at 11:08:05PM +0530, Shubham Chakraborty wrote:
> > - Fix poll() handling for closed input with proper errno
> > - Security fixes: limit-checks in _nc_write_object, _nc_trim_sgr0,
> >   read_SGR, and _nc_mouse_parse
> > - Terminal updates: konsole-direct, mintty, linux-alt1049
> > - Various bug fixes and improvements
> 
> Where did you get this text from? It is nowhere to be found in
> https://invisible-island.net/ncurses/NEWS.html.

I got the reference to the page from the repo itself
- https://github.com/mirror/ncurses/blob/master/ANNOUNCE

"Full manual pages are provided for the library and tools.

   The ncurses distribution is available at ncurses' homepage:

     https://invisible-island.net/archives/ncurses/ or
     https://invisible-mirror.net/archives/ncurses/ 
"

The changelog can also be found in:
- https://github.com/mirror/ncurses/blob/master/NEWS

> 
> Also, you're updating from 20251231 to 20260425, there have been
> multiple releases, so surely the changelog is longer than that.

I paraphrased the changelog incorrectly and incompletely:                                                                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                                                                        
- The poll()/errno fix is from 20260411:                                                                                                                                                                                                                                                                            
  https://invisible-island.net/ncurses/NEWS.html#t20260411                                                                                                                                                                                                                                                          
- The _nc_write_object, _nc_trim_sgr0, and read_SGR fixes are from                                                                                                                                                                                                                                                  
  20260418:                                                                                                                                                                                                                                                                                 
  https://invisible-island.net/ncurses/NEWS.html#t20260418                                                                                                                                                                                                                                                          
- The _nc_mouse_parse fix and konsole-direct/mintty/linux-alt1049                                                                                                                                                                                                                                                   
  are from 20260404:                                                                                                                                                                                                                                                                                                
  https://invisible-island.net/ncurses/NEWS.html#t20260404                                                                                                                                                                                                                                                          
                                                                    
 
> If you're using AI to generate those patches and their commit logs,
> stop immediately. We don't have the time to review AI slop.
> 

I used AI assistance when drafting the commit message, which contributed 
to the inaccurate summaries. I should have verified the generated text more 
carefully against the upstream changelog before submitting.

I will send a v2 with a proper commit message covering all intermediate 
snapshots, written from the upstream NEWS file.              

Best Regards,
Shubham
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
