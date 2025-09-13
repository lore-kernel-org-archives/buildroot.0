Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB5ECAC592
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 22:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E407B412F5;
	Sat, 13 Sep 2025 22:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwMxMM0Bi_41; Sat, 13 Sep 2025 22:51:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8AA41318
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E8AA41318;
	Sat, 13 Sep 2025 22:51:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DCDFA12D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE57F4035A
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IZToT9FDMgp for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 22:51:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.82;
 helo=send243.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42391400CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42391400CC
Received: from send243.i.mail.ru (send243.i.mail.ru [95.163.59.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42391400CC
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:51:54 +0000 (UTC)
Received: by exim-smtp-6658775494-mm6g9 with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1uxZ5z-00000000HcU-2tXm; Sun, 14 Sep 2025 01:51:51 +0300
Message-ID: <b9f210fc-51a7-4713-8676-502ad36642e0@inbox.ru>
Date: Sun, 14 Sep 2025 01:51:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250912054034.35961-1-fido_max@inbox.ru>
 <52e6c71dd7819ad16d5e192251407a44@free.fr>
Content-Language: en-US
In-Reply-To: <52e6c71dd7819ad16d5e192251407a44@free.fr>
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD91EA9861B4B16FED4F319EA5BCBCAB5BA3FCF8BCE6449F356182A05F538085040B8690760B994640B3DE06ABAFEAF67057885ED61B06E667578A6715552391C3D28FBD926AF783066
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78E88BD1CA827EF00C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE732F68F8AF5E5BA59EA1F7E6F0F101C67CDEEF6D7F21E0D1D9295C2E9FA3191EE1B59CA4C82EFA658EED0108ABBEE833ABB22F9947019DC9123590EF1ED0CDD746F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A3E15B919BF433779FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751F6FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B9FC99A4BA45EE8B4A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE31A2885C41F97C443847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5E73BFEBF90C19CCE5002B1117B3ED6961EB266C9E566F93933EE06AFCD964888823CB91A9FED034534781492E4B8EEAD9CFA8CFAC159CE19BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D343D1F112031EF3D625E0AA616754A42F987DC00898BF139C3350EBD081073767F9E6A4AAC83019B081D7E09C32AA3244CAF0D0A3B940FC89777DD89D51EBB774242B035E19CEDEA3CEA455F16B58544A2E30DDF7C44BCB90D57ADA2CBCE38F05762A0BE504FE5E636F1E3461735CEBA253FCF178C6DD14203
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVdVMtzNxwZu58uqdadsCYBQ=
X-Mailru-Sender: 689FA8AB762F7393FE9E42A757851DB66D088F7E25D7A0A581B3C3FB841E71B89374E2210C5A50D190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
 :Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive:X-Cloud-Ids:Disposition-Notification-To;
 bh=VM/nw8GOzV9O6j3+XF3A9NvfSwnvb8qvPO+YexUxZlg=; t=1757803915; x=1757893915; 
 b=HjBJ/O9iLY/2RfOycUHWupvt1dEH7cBbbyd864T+2O/NxUWcMvmXr5dG1/2M0cNE4XkTlP1gMYW
 OXy1lbSUGSRk8U5TucUJ/8/lVcnyxPVxBn+puE5XJbxYOHxogXXbxbSWyn28LyEoRHlbEi7heKov3
 iXx4TFIev1sDVj9BA01WXVCrdpytz9D1gjCnH/9UWnycOjc0LOqs8QdEMs8sQGZQAOk56ODctmGFO
 57pjp2F+lHf09iUuGio8qZiLeRy+mdBfhUvj05ekJ85i/ZXT/WEq8pcUNqgcDhtcFNAVYbk+Ek4rF
 R6nICAjggSdtdOlN/iETkOh4mxLy43Az4ouQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=HjBJ/O9i
X-Mailman-Original-Authentication-Results: exim-smtp-6658775494-mm6g9;
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

13.09.2025 16:19, Julien Olivain via buildroot wrote:
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

Sure. It looks like uclibc problem.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
