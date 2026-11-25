Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3577606A321
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=htVT1Jnc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de header.a=rsa-sha256 header.s=MBO0001 header.b=uW5O8lkN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3179B80D81;
	Wed, 25 Nov 2026 07:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdWL1zqJ7SBX; Wed, 25 Nov 2026 07:56:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B0DD980CCA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795593391;
	b=MhM95KgVmcCiMFg9ZBrWQbDnzwIEFk4F1lIMPehEIXtuqPmugQ2bWXMhvNHWFkw8EcqF
	 drpGwsD1lAJn+MUpnII/JhupSNTsaYxGrN7CBGpSNeN8vCsNRJ2rTqlbdpl2DzetHU5IF
	 o+IF1YTo+eMohP5V46y4J9DGKeP0kiTeeqORXCIeoZFgeo0bOdvYclkva6EEkAWCvuKwd
	 HGGd/tsVerhsMVv4JfWyxt/nLZtAC3qA0lzjGxram4n0u/vlnd/tdX1L+sJekgRBsZdwS
	 689EUWbCEpR4bHj0xAOiaOUrfQy4RO0mqaS+Q+cE8kWUpi8d1rGNn4kuuo0OJZUZ3Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795593391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:DKIM-Signature:Message-ID:From:To:Cc:In-Reply-To:References:
	 MIME-Version:Date:User-Agent:X-Rspamd-Queue-Id:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kkHhxCgw6mlJCqMAB0CyxcYvyHBOkBHOor4CAp31Pp8=;
	b=q4XOTul+yBSmySuIF7yIRS7e1ekVtkuv7UTBB26Wh2k9ncsF7Enj1qAJDePNDNa6xlX0
	 MfWJUSsv+BVuJKu0dR49NoVKVQmRoD6Q3YI7F9c1K/T9AbCe+E+9YoQ2OQ+HyOGVL4wDu
	 seqFaWlclEqJ+FrMKjptoltBWW6VPOSxJ1RimeMjVPWGmToZ5V/XvbL0F6XEm0vVa7dN0
	 xpsSDziFOyWgdDqEcZi91H7C3RHeWwQUW4nx8TdAv444GsF66tl3AgLe4ngm7Blmm2Pjr
	 5G7N93Fbrx+trrhr0pTDKVDzUx5mpE3N/2d9p/ejUx1jJ5T3EsQEhqlyTwzW7Ae7XNA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795593391;
	bh=kkHhxCgw6mlJCqMAB0CyxcYvyHBOkBHOor4CAp31Pp8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=htVT1JncBmaT74vuEw7CxKULdAapZTzvT8UBbNtEiH0zGyBNTBnrO8qty18wrXdVg
	 Fnmta3Wz/k7W7JvQPsnt9fNqaaw9N45A8avYOMldZ/sp5qyLm8Z01bpAgLm/f8ArJg
	 lPS8nJbOwz5moA4zDZm3nVVKu7ZB+6gdhk4XsWTr3vAWG79f5EH4GedhYNMXwnkX9i
	 vWPBIoluNUkeAyxKFlnXjXWrsxsodgbAO5rfaLfY3QAjQv1Lt7zZWgskD1bCs42TeO
	 nDjMEexRsejAuOuwOom3TQPb+OfqsqV67wT6iXAuE6PjKZoA+wboTEP10lMzQ0evDW
	 B/f9HOWwMzsgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0DD980CCA;
	Wed, 25 Nov 2026 07:56:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42BD02F5
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 07:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3442B40122
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 07:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmQgb-RMuC3E for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 07:56:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A005640064
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:67c:2050:102:465::110"
X-Greylist: delayed 479 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 25 Nov 2026 07:56:27 UTC
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=uW5O8lkN
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:102:465::110; helo=mout-b-110.mailbox.org;
 envelope-from=sebastian.michel@oss.othermo.de; receiver=<UNKNOWN> 
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:102:465::110])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A005640064
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 07:56:26 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4jZBcm2KjKzNlt5;
 Wed, 25 Nov 2026 08:48:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1795592904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2rsSTf7O5HssnkbWsoxeNMZZQO8KSltISGtmX3LFGk=;
 b=uW5O8lkNthwj92TbaW2NMCze25yOgInVilP16n+/PTTAXgdEszDP+BpvppMQa0xHEZad0K
 juLHseHog0g0iEj4yiEvjUqkFQvFdATFn9O64Gbt5v/DfhR4K+JJ2Z/mWEPYuOP5jOFamT
 3d9PRhmE8hjwc2SmAOS1X4F1Tsxl9Ka4X7xE6eG1Xx1Yt0lbyMPYaYz1rUTWWeWW8OsnO8
 I/GkAMvgG2NptaLfj4pcnJuEk/hXd4707VivpRFod1Z0thNq9gDPvQ7poXS4q7OWeLeAR3
 EzHHictOoOipUg+tgW56FFx8cdqZOhW7qNyTv2GzRtOW9jb8AlZW23xSBdvl2A==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of sebastian.michel@oss.othermo.de
 designates 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=sebastian.michel@oss.othermo.de
Message-ID: <3963ee911831353017937a24f7c1d042fe9393a8.camel@oss.othermo.de>
From: Sebastian Michel <sebastian.michel@oss.othermo.de>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <87zev915fx.fsf@dell.be.48ers.dk>
References: <20261113092630.1245957-1-sebastian.michel@oss.othermo.de>
 <87bj7r8qcv.fsf@dell.be.48ers.dk>
 <f5679391-fea4-4ad3-a0dc-01e7031dbd7b@oss.othermo.de>
 <87zev915fx.fsf@dell.be.48ers.dk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 08:46:58 +0100
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45app1) 
X-Rspamd-Queue-Id: 4jZBcm2KjKzNlt5
Subject: Re: [Buildroot] [PATCH] package/wireguard-tools: switch to
 git-based source download
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hey,


>> Ahh, as the author of cgit, Jason would probably like to know
about 
>> that. Did you contact him?
> ...
> I don't know how the cgit archive logic works. If there is come
> caching
> then he could perhaps replace the 20250521 file with the copy we have
> on
> sources.buildroot.net?

Just to keep you updated about this: I wrote a mail to Jason explaining
the issue a couple of days ago, but unfortunately no response yet.
Should he write back, I'll keep you updated.

Best regards, Sebastian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
