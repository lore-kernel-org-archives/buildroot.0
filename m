Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BF8CAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 17:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9E4A60808;
	Mon, 15 Sep 2025 17:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_P7eEo8sgOn; Mon, 15 Sep 2025 17:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E32D607F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E32D607F5;
	Mon, 15 Sep 2025 17:04:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B8F41F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F173C406E1
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7rc9DQK2F5Q for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 17:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.115;
 helo=send276.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D61A406DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D61A406DE
Received: from send276.i.mail.ru (send276.i.mail.ru [95.163.59.115])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D61A406DE
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:04:06 +0000 (UTC)
Received: by exim-smtp-6f8b4bbb5d-tcwck with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1uyCcV-000000004nD-0LKb; Mon, 15 Sep 2025 20:04:03 +0300
Message-ID: <f014315f-46ad-43d5-aabb-bf3a78210233@inbox.ru>
Date: Mon, 15 Sep 2025 20:04:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250912054034.35961-1-fido_max@inbox.ru>
 <52e6c71dd7819ad16d5e192251407a44@free.fr>
Content-Language: en-US
In-Reply-To: <52e6c71dd7819ad16d5e192251407a44@free.fr>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD91EA9861B4B16FED4F319EA5BCBCAB5BA49C7D1C40379AD90182A05F538085040B06D808ED395EB1C3DE06ABAFEAF6705CC103155B4CDE9BC4C2B38C7DD7812E628D9CF984B353DE0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7590E57235B5C00BDEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376A27C8034CCD05E58638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2EAA1261A26688EB42E070BE324C7D3C438563BC5D8238FB3BB0A4F435E46E6718B35066C979671628AA50765F7900637D0FEED2715E18529389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B8883BAB8B32E402CA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CFA80D66F452D417A43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5DF4F0DDB657BE4215002B1117B3ED696BB973F630C0320E9361FAC1196A180DE823CB91A9FED034534781492E4B8EEADEEA082C9A12FE455BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3407FE5477D6A8AF08C77FAFF7357190DABF3106370718439FE50A9DE24957BF5D8C725BC252CB66F01D7E09C32AA3244C61F50243F2E7859177DD89D51EBB77428B6C6A2CC024D00CEA455F16B58544A2E30DDF7C44BCB90D57ADA2CBCE38F05762A0BE504FE5E636F1E3461735CEBA253FCF178C6DD14203
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVdVMtzNxwZu5mo+M8kfv9xU=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB6F9E24A16CD5074F8F63EA2EBC8BEABBEC7CCC0137FE3453D90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=vNE0W2O1Tc7AmS9ylH6P8d6fSbBOAYq1WOybLkNpkbo=; t=1757955848; x=1758045848; 
 b=VHnu3z0vluAjlSliBtvSgRLEtmJ9BOi7qghC5guV1j6AYOy1sWSBbc687O6JHAJ6ITq+QnhU+X+
 C+czSBxxNRYDN7ipCTXaO412CRipNxUCg/60X9G8qyahFxZ0c4AQP9bZc8zmU1dBJE+bgW0Hr5oDU
 9qBilj9wE+4eJogLaSGs49dgAYt9McTEaumRdT+Ww1LIDHO1ItZKN/sv+BK4H7WhTc9z30hJXQTSs
 x68hj4s5LO8UhRv/TugN5QS+yPlqJJVyi/oQs/Tx/FRUinr9qqP3wR6v/hLT9jvorUzTMQ9dBX/ji
 lrEvs5binjFLEReZWtSzx06KtP6cS33esL3Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=VHnu3z0v
X-Mailman-Original-Authentication-Results: exim-smtp-6f8b4bbb5d-tcwck;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.14.0
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

13.09.2025 16:19, Julien Olivain wrote:
> Hi Maxim,
> 
> Thanks for the patch.
> 
> On 12/09/2025 07:40, Maxim Kochetkov via buildroot wrote:
>> Changelog: https://github.com/libgeos/geos/releases/tag/3.14.0
>>
>> Bump minimal GCC version to 7. (Switched to C++17 as minimum requirement)
>> https://github.com/libgeos/geos/commit/ 
>> e142764b77f4b8d0c36ec88406300c5f876743fb
> 
> This bump is introducing few build failures. See:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2037932018
> 
> As a reference, the previous version 3.13.1 is building correctly. See:
> https://gitlab.com/jolivain/buildroot/-/pipelines/2037941861
> 
> Those failures are probably due to this c++17 switch. Could you have
> a look, please?


https://github.com/libgeos/geos/pull/1305


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
