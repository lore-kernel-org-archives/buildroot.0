Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02151C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 21:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDCA540712;
	Sun, 20 Apr 2025 21:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7XdirikHAuU; Sun, 20 Apr 2025 21:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC51C40718
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC51C40718;
	Sun, 20 Apr 2025 21:15:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF76B1A0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5B7140712
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfLWi9ebQpyh for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 21:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCF1D40575
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCF1D40575
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCF1D40575
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:15:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 364B743AFF;
 Sun, 20 Apr 2025 21:15:48 +0000 (UTC)
Date: Sun, 20 Apr 2025 23:15:47 +0200
To: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20250420231547.32603f96@windsurf>
In-Reply-To: <20250331233726.3730509-4-daniel.crowe@maxmine.com.au>
References: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
 <20250331233726.3730509-4-daniel.crowe@maxmine.com.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeekleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegurghnihgvlhdrtghrohifvgesmhgrgihmihhnvgdrtghomhdrrghupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745183748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NfoghMmCI8eej1M+qKm6bfd/jS883Sf9qeAw0aU4U2o=;
 b=bMJoOF16NtYmrxQYCs5x9RLsrdmKQa7VZ7pKTTwzfXLY2DsPBq0nXDe5Dld7jQnmyJujl0
 1cLyFJ4ZPMEgoEkkEoxuXeQLb6EiajMw1sIBdycZAvdg+ew9eY8eegkVqBiN3GkYZLZt7Q
 e3nouLBicxNQ7bTpYEOIAHOcV9A/HQuAq0382QgdFGTJDPqT4IuEffaT+joCe9OIbVaaWs
 uu3XwaMneNAJ4zXuz8m1ubAvRmoejkAF+W8B3B02zRQrBP1/g+EVHutvURdYQ1ra3tj/1i
 e9Y/wbk+eoSVaREQ3Oxqwf1SEllKw/L8xTNfJN3+yWwhtGjTvYkfuhCj0d3yEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bMJoOF16
Subject: Re: [Buildroot] [PATCH 4/5] package/python-flask-restx: add version
 1.3.0
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

Hello Daniel,

On Tue,  1 Apr 2025 10:07:25 +1030
Daniel Crowe <daniel.crowe@maxmine.com.au> wrote:

>  package/Config.in                                  |  1 +
>  package/python-flask-restx/Config.in               | 13 +++++++++++++
>  package/python-flask-restx/python-flask-restx.hash |  5 +++++
>  package/python-flask-restx/python-flask-restx.mk   | 14 ++++++++++++++
>  4 files changed, 33 insertions(+)

The entry in the DEVELOPERS file is missing.


> diff --git a/package/python-flask-restx/Config.in b/package/python-flask-restx/Config.in
> new file mode 100644
> index 0000000000..cdbe509891
> --- /dev/null
> +++ b/package/python-flask-restx/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PYTHON_FLASK_RESTX
> +	bool "python-flask-restx"
> +	select BR2_PACKAGE_PYTHON_ANISO8601 # runtime
> +	select BR2_PACKAGE_PYTHON_FLASK # runtime
> +	select BR2_PACKAGE_PYTHON_IMPORTLIB_RESOURCES # runtime

Unless I'm missing something, this particular option doesn't exist in
Buildroot. What did you want to achieve here? Is this a package you
have in your private branch, and that you forgot to submit, or?

Thanks a lot in advance for your clarification!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
