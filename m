Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E5606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 16:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OHLj/MxC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 700CC60628;
	Sat, 21 Nov 2026 16:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1P6hQolpMBC; Sat, 21 Nov 2026 16:52:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8324A60642
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795279922;
	b=M2GZ0B5ue/eMZuAKrAHBFb5yN4swerkFajipk12TLDVANwGNbSfEID1Cmf31r5QStCNF
	 GGqokanZbQwxXar6Br5+NewVj1r61683LjJjKP4nVyGpx6UWlS6jLvvBNYY6NgwzrPs6C
	 tdRzdaKnWueqh4Ias1uvzf04wZ5drJI5JTQWYQi+4w2/rKuRLauiz1FqwQJ04JW6j7mi5
	 qlorRW5a62QRGL9LTzxp9CEvh0ijLNYlguEgmXXZhiTVZsVpYT+FTVoCSMNxazp6AFcrw
	 D6vzAKOKml1YwGaeL3R6T9r3V1xHwtWOT8QdgdXQEAMWKGPAMpiG0PAI4MGTmQaxBpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795279922;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=mqT/XsjRXHoSv3rPkpL/rxjajSUjZL73eCvrWL7NUFs=;
	b=swoQbQ3zOj27JLFrsv3Pvh7k/vtee5UnYk53IwDFQAaC+CWXYE3AcUB1375L1zD05/07
	 7uqEPc87vhlSO6lyKSKd0qtGQ8Xg6wWrIH9va8DAvrvMMouS2YQA3XleAad63FsjwFLq+
	 wDkrnvj5mdfX8LzS6HallGu9QHPzaPb3J1+qCWIMTBQ4RLq7SQ1Lf5fVfkKDTXZjPWrH3
	 KDh79WkFsRAZZwGdeSVj9U2OUx8s9ryGn+8WVugfLn62DVKiL5TPgTrR6BFKPX4x8IBMk
	 hAM7+//+OmMQC3w1Sg2HUcKXOdThbSTF2c8Lwq2rUiND7qrcdBO9GYoigbHz+yNJVMA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795279922;
	bh=mqT/XsjRXHoSv3rPkpL/rxjajSUjZL73eCvrWL7NUFs=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=OHLj/MxCvBsAAEbdfrTXqWv/HKb55f5VoIdrD1hnsVUgRxIP6fTsUNNgLLgesxlAi
	 aVfJ3qkFYF+UOEgCwqDh94EzioPbQUeZvNfe6xvyYSc205PS3orwzKkbY1NWkGAXOn
	 LOMPeBvJWYZP/s4NiQn96VhIX9OgYBoXJ7bl+rinzBGGCRvQzJNGUnBfd8BCbPmeZd
	 QrTLCdJjRHEzXi72qPsCGbRK1tbDzPongsg4xex2mLJ/r62hNq8CvljlInsdSF28dR
	 /X2h2b/rCL2Dd3N8jti0eJjeb9axypztdAl75NEBi+R0vqlNplA3kf9Y3JdHci6d+Y
	 I+aQu9b3VVy7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8324A60642;
	Sat, 21 Nov 2026 16:52:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E784260
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E82F880EBE
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nm72jGKfn5bR for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 16:51:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 23CC280E73
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23CC280E73
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:51:58 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795279916; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:M1/NsT4s+u8bTPK065sHs6vUM3m4
 9A8b3ggdBrVT66NZv/HnvfuCJx3JWfziY9zEpmc5mySklYvYoUV6nRcTvWNIOQzz7BDwpLdTF1z
 WcVHG0MyjW2j9Fmk6GsYeJdkKPfCBlODdWg2GMMvqV6NEUImJbiqiWY9su1pfLL1JJgEJyptiIG
 ISzPn7FXwZghR02VxiiZlV2Mri6S0BkRoul7+sus4P8AkQG98mfwpueoH6H3auoBZ1/SWytspdg
 F2PsMJINkyqWnUFLEtqvm7w8fZbAtcggKF+Ac6OEqdxSpCwUWvjk8yQPu/FRS+dGY238FoE4hzu
 PzFlsgTSLNN/bg==;
Message-Instance: m=1; h=sha256: MoqtHgAH3H3gtikpgAPsunihrxh8xDepakQTtwx3Xes=:
 8WvZJB0DYjkJKvh2VUOu7L0EN9thB5FmzGxAOz8iCLA=, sha512:
 xl5oa4nOAPey7193azd1GAt5XeA7YTTnNYP2uUGSeJ1SJpmQuSOvggDSQkcL4+xjtdmZxE88om12lJsCzpdXdQ==:
 8GZkvC1UEzEMLQWMyfj/BSiwXwtgVPTA69nJgxuxWBBlbLiJ+/6Ex18T8kuGpq2ZVn0XAM5UApL5nEE+PhxusQ==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU9j-1y8ZBZ352R-00m4eA; Sat, 21
 Nov 2026 17:51:54 +0100
Message-ID: <8bc3dd65-8748-48c6-8a53-c88ba1088daa@gmx.de>
Date: Sat, 21 Nov 2026 17:51:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20261121133437.915224-1-fiona.klute@gmx.de>
 <871p8ete2y.fsf@dell.be.48ers.dk>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <871p8ete2y.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:2EzvCIFqYx7g7Obw+mg8baEa1BJVanYN9DtgMxTrZODSj49rr4H
 hhAp8um+LzJc3BXHqyoqupwGiWdKRWPcEKjyTq/20gAVsR90sKukYDd/6aoq4Ck3yCaBn/C
 bZcwCFLDj3q6KgcsDZ8B2WXVMRwL0+V4EWAwDH/yQi3dQPzdZWDUXfdkNWxlkrm6Z0gDnkX
 yEqkP8zmquxgirWIAp9/w==
UI-OutboundReport: notjunk:1;M01:P0:+TEsRF6K1Ys=;bpwrBjre/BFXeLumDB9fpXxq5ZB
 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
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix download URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 21.11.26 um 16:10 schrieb Peter Korsgaard:
>>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:
> 
>   > U-Boot downloads moved to git.u-boot-project.org a while ago (see
>   > 747aa911f6a471558a5fb2a9e1b133d13104cae8 "boot/uboot: bump to version
>   > 2026.10"), and since early November ftp.denx.de is no longer
>   > responding. Update the site URL for package/uboot-tools to match
>   > boot/uboot.
> 
>   > Fixes: https://autobuild.buildroot.org/results/813/81326375b92b75936e02b5dadea5729811ecda98/
>   > Fixes: https://autobuild.buildroot.org/results/db1/db198283e319a4cb997c1567180290a79663e3ad/
>   > (and many more)
> 
>   > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> 
> Committed, thanks.
> 
> I took the liberty to also update the URL in the help text to match,
> even though the old URL so far redirects to it.
Good idea, thank you! The URL is incorrect though, I've just sent a 
patch to fix that.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
