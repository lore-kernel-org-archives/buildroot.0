Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D87CD65C5A
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 08:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 217FF405B4;
	Thu, 14 Nov 2024 08:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdJXCIs-3JMH; Thu, 14 Nov 2024 08:35:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D810C406E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D810C406E9;
	Thu, 14 Nov 2024 08:35:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6402FBF
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 08:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F74D400C5
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 08:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TIF-5DlB62Y for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 08:35:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.24;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6368400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6368400D2
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6368400D2
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 08:35:33 +0000 (UTC)
Received: from [192.168.0.66] ([88.171.60.104]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MrQMz-1tWU4b3Jxv-00eqSj; Thu, 14 Nov 2024 09:35:30 +0100
Message-ID: <e3e6612f-a9dd-45a6-89eb-9165788c5b8b@green-communications.fr>
Date: Thu, 14 Nov 2024 09:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, Buildroot ML <buildroot@buildroot.org>
References: <1af29766-5cfd-47a5-adb5-d90ff42dd095@gmx.de>
Content-Language: en-US
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Autocrypt: addr=Nicolas.Cavallari@green-communications.fr; keydata=
 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
In-Reply-To: <1af29766-5cfd-47a5-adb5-d90ff42dd095@gmx.de>
X-Provags-ID: V03:K1:LzczzJEF2ACX0iDvw3M2PUC1rwJc4fgfzT6mHl3xDmwi9koYlAp
 Fk4DxWtoJZ2+BoFIy6uM0oUtWNxGInKvOcAH2prgfQ6s9IQTtd9N125yov5HBDIjY2FXr3O
 ybXVGUKXF+lBtCy7N9Hy6GtAlddwouIMkuBAx6hEehwkWGN+hGoF8uVB74TX12kiZq41oMj
 041neUlw8wJ3EO/1XejjQ==
UI-OutboundReport: notjunk:1;M01:P0:YJh17PaqxOw=;fxVuYGwXUv2hCZczGFu0R+7+i69
 g1GxkSrJHwGmi8QLUz+eJtgQn953xSOUZ33jnCTiZH92Wc2bRNSQQVudNs2mMVzb8YjUovu2e
 ygDgUYg6IgpHlSToFUZaEPjGgSse1n3paaxsEH96L0PLgKBLxTiSNAQMa/8/TX2qs8IZGIMtU
 iI+DDJGuS1vPqrk92W74MrupGIlHKtsnVO7sMu3k/eMxOWIY/rZ/bAyl1vvP8+SFnCuJJjIUV
 +5wPqAVjj+0PfSxSt26FA4b2Y6eMZJsVjMCg+Gj8sj6+4fAXpei1u2cvp+PFWthhVYqW92utl
 NlaeRbaPWrSAtezDxVJLZp5ZKd1nbh9i9KT9e3P6HdEa2Izx5Fsr3eCyqrPHvXaSdrq3h925e
 mrNuhauea7F2y5HXtEQKDC0qtiKWm6mRO98vUEMUQN4Op/Zi3x1h90imrLAq8ycJfKfzaf3iE
 5DEKQ10yWzjvdAKJ0Y/2eV4GkRxpSqbXU+nn2OSB/XbnG3gQEhb+zQKmt81zs8ydSHUbF59il
 08xdl24wV6KqPBoEQqbZw2wktaDt/POORQktEvqviQJKK8FEb7QA2q1JVX5bllfAy19ikyhEe
 ZSKwZbDeR2+sVwg3VGd3lz0e7x9mQkiv9brEEgb4KYTst1s6zq7HUtPpp9qePoXh1aDSIcC/i
 ldVFsjvf5mBL7pJUuZ53WFCQwNHl1VZ7rhfM7b1milkczCeIcH8TrpKgcussIF8wk57YLpuYZ
 wpXcvyJvs6YDjn++Hd7thLs+sBNVkSbmm8Ati8gWBVhh/MVSLMjomIorLhgVhNpgF9HPGSohE
 KjwK2erXZhmuTV7bkic7p0FEJjxekNsmlRP7yBsG3xh3j38Cq/QiRnkAB7y4s6bbut
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] Consistency check for UID/GID tables
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

On 13/11/2024 11:54, Fiona Klute via buildroot wrote:
> Hi everyone,
> 
> as pointed out in the documentation [1] autogenerated UIDs/GIDs might
> cause issues if they change during updates, so one should set stable
> UIDs/GIDs for users/groups owning files.
> 
> I'd like to create a consistency check, to make sure that any files in
> the generated image will be owned by users/groups with fixed UIDs/GIDs.

Isn't fixing the UID/GID of users enough ? Since Buildroot typically uses 
usernames to define permissions, making sure users never change their ids is 
enough, as long as user names don't change. If the username changes, we can 
probably assume that it is intentional.

The only problem with this is that makeusers is fairly limited. We cannot 
specify "set the uid of this existing user" or "add this existing user to a new 
group" without overriding all other fields for that user. I have a local patch 
to work around that, but it's incomplete and I don't think upstream is interested.

It would also help to be able to forbid the automatic UID generation and fail 
the build when it would be required. But the last patch submission that could do 
this was rejected.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
