Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8D4C74A5B
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 18:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB99341619;
	Sun, 26 Mar 2023 18:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB99341619
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2aOlRAtZETjr; Sun, 26 Mar 2023 18:32:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB68D41682;
	Sun, 26 Mar 2023 18:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB68D41682
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61B2D1BF281
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 18:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A3F840A01
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 18:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A3F840A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xl8ujw9XzXrc for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 18:32:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57BA840A17
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57BA840A17
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 18:32:07 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1pgV9x-0001oG-1n; Sun, 26 Mar 2023 21:32:05 +0300
Message-ID: <1c422023-6eff-f879-7c5c-35560314e55a@inbox.ru>
Date: Sun, 26 Mar 2023 21:32:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20230326080034.14629-1-ps.report@gmx.net>
 <20230326080034.14629-4-ps.report@gmx.net>
In-Reply-To: <20230326080034.14629-4-ps.report@gmx.net>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD921C4293CD89C54A2532898BB9A993AB7C49D8025F93BAC0A00894C459B0CD1B96F7E1141113745EE822C6C044F6A8B520A8FD0755037FFCEA92BA30E35CD8A73
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77BF46084C0059042EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063707C9A2DE1D52FEB28638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D86189801CBC1AA8DEB58629602E2141456F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE70F3DDF2BBF19B93A9FA2833FD35BB23D9E625A9149C048EE270D6DF50F29E9E2117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7B2978FEC0F0F707D9FA2833FD35BB23DF004C906525384302BEBFE083D3B9BA71A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16B262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-B7AD71C0: BCAA75B3C340DBBEEF3A853C90EA8D50F01536074D6990B7EE9D5CB6078CC77CF5989A28B1CE5CB850B8A193DD8A991A
X-C1DE0DAB: 0D63561A33F958A56C85C08FA9EE00413A1DFBB1BD0B9BAA7EF99FC0F73872F6F87CCE6106E1FC07E67D4AC08A07B9B0A6C7FFFE744CA7FBCB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0AD75DCE07D45A749953FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFF67825344807FE95DBC0A1EAEDA23FBE501F375A92BF6DC5281644D324399CB2E4A5F4FEF661E8B50AF1D01ACB6F27A5274644B8AF9CB15D40D0788D6723457AA8CAA110EC39F0D1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMvqd+qF682OAgUN39GfgPA==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF5E5813C336612E35CA5CEEF647F3FF11098CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=aLxYC5o0i+z/eQG4QlZGetGu7Pftm1IBiU420InsNzQ=; 
 t=1679855527;x=1679945527; 
 b=BwHK3k0fhs9YrRpolLCWmB0tQWJ6dm/3h7oilWEAgJndIoAXyBNSVzMnAcWNWyG3C/KwhYPbj7oUILZUqPY3H1B9A4Zg+BYjGlR4c/ouLSju+FJZimwmP/Levl5wrersFhBGLSnNmsJD4c4VKgA406uJbHhPG3KrJS0HYCkuBRPJibMKdlzS0m+FuUju3zOTsMhFUTJ4gkjDYyXtbLa4IoxwevFQ37QJF+UmnAD+p3ynRKZ0VrI6xN6H5X/yN97K0y3R2yVShcj0xM+iPEawc1Iw83jh8R+xawhPYxKV3aMfpHcOwzrOxdRkiDQtWGez9twrYy6a4EdBvMxxmFSLNA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=BwHK3k0f
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH v1 4/5] package/osm2pgsql: fix double space
 in Config.in comment
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
Cc: =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@laposte.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26.03.2023 11:00, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
