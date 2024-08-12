Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB42C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 11:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D01E40334;
	Mon, 12 Aug 2024 11:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iz4SvkWPCPeH; Mon, 12 Aug 2024 11:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8F4A40336
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8F4A40336;
	Mon, 12 Aug 2024 11:22:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47CFE1BF2A5
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 11:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F71680F1A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 11:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EATD2yzLE_Uo for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 11:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBD0A80EB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBD0A80EB4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBD0A80EB4
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 11:22:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05DA140009;
 Mon, 12 Aug 2024 11:22:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sdT7q-0072Gz-1R;
 Mon, 12 Aug 2024 13:22:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
References: <20240713054213.228070-1-heiko.thiery@gmail.com>
 <20240713054213.228070-2-heiko.thiery@gmail.com>
Date: Mon, 12 Aug 2024 13:22:10 +0200
In-Reply-To: <20240713054213.228070-2-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Sat, 13 Jul 2024 07:42:15 +0200")
Message-ID: <87y152j89p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-cmake: remove override of
 CMAKE_ASM_COMPILER
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > Overriding the ASM is wrong and leads to failures e.g. for the llvm
 > package. Therefore the ASM compiler was overwritten there.

 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
 > ---
 >  package/pkg-cmake.mk | 1 -
 >  1 file changed, 1 deletion(-)

 > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
 > index 8f391eb4c9..c7032312fb 100644
 > --- a/package/pkg-cmake.mk
 > +++ b/package/pkg-cmake.mk
 > @@ -147,7 +147,6 @@ define $(2)_CONFIGURE_CMDS
 >  		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
 >  		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
 >  		-DCMAKE_SHARED_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
 > -		-DCMAKE_ASM_COMPILER="$$(HOSTAS)" \
 >  		-DCMAKE_C_COMPILER="$$(CMAKE_HOST_C_COMPILER)" \
 >  		-DCMAKE_CXX_COMPILER="$$(CMAKE_HOST_CXX_COMPILER)" \
 >  		$(if $$(CMAKE_HOST_C_COMPILER_LAUNCHER),\

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
