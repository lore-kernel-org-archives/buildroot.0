Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CE7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D681281446;
	Sun, 20 Mar 2022 18:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQHCCuFUJi7J; Sun, 20 Mar 2022 18:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35ECA81428;
	Sun, 20 Mar 2022 18:32:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E2F31BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D94881428
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dKzBKB96YIV for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:31:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 652BB81425
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:31:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AE08F20004;
 Sun, 20 Mar 2022 18:31:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nW0LM-00FFly-RC; Sun, 20 Mar 2022 19:31:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?R=C3=A9mi?= Duraffort <remi.duraffort@linaro.org>
References: <20220228162632.2777188-1-remi.duraffort@linaro.org>
Date: Sun, 20 Mar 2022 19:31:56 +0100
In-Reply-To: <20220228162632.2777188-1-remi.duraffort@linaro.org>
 (=?utf-8?Q?=22R=C3=A9mi?=
 Duraffort"'s message of "Mon, 28 Feb 2022 17:26:32 +0100")
Message-ID: <87h77smq5f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] linux: fix kernel image format for
 aarch64 BE
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlLDqW1pIiA9PSBSw6ltaSBEdXJhZmZvcnQgPHJlbWkuZHVyYWZmb3J0QGxpbmFyby5v
cmc+IHdyaXRlczoKCiA+IFNpZ25lZC1vZmYtYnk6IFLDqW1pIER1cmFmZm9ydCA8cmVtaS5kdXJh
ZmZvcnRAbGluYXJvLm9yZz4KCkNvbW1pdHRlZCB0byAyMDIyLjAyLngsIHRoYW5rcy4KCi0tIApC
eWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
