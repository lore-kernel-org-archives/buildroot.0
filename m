Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90015CA0ED1
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 15:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 658D540D1D;
	Fri, 15 Aug 2025 15:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItRVZCZ-jv6U; Fri, 15 Aug 2025 15:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6848140D20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6848140D20;
	Fri, 15 Aug 2025 15:28:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5991D223
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 15:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 568624083E
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 15:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lz1FPIprztiu for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 15:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1357140838
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1357140838
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1357140838
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 15:28:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 353FB43990;
 Fri, 15 Aug 2025 15:28:52 +0000 (UTC)
Date: Fri, 15 Aug 2025 17:28:51 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Andrea Ricchi
 <andrea.ricchi@amarulasolutions.com>, Roy Kollen Svendsen
 <roykollensvendsen@gmail.com>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 linux-amarula@amarulasolutions.com, Giuseppe D'Angelo
 <giuseppe.dangelo@kdab.com>, Angelo Compagnucci
 <angelo@amarulasolutions.com>
Message-ID: <20250815172851.77009124@windsurf>
In-Reply-To: <20250814153259.6822-2-dario.binacchi@amarulasolutions.com>
References: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
 <20250814153259.6822-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveetudelffdtjeekhfetkeeggfeujeeltedvtedvieeufeekuefgjeelgedthfelnecuffhomhgrihhnpegtohhnfhdrihhnpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopegurghrihhordgsihhnrggttghhihesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghui
 hhlughrohhothdrohhrghdprhgtphhtthhopegrnhgurhgvrgdrrhhitggthhhisegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehrohihkhholhhlvghnshhvvghnughsvghnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnghgvlhhordgtohhmphgrghhnuhgttghisehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvshhsvggvvhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghmrghruhhlrgesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepghhiuhhsvghpphgvrdgurghnghgvlhhosehkuggrsgdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755271733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBAQGavOgkJzB7oDLJ0ObQ6mn7VQ/j1Q4O+OaA2vh1M=;
 b=LTLMB3pMHd3+eB7dgdJZFM+k9W/TftSL13ffkW2dSSeQTIABD/XeFNcXmGm+zA+KMQwZel
 uGOu/f8S+89tkWD/+BBFzHFwuXXL0fZM53tHL22owQNQm5Ai6o07op2U0Vw6Byo6KCc21Q
 toCxNgzjwwIbh67MHeCWkWLr4PdE0f9qulGmiYTgPe9lk4CdqYf4OLawq4oh84/3Pu+wpj
 o7sOScjzQc6Io/RguoP1JTUA7sgfID5cZ8DOvUjDG9md0yV0MCJEh4MIIqoe0dw9DB8H/B
 RKXBIlfixvyCmlxJxB2iVwes7XlRetLoehKmR7Spn5XVi6lj9fopN8YIX/0cPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LTLMB3pM
Subject: Re: [Buildroot] [RFC v3 1/5] package/qt6: Add qmake functionality
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

Hello Dario,

Thanks for bringing this further. This really seems like a copy/paste
of the Qt5 logic, with even some parts that are dead code (see below).
How much have you validated that everything added by this patch is
actually *needed*, as opposed to just blindly copy/pasted from the Qt5
logic?

Also, in the commit log:

> flags/cross-compiler the biggest difference is that where previously
> qt.conf was used to fixup per-paths builds, this is now always
> created with changed contents so qmake looks at the correct target
> directories.

I'm a bit confused by what this means. Is this about
QT6_INSTALL_QT_CONF being called not only by QT6_QT_CONF_FIXUP in the
BR2_PER_PACKAGE_DIRECTORIES=y case but also being called by:

QT6BASE_POST_INSTALL_STAGING_HOOKS += QT6_INSTALL_QT_CONF

 ?

If so, why does this has to be different?

On Thu, 14 Aug 2025 17:32:55 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:


> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index 51a4f1b5be7f..697d1a96a920 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -55,6 +55,9 @@ QT6BASE_CONF_OPTS = \
>  	-DFEATURE_system_zlib=ON \
>  	-DFEATURE_system_libb2=ON
>  
> +QT6BASE_CFLAGS = $(TARGET_CFLAGS)
> +QT6BASE_CXXFLAGS = $(TARGET_CXXFLAGS)

These variables are not "changed" anywhere, so you could directly use
TARGET_CFLAGS/TARGET_CXXFLAGS. Unless the goal is to keep the logic as
similar as qt5 as possible.

> +
>  # x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it
>  # is not clear yet how it maps to all the avx512* options of Qt, so we
>  # for now keeps them disabled.
> @@ -431,5 +434,20 @@ define QT6BASE_RM_USR_MKSPECS
>  endef
>  QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
>  
> +define QT6BASE_MAKE_BR_SPEC
> +	mkdir -p $(@D)/mkspecs/devices/linux-buildroot-g++/
> +	sed 's/@EGLFS_DEVICE@/$(QT6BASE_EGLFS_DEVICE)/g' \
> +		$(QT6BASE_PKGDIR)/qmake.conf.in > \
> +		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf

$(QT6BASE_EGLFS_DEVICE) doesn't seem to be defined anywhere, so I have
some doubts that this is doing something useful.

This also means the @EGLFS_DEVICE@ in qmake.conf.in is not relevant.

> +	$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qplatformdefs.h \
> +		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
> +endef
> +
> +QT6BASE_CONF_OPTS += -DQT_QMAKE_DEVICE_OPTIONS=CROSS_COMPILE="$(TARGET_CROSS)";BR_COMPILER_CFLAGS="$(QT6BASE_CFLAGS)";BR_COMPILER_CXXFLAGS="$(QT6BASE_CXX_FLAGS)"

What is this doing? Does it actually work? I'm asking because that
doesn't seem to exist in the Qt5 case.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
