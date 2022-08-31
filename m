Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF23ECAAD4
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 20:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 054F7610E6;
	Wed, 31 Aug 2022 20:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 054F7610E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5N4aoZVpAz_F; Wed, 31 Aug 2022 20:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F7660C0A;
	Wed, 31 Aug 2022 20:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63F7660C0A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 953F81BF422
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 20:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D8134012D
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 20:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D8134012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YADgzCsAf8g5 for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 20:24:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D869400F8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D869400F8
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 20:24:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a07:37d4:42bb:3116])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BC61D13F86F;
 Wed, 31 Aug 2022 22:24:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 31 Aug 2022 22:24:27 +0200
Date: Wed, 31 Aug 2022 22:24:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Message-ID: <20220831202427.GK68979@scaer>
References: <20220829171415.129914-1-marcus.hoffmann@othermo.de>
 <20220829171415.129914-2-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829171415.129914-2-marcus.hoffmann@othermo.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661977473;
 bh=wTurjPE7Mosx2qa2Afj6xXyGAo6jYZM75wJlqWVMKW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TZ22oQ3UTTWEDaNvWhUABhmu1rtxj6UckZPWrVlEex7WsxTLZXIH/p2U0RVHUXIvO
 3BsdV90AgP+dKbtwEBb6jGEFS36Gn7GEkyAjLtkO7gdnFMGPrTxRpWglXhI+8rg1Rj
 YhEKf6vdVsZjn0ZaKRSxpUfqDmBCD2u43DYIjsFNim4wtX8BKmK2zXGV/O/+natX/P
 gAzSQcdF9QscIo4wIlal7j8gB/pFAJAPwGzFZD5dONX0jbbfSmwc6evj+j16k5PlKW
 86ViKUA/gZ2hr/ewNvjOLNH0Jf3lLTaUxhu3KAePPYgcoG1RKNBrXORARDOV9mZY9R
 jF6JIFvCdR2TQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TZ22oQ3U
Subject: Re: [Buildroot] [next v2 1/2] package/python-paho-mqtt: bump to
 1.6.1
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
Cc: Davide Viti <zinosat@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2022-08-29 19:14 +0200, Marcus Hoffmann spake thusly:
> We need to switch to the github download as the sdist published to pypi
> doesn't package the epl-v20 license file isn't included there:
> 
> https://github.com/eclipse/paho.mqtt.python/pull/635
> 
> License changed to EPL-2.0 or EDLv1.0

The LICENSE.txt file read *and*, not _or_, so I fixed that in the commit
log, and in the .mk [0]

> Changelog:
> https://github.com/eclipse/paho.mqtt.python/blob/master/ChangeLog.txt
> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> ---
> Changes v1 -> v2:
>   - switch to github download to have license file in source tarball
>   - update license hashes
> 
>  package/python-paho-mqtt/python-paho-mqtt.hash | 10 +++++-----
>  package/python-paho-mqtt/python-paho-mqtt.mk   |  9 ++++-----
>  2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
> index bf3993e919..dbf9ee89f6 100644
> --- a/package/python-paho-mqtt/python-paho-mqtt.hash
> +++ b/package/python-paho-mqtt/python-paho-mqtt.hash
> @@ -1,6 +1,6 @@
> -# md5 from https://pypi.python.org/pypi/paho-mqtt/json, sha256 locally computed
> -md5  e3ac29cd5dc247a01083a2a8f3fddd08  paho-mqtt-1.4.0.tar.gz
> -sha256  e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79  paho-mqtt-1.4.0.tar.gz
> -sha256  76f13729e84e9222e543303df00f87d1b2c0995b6a505cd859a285667e44babb  LICENSE.txt
> +# locally computed
> +md5  00c3381d7deacc7ac8b220f3b9d689c6  python-paho-mqtt-1.6.1.tar.gz

md5 is weak, we only keep one when supplied by upstream, but we do not
add locally computed ones [1], so I dropped it.

[1] https://nightly.buildroot.org/manual.html#adding-packages-hash

> +sha256	6e35c1be242a901fc9c00bad7d37b5cc4a497f398dfceb4ed0d8018a959be650  python-paho-mqtt-1.6.1.tar.gz
> +sha256	66408b049249c3bdb0ba1ed285f5422ce67e371d40151bebd4d806af454ffe7c  LICENSE.txt

Fields are supposed to be separated by two spaces, not a TAB (though
that is supported for historical reasons).

>  sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
> -sha256  3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
> +sha256	8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  epl-v20
> diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
> index d192749e1e..3ff5f9e57a 100644
> --- a/package/python-paho-mqtt/python-paho-mqtt.mk
> +++ b/package/python-paho-mqtt/python-paho-mqtt.mk
> @@ -4,11 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_PAHO_MQTT_VERSION = 1.4.0
> -PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
> -PYTHON_PAHO_MQTT_SITE = https://files.pythonhosted.org/packages/25/63/db25e62979c2a716a74950c9ed658dce431b5cb01fde29eb6cba9489a904
> -PYTHON_PAHO_MQTT_LICENSE = EPL-1.0 or EDLv1.0
> -PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
> +PYTHON_PAHO_MQTT_VERSION = 1.6.1
> +PYTHON_PAHO_MQTT_SITE = $(call github,eclipse,paho.mqtt.python,v$(PYTHON_PAHO_MQTT_VERSION))
> +PYTHON_PAHO_MQTT_LICENSE = EPL-2.0 or EDLv1.0

[0] here, I changed to: EPL-2.0, EDLv1.0

Applied to next with the above fixes, thanks.

Regards,
Yann E. MORIN.

> +PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
>  PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
>  
>  $(eval $(python-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
