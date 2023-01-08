Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159F0C53210
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 11:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76A5360A70;
	Sun,  8 Jan 2023 11:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76A5360A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5fKNtpsIDvF; Sun,  8 Jan 2023 11:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C312160A84;
	Sun,  8 Jan 2023 11:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C312160A84
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AEC51BF3D7
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 11:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3670360A47
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 11:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3670360A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yT92eI8FEmnC for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 11:27:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E138260A70
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E138260A70
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 11:27:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3se2-1onyjb2yvo-00zmwc; Sun, 08
 Jan 2023 12:27:15 +0100
Date: Sun, 8 Jan 2023 12:27:14 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230108122714.3ba1a71f@gmx.net>
In-Reply-To: <87cz7qm9fj.fsf@dell.be.48ers.dk>
References: <20230106210417.29296-1-ps.report@gmx.net>
 <87cz7qm9fj.fsf@dell.be.48ers.dk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:UQ+lUnSldikjadTqEd1a54+PCVn0xDHFIdAeatwaNuBCfJ+HG3h
 vQ4wWB3P1w43CMnmi4WdlOXV23zhXgw5omKkByeqwyd6+YWrOc9Vv6r9zmGdn7dMSKBp4n7
 X7T/ZkuHzJH6h+g7T3RvvTk6HQ6JhsQMF++9eD9mwOKnyn1nxDBiJJMFxl7YJ+O1i5LMY8R
 +qg9KIPr9t00fVc/xQZpQ==
UI-OutboundReport: notjunk:1;M01:P0:FSM9lpaLDpw=;JteUrBEmdrzAtAfvRtwQzJXD857
 C3CMCVM8R2To2ovxKD4oFz5zOJX5vCLIv01AIuJGthVg8kSwAn8kKB9jrdtIk/vgM/b1pZWiX
 +1DvJ3m0LBfGm+RukqVUW300aw82jXm7o4pSXlxNdVYEkRz6pe+4iU+FejDP4D7v1HCrTA+B8
 PgoARzi1mU0Ck9iJRFZ9Lf57cF6M43quIKjE2LJxVekgMkav5GMlgk1xslzVE4Kld53tFSusY
 RmQvypvTaxGV5fCEK4fbgvt9jRuT0s58rihVH6fkOVFanTXAUVbsA6arXEHLNLKlkdxEEnFhB
 +t8ooNDSilTb+Cl9YQGByO1phDxgeEfWOoBqySSOqZuXdWaYEXdZL5n85Z1k+/csdW2H82kUs
 5ulvsWTKdiBnX11hfRo/5NTRkf4R5jRvCn2zQdFwOHCdMuTI+j2oIIv0hjt3E5VqX/kATytUq
 Bnf0wwA0Y5SnUEMGfn3QXfQAbl/8ioU0tjJq4/TobFTYyCb1A6Pp7Afie4TUuBqMODHz8now0
 v68x4sMotUoznbx6cpiCE2M3em3BpwvXmdSMS3E8jyXyjpP4mPMMsm4koQ5SxYACqJLWXJsE/
 NT2+dgEvot4bI7gPp+RLVYrmMEnGowbp4G6fBLn+TwVQ3ZwhgijC9NLlmG79XbwCAFEmr7hgn
 vWx9tblC8RX5N/J8O+56jgYSqA6srzUzlC125mlmODW86jvHNlBJbKGhQxEZxCdkc8X3jdlKr
 9dR0PGy+aDZg0JvEN8uwuUOH1QKnjicMzH9hP6/qy+wqHZjhQVcV0QABksBevhY5eHfjntl2G
 E8+UGnH/2vpVJv3DjXUIJkDtcFZkyzamY61xYYMhnj8X4BvyKHrleKn8NcPRoUxmt4eiF0Jx5
 04tLmZ8ORH8vMtoj5u5disdxIaYWcg7drK7MQji5mIYO2HrGq9i+6rwWG8C9ZSr2/wgRE8rdc
 AvUAnOFMrVKjZNM6zplZ+RjdGXY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1673177235; bh=H3frCJRVgFMIM1RMxOwDv9cPW2CyBQubdN099g1z06s=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XEz477Ms75hgfWEqVx9s7kKrv2tKeb1gBde52ZAiCb8ROdjjWEZLw6YEhQVIEF0cd
 JKdtsBrTfIUJCHyfkNwSdk6ZBB2PlZfkmWH/MfHA+rLnp3MAJpD4micTesBjETQKUv
 PinLKK6K//p3R9Q0o4g6IU7Fnyi+4br3O6AnHDmetKCr3AZyen+OTzRM8H6vss/GKD
 +i1E4r5C2qn00c0pZSMWANdiYJIHH7++uthY+wG78fxaHTDqH8mDjEw8bIV/CydFwH
 sLZxGshOhRUxhY7q5z4CRaKJcsEvpLCe0PMtJ5Mmlja+u8UhL6sbhrtI/PhlZJih1x
 BKSWwRjxt6Mqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=XEz477Ms
Subject: Re: [Buildroot] [PATCH v1] package/ntpsec: bump version to 1.2.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 07 Jan 2023 20:28:00 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
>  > - remove 001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch
>  >   (upstream applied, see [1])
>
>  > - rename 0002-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
>  >   to 0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
>
>  > - remove 0003-fix-build-with-libressl.patch
>  >   (upstream applied, see [2])
>
>  > - update license file list (change from LICENSE.adoc to LICENSES/BSD-2,
>  >   LICENSES/BSD-3, LICENSES/CC-BY-4.0, LICENSES/MIT, LICENSES/NTP)
>
>  > For details see [3].
>
>  > [1] https://gitlab.com/NTPsec/ntpsec/-/commit/0bea0bef36ff9cfa3ff52de25a839c283cf46cf7
>  > [2] https://gitlab.com/NTPsec/ntpsec/-/commit/128b66ae122d7b41ce4b99f427383fd6a5923d71
>  > [3] https://gitlab.com/NTPsec/ntpsec/-/blob/master/NEWS.adoc
>
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
>  > Fix package/ntpsec (renmae patch)
>
> Dropped this line and committed, thanks.
>

Ups, thanks for spotting and fixing my git-squash artifact....

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
