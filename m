Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6830C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 20:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7835660E00;
	Sun, 22 May 2022 20:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60Gc-i6ql0Fk; Sun, 22 May 2022 20:12:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A6760B12;
	Sun, 22 May 2022 20:12:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 046641BF392
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6A26415A5
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 20:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZdHIvurDKuj for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 20:12:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91C1B415A2
 for <buildroot@buildroot.org>; Sun, 22 May 2022 20:12:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 361B0C0003;
 Sun, 22 May 2022 20:12:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nsrwP-00CSCB-A0; Sun, 22 May 2022 22:12:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220418114103.276282-1-fontaine.fabrice@gmail.com>
Date: Sun, 22 May 2022 22:12:41 +0200
In-Reply-To: <20220418114103.276282-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 18 Apr 2022 13:41:03 +0200")
Message-ID: <87zgj9xr5y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libkrb5: doesn't build with
 libressl
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
Cc: =?utf-8?Q?Andr=C3=A9?= Zwing <nerv@dawncrow.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libkrb5 does not build with libressl since commit
 > b7a5b9d06d484700fc4fcbd354f2c15e0422688c and upstream is not interested
 > in fixing this issue as a PR is opened for more than 4 years
 > (https://github.com/krb5/krb5/pull/607):

 > pkinit_crypto_openssl.c: In function 'cms_signeddata_verify':
 > pkinit_crypto_openssl.c:1700:22: error: implicit declaration of
 > function 'OBJ_get0_data'; did you mean 'BIO_get_data'?
 > [-Werror=implicit-function-declaration]
 >  1700 |         print_buffer(OBJ_get0_data(etype), OBJ_length(etype));
 >       |                      ^~~~~~~~~~~~~
 >       |                      BIO_get_data

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e623f4e1d6b6004e98815b8b7da3938238890bd8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
