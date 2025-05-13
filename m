Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE00CC3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 11:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A491E40DFD;
	Tue, 13 May 2025 11:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xooGDCJsJAsg; Tue, 13 May 2025 11:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC2D240D84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC2D240D84;
	Tue, 13 May 2025 11:08:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D8A712A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5320681516
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBcjjCsubcxn for <buildroot@buildroot.org>;
 Tue, 13 May 2025 11:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B095C8149E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B095C8149E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B095C8149E
 for <buildroot@buildroot.org>; Tue, 13 May 2025 11:08:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1676373712; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 May 2025 11:08:48 +0000 (UTC)
Message-ID: <2bbbdf5e-2450-4d2f-abd2-e0bb210c14ba@korsgaard.com>
Date: Tue, 13 May 2025 13:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, mmayer@broadcom.com
References: <20240817000027.654079-1-mmayer@broadcom.com>
 <20240817121031.55afa6c1@windsurf> <87le0th808.fsf@dell.be.48ers.dk>
 <CAGt4E5t-csHham0e-xuhhXj-sq8fn6qd3ZbOyrutf3uNHgqKKA@mail.gmail.com>
 <87h6bhgf6a.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87h6bhgf6a.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=POh8UvAoco2iicpVtS93MyFZrX+J3eJGPNrdeB8Ab5eNLQp0+VK8eXDLk9n4kGNYkL0TPSRj4GkuWZu/CWn1XZWqEg7Ot4q/5BOUPDvnG1dq6YZrR/YNCdW12VvAHtFOuFOXEpb47yNOwUUeKnK1OmIP1nRwWzylV7vwsBqt74gWu1EEtJCBN/4UAEYHRSe5xIIVvp31VsE9OwnJ6CScqcUnXzCZIJ4BrHIN5lMpSD4cESJffkrdokSOis0Ry2HB9bvZVZn9fCriRsDTodRvNrZCK20swO6EpYlgWRiF3I8riozScXfF57oZ06CI+a9FIcudj5mo+ncYb+nSyuZC8Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Gl7yTWofGgAaBSh5/utrI2xed9zDhZerVwBas1+7f4M=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=POh8UvAo
Subject: Re: [Buildroot] [PATCH] package/dropbear: provide config option to
 turn off SHA1 for RSA
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/19/24 09:11, Peter Korsgaard wrote:

> True. It also somewhat depends on how fine grained configuration options
> we want, E.G. we could also simply handle the RSA_SHA1 option under the
> LEGACY_CRYPTO option WHEN upstream disables it by default, but then we
> have to wait for that.
> 
> Looking elsewhere, I see that openwrt handles it with a "modern only"
> option to only enable modern/secure options, maybe that is a way to go?
> 
> https://github.com/openwrt/openwrt/commit/bf900e02c7102601be2e9280231711e70f065877
> 
> Related to RSA_SHA1, I believe the original reason for you sending this
> patch was to disable everything related to SHA1, but SHA1 is also used
> for HMAC and key exchange, so we should consider disabling those as
> well:
> 
> https://github.com/openwrt/openwrt/commit/2d9a0be307b534ceb717267c95402d1d707cd2c3
> 
> What do you say?

This never made any progress, and I have in the mean time applied 
https://gitlab.com/buildroot.org/buildroot/-/commit/05fb4526f909aac533ed943977d4eeabd0b9b4ac, 
so now upstream has in fact disabled SHA1 support by default and we only 
enable it when the legacy crypto option is enabled, so I will mark this 
as superseeded.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
