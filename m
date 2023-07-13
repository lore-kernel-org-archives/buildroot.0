Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BC0C001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C1FC4178E;
	Thu, 13 Jul 2023 21:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C1FC4178E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGmu7MUGzLFn; Thu, 13 Jul 2023 21:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A28AB416F2;
	Thu, 13 Jul 2023 21:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A28AB416F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 839931BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ABC183CD1
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ABC183CD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LG9hgXc2e55 for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:20:06 +0000 (UTC)
X-Greylist: delayed 00:39:22 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2D7383CEC
Received: from fallback23.i.mail.ru (fallback23.i.mail.ru [79.137.243.77])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2D7383CEC
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:20:05 +0000 (UTC)
Received: from [10.161.100.15] (port=45366 helo=smtpng3.i.mail.ru)
 by fallback23.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1qK37B-00G1zU-4P
 for buildroot@buildroot.org; Thu, 13 Jul 2023 23:40:41 +0300
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qK371-0004QK-Jg; Thu, 13 Jul 2023 23:40:32 +0300
Message-ID: <ac44813a-8d76-cef6-ad24-29d67e5209c3@inbox.ru>
Date: Thu, 13 Jul 2023 23:40:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20230713075740.328213-1-james.hilliard1@gmail.com>
 <20230713221119.0c83afa4@windsurf>
Content-Language: en-US
In-Reply-To: <20230713221119.0c83afa4@windsurf>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9B2A9E02D3479B2E01820269E149F1ED29013C2CAD95D1A59182A05F538085040B095EBDBE365286EBEBCF1F2F4CA91E184B6B58DE300844CB384D6D201655113
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70CB15FA6C489297DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063795AFAF91F541EBCE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D870C077FDDBD69A01E23507E2BC78D1086F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7820CF4CC0E318EFB9FA2833FD35BB23D9E625A9149C048EE26055571C92BF10F2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BE2A68AC901FE7BE8A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB0EC3B1FCAE4A06943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A55B3730E78E39152B42081A01F6639A2C3766CFEAED2A3CC9F87CCE6106E1FC07E67D4AC08A07B9B08ED1AC82D843A2BBCB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3457FA942CB4462B4C165C9B1A80D642D0432ED532A9AF048A5CA36270FA1D444DF37A61EB7AF364741D7E09C32AA3244C3A3863AE3CDAF86A702F56177BC93E527C0C08F7987826B985A42E4C463514DC5DA084F8E80FEBD3498BCAF62EB65D490083D0702184784583DB18EBE73F7D69
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojmIyQFW4pVcnTTfXQ8ZNaUw==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986B36851C8C45907E4A114619CF24A0471C98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B421986EB18E28D707A1C37FAF45AFF25A30DE197AFDF5F339049FFFDB7839CE9E974A02759C12FD71955C973B2A8F84D4CC84E927CA676ED43A4C487B4AD82102
X-7FA49CB5: 0D63561A33F958A5C508746550A72AAF04DE9F69908DD026D4785AEB73A299D6CACD7DF95DA8FC8BD5E8D9A59859A8B672C9529151755235
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdojJHpMQNyvvBmUf7tR/VVA==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=4nwkGvQGgt/K2kyYD1ePc/wDSRO9l2ClKSuBPiFp3ec=; 
 t=1689283205;x=1689373205; 
 b=lveRD6RrbogJ2NOX5HT4o6DkjxB2RRMdrbZ5IrzG+benV69d3wh6TY4a1KQGwf8lVfZ/HStIIp6QH1eywbF/bDBVquQe1nAiUqAL5zkQNdyFAPqtuwJDY8E89VNlMP+zVyzOed3cXhpEKDDwEUUHsxdH2BQUtuW6e/As/wuRKCxkGmqp43RMYq3KdUzcU37vcNXV4QZ4VOGTHm/PyopXn2unXpjXeXi5qj9KwXHt9USoz7zdIVh9PhMdzt5ZqoJ5QZ1/gyJQzlikaKuOFb14lEPm9V1S3GPxuIgzn9HoGW9FROwFIitklMR+uFFCnWuo6s+ugDd8H9YLhflP5vA4mQ==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=4nwkGvQGgt/K2kyYD1ePc/wDSRO9l2ClKSuBPiFp3ec=; 
 t=1689280841;x=1689370841; 
 b=oea/gUiBbp4YQOecqXh4JrILOavt1nQ9KQU9CqU47je/nHjucwe0FZGIcwg/Y7ZniNRAaBWAtKy4HnWknZBaZ76gXC9bMBiPsHGhEdAJD0bQoztk5iqQ4F+kFR3AUTlZEqlOt2wG4lYRfy6Z/bzxI+KUULjJzjIvgakk6pigQ1Q2lIrTuyJEd872Mtjyz20//fFGJhOPr8VwwKsn3MyODBqtEHNTman5wQ5szcrAeHhvwwjKvj6LDoWM6IBfQtW/tKGewpPNgM7cRBdovaMuey12Bzr+InI60JAUOCs67mHPvrgjVzEofjTKj8NzH/h2n8geilu1f+8LHMOI02prfw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=lveRD6Rr; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=oea/gUiB
Subject: Re: [Buildroot] [PATCH v2 1/1] package/strace: use bundled headers
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13.07.2023 23:11, Thomas Petazzoni via buildroot wrote:
> On Thu, 13 Jul 2023 01:57:40 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
> 
>> There is a bug in the configure script, while we could apply the
>> upstream patching fixing this bug the better solution is to switch
>> to using the bundled headers instead.
>>
>> The reason for this is that strace needs the headers of the running
>> kernel rather than those that were used to build the toolchain.
>>
>> The running kernel is often more recent than the one used in the
>> toolchain so we do want to use the more up-to-date headers.
>>
>> As such we should use the strace bundled headers as they will be
>> the most up-to-date headers.
> 
> But then isn't there a chance that the bundled headers are too *recent*
> compared to the running kernel? What happens in this case?

It looks like it is fixed:
https://github.com/strace/strace/commit/8f691206e4aa769cc99e264f1c15ae6956789f91

So let's try to upgrade to 6.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
