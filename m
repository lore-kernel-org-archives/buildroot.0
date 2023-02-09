Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37017C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 06:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9023405F4;
	Thu,  9 Feb 2023 06:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9023405F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkm4b3DFL-Wh; Thu,  9 Feb 2023 06:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 008794051D;
	Thu,  9 Feb 2023 06:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 008794051D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2751BF852
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 06:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4643E4051D
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 06:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4643E4051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUslGm6agQs6 for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 06:54:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8B4040393
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8B4040393
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 06:54:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7F57DE0006;
 Thu,  9 Feb 2023 06:54:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pQ0pY-00GgE5-Dz; Thu, 09 Feb 2023 07:54:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Afshin Pir <Afshin.Pir@gallagher.com>
References: <SY2PR01MB27781C2BC99C40BB9F67F69E94D89@SY2PR01MB2778.ausprd01.prod.outlook.com>
Date: Thu, 09 Feb 2023 07:54:52 +0100
In-Reply-To: <SY2PR01MB27781C2BC99C40BB9F67F69E94D89@SY2PR01MB2778.ausprd01.prod.outlook.com>
 (Afshin Pir's message of "Wed, 8 Feb 2023 19:44:51 +0000")
Message-ID: <87mt5nfhvn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] OpenSSL v3.0
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Afshin" == Afshin Pir <Afshin.Pir@gallagher.com> writes:

 > Hi
 > I wonder whether buildroot currently working on OpenSSL v3.0 package
 > def or not. If not, what are the challenges for building this package?
 > Because I need to migrate to OpenSSL v3.0 in my buildroot and I like
 > to know how I can do it.

There has been various discussions but currently no concrete patches for
openssl 3.0 support. Most likely not all packages will work with openssl
3.0, so we might need to keep the current openssl 1.1 package for a bit
and offer openssl 3.0 as a separate package.

Openssl 1.1.x indeed goes EOL in September, so it would be great if
someone could work on it soon!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
