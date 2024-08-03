Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58711C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 17:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6299140137;
	Sat,  3 Aug 2024 17:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbgXPj5m5YxT; Sat,  3 Aug 2024 17:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BBF240198
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BBF240198;
	Sat,  3 Aug 2024 17:15:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80BAB1BF3AE
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 17:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E5F1605C1
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 17:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SY2GArgo1z1u for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 17:15:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::42aa;
 helo=smtp-42aa.mail.infomaniak.ch; envelope-from=philip-dylan@gleonec.bzh;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69DD7605C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69DD7605C0
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::42aa])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69DD7605C0
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 17:15:29 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Wbq8Z4PKgzfrs;
 Sat,  3 Aug 2024 19:15:26 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Wbq8Z1gQFz9Fq; Sat,  3 Aug 2024 19:15:26 +0200 (CEST)
Message-ID: <5f33a2e1-e2bf-4c4c-982f-f89c85f05a28@gleonec.bzh>
Date: Sat, 3 Aug 2024 19:15:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
 <20240801153432.1741409-1-philip-dylan@gleonec.bzh>
 <20240801232014.6ec310ce@windsurf>
Content-Language: en-US, fr, fr-FR, fr-BE
From: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
In-Reply-To: <20240801232014.6ec310ce@windsurf>
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=gleonec.bzh
Subject: Re: [Buildroot] [PATCH v2 0/2] Udoo Neo kernel update
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 01/08/2024 23:20, Thomas Petazzoni wrote:
> On Thu,  1 Aug 2024 17:34:30 +0200
> Philip-Dylan Gleonec <philip-dylan@gleonec.bzh> wrote:
> 
>> Philip-Dylan Gleonec (2):
>>   configs/mx6sx_udoo_neo_defconfig: bump kernel to 6.6.43
>>   configs/mx6sx_udoo_neo_defconfig: add hashes
> 
> Thanks, both patches applied! A couple of small comments to improve
> your future contributions:
> 
> - In the first patch, I added a short extract of the kernel build error
>   being fixed, and also a link to the Gitlab CI failure being fixed by
>   this. See the final commit
>   at https://gitlab.com/buildroot.org/buildroot/-/commit/44b921f605dffd07bb6294e6368c2ace34a08266
> 
> - In the commit title, we normally use "configs/foo:" instead of
>   "configs/foo_defconfig:". No strong reason, just a habit, and we like
>   to be consistent.
> 
> - The wrapping/paragraph organization of your commit messages was a bit
>   strange and not really consistent with what is done in Buildroot, but
>   also in the kernel. Basically you tend to do:
> 
> Some explanation here.
> Then some more explanation that might
> span multiple
> lines.
> Then another explanations.
> 
>   While in most projects, including Buildroot, we expect:
> 
> Some explanation here.
> 
> Then some more explanation that might span
> multiple lines.
> 
> Then another paragraph about something else.
> 
> - If you do have this board, it would be nice to add yourself for this
>   defconfig, and its data file in board/ in the DEVELOPERS file. This
>   way you will receive notifications when the build of this defconfig
>   is broken, or when someone submits a patch touching this defconfig.
> 
> Thanks a lot!
> 
> Thomas
> 

Hi Thomas,

Thanks a lot for the merge and the feedback, I'll make sure to apply it
for the next patches.

Regards,
Philip-Dylan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
