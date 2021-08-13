Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90BBC4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 04:07:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEE2160F00
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 04:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEE2160F00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7755D40475;
	Fri, 13 Aug 2021 04:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGkOXpT3umpr; Fri, 13 Aug 2021 04:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2EB404CA;
	Fri, 13 Aug 2021 04:07:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7408A1BF302
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 04:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7017860640
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 04:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ie1ex-HoEwmn for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 04:07:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D789605E4
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 04:07:43 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 72E704403E6;
 Fri, 13 Aug 2021 07:07:33 +0300 (IDT)
References: <20210809224214.2966469-1-fontaine.fabrice@gmail.com>
 <20210812234815.4f23b2c0@windsurf>
User-agent: mu4e 1.4.15; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-reply-to: <20210812234815.4f23b2c0@windsurf>
Date: Fri, 13 Aug 2021 07:07:38 +0300
Message-ID: <87sfzef0mt.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix
 gidatadir
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
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas,

On Fri, Aug 13 2021, Thomas Petazzoni wrote:
> On Tue, 10 Aug 2021 00:42:14 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
>> Since commit 521d387640d704f24caee51841388d98bcac739b gidatadir is
>> wrongly set to ${libdir}/../share, set it back to
>> ${datadir}/gobject-introspection-1.0
>> 
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  package/gobject-introspection/gobject-introspection.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Applied to master, thanks.

Not in master as of commit 921830e92d8b.

You applied the exec_prefix fix[1] instead (commit 34da8f96141f).

Both are marked as accepted in patchwork.

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20210809223547.2961300-1-fontaine.fabrice@gmail.com/

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
