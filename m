Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDF6C64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 05:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CB2260AE0;
	Mon, 27 Feb 2023 05:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CB2260AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jgAqPB98iml; Mon, 27 Feb 2023 05:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F0060AC1;
	Mon, 27 Feb 2023 05:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8F0060AC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9281BF406
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 05:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74E32409B3
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 05:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E32409B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1FWj0IL3pV5X for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 05:12:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 776334090F
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 776334090F
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 05:12:17 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pWVo7-0001hV-18; Mon, 27 Feb 2023 08:12:15 +0300
Message-ID: <a39884db-7b0d-ea82-9b7a-74e243e0c9ff@inbox.ru>
Date: Mon, 27 Feb 2023 08:12:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230225093527.16587-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
In-Reply-To: <20230225093527.16587-1-fontaine.fabrice@gmail.com>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9806C989EC2150E337603B3C124283E76045787C7C06EAC54182A05F538085040CF834A5A502D5EE778279C2AC7CCB78DFB20D8D4F3093931E418D1D9047255F2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A4C4638C9DDF45FCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379A70878BADDF00B98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8CC54A722A10B553356494F13B4D201F76F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77A825AB47F0FC8649FA2833FD35BB23D9E625A9149C048EEC65AC60A1F0286FEF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063733DB58E2D23414FC389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E73557739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3458239C6F30CE7ACF347D0C918E93FA4817A8BF31E0A9555E32C321ACACBA418445CBCD2C696356401D7E09C32AA3244CB4CCAF793FB37FB2EFA5275D8A6CCBEB3C6EB905E3A8056B729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojY+HhiuGRi+oo2teHNEK3YA==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5FDB50733E2827DA9972B846C26C06DDA98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=E14Ty6yhRvoENDwsd2eJ6bQ25ZQWyPKTdlqKjth1cts=; 
 t=1677474738;x=1677564738; 
 b=rGeqhTqJDBbiLm9XqwSqCuZ/lmwXb2DS1KET7VAV8wNqHt6sz2Xo2HpiYrR5tuyEPBmDSAar/NHRYx6Bnf4J63B2NxfNerW66zesiMDAlm9DWuyFREGfv0oZGfYd0mJUDrDoKxL/JDMjQj20Yk/nB5cFEhirFi5/iezniQlgpdQrB0lFfgGK+CDJXXN1wSkTU0OvBrVmLCa2OYdDC0+hlu/qou7a+kBC0jLxoleQ8rbwu3x9caUwubRTKK0u2RVu6YUeu+P5cxjW3+kf7voVmqWtpZnKGlhl11oWdRKVaO9t/yyLvhwsi/tEQ7pIloGIWUQZfEBhlM4ssaUu3o6Eig==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=rGeqhTqJ
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: add host-pkgconf
 dependency
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25.02.2023 12:35, Fabrice Fontaine wrote:
> host-pkgconf is mandatory to find lz4 and zstd resulting in the
> following build failure since commit
> 9cd2e6e090449f9d2f371d24152580c038892f3d:
> 
> configure: error: in `/home/autobuild/autobuild/instance-5/output-1/build/postgresql-15.2':
> configure: error: The pkg-config script could not be found or is too old.  Make sure it
> is in your PATH or set the PKG_CONFIG environment variable to the full
> path to pkg-config.
> 
> Alternatively, you may set the environment variables LZ4_CFLAGS
> and LZ4_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8744277ebe9910635ef8fe290c8ba4eee420b538
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
