Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E55AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:25:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 174C261159
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 174C261159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB35B849E0;
	Mon,  4 Oct 2021 12:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-3m-PQlfU5A; Mon,  4 Oct 2021 12:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53520849AB;
	Mon,  4 Oct 2021 12:25:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2432E1BF330
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 098C04022E
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8AGFn6TJzmPp for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 12:25:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C71D7400ED
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 12:25:05 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9AA1260011;
 Mon,  4 Oct 2021 12:25:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXN1i-0003nF-Tk; Mon, 04 Oct 2021 14:25:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
References: <20210907120750.31432-1-raphael.melotte@mind.be>
 <20210907120750.31432-2-raphael.melotte@mind.be>
Date: Mon, 04 Oct 2021 14:25:02 +0200
In-Reply-To: <20210907120750.31432-2-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte=22's?= message of "Tue, 7 Sep
 2021 14:07:48 +0200")
Message-ID: <87v92dht9d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: fix
 building on mips with GCC10
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+IHdyaXRlczoKCiA+IFBvcnQgdGhlIGZvbGxvd2luZyB1cHN0cmVhbSBjb21taXQ6CiA+
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3JnL3hzZXJ2ZXIvLS9tZXJnZV9yZXF1
ZXN0cy81OTEvZGlmZnM/Y29tbWl0X2lkPTAxNDhhMTVkYTE2MTZhODY4ZDcxYWJlMWI1NmUzZjI4
Y2M3OTUzM2MKCiA+IFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvciBvbiBtaXBz
IHdpdGggR0NDMTA6CiA+ICAgQ0NMRCAgICAgbGliaW50MTAubGEKID4gYnVpbGRyb290L291dHB1
dC9ob3N0L2xpYi9nY2MvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS8xMC4zLjAvLi4vLi4v
Li4vLi4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS9iaW4vbGQ6IC5saWJzL2hlbHBlcl9t
ZW0ubzooLmJzcysweDApOiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGBJT1BvcnRCYXNlJzsgLmxp
YnMvaGVscGVyX2V4ZWMubzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUKCiA+IFNpZ25l
ZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KCkNv
bW1pdHRlZCB0byAyMDIxLjA1LnggYW5kIDIwMjEuMDgueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0
ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
