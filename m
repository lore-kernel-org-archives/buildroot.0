Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BFC606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 20:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N3wDbIO8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04278100F;
	Tue, 20 Oct 2026 20:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GjJu2Mbmihg; Tue, 20 Oct 2026 20:38:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6C85A80FF5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792528685;
	b=ngn6+1y30XF/Qn/TkKbiA8B8SO4TeX5tY6iCcz3iOWORtxx2ULq3MryG/stTzgcYZuMb
	 auhCL6yquROpZIMs+Ggpn/vtJraHqeWP619zGgLYXanFwTIioxQ7oII2tFK+OXTsrawIE
	 xOzMpB/EhQDCaYh+o+pibGq9ZvNy8iGXbiKSZuB3C0ORQqMwLrKFwdWNDS4EfFlTDAHGw
	 rlx/Mo64rHdrj6NMf9mw7viE6XNfkq9FdsyK9PgIgWrS+mFMTmmpGnKW7PIut7YsamepJ
	 YdCqptFn5c3RD9mBIZnLqxgEL40yyNh+gDf0VNcN0CV90+BQJWPk0GfLpTUiUJIhQrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792528685;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=X9aupM0hlQta3Hz3t0Hag5fmdljJ2SM0NNhK/Gm8LVI=;
	b=n+xwNDXsjLA1u40R591X+BIZuFNHnfnJ4nYOl/Z/ZvbCH17FdTsFWpxViMOctW4nwKg0
	 S3AUSQuTXuuQA5fryyAv0rHS8U7vseykvRqVrXKvxqZeWqP7rGVcN8sUNz1pijqnGssz4
	 l7Bjro33zRfsfnJViPdbXCO4ExQ1BPpJ80HVQCqkBYxynDV94Z4lY00A8vGBpxeveBHMx
	 A+eTeZwnRMPTX8pOIfXzhAcdcVqVhfTrHMCB8R1cxaKdhwLV7Q3DlOq5++0OoP56D82/L
	 h3Mr0zEgHjc9im0Yk3oN6n2P5i7xkO7XrNCpzjMvYumOpDDL245OQkM/jS/I0jU1fRw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792528685;
	bh=X9aupM0hlQta3Hz3t0Hag5fmdljJ2SM0NNhK/Gm8LVI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N3wDbIO8nniH8ssXtd/pE9EoQa+RekccSjSPB/tWMWaGeiDApIfHJKQWLyRd6WfpU
	 FWsWvn0oK3+TNu8YNV1+cdWyitUbk4ulS7Jrr846nzCQOA4I2kctY4/Leicg4+trJA
	 qogOMAT0rLDLO5QtMSDY3iMaKk5kOAawDs1dmjVPinrzuxsuWw4eQa5TXB0hWjpvIc
	 WDhWRJRzz+fwfI7pxEpEo6C68kMHOspCGau8bi03XohuqYuyFVx9e8CN9NLpszYOG4
	 CwvFMSMh4CAHDgU7k9owmMu2t3TfrARO5lqW2ClqA+CszT67Hho1iQQqyHV9PDAXwj
	 IH4ApIotchfhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C85A80FF5;
	Tue, 20 Oct 2026 20:38:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67DC13A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C5A460712
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rf1wTfqzBPTJ for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 20:38:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D24DB6070D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792528683;
 b=Vo4DSEhTgIN/1i4nbzkYYucT1h3jzGgiBBjpCfrxe20EKNYqG8WEmxTyWRdnnFSxV4mr
 YiAIY+oB9SFVIiI6jLqD1jpw18zOOalvmiXLkLK+WQYPIqqGVTmUXNv0k/bpOWvti0zXh
 wMs8gpjWU5VKBoHORTI9eNzgxqJ3JjvRlFFR7TO5nPHolBo7ZvihX+gq6nhjpwY7Qa9ga
 t9yTLhsP/EqHFDVtNw/uV6csOkiIBjO5DYMhIKI4/CnTX1ZluVuZavxRagWAbNUVc3NDU
 phvsF6m6RnrA9SpWgAFqbh/TtOczNOYb2r6Bxmx1MgXiisJkvCtHM6/n9S/q1SAVCqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792528683;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=5s+CS6AgOlotwLXY6bbWJySayoMWHFI2w+YaGenyJpU=;
 b=akiMeG+pZFyItoHhw4C+p7lr3108HgmiT2vujFYhshA4GBvUrk9snSIwe7n+fsFNvOn4
 FoX4hbzxN9wmF/hYFKqhvdfVOJ6//UHwyceyFZ5TNMigHX8zFMkqJoA3DHqTFXPVpIUJd
 UtMs2BzlnelQMVLcZqzWupiHw2itiLPcPGmHEyqEiLDbhpaVFP2Dto3v9m8XWRXEMTXVb
 /NcnAcaW7nNLyCOypPnhFyMqBpTRnAwQj6nj6MGCdwo4ujUMSuo//CpkOKzpgM9PZYcdO
 3jmw6j4MQNSXfA16U7HiIyabEryQLv+YewtswnM1kn/4X+Nw8kwEmmnZRXY0HoAx6Bg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="0Lvf/14e"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D24DB6070D
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:38:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AB5C4C62205
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:38:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D874C60393;
 Tue, 20 Oct 2026 20:37:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E982610328934; 
 Tue, 20 Oct 2026 22:37:52 +0200 (CEST)
Date: Tue, 20 Oct 2026 22:37:51 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <atfQ8JUFlM9vWdTL@windsurf>
References: <aq4_E7df6qI8WnH4@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aq4_E7df6qI8WnH4@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/nim: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Waldemar,

On Sat, Sep 19, 2026 at 09:51:47AM +0200, Waldemar Brodkorb wrote:

> +define HOST_NIM_INSTALL_CMDS
> +	cp $(@D)/bin/nim $(HOST_DIR)/bin

This was causing the nim executable to be installed as a file named
"bin" in $(HOST_DIR), as host-skeleton doesn't create $(HOST_DIR)/bin
as a directory.

I've changed this to use $(INSTALL) -D -m0755 instead, and applied to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
