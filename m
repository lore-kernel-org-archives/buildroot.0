Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D237C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 13:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2092C4F462;
	Fri,  3 Nov 2023 13:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2092C4F462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sKnEq50OJhFb; Fri,  3 Nov 2023 13:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85FEF4F465;
	Fri,  3 Nov 2023 13:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85FEF4F465
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DD4C1BF2C5
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 13:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DDBD85405
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 13:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DDBD85405
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_vWtzXmRqIA for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 13:13:21 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79F2C85404
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 13:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79F2C85404
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26C83E0008;
 Fri,  3 Nov 2023 13:13:16 +0000 (UTC)
Date: Fri, 3 Nov 2023 14:13:15 +0100
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20231103141315.582eec3d@windsurf>
In-Reply-To: <87fs1n59z7.fsf@tarshish>
References: <20231102143608.3231106-1-hmaied.benabdellatif@etictelecom.com>
 <20231103105458.36622fb1@windsurf> <87fs1n59z7.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699017197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0rHbuE/t0uhrOzxK/U5pr5fWghYNL5RhG5VrOdZFv0=;
 b=XTctd4xBawCHL/+FxO0NaEuXXNlaSsKyuMWWMfk3nV/VfwFjTfJFnNqQJg4zoW632NMIqk
 +07bDeUFWNU02KHofrIOx65M2/C6Qxx609ovI2wUyA1o6GDtM+vAaualfMOweCzj3KVmhX
 +MKTlkFxsq6wTtPQ0wquJ0VB8BUXvx7KOHy9wiDrNpEJP+TK/7mdv1PDGyDaUHx4x0DV9S
 8uNsyleBGtpTWf9qK20vKt0MHLdbGG2hxpM/fGlkjuJo8ma4nXNuGXrNVD4KTz3GUb0MLO
 2pJ6ihvvnlHE/O35zyvLpx7j7gjBi10/YAk9w8IRy6UC5RkNpQX3ksni7WJ30w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XTctd4xB
Subject: Re: [Buildroot] [PATCH 1/1] package/openldap: bump version to 2.5.16
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: hmaied.benabdellatif@etictelecom.com, David Bender <codehero@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 03 Nov 2023 13:48:36 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> > $ wget https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.16.tgz
> > $ sha3sum -a 512 openldap-2.5.16.tgz   
> 
> Where is this sha3sum utility from?

"dnf install sha3sum" on my favorite distro :)

> > 5a1fcef237bbcf119dc1be15c366283814c29e6433ebe320ad186f184f52befc1f4f1dd81faf29b1d078e2f59e8de081699a153f0821f3741d7d24913276d577
> > openldap-2.5.16.tgz
> > $ wget -q -O - https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.16.sha3-512
> > SHA3-512(openldap-2.5.16.tgz)=
> > 5a1fcef237bbcf119dc1be15c366283814c29e6433ebe320ad186f184f52befc1f4f1dd81faf29b1d078e2f59e8de081699a153f0821f3741d7d24913276d577  
> 
> This form of output hints that sha3sum is a wrapper script around
> 'openssl dgst'. Is that the case?
> 
> For the record, the equivalent openssl command to generate the same
> output is:
> 
>   openssl dgst -sha3-512 openldap-2.5.16.tgz

Yep, this also works.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
