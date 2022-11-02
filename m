Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A93C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 04:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F6160B12;
	Wed,  2 Nov 2022 04:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37F6160B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7AwTxl1m6vuv; Wed,  2 Nov 2022 04:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FB0360AAA;
	Wed,  2 Nov 2022 04:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FB0360AAA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAA911BF35C
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 04:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8585981419
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 04:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8585981419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ki1GPYqO7jSC for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 04:47:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7C98140F
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D7C98140F
 for <buildroot@busybox.net>; Wed,  2 Nov 2022 04:47:47 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id F3879440782;
 Wed,  2 Nov 2022 06:45:23 +0200 (IST)
References: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
 <fe30717bf4f0096985334e3e23fd1f1573eb53f9.1667288516.git.baruch@tkos.co.il>
 <20221101213240.031261eb@windsurf> <87bkpq1jrh.fsf@tarshish>
 <20221101215836.44ee15cd@windsurf>
User-agent: mu4e 1.8.10; emacs 27.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Nov 2022 06:43:09 +0200
In-reply-to: <20221101215836.44ee15cd@windsurf>
Message-ID: <87sfj2otch.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1667364324;
 bh=Ks5M8ufcj0wZAbFvPibw8HH+AMWqWs8iAbh+du/ET3A=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=fd/kTJBwi1QyfzJA66JyAJg+cK81PbomDfuTciH9b/kneFYA5h77Iu9hddI5zUSuI
 j5Y2MXpaR+J8X5LMwuk3orBDSxJKPFTI9/JqT569Duuk6h/mXy/jykroHgXmiL/moP
 UeK8dvtWEarB2sVRdydZRpllnfu9jfT3Mpuf0WIIidGWg+SQjUFa3o1ABljtZdjp43
 ZWVdlhjenPOmNNl3ovDLukC8h0NH8JAii4imMJeV9Vzu0JJS2R1FhfUURa1QnISerD
 RuJJ81WkHP20n8Yg148Vh5bJ7CDlXrpuOZYoxutcONvdgCPdQWgFxB0SiXeajnfdsA
 zTfUH4dm7FOJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=fd/kTJBw
Subject: Re: [Buildroot] [PATCH 2/3] package/socat: disable openssl for
 static build
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Tue, Nov 01 2022, Thomas Petazzoni wrote:
> On Tue, 01 Nov 2022 22:47:10 +0200
> Baruch Siach <baruch@tkos.co.il> wrote:
>
>> > SOCAT_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
>> >
>> > does not work?  
>> 
>> It does not work because configure.ac puts $LIBS before -lssl in the
>> tested command line.
>
> ACK.
>
>> > Also, do you have an autobuilder failure for this issue? Or you just
>> > encountered it locally?  
>> 
>> We don't pass an explicit --with-openssl because socan configure does
>> not support it. So the configure script just behaves as if openssl is
>> not there, which is normal.
>
> Hm, OK, but that does not really answer my question :-)

There is no build failure so the autobuilders can't catch it. So yes, I
have seen the issue in local build tests of static linking.

This patch does not actually change the current behavior. Statically
linked socan lacks OpenSSL support either way. But this patch makes it
explicit.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
