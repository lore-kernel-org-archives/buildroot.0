Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE007C4167D
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 836B47059C;
	Fri,  3 Nov 2023 09:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 836B47059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lJLXQCnYZFkt; Fri,  3 Nov 2023 09:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DE8370401;
	Fri,  3 Nov 2023 09:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DE8370401
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29D8C1BF27E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C457581421
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C457581421
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcQABhbqwLIt for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:55:02 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C75E813B1
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C75E813B1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 870E76000F;
 Fri,  3 Nov 2023 09:54:59 +0000 (UTC)
Date: Fri, 3 Nov 2023 10:54:58 +0100
To: hmaied.benabdellatif@etictelecom.com
Message-ID: <20231103105458.36622fb1@windsurf>
In-Reply-To: <20231102143608.3231106-1-hmaied.benabdellatif@etictelecom.com>
References: <20231102143608.3231106-1-hmaied.benabdellatif@etictelecom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699005299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HY8VDUrjhrotsfuRKAzvq+SZRrays0V2Xo3DdBmA+uw=;
 b=EHLRJexDdHQiXvQWcTd5tT9l6XUzeSmwWnAfhvZKelCGM+IUSxpB4t2r8yfKSV+y1++c9Z
 OsU5cnuz/KlaL6RZeQajjcv759YpHiZCJvmsA+N5Xa5TXKdOJ4merFrvei4gPmABrx8SmH
 Ih0SXT3mPS3Swl4iJCSJCWaTV+7Zbv3TZmU/g9ZxBHWi0tyVLCu5tk+sZ87T9UPovM6dnt
 s6dXcyrfXqrzA+2CcWx1l3wkdUlFkMt57Rh7rSxBUTtLe5TLxLeXOMTjDKSFJAJQIy50os
 mk1LThWJhmXg5CL/J6V9S2oCN9sYmPAbvKMlF9e76LiOBpCBABF55vhLdhwCFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EHLRJexD
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
Cc: David Bender <codehero@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Hmaied,

On Thu,  2 Nov 2023 15:36:08 +0100
hmaied.benabdellatif@etictelecom.com wrote:

> From: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>
> 
> Signed-off-by: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>

Thanks for the updated patch. Could you please comment in the commit
log on why patches 0001-fix_cross_strip.patch and
0004-revert-ITS-3977-fix-libtool-static-behavior-to-match.patch are
removed?

Also, I see you rename 0002-fix-bignum.patch to 0001-fix-bignum.patch,
but it looks like you forgot to also rename 0003-disable-docs.patch to
have a correct sequence number.


> -# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.md5
> -md5  6036a03b3a67b4a1fe1246e0a2c7265a  openldap-2.4.59.tgz
> -# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.59.sha1
> -sha1  b154d06bbf40fafafb34fffc4b116946d931efef  openldap-2.4.59.tgz
>  # Locally computed
> -sha256  99f37d6747d88206c470067eda624d5e48c1011e943ec0ab217bae8712e22f34  openldap-2.4.59.tgz
> +sha512  ed0c3732c096807006a13df7484c889ccc6943ced3e50c0d01034e6c6823c0996ae1fda0348677243934fbe8715a467abc46f01dee87b7571f5392b0570eb04a   openldap-2.5.16.tgz

Why are you no longer taking the md5+sha256 from the upstream website?

Apparently, because they are now only providing
https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.16.sha3-512
which is using SHA3-512, but we don't have support for SHA3-512 in
Buildroot. However, you could probably verify it on your side:

$ wget https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.16.tgz
$ sha3sum -a 512 openldap-2.5.16.tgz 
5a1fcef237bbcf119dc1be15c366283814c29e6433ebe320ad186f184f52befc1f4f1dd81faf29b1d078e2f59e8de081699a153f0821f3741d7d24913276d577  openldap-2.5.16.tgz
$ wget -q -O - https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.16.sha3-512
SHA3-512(openldap-2.5.16.tgz)= 5a1fcef237bbcf119dc1be15c366283814c29e6433ebe320ad186f184f52befc1f4f1dd81faf29b1d078e2f59e8de081699a153f0821f3741d7d24913276d577

They match, houra.

$ sha256sum openldap-2.5.16.tgz 
546ba591822e8bb0e467d40c4d4a30f89d937c3a507fe83a578f582f6a211327  openldap-2.5.16.tgz

And then in the .hash file:

# Verified by locally checking against the SHA3-512 hash available in
# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.16.sha3-512
sha256  546ba591822e8bb0e467d40c4d4a30f89d937c3a507fe83a578f582f6a211327  openldap-2.5.16.tgz

Could you rework again your patch according to these changes?

Also, when you send an updated version of the patch, we expect the new
version to be [PATCH v2] or [PATCH v3] and have a small changelog below
the --- line. See
https://buildroot.org/downloads/manual/manual.html#submitting-patches
for more details.

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
