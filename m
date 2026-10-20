Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F17606A325
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 22:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SAngYXOb;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=ejlvd2u4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D16896073F;
	Tue, 20 Oct 2026 22:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOzkArnJGdFV; Tue, 20 Oct 2026 22:30:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D73136071C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792535413;
	b=Gbvijn5qgdF19XOtPYeMeLXeBSoPBU17lMH/gec3cBGX/8GVXi+aG1wWkrBubeLM0Bvu
	 UikpD+QdkCZZb3rTIHXtZAJ0Al9Wqqfu3oEeBHIoFCwBEz64BW81YzLXAu+PiZMbpsIPC
	 Ix84EtQ3oBP4X1OAS/NxOGFq/bUAbf2bteS/tWY/xo8C5r7Zgd3kJOb+ov5CxExEu+xBQ
	 STKDeb1Q9vulKUrKu6UjUsNIorzYIUvlntMzU8za+bvFxJMVLVXK530TvWGojQgjk4psn
	 nNcUMu1cEspOmHcAgxm8nF6ToXClzh4kVUyvuiiVweFKDbaDSDQ7NbyQtQQYF4tolUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792535413;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=84UEgiewlPwpvsuAxf5hhfeNYdevHMiCUDKbKVGjKkI=;
	b=dAdT2BA5ZpMLGpQAUudXRqtOp67Me6S6YJLdS1cUoDseEPWVluqtb6AzaxkuF9cv5a64
	 Sl7NIXI6G5elq6ggFvvvEMWipjycF2VxDVQZk9TYEOtO1C1/N2YG31R/vPphseLQ33FjY
	 s4DiS892xkW2bJQNuR8cqQs7WDMese7osu3ytp74Ohrq/d1C2E86ByECSTs7hsY4t9/1r
	 jx9lMZgPM58TDlPB1cQdXdyqRLIEs0sdiuqMNKi4qi+21lu7T5+3wk+Fh6v2QRBtJwDAW
	 IbI10+ar+uPkIw9vPcKPDmLta0axu7WpYw5b6C8jj27Gv0VApTqngk1jhGRlOlXO6Cw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792535412;
	bh=84UEgiewlPwpvsuAxf5hhfeNYdevHMiCUDKbKVGjKkI=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SAngYXObiFc99IWLKRTvnkOiIfDzCyLFh0M0avCkzkhEpQWXXriLCQu+fFrSf/kc6
	 LoyELxQLUPsXvx+A442Wi4JRRv9M7cAszKjkSFS7rYJpEg7qLbLAOvMwTTjmjnqeIN
	 +0IfL71YTCOlg59FyOMFFeuS5Em0ZdNuzzuG/N6Y9i9By/guQKM9z4j3PggMzGXCtP
	 ZhlgI4R7natZxQqJ3OR+6dn0ToD+g+jtR4V2J6+R+FXsdbrCy0yQk1ofCFTRfYLv3m
	 y1b3qqm6klAm9UUO317eiPpl4AW35JbmC++IGNErJONfFQnzXkL3HsK13FKZ3XoJke
	 OPUI5Nd78vpzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D73136071C;
	Tue, 20 Oct 2026 22:30:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D593B769
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB830407C5
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YF_mYmNYi-US for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 22:30:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1045D407A4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792535406;
 b=MEaIHI6fvg5hva11B/Zfi393FBwegUx7zD57nWya8mI97ijEMJlNgnnqAiw6W5ByjUhb
 rHGxsD5fk32uBjN4NBINaAa7ab/Lqw0sw2kYX1yAICzB8lozpg7MyYIV8vn+LzNWn33Zd
 licf1TuMA0/88UcRwXTZeoGuRKdqgBOp4xJjrvM4aoCSEHziP+w1etnNvr+ftfxImXwma
 FEeWWS/jtz1bHewWabm0wbkCwrrPciGm7I9CL6/LmQewQ84iOxOkQIIUVyIZTKX18btp3
 HrYyDCs5mmcqJ0vNagoK5REJt3Q4Tr8FEX8zkoYNLMYC0PCLueieTyERJ8eqRIibhjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792535406;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Operating-System;
 bh=C+S1abDzpk/sCbtPshSYvVRLQmJVZyfWlDyOp+6UGWA=;
 b=eSXTNRTm25G3W48CqZ5+kmZrKrjzQuqD4WB3qz59/zNv5qw4S7jtG2RBdz7KdX3F8dlK
 ryaE3aLexhBnNhV3Y1GrzIwC1fw+/4E7G4ISQbadYlmzfXsutKmepNYI38BF5I+NYH7fM
 otJaBywFYBETzABZnJaWfpNmJPzioYQu+sqKIHe3UycSMdWSe78DaoIoE4xTeFZn76SYm
 aMK5wYsmJLMSnqVN832KX/8AqnLwHiQWgYRCbwCqeG5zzJb3oCWWAJB5fc+W/JZu41rq3
 nDpZk7iw1HELvmGDpsJQx3atwt5bTYnWo5um2yeJGlsCJB2PBE+nTC385CHWLZodw/A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1045D407A4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1792535403; bh=XjkxD7+k6ysn5Q3yIgSGZUDEBMlRkM0tkOuWvQcEgGQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ejlvd2u44B2lGGmofAiuhULROwy/Lil9g0EitLCymfjoXDyOz3c2SL/SREoaAvUP2
 ZE4wf0wIpzJr0JB5dIoN6SKduFeZCeZfHwW3psiprNVUIkeFX02+tuKUrxCjrkXJZs
 GfFFYsUznO/vfsvZa0avk43xCzImL3A3vt3qoCUIUBhlUb3VyjMe7MGtekHB3T/Gur
 Dg7AVgq1PMmeENeSgoIFumNNKzGJiKPU4PONdK8ASet1BblvJ0ZR+AO6NKDfW/cAc+
 A9WwVBbTK955rfmfEAoINJHkaznZ+OZp2fitwrgxAbdTI2sjMqyXC1ZMw/KV+TN8pM
 542dTEe4nPIQw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1EE0431E046C; Wed, 21 Oct 2026 00:30:03 +0200 (CEST)
