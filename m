Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4A8C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 14:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF9C80CAF;
	Sat, 12 Sep 2026 14:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZLbYqHKEEVo; Sat, 12 Sep 2026 14:58:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 80F6D80C63
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789225117;
	b=QRkEml8nE0S93kKiHEXgz2T+oxrLLtqVkaTGem1hDjXZkStKop9LNGsWInPOBY4p6no7
	 hwFA4X5FOw/bJ9Uc2uzlBn+SFjAPocwKnqZT7JFx66+WfD/j55XvW43/VA3w6TfqNvSmH
	 kKlMMrruqKKAMxKRbmpXYVFNum8gDfBkv6eE0FLZF8I5qmBzDhhnA85EFpR0l9KnanyvD
	 t+1hKZ90dHTZ02Vbzo08WR0eKtJenuqf2z28cvxfvKkjO4JyCC74jTFSVRh5IrCrZCcoO
	 g3qlk1vt6CtiDZ8kQLmb385ok3lqB/BPhQ5Hjdq3TazZgdqxgVkKhLhlbGFZUZEHdCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789225117;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ZLC5x3NP+q2/obG4ktYq8an8llOGLmKovk8G/2YFCDQ=;
	b=RB0LZICawhmUW33DrHlBEbn4meLD2voenBW1dWOVjucMR6EIbS+lEFwcNwmexIkqGQtk
	 xlF5UL7cAbjBvAdfXwMWfXNaKTTtGEdTEjek5UBOJgKwxLgMyjCaDg1XjEysDR8tpSh3M
	 /EyvZq7Ka51PrbCTEGXtCrF0nOnw5NH/I6ojEUo188cmXMM8VRecinkzS7SBvA+33Y2N5
	 j+mTSHmbE/FH5bVV89brBwC6pKDTHi2pqYvsH908yMXbxJYMzXKmqUgSCcsXwiDLJoNvn
	 tcpKXAqCO6L0EFxyQ5P9BroNNzEm6akPf++II5BB+9qdu+bzaEiNXq+LrfSv+mJBqfw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789225117;
	bh=ZLC5x3NP+q2/obG4ktYq8an8llOGLmKovk8G/2YFCDQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=faz+NAIUQGoruDCSNbBzCtKmHYR2MY/fBFCVIgqG3uUDaLmxeTpn/b891ChCHkJ2C
	 uItQLgTQMameBA5Mea5FX1HcxKbwm7P09KdjZr8EedrKjj0/plnBJabPeXoZ1lnvt9
	 ZSjpdGiGnwppgaCxR9cDPghKIJQ82J8h7XASATlLv8DsledEuo9KbELVTw4sfHd4Td
	 t5gNrmEt8P/eFW1nQQJiG59zIYtsKPz1j/IqtIWyuuyPcqOogcYivYnrRyJ+tGCf11
	 /KiDrYYwmSgbqk+szeg3tSFjUlBJi9ks/pB72eEBX6qjze4QrBI7IVCeEqb7EYkoD/
	 sZBHNd5wuQIxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80F6D80C63;
	Sat, 12 Sep 2026 14:58:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62FF132F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4910560608
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvGVvqv5kK8B for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 14:58:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 44A25605EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789225115;
 b=ijVNWQ24CYfe2EZ20CSBRnfIblvOoYjBzYx4XlW57UFnMn/WMPk555E7KQmCb4TtOeAF
 a2EbmNPZ+Qwct269lGYDAPWZpSWIkRGzGadRrVFkgPdrEjCamhkSfzRvlQPIimpOOUui8
 t4x/DA5EuQpBhwrTZpHYNXSaRhBcgUmnPPD+A4hjpeZ0QPEybKkzQnoIZ7Ma1zXFMW0j9
 0xkp+qO9ystpCyKYeKdP3kHGekKrjnSeWlEiiIpltWU1iegszkqdY+8q5AqyLdz22AWsd
 VLfZQJCHuhgKrYaaCww/uxNQUswTaF42iRKO+d5HPliOIfHcJi2dS8IosU11AP0hy9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789225115;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=RZ4Ow2PTKiTBR7AeaYAsRwIbxH8bKhi1FgbyA/O1rCE=;
 b=Atq8nbOKTlrrqai8ttJobWr5V02o4N2ii3GpI4Iun98aEkuqLkRgxuATLPKCe0PIAkjN
 aguGhVYn+gjI78thuS7N3xfC3HJPNNU7XF6euqY67hm6guwnqj+gDOS5OA97t28SLJVaZ
 TwMsg05J0CNJFYba+Ti/iiIJ5gDlhkDzvNb/m6idXhtX1NO4YbU01f2YNuHu/4w5nzQPb
 miC7YhfEiKT/DoM4f4Cy41pnBoVdzlik2evG9KKlTnm7inZ+wpOGUeu14r/bQmHZH+gC4
 Y/fo6bqSYobkOvFFP3/t0cqNhaQrRuPiijTvG/Qop4mqvhrhr+yyj87cexdHc5szfiQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NhH+1wJw; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44A25605EA
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:58:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D0A7460136;
 Sat, 12 Sep 2026 16:58:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 16:58:30 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 16:58:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philippe Reynes <philippe.reynes@softathome.com>
In-Reply-To: <20260911211507.776128-1-bernd@kuhls.net>
References: <20260911211507.776128-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <e34801044a5e727087c0c19a22a9fcf9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: bump version to
 rev183-2026-08-26
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/09/2026 23:15, Bernd Kuhls wrote:
> Rebased patch 0001 and added Upstream: tag.
> 
> Removed patches which are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
