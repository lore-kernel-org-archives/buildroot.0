Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16936C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 23:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A387E40022;
	Sun,  4 Aug 2024 23:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KGdNauh0ANih; Sun,  4 Aug 2024 23:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77111403F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77111403F8;
	Sun,  4 Aug 2024 23:20:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BEC91BF334
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 23:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18F81403F8
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 23:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISil2e0pstaT for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 23:20:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E6DE40022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E6DE40022
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E6DE40022
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 23:20:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.195]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNtP-1rwUDW2yaL-00ZsA6; Mon, 05
 Aug 2024 01:20:19 +0200
Date: Mon, 5 Aug 2024 01:20:18 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZrAMsplA7x-BAvrB@probook>
References: <Zq3NCVPhjeIDwGnW@waldemar-brodkorb.de>
 <20240803115210.55905c7e@windsurf>
 <Zq4PBulXFJ0Bcq9H@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zq4PBulXFJ0Bcq9H@waldemar-brodkorb.de>
X-Provags-ID: V03:K1:w5uLdLzoF0maFj//KHhdcmbSs45OKhrvwK30ttWBdp1Uuld7ea/
 +pVAekT4geh5I2x5SzJwzoiG4BcL23ZHOQLuq0woI4s+oJyHkNSUDFi8dPvsQwp6/xNJ+13
 Hnde+QQ5j1dlhQyYiScCc4AJMJGAB3eo8yqjXOVwj4IA1Q8Rx34F1nyjFYoqGoBPYhVJKy6
 R+loxb6VYJ5fTcBZ1de0A==
UI-OutboundReport: notjunk:1;M01:P0:w7O7JnVkfMw=;WZxhzgcEl1ps8rGMqwP/OWiXIl3
 XxaeUx+uHvtBqrI9f6KwDCGv86Xd+Jaf58maZ2v3e7a++XKw4QVckAa2b1jqhjuoPlmiu3D+9
 EiXO+gQFmyJcJtDeABK5oY4+CA+t/qRpxb9KiTLbwwDjaDPB9NR3v5kdjNOkihO3KrBNZG/da
 g5IUWfFTV7VrHYeH0TLxNZyFAjR3g08Ag+gif7YZ0xq5H886Kv3vPCT5k6A8ApRTIXHMOY+FC
 RmL2DDZdx81rsQtceqlEmnfbbSr6H0MPms+1jXHu6MuXToKx7jcK/EwG0HF4SNq7f0LvDIUCj
 EIeyp6sySfCMCyOe9O2BDIPmNlbaanEWC7zeoQ/DUUCX2Rpcnug0ibzRkxx5KOsNxlyNCe07G
 vsouJ2QJh6jVt64/1DEfqNXg4ZIYuADKVskPdRJZfsGH4bOHnJ6GZ4aSfvd2KulZOXmb1Jwuv
 gQV4QUoZLgTXwZ/9H8ZXjohkU09n3vQFjAxtDAIplmaE45tNNEsJ1Y3AmTxqCsYzKgMIbzQkW
 RxU9By6wqa/tktGzvO14I6M+c6s4K8+S28XEzXN86zFZeK+4cmzMRvvw6uBjpKUfFZkFwNCBX
 42+sTchxy1lFKNWkV9SCPMc6xQJvwuiIwwZ+77nwcj4K5Roe9GegPV4UWgnhNR807WZRajzqD
 1MoMLr7StC51PCngWVAEWaddllzuA9n+JyUp8uUjxyTM3WLpvNW41RxC20xJAdMTySVKvjwLI
 kXjIyQ4FCqed9m/W3lUtSOUiztFlkX/JuhJ/d9mVUaNy8a0YvjJMUziHrmDquRel0nJtZFeLq
 /40Q1jkaYlp3LsssaVwEbn4w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1722813619; x=1723418419; i=j.neuschaefer@gmx.net;
 bh=Awm0Rr4iIu6GsnHXC6cHS315TbcsxzfkCkzd7TiJeHg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=P5W1GUMiUXvzvG0O6spQXXuuh3WDwR1xXzaFoOVuy1yM76dZXPOtFWeKAPRmDgB2
 cTEDpFWnV8HkE0uSUsH6vfSPTwbz4awyTgIERL3txF9lOxYAhhHfX/E0Tywoe/Liq
 cPo/ySiDXDzOKekl6QO5cyrJXnunjtVomWVuSkJ87gYKg3srMu+OQ0o5pJt4ZcvYV
 YbRIgPNzOzTM0FbAXDJXjbTFiy82j81kU33wmPfRoA/bSKvF6/abtGtAQ7fGcd6J4
 KqWBiaxfAmP58HTO4H+uOWS7buM0ueUa+CESKl5vhsJhbWAooLU54vrKnN5iDKVg4
 GW/hgJ6yyn6hHyDE+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=P5W1GUMi
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix missing m_tim issue
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Aug 03, 2024 at 01:05:42PM +0200, Waldemar Brodkorb wrote:
> Hi Thomas,
> Thomas Petazzoni wrote,
>
> > Hello Waldemar,
> >
> > On Sat, 3 Aug 2024 08:24:09 +0200
> > Waldemar Brodkorb <wbx@openadk.org> wrote:
> >
> > > Patch from upstream to fix missing m_tim issue.
> > >
> > > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > > ---
> > >  ...are-st_mtim-if-defined-__USE_XOPEN2K.patch | 205 ++++++++++++++++++
> > >  1 file changed, 205 insertions(+)
> > >  create mode 100644 package/uclibc/0003-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
> >
> > I believe this potentially fixes some autobuilder build issues. Do you
> > have some references to those build failures, perhaps?
>
> I actually do not remember the build failure.
> Was it tipidee?
>
> @J.: What was the autobuild failures you were getting w/o the patch?

tipidee, indeed. Here:

http://autobuild.buildroot.org/results/f07d6d6ae2331f9972974093c0503b9d3c6b914a/build-end.log

And someone else reported a similar issue with s6dns.


-- jn
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
