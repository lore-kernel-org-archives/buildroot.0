Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61326C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 07:03:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05EEC6112D
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 07:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05EEC6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B6B9607C6;
	Tue, 27 Jul 2021 07:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jd9BKO4OZHvx; Tue, 27 Jul 2021 07:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E86DC6072D;
	Tue, 27 Jul 2021 07:03:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA7EE1BF2B3
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 07:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9EE283077
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 07:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvbSNwxvKbYn for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 07:03:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp38.i.mail.ru (smtp38.i.mail.ru [94.100.177.98])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEB418302F
 for <buildroot@busybox.net>; Tue, 27 Jul 2021 07:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=XIO0nctMYZfnXXB6A5AkrEfPTwTFxVO+nSt7hWBEeTc=; 
 t=1627369422;x=1627974822; 
 b=YvaJh9Xlfjl2xt1jmo53pzz4pOtXigGlOb4sXupE+Ulx/DH3Iy598kSY+sMI8YzRDVGrFi1loCX/IDAKgl2o8n2qvGOCQj7UnNaImcobLeEbtVi7yQrjZYbxwybTOLRMdQC435gfnZVLWxUNblju8/YSO518zHXFBtBwbb2rRRk=;
Received: by smtp38.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1m8H7q-0003VK-TZ
 for buildroot@busybox.net; Tue, 27 Jul 2021 10:03:39 +0300
To: buildroot@busybox.net
References: <20210705125139.1516789-1-fido_max@inbox.ru>
Message-ID: <ea0533dc-e2fc-aa00-cc0d-ddaec8da89e9@inbox.ru>
Date: Tue, 27 Jul 2021 10:05:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210705125139.1516789-1-fido_max@inbox.ru>
Content-Language: en-US
Authentication-Results: smtp38.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD941C43E597735A9C3038391AAE5FBFA7682283CBB09BF492D182A05F5380850405E92F9EA11763F94995F3131FBDDFA0B0C7DDF0E40AC1B997FA350A535BEE876
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE751DD1FEBB966604DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637A6C16C7015BEC7F48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C88ECD1DACD09D8455709C04C76DEF9C6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77A825AB47F0FC8649FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF1175FABE1C0F9B6A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCE4EEC0B4D8EDD6D03AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637458D1332A1BF835ED81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FB26E97DCB74E625235872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5DACF4982F1E6E11998EC41DA2EC3C2A8730F3285376F6453D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75BF6B963DD989C0FC410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34023CA4E4726A7D6C5402FF879581A542903043F5304CFDAAA97E5D95122B61EE41F6480D167A4DC31D7E09C32AA3244CC821C759BC873413ACCE9D94F6AF8C0C63871F383B54D9B33EB3F6AD6EA9203E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMEANdStWW59luPRSAjt+gQ==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24166970D32BAE566CCAB855C09869E742F33524C0AB858655EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH v2] package/gcc: fix libsanitizer in gcc
 11.1, 10.3 for linux 5.13
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Maxim Kochetkov via buildroot <buildroot@busybox.net>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

05.07.2021 15:51, Maxim Kochetkov via buildroot wrote:
> Starting from 5.13 Cyclades async mux support is dropped from linux kernel:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f76edd8f7ce06cdff2fe5b6b39a49644c684a161
> 
> But gcc's libsanitizer uses <linux/cyclades.h> header.
> This issue is fixed by:
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=745dae5923aba02982563481d75a21595df22ff8
> 
> Right now just gcc 9.4.0 has this commit and 8.4.0 is proposed to be deleted.
> So we need to add this patch for 10.3 and 11.1 to fix build with linux kernel 5.13.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Fixes: 
http://autobuild.buildroot.net/results/3ab15a8e16a929dfb2b99b371fa9838d4e137bf1/
Fixes: 
http://autobuild.buildroot.net/results/e78a68cfe68461a78a50ee41a0ed5f0923611b00/
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
