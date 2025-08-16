Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999ACCA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6816C6153E;
	Sat, 16 Aug 2025 20:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiKRYyqgADhh; Sat, 16 Aug 2025 20:47:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ED5961539
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ED5961539;
	Sat, 16 Aug 2025 20:47:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 910F175
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82C7583E63
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfL3RMTmS3iH for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:47:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8FEE783F51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FEE783F51
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FEE783F51
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:47:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BDAD4452B;
 Sat, 16 Aug 2025 20:47:31 +0000 (UTC)
Date: Sat, 16 Aug 2025 22:47:30 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>, Kurt Van Dijck
 <dev.kurt@vandijck-laurijssen.be>
Message-ID: <20250816224730.466990e0@windsurf>
In-Reply-To: <20250812173616.1977078-1-thomas.perale@mind.be>
References: <20250812173616.1977078-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddtfffhvdegueeludeugfelheeifeeuueejjeevhfetueejteejtedvudffhfffnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgur
 dgsvgdprhgtphhtthhopeguvghvrdhkuhhrthesvhgrnhguihhjtghkqdhlrghurhhijhhsshgvnhdrsggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755377251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ono3jUnm6GUq+wEGW66YK79X/CTfEWBQzLqChALjIG8=;
 b=cOHCiuYC5PlvnkP57y1CLeoinsO2oxLnSCdy6A/hidnXzJoZw3hzc7NVE7i3v9gYQDkfpA
 /bjb3cszC3w8HAJnCfc8WxXILfbEpotiNm11XiXJ7/TPRx3JIh1NvCgkcqdOdGDkqkjqSu
 3S08LhoYotOQazEhAVrC40RiKqqVVJcERuLF4AYB4WFAwL6otWqgM8LfK8R+sTYGJcgG9p
 Ho/ui3z6D9RdWmY9K9Uyzn0T8mXi0Ltz0mx60pvqdHQYuH4TXzDe7Smhs7Lwt1BRs5ytNS
 +0MvC0FNO/ocmJv2jTd19IYdXBNhAkmA/3X7dELL/Lu/z5+0vrzmXaO4HzzvBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cOHCiuYC
Subject: Re: [Buildroot] [PATCH] package/bcusdk: fix build w/ gcc-14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 12 Aug 2025 19:36:16 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> When using gcc-14 the compilation fails with the following error
> message:
> 
> ```
> close.c: In function 'EIBClose':
> close.c:38:3: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
>    38 |   close (con->fd);
>       |   ^~~~~
>       |   pclose
> openlocal.c: In function 'EIBSocketLocal':
> openlocal.c:57:7: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
>    57 |       close (con->fd);
>       |       ^~~~~
>       |       pclose
> make[6]: *** [Makefile:611: close.lo] Error 1
> ```
> 
> This patch include <unistd.h> to include the declaration of close.
> 
> Fixes: https://autobuild.buildroot.org/results/483/483fc4584815507c3798eb972e22e51f70f52c23/build-end.log
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  ...include-unistd-for-close-declaration.patch | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/bcusdk/0005-include-unistd-for-close-declaration.patch

Applied to master, thanks. However, I suggest that we drop this
package. It has been added in 2014 by someone working for a company
which no longer exists. The latest release is from 2011. Kurt, the
package maintainer, only every made two commits to it, back in 2017.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
