Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA72606A330
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mrg/V5zR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31AD40726;
	Tue, 27 Oct 2026 14:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxg1Lt-K74oZ; Tue, 27 Oct 2026 14:28:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C630940732
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793111298;
	b=lIgJLh39EfJGB8Cr08j8YEC0krQCF8IGge/k5Kn3j6I6RjWDEyS0mjwqi8LQVjqCbLtS
	 +ScaLNTo+GERbCvKGv18eA8U7oLx5xEdSTcHSm4ZcUipFE2sZjpodqOzJOx2MOnnRGUGR
	 J1vY3/SU59G8Ci+3BD4K0APW4xs3cu3UkxtPXaKJdBoiJp7dha34Za1cgvqmIA78ic4Qg
	 Q6lKU0ZI13LSO5bpXLv3m8L6mQi0EWma5rnqWsc4VJQgxDrwMMolpBQviHXy/Eg1Lu8vv
	 Fhm6SDzXkjQo4nCqHxfWuCpULQU9Z3Ly90x6q51psfINABWC8YjuS08sZPrtrfQgRtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793111298;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=TDXnIk4f86GsIoDk4wTRmVXA5dINJpamyeG8WTz6aLs=;
	b=FftKq6e8O3KLQiMWhQuy8OpzW68P036SEvwwkcb1cxdKfirhUc6Z5qQ/Jbnrw8NUjrB+
	 bPDqF4ftHEWAOV875ootPa1rh6YT3TQw0EJy2+EujW/ibydkM6nqRZm9fgyTUyts15Xa6
	 3b4vo3Qa1NsE07mDxW47pdicHPmvnC7nY4lDHVeX1GQbdlBshxUK4FPZyhsNvR34Q2wyl
	 iYfPFTtHYF4HbKy1mepM2CqKQCpG1seoVDfM9F2/mUQQNgay7FKv2QfT5pr1gdjCyHLyA
	 3DLXE0cnQHydgaCxulqKN9YBSM04g8TX0zJl2/B+ruYLfhXHSZDtzPVYz4ng5Qt9U1g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793111298;
	bh=TDXnIk4f86GsIoDk4wTRmVXA5dINJpamyeG8WTz6aLs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mrg/V5zReOJ4CoVGD4f9nMwjy8RYQp5MUDzKKn8lBlbyU+0RiR00HG/i9pvNCo8N6
	 4ON41rY7Xcp+0fWYH6ris6lxJI9oE3p352xso1v29gDTmLnfr1/mODDAHg+alGiBaE
	 3HZUTJo44ssIzvlVYW0bZw+jNCpfHmhP+XLDBZQu47s6tTkNi9eLqiIgo2z0q8aKLM
	 DoFJBeeamITw0FthdyaXBshDsRBZNOQALEzEQr3XzurHCbec5oMbVT8aPj7Vgpv2P2
	 fSgm5SkaqVDHdTPFN9NSEF5ZDt27KIWuUyylwfKK0HAe0w+c6UKFrJDuJaPcfea2Ae
	 iPyF7eOe3+Vsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C630940732;
	Tue, 27 Oct 2026 14:28:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDF23279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AECF980DA2
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oeC0fQbPv-_c for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 14:28:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C745C80BD4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793111295;
 b=Il707cCd9Cegmr6gc/z955fMWI0e/1fV+PBwEEUB3C1kYyz82M8WXOrLnojMGKn3rll4
 Y30tKhTsbCH9Cjg2pqG7qZ/16n0k7km+HLJZOqSfewPYj4Xz4+A19R0l4ZiM++Dt8jrW3
 3cGAT2hajpQMOqiOw2KEh8HmrDXy0f5rrdm0N+l77nui0g/OnfE1AFVJMRya7ffuAxINn
 biVqj5hjHzJDy6ME3Y0+PF/6t9IJDY9BoFI93KKwCRnXsLVvmg+nDVGono9f2grnRhWv2
 s32RU7r0hcwb6OwMCBWvF/u9xIGwxJHhs3P3Gk3w6HH7nbiU59RRHD8TtdOIeUpOYEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793111295;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=6dDpILnVmuEj7RQiMTwEeW9JDPZGgguh/E6xtMZltgs=;
 b=rqHJWiQo79r51e8MjPtLbfOMIy+sJ0FHtmYNEpHOj8lVn9aNadOAJMw5cGqUynHK3sIP
 3J9CJSr5O4uuCuAtNSH1R6EwOaL+SeS95vEoKfqqO8YLJzMMeR9SC83RQj/G/7otvuf8k
 LSn9L+1fRftXEkRskl0wmfTSoasvh7LmmZwJGnT1TAizx64dtgxByhREQNtg9e90sZhkB
 Jp7ZzSDBp9qptiuZHMRbD30YPXFqtfWNPiV7ZXWqdi6QveiBZsT5u4soUHKpMikDkBGCx
 wAjSX4x+CxNnNqTtXd6YX+nsOtiomCZ+B69oVsfX+QfY/+GxhoFt0LBCEBv70wXrzow==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ya+glPFO; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C745C80BD4
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:28:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a2069b9710so40681545e9.2
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 07:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793111292; x=1793716092;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6dDpILnVmuEj7RQiMTwEeW9JDPZGgguh/E6xtMZltgs=;
 b=e1yr6FgGfEf6xDWvbsZq1mUDhpIkT6tBVqhBlMgPKmZCXHlHY7rdU83kWPzZ4jFbim
 Q6Lh93eaRTP7oiZbftDvoavS5kj4W3BGrSfiSUcsipsnj1cGHC8XHzO5i2STfmL7o//e
 +C2I3mZGJx4BvTEbn/aX9cs+sqe9ybdHobTxEO9kLTjuqGIlfcFaYSpxCith7TzKBvoR
 fK/JKa+ZHdxafXvfL/MsKVW60HUTjsRGGcmtYDdZGrZ2O6XGO4IlKoMbdiafI9QtFw4V
 yC3seaEg7xYiU6NIbaHT0yOaxv+t8TzApoj0uosbvEVZP+VAO7ONY8iZI5+Q5efEdaTW
 xvIQ==
