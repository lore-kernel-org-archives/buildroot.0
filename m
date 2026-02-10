Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97920EA813E
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 16:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A31411CA;
	Tue, 10 Feb 2026 16:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sx6-0dyoLyKe; Tue, 10 Feb 2026 16:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81F1A411F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770740365;
	bh=qUUqyenHzC7+X5+JWGjEL5nXIocuQ9QHX9xnUhV7yN0=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DfKmgcq7B+04Unk8v6A3wZwqNhWrnOpXDvC+LirtLxvu34DOfslPgGSEqe72X+RVG
	 uXN1odqhkeT8WKf8s4xxEB3YqdbOyFnPbhU1EZWs6k8R4Kxm8DwTNJh+6f8JaS2hZ2
	 E6BvnqwLo806f4G1OzbEJ6HCv7bn2STo/Mv2oEAJNLnhlFjjihcbbJuPCBeybLDnYu
	 /rJoKW5mDqtDCpHdd0poskt+QTn9KOlSzbP8Is1EePZY37Hnwk4VUMrNSXBtoMuD7B
	 0UpLv+6qKj1ceeHbiGrEuU7OzOvHw57Hlq32qrNufZNjk3YS9sE9F//G6grey4Z6Hi
	 yP5RlggG8mTQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81F1A411F0;
	Tue, 10 Feb 2026 16:19:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED62E219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D253A608A7
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MoL-vWyjTtf for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 16:19:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A202160712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A202160712
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A202160712
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 16:19:20 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id pqSMvMQyunDG4pqSMvamKc; Tue, 10 Feb 2026 17:19:18 +0100
Message-ID: <61f8d598-74e6-49ad-bff8-bb7395a2a39e@benettiengineering.com>
Date: Tue, 10 Feb 2026 17:19:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20251125145024.602672-1-giulio.benetti@benettiengineering.com>
 <aYIe1pqsEBM8J9Qm@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <aYIe1pqsEBM8J9Qm@windsurf>
X-CMAE-Envelope: MS4xfLC5TN1DuBFDqwtkjTDODerngio3EmF3nJl1fiI8Bj7r95A9UfWBeVU4YqTf5SbWjClXT9g9/jCE3AH1BPJA5OoPnb7LV4oB7t/2WveZgSdSjU1ZrD7R
 mG/gS8tHEfIuMOTvEzz6ZG1uJojGJPhwZcZoN3o6kwklcYpfZGdbrpIIZBCqct/+nqbfvU+1OQtymD8/kpUmkuplxmJiLoFj/oPU7EVxMGfQ4LAAL73zcfqu
 xrs6N3csknmq5e27uBilkGrX/qAwRao4v6Hh933n4IY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770740358; bh=n4cKRX1PwgE2IhgaPZOGmsHa1kq7f7cOwtiK6D2Jvfk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=l8gL+Q3aErWCjKp3fz05al11lzzqgF8VSLij2t20UK3JlS95spOFFcyPVeqogGdxu
 U4r9YM+b05sVM/vFYcbXjFgiFtT6S8TMIVugsGQYCxEzCI59HNphIThcCasOuX+uyz
 8oH9MsX0s86twAwSUZ42MFcxQmwj4kUAvVaeYP/CBWcVVFE/2uJ+GzB/JzSazqTzsf
 6VlicCmUMp+21aLA7Ek3Cor4m4TlQKsVwAPPm3Ewa1tM/DLX6LE+UnLNyw0tj39+3M
 XxjNXi80SbXcnSCOJnSZ519zhON0Pl7cBDiTM9gU0Jva/ivgYtz3KeCXIl6jyU63Rb
 0CM/mAEpGTzEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=l8gL+Q3a
Subject: Re: [Buildroot] [PATCH] package/swupdate: fix build failure due to
 missing include
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

Hello Thomas,

On 2/3/26 17:16, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, Nov 25, 2025 at 03:50:24PM +0100, Giulio Benetti wrote:
>> Add local patch upstreamed to fix build failure due to missing unistd.h
>> include.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> I'm rather confused, because we have been using swupdate 2025.05 in
> Buildroot since commit d5826736d5aa63eb818a5d20338b7b698f66dad7, which
> was merged in May 2025, and this version already includes <unistd.h>
> in network_ipc-if.c.
> 
> So I'm rather confused. Also, I couldn't reproduce the issue, building
> swupdate with a musl toolchain.
> 
> Could you clarify? Also keep in mind that when fixing issues we need
> to indicate since when the issue exists so that our dear LTS
> maintainers can understand whether the fix needs to be backported or
> not.
> 
> I'll mark the patch as "Not Applicable", but feel free to send a new
> iteration with more details if you find out that the patch is actually
> still needed.

here is my mistake, I've picked an autobuilder failure [1] without 
rebasing and thinking to fix it. That worked using br-reproduce script
and I haven't retried to build using master branch.

Sorry for the noise

Best regards
Giulio

[1]: 
https://autobuild.buildroot.net/results/864/8640e0adaed4ec512c62dab73d2b3bb299cb7e9a//
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
