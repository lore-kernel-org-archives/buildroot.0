Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CEFC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 11:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA53606CA;
	Mon, 15 Jul 2024 11:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8b4IK7srfyyn; Mon, 15 Jul 2024 11:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8B1D60780
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8B1D60780;
	Mon, 15 Jul 2024 11:38:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 066631BF3D9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 11:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0101F600D4
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 11:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zgdlr9-voWo for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 11:38:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=p-bhagat@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 201EF606CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 201EF606CA
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 201EF606CA
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 11:38:53 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46FBcoUU101349;
 Mon, 15 Jul 2024 06:38:50 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46FBco3a083946
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Jul 2024 06:38:50 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Jul 2024 06:38:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Jul 2024 06:38:50 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46FBcj4T015691;
 Mon, 15 Jul 2024 06:38:46 -0500
Message-ID: <6e454fb2-3a2a-42b8-9ace-87f0446ad1d1@ti.com>
Date: Mon, 15 Jul 2024 17:08:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20240429092326.3247116-1-p-bhagat@ti.com>
 <20240709225840.3f852ad5@windsurf>
 <efe068e2-2721-4986-a514-c848b8fb4442@mind.be>
 <20240710111557.6bd8439e@windsurf> <87ikxdk2g6.fsf@dell.be.48ers.dk>
Content-Language: en-US
In-Reply-To: <87ikxdk2g6.fsf@dell.be.48ers.dk>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721043530;
 bh=BzKSFN+l16HAOkTw86aqMqnVIn+zy9NzNhuTQA4oFGE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Li2JVeLSGDROFFS3K9bRmeEyN8W2n9u6vjRpOxh09Lsv4DcCQBSPS59f48rHXArkl
 ldnMlq2DlLFZZwA1BiKD+s3huVF+GJJ65YLrTkq/3I4Y/hoin0s9Qt4qOCYMJByczJ
 OeZjH/KRzkNCEnU3G7jPXxKgVZkeCxmaGQjuJdv0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Li2JVeLS
Subject: Re: [Buildroot] [RFC,
 1/1] configs/am62x-sk: Add fragment for TI tree integration
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
From: Paresh Bhagat via buildroot <buildroot@buildroot.org>
Reply-To: Paresh Bhagat <p-bhagat@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Gyan Gupta <g-gupta@ti.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Chirag Shilwant <c-shilwant@ti.com>, Syed Mohammed Khasim <khasim@ti.com>,
 Paresh Bhagat via buildroot <buildroot@buildroot.org>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>, Romain Naour <romain.naour@smile.fr>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,
Thanks for the feedback. Agree that using a fragment config is not a 
good option due to potential differences between upstream and vendor 
versions. Instead having separate defconfigs is a better approach to 
handle these variations effectively.Currently the vendor-based is being 
worked on using a Buildroot external tree. If we decide to upstream 
it(defconfig), it will be done with a suitable name to clearly 
distinguish it from the defconfig using upstream version.
On 10/07/24 15:12, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> Hi,
>
>   >> Just one thing about the naming: I think it should be
>   >> imx6ullevk_upstream_defconfig and imx6ullevk_vendor_defconfig to make
>   >> the distinction clearer. I haven't looked at this TI series to
>   >> evaluate its naming scheme, but you get the idea I guess.
>
>   > I fully agree with this. The current naming is less than obvious, and
>   > what you propose would make a lot of sense. With that naming, I believe
>   > I would be ready to accept 2 defconfigs for TI platforms for example,
>   > one using upstream, one using vendor stuff.
>
> Sounds good to me, but lets drop the suffix if there is only one
> defconfig / for the main one to limit renames (E.G. backwards
> compatibility) for our existing defconfigs.
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
