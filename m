Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8C4C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1838F83EC6;
	Fri,  5 Jan 2024 13:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1838F83EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eoyntirFd0li; Fri,  5 Jan 2024 13:17:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6423883EAB;
	Fri,  5 Jan 2024 13:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6423883EAB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E4491BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1538C436D6
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1538C436D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GSVrpEuzeD2 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:17:31 +0000 (UTC)
X-Greylist: delayed 349 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 05 Jan 2024 13:17:31 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81534436BD
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81534436BD
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:17:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF64421D34;
 Fri,  5 Jan 2024 13:11:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0DE05136F5;
 Fri,  5 Jan 2024 13:11:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GC9eAgkAmGVEDQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 05 Jan 2024 13:11:37 +0000
Date: Fri, 5 Jan 2024 14:11:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Rob Landley <rob@landley.net>
Message-ID: <20240105131135.GA1484621@pevik>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
 <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki>
 <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
X-Spamd-Bar: /
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.82 / 50.00];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.cz:+]; MX_GOOD(-0.01)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-0.11)[66.47%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 REPLYTO_EQ_FROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 URIBL_BLOCKED(0.00)[suse.cz:dkim];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[18]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_TLS_ALL(0.00)[]
X-Rspamd-Queue-Id: BF64421D34
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.cz; s=susede2_rsa; t=1704460298;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XMu0Tc8M/OGHMVCqGwKKidHMYVyujs8ULbIrYAKyctk=;
 b=PirfMTLkdWyOzUVVz7p6G2ULi4VhsbiBiEovaWdYP6RmzcuwhtQKKUgKa98M3/Ip8l1k/g
 XwNng9X+TvSLeuIRIA9U9KlvSfKkHLqoBB1MvKK/dh3zwPOw6svOjDiCk3dtV0Bq+qEnr5
 Qv06406TfLtT/5tFFYvfvqWg9SA8IqM=
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=suse.cz; s=susede2_ed25519; t=1704460298;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XMu0Tc8M/OGHMVCqGwKKidHMYVyujs8ULbIrYAKyctk=;
 b=/vZmO3d4O+ZOvy2AL7ekQ7g4Fa0ZowPCpSXsCf1l01Jz1p9pxtSiDqKiaPh+6bDpvquCQ9
 f3qkaTRGWtQT5+AQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.cz; s=susede2_rsa; t=1704460297;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XMu0Tc8M/OGHMVCqGwKKidHMYVyujs8ULbIrYAKyctk=;
 b=Uk26/hGBJXjpw8WTegFn/8dWqIzARLH7T6rfeEUvsOk1mAl5RjTrjREnCSUF82cXmbTFX9
 ts3XwW8FLL2JAyFOtJWm3lU0iLZC81SdDShl3VZRNMWb0BNeZNSJ3HWfhQaPBCcvuyZzgl
 B8qt1ml182j0+u5k2jGWDzmk7ft6S0o=
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=suse.cz; s=susede2_ed25519; t=1704460297;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XMu0Tc8M/OGHMVCqGwKKidHMYVyujs8ULbIrYAKyctk=;
 b=Dq2NWLSjfkY6KPsXaTn2B4MnPvlbKABhwyuoEx9zmsCM6PoEOnXj0wNXu+xI3t+rB1SZi2
 oehXWwFEzy/kGqDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz
 header.a=rsa-sha256 header.s=susede2_rsa header.b=PirfMTLk; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/vZmO3d4; 
 dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Uk26/hGB; 
 dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Dq2NWLSj
X-Mailman-Original-Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="Uk26/hGB";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Dq2NWLSj
Subject: [Buildroot] Call for nommu LTP maintainer [was: Re: [PATCH 00/36]
 Remove UCLINUX from LTP]
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Andrea Cervesato <andrea.cervesato@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linux-sh list <linux-sh@vger.kernel.org>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Li Wang <liwang@redhat.com>, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Cyril Hrubis <chrubis@suse.cz>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, buildroot@buildroot.org,
 Greg Ungerer <gerg@linux-m68k.org>, ltp@lists.linux.it,
 automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

[ Cc also automated-testing and buildroot ML
FYI thread started here:
https://lore.kernel.org/ltp/20240103015240.1065284-1-pvorel@suse.cz/ ]

> On 1/3/24 06:09, Cyril Hrubis wrote:
> > Hi!
> >> I am not sure I agree with this series.
> >> Removing support for UCLINUX from LTP is almost a guarantee for
> >> not noticing when more breakage is introduced.

> >> How exactly is UCLINUX broken in LTP?

> > As far as we know noone is using it and nobody is maintaing it for a
> > decade,

> Nobody is maintaining "uclinux" because that was a distro, but you can build
> nommu support in buildroot and such, and people do.

Right, there are nommu users. Will anybody join LTP development to maintain
nommu support in LTP? The needed work is to add this support to LTP new C API
[1] and use it in the relevant test. There is some implementation in the old
API, I have no idea how well it worked.

If nobody stands for maintaing nommu, we will have to delete it. There is nobody
from the current maintainers who is using LTP on nommu HW (that is the reason why
nommu support have not been implemented in the new API).

Kind regards,
Petr

> Rob

[1] https://github.com/linux-test-project/ltp/wiki/C-Test-API
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
