Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E91C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 20:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4BD840598;
	Thu, 19 Jan 2023 20:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4BD840598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Skv5o4VuGEba; Thu, 19 Jan 2023 20:35:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A07B405A0;
	Thu, 19 Jan 2023 20:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A07B405A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 769ED1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 20:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 510D841B4F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 20:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 510D841B4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7isejn8-mX5 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 20:35:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C794F41B4D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C794F41B4D
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 20:35:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.145]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlT2-1otgx01Okg-00jqzY; Thu, 19
 Jan 2023 21:35:40 +0100
Date: Thu, 19 Jan 2023 21:35:38 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230119213538.093a1fa4@gmx.net>
In-Reply-To: <87cz7aden6.fsf@dell.be.48ers.dk>
References: <20230119095842.445227-1-bagasdotme@gmail.com>
 <87cz7aden6.fsf@dell.be.48ers.dk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:sN9c2nhc0VJGzige+aGfI7mEzMXt9G22gvInGjhj4uMhvKtSeOu
 YQwcyJAcyfeRdkVrMgdWcWcPjR6IHfkwX4u5A7bxQO1EYJjAm9JZjuSJ7OBP8gFE9xZgnLd
 DdCVq5Y0kPpgUYeoIdwHPjM98VEOqg8sC41CLIhM0+OlxgtKVnlxpXI3WilMSc5zoYvOUA/
 sWjayjZT3rQKR6j+FsZHA==
UI-OutboundReport: notjunk:1;M01:P0:gszsDwxUtI0=;4rHw8OsMdOWQswETemEgNb4QEUo
 6t53eyFg6449y8LZ6xVn3abAnGgEPhCSCyNfyYH+o+b1hd7JrXp4EKvNvnfuw6gCrtx3TAd3G
 LGt4itmOuWAzxPMuYvJUmfUjZXcgL2yt9f2j1SkE/8qCFM5ZlDRHd0Me2f4+/1ab+/lMuI42r
 bAloh+5z2YDfXknQ93TxFJDHy2538Ktdkft0IImJawJKGGvYtHTffHrZ3oZ2W+0jV4iJhkaA7
 FIhoZdUIzrEhiBvYAFWY/0MFGTwDx5M5zksV/wtH47kHHkdShkOQPMTxhYgA5/4fjOhYh9wBu
 3Ok67P6p8Mk4q54GIw1HxZROD4+2y6he+AgIvd/XZdpD+BPkmYbrunFJO1nW8P6cN+YLloyto
 Fl3cAIl05NmuFfpczxxVsU0GmC3yUz6kD5L/DLRh/+0orXuoh7clivwzMukijSyYmnivAnihU
 eAl/A/H3nBEzTSlWTJesdTpK1qoZiVeGmkgT1/DqJqhdj79pY1tfP/oewf52vJ83wPt1USn3E
 TXoRBN8KrnWRJJrffx+D+WhX57TSkSDXsqIKTSoCi5nrhJEB3OkAxEeer9H8Talfo/N+vw0ZE
 ti3JQHzppjuc7WvNG1LwfrH7AgIwAQYpL3ahcj1PnLR6l7oyN607twxNNE9uYHCe9BRZc9csr
 v3SoU7paOTUHYMXb3Bu5pcXLc/GUjd8jVdT3DSHHkQZlxduBccxp9wKStwwJDseq/HIsBUtVq
 ONpYSsfFjKI7uFWKid6gN6r1z3zdx8zQqDtXU3/qMkcI6kRwhTHi7D+1qKmHebr5vFK27zFRf
 29Jj9omp19kX8KwAcq4+5LZFApDlSxjkbIj+8wfsDd3VnguLZw7dAjbfX1u1gruKxxJykAzlC
 oSRmyzoqTBw+DlhiQILgLGF36GaXgeHtdtK/3avfMo4LnqYN8lyXc13dkDWiFjzx27sDE+FA9
 MScuKg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1674160540; bh=BtWlEDZ45ObSW7f8VwocPQZEac3LME+Caec7Bz/iEJY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=oOcf/yvhWfyAlJHE+rE4L0Hf0iourzgQ/1/5aScLDkcX4IgjGNNJDSB+Y2tq8vu7G
 VQVfFAb5WX0gDb+ZdGzNAxZ/xtoPFNolg8XuwMms51AArh6MCezvRakz98bz890w9a
 GaZkvEeXZ7LNgiF6P1KgOGSHjoJbzBLORNH4zrhwx27VwfSoQzAtJKMzInNyRt8baM
 RPXKvHgm00aNbUgJ0iWtsVO1Cn6/iVkzgYaQ9BfhGV6aSKp+4vaA714C0Gt5evcrM1
 0+GV9KMs8DCKXKnRWPHFJBZBC6c04YFk+TmRouAgrwTioxyK2NjPJYz3EMaeB/Rcax
 EKtHg3QpuYSqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=oOcf/yvh
Subject: Re: [Buildroot] [PATCH] package/git: prefer OpenSSL SHA-1 and
 SHA-256 implementation
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
Cc: "Yann
 E . MORIN" <yann.morin.1998@free.fr>, Buildroot <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

On Thu, 19 Jan 2023 11:04:13 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Bagas" == Bagas Sanjaya <bagasdotme@gmail.com> writes:
>
>  > Git is shipped with its own implementation of SHA-1 and SHA-256.
>  > However, when OpenSSL is available (BR2_PACKAGE_OPENSSL=y), it is
>  > preferable to leverage the OpenSSL version of these hash algorithm
>  > instead. --with-openssl configure flag doesn't enable that, though.
>
>  > Set OPENSSL_{SHA1,SHA256} make variable when OpenSSL package is
>  > selected.
>
>  > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>
> What is the added value of doing this? Size? Speed? Why is it not the
> upstream default?
>
> A quick search for git + OPENSSL_SHA1 lead me to:
>
> https://www.spinics.net/lists/git/msg125401.html
>
> Which is old, but argued for not using the openssl implementation
> because of performance concerns.
>

Or 'Makefile: make DC_SHA1 the default' ([1]):

	Makefile: make DC_SHA1 the default

	We used to use the SHA1 implementation from the OpenSSL library by
	default.  As we are trying to be careful against collision attacks
	after the recent "shattered" announcement, switch the default to
	encourage people to use DC_SHA1 implementation instead.  Those who
	want to use the implementation from OpenSSL can explicitly ask for
	it by OPENSSL_SHA1=YesPlease when running "make".

And 'INSTALL: remove discussion of SHA-1 backends' ([2]):

	INSTALL: remove discussion of SHA-1 backends

	The claim that OpenSSL is the default SHA-1 backend hasn't been true
	since e6b07da (Makefile: make DC_SHA1 the default, 2017-03-17),
	but more importantly tweaking the SHA-1 backend isn't something that's
	common enough to warrant discussing in the INSTALL document, so let's
	remove this paragraph.

	This discussion was originally added in c538d2d (Add some
	installation notes in INSTALL, 2005-06-17) when tweaking the default
	backend was more common. The current wording was added in
	5beb577 (INSTALL: Describe dependency knobs from Makefile,
	2009-09-10).

Regards,
Peter


[1] https://github.com/git/git/commit/e6b07da2780f349c29809bd75d3eca6ad3c35d19
[2] https://github.com/git/git/commit/0ced11d32fea5caec3f014b4e60dd197b9c8aa0f
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
