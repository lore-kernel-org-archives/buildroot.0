Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2A6CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7384F80D88;
	Sun,  4 Oct 2026 16:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3qIBjVxCiGw; Sun,  4 Oct 2026 16:01:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A174B80D50
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129716;
	b=jWa5ky3Ul5QEwjK5dljLHi5qweelMBti+1ghRtV8mJluOCh7OzLsYEU+3yBOZD+T6cV4
	 f6Q1Nn28vYPfoaHokdblTPoHGuKZt7tQ0GUyPRvxfrTW3shmQJoluIFESwIFRp0GP7Y9U
	 pHSqGK8UU/KZC7D1gJ6soDwljBaj1HnE0aunlg/gBqhOHD//TzfKgx46T0xT6KWiwvyUD
	 WQ6gKwqJU7VmHXW3xrmqO5mD+W58xJV2RaWt856eE5nE284y7LkjYpp1XxtNYqZxrZrXJ
	 d6zVp8/geJCelud4KPKC+/VsJfTMkY71fbtTiv6/yTRp8Dlv8A/PRst6eKPVTeiQoZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=viRLXbjtYdD9gUXb1fAJyL60eVavJB/c9JRKHqHXui4=;
	b=m/2qhgiPPClBPhQTAroe0tV2PLu8JZgsDawljG5O32CMQSj/D+Wgs0zwSBR2y6k5mrIH
	 K3DJeIrqavrJ/ht+06udxrYhuURgDw2Im35YAVJsWUc8edjp29cZsOGOY4jXkWgycZ53I
	 t7pWPX/9DzzzjqY/GJbx1behhGcTz4hdlLJGeHOhyXML4iln5QQL1XvSzLPhPgpg0ukkB
	 6ASwI8r8wWs5aKo0gw/i8vQ/YHmmyddd6dHSr3yS0khXvArTUrHz8ZjiM9gojAjn5t1DL
	 NSLhJPdJVa8qOI4s7e6JPqtbLVSz4azUBSlTFLeZJRz/LsgW/id1wK+y/Vprcqbrbzg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129716;
	bh=viRLXbjtYdD9gUXb1fAJyL60eVavJB/c9JRKHqHXui4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gw8lyMVqYAeOG4D8yv2j10yskTGTythjIS+ajB40OethKhKuEVxU+6QCXBJoOJlKh
	 iVFPZPOuPw6//u98Ib22+mkydJT8QpgKzZJcFaeGhseWAtS1owgAgQZaklL93wTPE8
	 dHqnmg1Fk2p56WRrEBRjEdVMAwdYVvSnLZ9bmU9ltnW6Zm0TPSNT+HtzBm6RTPVQEN
	 B+P8x7kWIn/prfOmwFP1HXqYzflUPusw62qG76Ie0UaLeAcaQbaPalYcjSofDlRTPi
	 2/T+kQFAIf5otsVeEpSmOi6M4OiJDoTELwW+lNbFAJ9zn38u9Xvxyd8Of6DLZhML8E
	 7k59ZoWbzeGyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A174B80D50;
	Sun,  4 Oct 2026 16:01:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A19632E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87ABD405A4
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWRhriTYbwxh for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:01:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AC1674059E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129713;
 b=e05EM4U8/aNNFaJ58VbQTZnLCt6p0Kzyth3NfBkJAmgIIlcd4nSlGx2DY5ot0Kn7JEi1
 X7/ORHSydNY60uMcUsGrgQkmwv3qH0/wseTm3Ido9590fIuHxIa7OP35QBdJ1L/3iRFNk
 cc4XFw7cFrx9SKcJ+yg0bQ2W4flTg0ogsfnxOvtZx5R/+B+7F55LkdvR1zthvqtJp9Aeg
 WY61XE8GoCDjyEBWgFtjAvHIubwOs7frqxGd7lbvYCVRvTn/36PvcnwsB3E3Tap3J9ruW
 yt7wMSNODFC4c4yEOWqo0BQAn6gCnegzaNTmt48wsol4xXSDxzfKVA2+V57JjERC+Cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129713;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=TaswI6VIlN3hb2SiZiEU8deiOnIB/BcNfFnSpCA4L9w=;
 b=jAlnqSg+lHTMlulvnYmIGi3yLlrOqsMuIUUrvSDYy1SV92Uf46fBe7O60VDZPh+vaN7u
 Ty6Sm/n1+ZX4iiczJ+UMX/0a++XYTLsOFaKDKjdt6M+8Qumtj4hMO/Ni2tuZ+K7eoQfyi
 cSug58+n0AeJHgh6bO9FKObXSld3txCbdy3wY9H72PpbRQTH61eqkwnedkW2tPPFPzPca
 +WIHncCVhAhpHabqI6XQhWpjbIiwzkE+Js5tEy3BEIRKmHLNKGiKkOqxIEAPUc4uSrzH9
 n/WbbfIXmKztSwZlsdjOSjyf1C4SlfYLOI40qsCl+4Pv4ApktPVAb6l+eN+sJNr+ujA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Bvc58bDP; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC1674059E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B1DEF4E41165;
 Sun,  4 Oct 2026 16:01:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8713B604FE;
 Sun,  4 Oct 2026 16:01:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C758B10328192; 
 Sun,  4 Oct 2026 18:01:50 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:01:50 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ4aQvsmgT1x3Ba@windsurf>
References: <20261003210833.735937-10-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-10-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lmdb: bump to version
 3.0.0
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

On Sat, Oct 03, 2026 at 03:08:00PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