Date: Wed, 21 Oct 2026 00:30:02 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <atfrauVhAXrHeul4@waldemar-brodkorb.de>
References: <aq4_lUtScguSDLRY@waldemar-brodkorb.de> <atfRLgIqqBBd6TuN@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atfRLgIqqBBd6TuN@windsurf>
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH v2 2/2] package/chawan: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sat, Sep 19, 2026 at 09:53:57AM +0200, Waldemar Brodkorb wrote:
> > Chawan is a text-mode web browser and pager for Unix-like systems, with
> > a focus on implementing modern web standards while remaining
> > self-contained, easy to understand and extensible.
> > 
> > It includes functionality such as CSS, inline images inside the
> > terminal, and JavaScript through a small, independent browser engine.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> I've applied to master, with some changes.
> 
> 
> > +CHAWAN_VERSION = 0.4.4
> > +CHAWAN_SITE = https://git.sr.ht/~bptato/chawan/archive
> > +CHAWAN_SOURCE = v$(CHAWAN_VERSION).tar.gz
> > +CHAWAN_LICENSE = Unlicense
> > +CHAWAN_LICENSE_FILES = UNLICENSE
> > +
> > +CHAWAN_DEPENDENCIES = brotli host-nim libssh2 openssl
> > +
> > +ifeq ($(BR2_aarch64),y)
> > +CHAWAN_TARGET_ARCH = arm64
> > +else ifeq ($(BR2_x86_64),y)
> > +CHAWAN_TARGET_ARCH = amd64
> > +else
> > +CHAWAN_TARGET_ARCH = $(BR2_ARCH)
> > +endif
> > +
> > +TARGET_CONFIGURE_OPTS += \
> 
> This was very very wrong, as it means you're changing this variable
> for everyone in Buildroot. Variables are global.
> 
> "make check-package" actually warned about this:
> 
> WARNING: package/chawan/chawan.mk:23: possible typo, variable not properly prefixed: TARGET_CONFIGURE_OPTS -> *CHAWAN_XXXX* (https://nightly.buildroot.org/#_tips_and_tricks)
> 
> > +	FLAGS="--os=linux \
> > +	--cpu:$(CHAWAN_TARGET_ARCH) \
> > +	--gcc.exe:$(TARGET_CROSS)gcc \
> > +	--gcc.linkerexe:$(TARGET_CROSS)gcc" \
> > +	PREFIX="/usr"
> 
> So I've changed this to:
> 
> +CHAWAN_MAKE_OPTS = \
> +       $(TARGET_CONFIGURE_OPTS) \
> +       FLAGS="--os=linux \
> +       --cpu:$(CHAWAN_TARGET_ARCH) \
> +       --gcc.exe:$(TARGET_CROSS)gcc \
> +       --gcc.linkerexe:$(TARGET_CROSS)gcc" \
> +       PREFIX="/usr"
> 
> and then used CHAWAN_MAKE_OPTS.
> 
> > +define CHAWAN_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
> > +endef
> > +
> > +define CHAWAN_INSTALL_TARGET_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> > +	DESTDIR=$(TARGET_DIR) install
> 
> Continuation line should have had one more indentation level (minor
> nit).
> 
> Applied with those changes. Thanks!

Thanks for fixing my bugs and applying!

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
