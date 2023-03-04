Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF46C64EC4
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 09:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D20D60A7B;
	Sat,  4 Mar 2023 09:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D20D60A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXMIsR4hPwgd; Sat,  4 Mar 2023 09:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D99B560A6B;
	Sat,  4 Mar 2023 09:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D99B560A6B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 576741BF44C
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 09:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3115C60A6B
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 09:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3115C60A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZHFOvLxyJMA for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 09:09:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAABB60A68
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAABB60A68
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 09:09:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 38048240002;
 Sat,  4 Mar 2023 09:09:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYNtN-00Dj27-5S; Sat, 04 Mar 2023 10:09:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20230215072923.184867-1-christian@paral.in>
 <8735775lzv.fsf@dell.be.48ers.dk>
Date: Sat, 04 Mar 2023 10:09:25 +0100
In-Reply-To: <8735775lzv.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 15 Feb 2023 10:14:12 +0100")
Message-ID: <87mt4sevcq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 1.19.6
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
 >> go1.19.6 (released 2023-02-14) includes security fixes to the crypto/tls,
 >> mime/multipart, net/http, and path/filepath packages, as well as bug fixes to
 >> the go command, the linker, the runtime, and the crypto/x509, net/http, and time
 >> packages. See the Go 1.19.6 milestone on the Go issue tracker for details.

 >> CVE-2022-41725: net/http, mime/multipart: denial of service from excessive resource consumption
 >> CVE-2022-41724: crypto/tls: large handshake records may cause panics
 >> CVE-2022-41723: net/http: avoid quadratic complexity in HPACK decoding

 >> https://go.dev/doc/devel/release#go1.19.minor

 >> Signed-off-by: Christian Stewart <christian@paral.in>

 > Committed, thanks.

Committed to 2022.11.x, thanks.

For 2022.02.x I will instead bump to 1.18.10.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
