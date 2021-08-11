Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CBEC4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 04:41:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35DE060C40
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 04:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35DE060C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E13284045A;
	Wed, 11 Aug 2021 04:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dSxAM9bs8uQI; Wed, 11 Aug 2021 04:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 691C440461;
	Wed, 11 Aug 2021 04:41:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92DE81BF308
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 04:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8138D400F3
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 04:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=inbox.ru
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHqznJ86jLRK for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 04:41:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp37.i.mail.ru (smtp37.i.mail.ru [94.100.177.97])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3EBF4014C
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 04:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=w+M+zlPARyf+bhazIp2fy7e6RDfHAPsd4UFVllmhkcg=; 
 t=1628656868;x=1629262268; 
 b=jXSztn3fOALYklfUG+5Iol7Gcs9JOEaQ9qzoxuAcDMM2YsyPgvqmiEkJMXCBzi+/L+J0XOfLCv+XeEWZvEUV4DsfoEKB+W/Ry2CneJcIg0f5W/KfkW3P7+XTfgDbSsxw6MfHKlIVednMPCpEEs5EmpKPhGm6duExZpeyp+8RPRk=;
Received: by smtp37.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1mDg38-0005KT-0r; Wed, 11 Aug 2021 07:41:06 +0300
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210810182216.426739-1-fontaine.fabrice@gmail.com>
Message-ID: <2e60f18b-7eb7-77a0-bc1d-d0a598402759@inbox.ru>
Date: Wed, 11 Aug 2021 07:43:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210810182216.426739-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
Authentication-Results: smtp37.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92087353F0EC44DD9D5AC6413C25DCF08CC98B8FCC5CD86F3182A05F53808504027E4E6BB79B5B76B19FAF0E212CF3C7980D069A637B52925BED99829B3DB9AF2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F2393C4755A27B53EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637BA5555A0C16230F4EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BBCA57AF85F7723F2B01D06C0C8D0F8C2E264B71F5141B6BF20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0A3E989B1926288338941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637DCE3DBD6F8E38AFD389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637B0382658E8A369C8D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7A594BB8C7EE5EFD5EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C369456C5265B6C55C35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458F0AFF96BAACF4158235E5A14AD4A4A4625E192CAD1D9E79D94463893BF8742D0CF2F105A08946908
X-C1DE0DAB: 0D63561A33F958A500CE07FB21D1310C931B617FC52BF4C6DE1FF1A02CF7FFA5D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75BF6B963DD989C0FC410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349379E7F8541B6C9AA81371440B172444C27B8058339591A52B70735D6EA562EBDF03133B504D252E1D7E09C32AA3244CF8D851E6F528324B5D74B066B9CA78143A76366E8A9DE7CA729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj6qlzQV0oSZPefdeIJnY/5Q==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB241DC4F11F8ABD0B142FE5F2268511FA5DC6685C364A857514EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: needs std::future
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

10.08.2021 21:22, Fabrice Fontaine wrote:
> osm2pgsql needs std::future since its addition in commit
> 46c42042867e672eb21b386eb5e29747c30e80ca to avoid the following build
> failure:
> 
> In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.cpp:12:0:
> /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp:218:24: error: field 'barrier' has incomplete type
>       std::promise<void> barrier;
>                          ^
> /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp: In constructor 'db_cmd_sync_t::db_cmd_sync_t(std::promise<void>&&)':
> /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp:221:37: error: class 'db_cmd_sync_t' does not have any field named 'barrier'
>       : db_cmd_t(db_cmd_t::Cmd_sync), barrier(std::move(b))
>                                       ^
> In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/middle.hpp:18:0,
>                   from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/dependency-manager.cpp:11:
> /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/thread-pool.hpp: In member function 'void thread_pool_t::check_for_exceptions()':
> /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/thread-pool.hpp:49:19: error: invalid use of incomplete type 'class std::future<void>'
>               result.get();
>                     ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/69528232ceba128a2e60aa778bb0943fdefc2ed1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
