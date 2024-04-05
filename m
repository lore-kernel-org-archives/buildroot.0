Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6670CD11C2
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 09:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 730AD82174;
	Fri,  5 Apr 2024 09:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8hZMzBFNChK; Fri,  5 Apr 2024 09:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AA09821A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AA09821A8;
	Fri,  5 Apr 2024 09:21:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 387F11BF5F8
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 09:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3253E407CB
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 09:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnf6GH9ZHczE for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 09:21:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E40D407B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E40D407B7
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E40D407B7
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 09:21:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 3BD241814B9; Fri,  5 Apr 2024 11:21:03 +0200 (CEST)
In-Reply-To: <20240404124329.768546-1-thomas.perale@mind.be>
References: <20240404124329.768546-1-thomas.perale@mind.be>
Date: Fri, 05 Apr 2024 11:21:03 +0200
To: "Thomas Perale" <thomas.perale@essensium.com>
MIME-Version: 1.0
Message-ID: <21d09-660fc280-5-914bd10@117861333>
User-Agent: SOGoMail 5.9.1
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1712308867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gOQOsxqN6yJbEscdpS7NKDW6sQ9AndpgVe59KWrntyY=;
 b=KNiTeHFnY5mqvDQ87Gu42RP9HK4cE9vNFEDHrmIoaiZau8Np3s9cmlAi2mGlAB5wGeWTPd
 tjPVhuBBQiiwIVDCIpzcnhGAHGMU55E9FA19CWRSYoO3LR4AcHN/2pXwKmGI85Ab71P/PO
 +c/4xea3Q90i3kSIau2OqGyHVeNW5Yo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=KNiTeHFn
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BRFC_PATCH_0/5=5D_Support_SBOM_in_Cyclon?=
 =?utf-8?q?eDX_format?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Robert Smigielski <ptdropper@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Great that you're taking up this topic. I'm highly interested because I'm currently generating my sbom "by hand" using a small python script which
converts the output of show-info. But yours is already better as it adds the dependency info and also fills the purl field (to the best of its knowledge).

Did you see the work of Robert (i added him in CC)? He submitted a script to the list some time ago which can run on the manifest.csv [0]. 
Maybe there are some synergies.

First feedback:
I created my SBOM using your patchset and put it into our dependency track instance. Looks promising.

One thing that I noticed: 
when running `make cyclonedx` I first get the output of wget which retrieves the cyclonedx schema. 
So I have to cut it from the output to have proper json. Maybe you want to silence this in some way.

I'll keep playing around and will give you further feedback if I'm noticing things.

Regards,
Michael

[0] https://github.com/CycloneDX/cyclonedx-buildroot

On Thursday, April 04, 2024 14:43 CEST, Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
