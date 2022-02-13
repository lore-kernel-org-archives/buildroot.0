Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FEDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D56040325;
	Sun, 13 Feb 2022 22:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cE40q_SYee1L; Sun, 13 Feb 2022 22:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0ED240274;
	Sun, 13 Feb 2022 22:35:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8120F1BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE8C606CB
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgVdx82iYdKN for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:35:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTP id 344CC6059A
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:35:27 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNSnniDS8XmFAJNSonv34M; Sun, 13 Feb 2022 23:35:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644791726; bh=ecMQSt45FNC+YdgoykVnsYW5BxCs6HzKQm6qt3leRmg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=dU/zMqEPmsI6GuKt394cD5oL4X+trhJmXywZf0Imkbv/jQir5Dr/0B/Hexs5RP9Up
 h9W3fFNGxiHOoDK9zRFOLJzfs7+7fcHtj4XSi0M0VbRKMCDyEqIRpYCnQslHd3yloh
 m2zm/BMwl6BjgGhnAEfhoEYhySSswToc4ycyMrszRoyoh8uFlXT0izQelYw3sCzYv+
 Qbrb+Bq1YeSrwAcqwCCC2VEwpD671+tkNDVTQMLfEIBpciX9rF18f1GMbOIt8Hq1n1
 Nb4eps92dTyghPefUqsGZn3i/ZXOMSCxYt+mC0D1Pgohd1pg5YpDuvZufDGOrnpv1i
 8wWbeoaJwvqpA==
Message-ID: <c5500c48-fde2-e535-ab00-88fb17eb083e@benettiengineering.com>
Date: Sun, 13 Feb 2022 23:35:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220213210504.1416861-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220213210504.1416861-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4wfPiwOGvkv2veb1jMOBYgymOlefnG+rVLxi/oy6WtWIpO4zFZHbTKj8uLMsdxobstsaCiGohkWLuE0/IU9Llbf3ojiVX8D3rPUC4rFzUZySj0+Q/AxOs3
 Hjv/9MtPoo5/w39xsU9keHmeKeozJDhNEXCYvzIwdJTO84cuh9X4TToqCcAhIMHickSgslSbZJLY/fkNyBkkwsi/o+KAwCkMBn5W6d9KjYhTeRFiBXG4kDWi
 0MdCoN5VXN8xOkT37bvI6A==
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptsetup: set
 CRYPTSETUP_AUTORECONF
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

thanks again,

On 13/02/22 22:05, Fabrice Fontaine wrote:
> Commit 683e8387d05cb506c30592ab43a3e7534d7cf56e forgot to set
> CRYPTSETUP_AUTORECONF resulting in the following build failure:
> 
> configure: error: You need the gcrypt library.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/f6cead0cf1089bbbe52457d379764a0aa9add408
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Now that my patch for DEVELOPER has been committed I will receive the 
build failure e-mail.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   package/cryptsetup/cryptsetup.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 2e06047c56..55cc70576c 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -17,6 +17,8 @@ CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
>   CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
>   CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
>   CRYPTSETUP_INSTALL_STAGING = YES
> +# We're patching configure.ac
> +CRYPTSETUP_AUTORECONF = YES
>   CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
>   CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
