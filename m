Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC86C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 06:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F54F40921;
	Thu, 10 Feb 2022 06:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vf0pIZ3i5bnw; Thu, 10 Feb 2022 06:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D081408DD;
	Thu, 10 Feb 2022 06:40:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 346631BF409
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 06:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2327B408DD
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 06:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4Xq9jctJrPI for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 06:40:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.post.pl (mx.post.pl [89.161.252.111])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95F17408DA
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 06:40:37 +0000 (UTC)
Received: from leo (unknown [89.171.33.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail02.home.net.pl (Postfix) with ESMTPSA id 33E414788D
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 07:23:40 +0100 (CET)
Date: Thu, 10 Feb 2022 07:23:39 +0100
From: Arek Marud <a.marud@post.pl>
To: buildroot@buildroot.org
Message-ID: <YgSva/uDdORQm9pE@leo>
References: <YfcMrhsNq6LnkKzP@leo> <20220130234800.14da56ca@windsurf>
 <Yfz+U7rrMCkgrjah@leo>
 <d33c9f1c-2a1c-285e-0acc-cd52db921a34@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d33c9f1c-2a1c-285e-0acc-cd52db921a34@mind.be>
X-CLIENT-IP: 89.171.33.130
X-CLIENT-HOSTNAME: 89.171.33.130
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddriedtgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffogffrnfdpggftiffpkfenuceurghilhhouhhtmecuudehtdenucenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehrvghkucforghruhguuceorgdrmhgrrhhuugesphhoshhtrdhplheqnecuggftrfgrthhtvghrnhepieeuffehgfetuddvueeutdfhteevffeuheelffffledufefgkeffhfdtudejveetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpmhgrkhgvfhhilhgvrdgrmhenucfkphepkeelrddujedurdeffedrudeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekledrudejuddrfeefrddufedtpdhhvghloheplhgvohdpmhgrihhlfhhrohhmpeetrhgvkhcuofgrrhhuugcuoegrrdhmrghruhgusehpohhsthdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-DCC--Metrics: mail02.home.net.pl 1024; Body=1 Fuz1=1 Fuz2=1
Subject: Re: [Buildroot] I have a problem adding new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi Arnout, 

>  Hi Arek,
> 
>  Please don't top-post, but reply inline like I do below.
> 
> On 04/02/2022 11:22, Arek Marud wrote:
> > Helo Thomas,
> > 
> > Thank you for your answer.
> > I had a problem with libonvif compilation. Compiler complaing about
> > unsafe include path (details pasted below).
> > 
> > I was able to compile project ONLY when --includedir parameter was set,
> > without it - compiler complains about include path.
> > 
> > https://gist.github.com/arekmd/11e9621ae3fc476cf37e80150d15b177
> > 
> > I pasted build log without LIBONVIF_CONF_OPTS line.
> > 
> > 
> > myname buildroot$> make libonvif-build
> > WARNING: no hash file for v1.1.1.tar.gz
> > > > > libonvif 1.1.1 Extracting
> [snip]
> > make[3]: Entering directory '/home/myname/workbench/resources/development/myproj/bu
> > ildroot/buildroot/output/build/libonvif-1.1.1/build'
> > /bin/sh ../libtool  --tag=CC   --mode=compile /home/myname/workbench/resources/dev
> > elopment/myproj/buildroot/buildroot/output/host/bin/aarch64-myproj-linux-gnu-gcc -
> > DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFS
> > ET_BITS=64 -I/usr/include -I/usr/include/libxml2 -I../source -D_LARGEFILE_SOURCE
>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>  This is what is wrong.
> 
>  It is caused by the following lines in build/Makefile.am [1]
> 
> AM_CFLAGS = -I$(INCLUDE) -I$(INCLUDE)/libxml2 -I../source
> ...
> INCLUDE = @includedir@
> LIB = @libdir@
> 
> That is just simply wrong.
> 
>  The proper fix is to patch the project and
> 
> - Remove the -I stuff from AM_CFLAGS, instead just set AM_CFLAGS = -I../source
> - Remove the INCLUDE and LIB assignments
> - Do proper discovery of libxml2 in configure.ac
> - Add the libxml2 include and lib directories to CFLAGS and LIBS either in
> configure.ac or in build/Makefile.am
> 
> 
>  But it seems that this project is pretty dead, so the easier approach is to
> just add
> 
> LIBONVIF_MAKE_OPTS = \
> 	INCLUDE=$(STAGING_DIR)/usr/include \
> 	LIBS=$(STAGING_DIR)/usr/lib

That worked. Library successfully compile and install.

> 
>  Regards,
>  Arnout
> 
> [1] https://github.com/sr99622/libonvif/blob/76961fb9f3ece462724a4a6c09b4bd7cc051b759/build/Makefile.am#L7
> 

Thank your for your help.

-- 
Best regards,
Arek 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