X-Gm-Message-State: AFq9FYL6kG6Tz52lt9cUU3bkJCls7zUyma8YnkSth8YHK8vr5CqC92Sa
 38emWFIN7W4B4uB/yElQyo+/N/LfJwzkgGUGPM4b8m2s/u2BOJvKbVkKcTy3FPRrhhCLdzi89GV
 4PsB2
X-Gm-Gg: AYBFou2Y3/CWiCEgXtOyvvKuK1VCAYD2CE5PtSwE4JFYewVIE1dFjjRFdu0QQgmLLb+
 yfjEBzqD/vzzCb71krM9ortptfVKrzrS8FnOtFrrh1KxY5DHyyd49PfCKSCWtWb/0N+96o1eRyL
 teX7ZiaQwzC9IOMmag5zCJPaaMJOX2vMa2tSevSfFCnYcq/jFPSA60fekPJc3vk4Z026RhreMa/
 lojTmM8jbP4rvU27dBkRwwTKl8F64cBeTR4y/X7zBf9RQHHCk2oFTVK21aYZHjb6YZuv9wTHcGo
 1M4E67pGL5NxsZH26bnQhGShKbc2/SF1I+xiww1QQ55XG+FXBo2soUOVE5KPGTta+2YkD+Bap6o
 /QtPpQd+yDuQvD1KaII0YvF2SKZyUqIl0UhjsOf7B/4HMzwuqfxhyKhNKd2LYYLRhHgdP12XJVl
 9Q57Tvj0Tw9F3Drhgi62i2/iBtwovd/hwZVolFOmYU+GcbeeesLG4SKflrGn/ddiTTiIhTJp0x0
 ohyWQS7873kRQNYqClQQVMLKJSq9fteIGQPGOWcZv3zco38nLy3774cygXYN5ZiNMRUWBnwa/Fc
 eOupKltJP1XF37kainTJrebDfGNFydIGba+oLUH5zrGBIPji4MXgwsaGBsVS
X-Received: by 2002:a05:600d:2:b0:4a5:1c2a:4bb6 with SMTP id
 5b1f17b1804b1-4a51c2a4e51mr122430125e9.32.1793111292158; 
 Tue, 27 Oct 2026 07:28:12 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a029332sm241051775e9.4.2026.10.27.07.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 07:28:11 -0700 (PDT)
Message-ID: <1821420c-9127-48d2-b120-3854bd610791@mind.be>
Date: Tue, 27 Oct 2026 15:28:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20261027101235.2876416-1-titouan.christophe@mind.be>
 <auCgGxiJaYUrMKSA@windsurf>
 <CAHDQB6PGTdFpdKPo3BZj-W+zU1mvNuwYjjWB+R0i2hkcfQMeOQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHDQB6PGTdFpdKPo3BZj-W+zU1mvNuwYjjWB+R0i2hkcfQMeOQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v2] package/mender-update-modules: fix
 LICENSE hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Adam, Thomas,

On 27/10/26 15:18, Adam Duskett wrote:
> So crazy that I have a pending patch I submitted over two months ago 
> that was
> not only reviewed by you Thomas; but I responded, and then the patch was
> ignored.
>
> Then this one is committed in just a day?
> https://patchwork.buildroot.org/project/buildroot/patch/20260807125510.1285300-2-adam.duskett@amarulasolutions.com/

Sorry, I hadn't seen your patch. I encountered the LICENSE check issue 
when checking if some other fixes would apply to LTS branches, which 
runs `make <pkg>-legal-info` as part of the process, so I just sent a 
patch right away to fix the issue.

I marked your patch as superseded in patchwork now that this one has 
been applied.

>
> Adam Duskett
>
> Business Development Manager
>
> M. +31-627-966-675
>
> adam.duskett@amarulasolutions.com
>
> __________________________________
>
> Amarula Solutions BV
>
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
>
> T. +31 (0)85 111 9170info@amarulasolutions.com
>
> www.amarulasolutions.com <http://www.amarulasolutions.com/>
>
>
>
>
> On Tue, 27 Oct 2026 at 13:59, Thomas Petazzoni 
> <thomas.petazzoni@bootlin.com> wrote:
>
>     On Tue, Oct 27, 2026 at 11:12:35AM +0100, Titouan Christophe via
>     buildroot wrote:
>     > The SHA256 sum of the LICENSE file was incorrect, leading to a
>     failure
>     > when running `make mender-update-modules-legal-info`. This seems
>     to be
>     > the case since the introduction of mender-update-modules in
>     Buildroot:
>     > the license file hasn't been updated upstream for more than 7y
>     [1], and
>     > the buildroot package was introduced in May 2025 as Buildroot commit
>     > a474642fdcd8 ("package/mender-update-modules: new package").
>
>     Crazy that this has been incorrect from the start!
>
>     > [1]
>     https://github.com/mendersoftware/mender-update-modules/commits/master/LICENSE
>     >
>     > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
>
>     I've added a Fixes: tag:
>
>     Fixes: a474642fdcd8 ("package/mender-update-modules: new package")
>
>     and applied.
>
>     Thanks!
>
>     Thomas
>     -- 
>     Thomas Petazzoni, co-owner and CEO, Bootlin
>     Embedded Linux and Kernel engineering and training
>     https://bootlin.com
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
