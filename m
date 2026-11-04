Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A99606C937
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cNxgSZBz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4207360815;
	Wed,  4 Nov 2026 21:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqVAUfL4iXhT; Wed,  4 Nov 2026 21:01:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6B4D760728
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826089;
	b=JeGI3LJWIwq1QiiBUt6M01tJh+h1Su/7Ugl08rou6Sruwg5wphTDLXzvqtnouAOi+B3R
	 rUeM4wufHJYb3XZIWFl/oMPCw5pZMYuoCTK5x7T5fgWJTpP+umU7vxvitHdlRLGI5i3fQ
	 m9jq5+Lee+uOnuvKJLKVjebpNrXg771sCSSG7Mf2oic6PPMMLoEYccJ2w4c6/iqT1Whml
	 xzWaxg7jaMQHWJHKPbQbZ1JBte6uJW6v8jhJyv+vblvRRouccqsut0W5E69/17UTRzWAx
	 sz4gL+yDzVL1JZc9K9JpwwL4bPXgyysoiXJlhdVCKpjfSJWTopm+SJxx11i8w1EMk2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826089;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=UJoTgHGkeeDvCe2KPuKdR9asWPFvLSsp4pE3AlHkf8A=;
	b=sCZ3EJaEuqdj3fHx+jzVLPVmS2NoUE7E7un40H0Pqhv5QnlBFiUouWK/apKYslSnHgDe
	 3JzK3I8nIw51gzeLMEKJITB73Opk8LhooAYQVdusygK9WroOX5gyuisWpR8WOXgpowDWo
	 ND045ReOmY7kTgaZcdlp76VVPuWpoFDORMUS8Q+hEr1/fSrZdkqA8BX/wcbU44ar9EM3e
	 iTrhMcCv1aMFE4WeEYLrAUfpf+2raKbmZwQVbVm1DqEYDKqFxjzeCl8k6aBpYNeK2fOOt
	 Vr4+0hkbnZyqbr/cU/7JVkT6QbdKi+nH6C+fhqelVjvJ5TlR7KPAUTydYNp/SmMJkew==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826089;
	bh=UJoTgHGkeeDvCe2KPuKdR9asWPFvLSsp4pE3AlHkf8A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cNxgSZBzX0hqHH3y5aRdCCctyc1ciFMxHFClI61KUTeovFJHZ0WA6WAYLFAzBScWg
	 FhiO1xDF/1RH4iZx0yGKWLP41h+J9rcK7jAilT2LpUNQisU5ZV/o1nlVrp0t8thy/1
	 0635W8Q1Yk1LMKNuhAaJniFfOOuNysjSeieAkBT8eDRlp+yadKXiqdx5A64xEkJI89
	 62iWej6Vvqdd/XiwISg8PK5Hyk4jR9akqbSU5f0aWc6PF/ZysqW0ysHGGd9GZmnXB3
	 +cNzIdC7J3uPWmMeIulCB+KvPavOOHpAeR479gHJQ64p5GKIS4ZJ8JdwcfzdQcaggM
	 MPAOZhILZXgqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B4D760728;
	Wed,  4 Nov 2026 21:01:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2443231F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15E546078E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOJ5LLPgbNRC for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:01:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2FAE4605C9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FAE4605C9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:01:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A40804E403AA;
 Wed,  4 Nov 2026 21:01:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 334985FAD2;
 Wed,  4 Nov 2026 21:01:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E01EE10329206; Wed,  4 Nov 2026 22:01:19 +0100 (CET)
Date: Wed, 4 Nov 2026 22:01:16 +0100
To: =?utf-8?Q?L=C3=A9o?= DENIEUL <leo.denieul.yoshino@gmail.com>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>, 
 Dick Olsson <hi@senzilla.io>, Vincent Jardin <vjardin@free.fr>
Message-ID: <auudGNArpxqTGpHE@windsurf>
References: <ausqgYQmLF5N9AZn@leo-ThinkPad-P16s-Gen-4-AMD>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ausqgYQmLF5N9AZn@leo-ThinkPad-P16s-Gen-4-AMD>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: pass HOSTLD and
 HOSTLDFLAGS
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 01:52:17PM +0100, L=E9o DENIEUL wrote:
> Since TF-A v2.15, commit 0607fb7f6bd9 ("feat(build): add HOSTLDFLAGS to
> pass flags to host links"), the host tools such as fiptool are linked
> with $(HOSTLD) instead of $(HOSTCC).
> =

> As Buildroot exports HOSTLD=3Dld, fiptool fails to link (undefined
> reference to optind), so pass the host compiler and the host link
> flags.
> =

> Signed-off-by: Leo DENIEUL <leo.denieul.yoshino@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
