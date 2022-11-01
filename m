Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A53FC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A982D410A1;
	Tue,  1 Nov 2022 20:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A982D410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xEvtV3YjMVZH; Tue,  1 Nov 2022 20:46:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97AFE409BE;
	Tue,  1 Nov 2022 20:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97AFE409BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8F551BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A16C38128C
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A16C38128C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYfh0S9yBe8w for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:46:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D488124A
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80D488124A
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 20:46:37 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 7EF20440876;
 Tue,  1 Nov 2022 22:44:14 +0200 (IST)
References: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
 <20221101212917.19567f3f@windsurf>
User-agent: mu4e 1.8.10; emacs 27.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 01 Nov 2022 22:43:50 +0200
In-reply-to: <20221101212917.19567f3f@windsurf>
Message-ID: <87fsf21jyu.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1667335454;
 bh=Zpe8E6AiyLg/ZfPfvTHKXsAqVuhPkEM3Jn7OpeT5NjQ=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=p+R+9Mybm9g2BkiIzShdp4f1qlbbMm2xj/Kt1cEZsTRnlpGW3m3auHnqZLE33k1hK
 ONKz6GrW4On6wz5C2eOI3OB0woD3GI36nx1BfGH7JsMyuUpdADwe1Ohksv+Sru5eA2
 /HISzyVVMaeimAL0oefV7JMHEvsoK4FIdEwXD+qGaRp7myxDwjSs31ptG//t0+XnV+
 Z6niIU87C9w9nAqBItEOth6ofTtDP2ubZNQfE0T6uSsRfMj0Gbk8AsV8bEnjDA5S3A
 6qz1gV3ysPcq4Lu3OtH/GE7NSsiO84bp3NGf32kcwVxYItV42CU7WTr+TgoxnlsgfJ
 ZdvAqAMuhd8Ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=p+R+9Myb
Subject: Re: [Buildroot] [PATCH 1/3] package/socat: fix printf feature
 detection
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
> On Tue,  1 Nov 2022 09:41:54 +0200
> Baruch Siach via buildroot <buildroot@buildroot.org> wrote:
>
>> socal configure uses AC_TRY_RUN to detect printf features. This does not
>> work for cross compilation.
>> 
>> All C libraries we use support C99 snprintf. Only glibc and uClibc
>> support the deprecated Z modifier.
>> 
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  package/socat/socat.mk | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>
> How did you notice this issue? I see no autobuilder failure. If it
> wasn't working for cross-compilation, we should have build failures, no?
>
> Or are bad results of these ./configure tests only causing runtime
> issues? Could you elaborate a bit?

We are just getting wrong result that leads to sub-optimal code. The
build does not break though. I noticed the issue by looking for
AC_TRY_RUN in configure.ac.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
