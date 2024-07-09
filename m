Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260EAC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 12:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C726D40D3F;
	Tue,  9 Jul 2024 12:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_Qzh5xvQ-gx; Tue,  9 Jul 2024 12:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7453F410AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7453F410AE;
	Tue,  9 Jul 2024 12:51:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9BEE1BF275
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 12:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4A1281CE7
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 12:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnW5gMdUuJch for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 12:50:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 731E381CC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 731E381CC3
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 731E381CC3
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 12:50:57 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6C7A72C800F1;
 Tue, 09 Jul 2024 14:50:54 +0200 (CEST)
Message-ID: <d2f465a9-7954-4843-88a4-eedce65fffd1@bubu1.eu>
Date: Tue, 9 Jul 2024 14:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
References: <b80fa61d1f85e2e418afa9eb105a3aeddaa6d588.1720528385.git.yann.morin@orange.com>
Content-Language: en-US
In-Reply-To: <b80fa61d1f85e2e418afa9eb105a3aeddaa6d588.1720528385.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1720529454; bh=wxsI/CaHR+x1fULx+ql544AgtMB5Ka9BEtEZEJm4hi8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=qtVJ3HnAQMXFsTsvPQmXoDqlRAwPO1xI1EYJItc7em/7sgN1yDqU/nsQ7cs+SFVv8
 c0HCyUadN20tHV5AdrLEjb/9J9Wwr1gaamMz8sSMgxQHCg+TzNF1Ur2LHq6kOJ15kI
 O4j4y94pj7Q7GMDGNjDfkGV7AnFS5j2yexvx/U9hg9NaXwZ2SQRTc+VwukUl5Bxdkt
 kPKEKHln7El3XJU9PDjNlv9fJM69DlbXsKE/mYLVrG5sg5vwvgbAYaVUcUGcwiUQ6v
 l4yahw3Cxlm+xuuNp/G96MMg5Gn0q/sMbrz9OxGlrQgo3dW1tvPxKVub24jM3dWx2r
 cpYzZDpEs0JFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=qtVJ3HnA
Subject: Re: [Buildroot] [PATCH] package/python-paho-mqtt: bump version
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Davide Viti <zinosat@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 09.07.24 14:33, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Version 2.1.0 is a major bump, with an API change that should be
> backward compatible with version up to 1.6.1.
> 
> The runtime test failed in timeout because the crng init did not have
> time to complete in the default 5-second timeout; tests showed that the
> trip-off would be between 6s and 7s here, so increase it enough to leave
> some margin on less-capable machines.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Asaf Kahlon <asafka7@gmail.com>
> Cc: Davide Viti <zinosat@gmail.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>	

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>   package/python-paho-mqtt/python-paho-mqtt.hash         | 2 +-
>   package/python-paho-mqtt/python-paho-mqtt.mk           | 5 +++--
>   support/testing/tests/package/test_python_paho_mqtt.py | 3 ++-
>   3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
> index 81b9dda81d..5fe91c5c54 100644
> --- a/package/python-paho-mqtt/python-paho-mqtt.hash
> +++ b/package/python-paho-mqtt/python-paho-mqtt.hash
> @@ -1,5 +1,5 @@
>   # locally computed
> -sha256  6e35c1be242a901fc9c00bad7d37b5cc4a497f398dfceb4ed0d8018a959be650  python-paho-mqtt-1.6.1.tar.gz
> +sha256  3602ce9d1ada58b063f2052ff013ff8cdd06d66cef918d5f6d048b6f68ccf049  python-paho-mqtt-2.1.0.tar.gz
>   sha256  66408b049249c3bdb0ba1ed285f5422ce67e371d40151bebd4d806af454ffe7c  LICENSE.txt
>   sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
>   sha256  8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  epl-v20
> diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
> index f255a7847d..095d6e1f90 100644
> --- a/package/python-paho-mqtt/python-paho-mqtt.mk
> +++ b/package/python-paho-mqtt/python-paho-mqtt.mk
> @@ -4,10 +4,11 @@
>   #
>   ################################################################################
>   
> -PYTHON_PAHO_MQTT_VERSION = 1.6.1
> +PYTHON_PAHO_MQTT_VERSION = 2.1.0
>   PYTHON_PAHO_MQTT_SITE = $(call github,eclipse,paho.mqtt.python,v$(PYTHON_PAHO_MQTT_VERSION))
>   PYTHON_PAHO_MQTT_LICENSE = EPL-2.0, EDLv1.0
>   PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
> -PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
> +PYTHON_PAHO_MQTT_SETUP_TYPE = pep517
> +PYTHON_PAHO_MQTT_DEPENDENCIES = host-python-hatchling
>   
>   $(eval $(python-package))
> diff --git a/support/testing/tests/package/test_python_paho_mqtt.py b/support/testing/tests/package/test_python_paho_mqtt.py
> index 0fe7fa5904..217293e4ee 100644
> --- a/support/testing/tests/package/test_python_paho_mqtt.py
> +++ b/support/testing/tests/package/test_python_paho_mqtt.py
> @@ -18,6 +18,7 @@ class TestPythonPahoMQTT(TestPythonPackageBase):
>           self.check_sample_scripts_exist()
>   
>           cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
> -        output, exit_code = self.emulator.run(cmd)
> +        # Increase timeout to let the crng init complete
> +        output, exit_code = self.emulator.run(cmd, timeout=15)
>           self.assertEqual(exit_code, 0)
>           self.assertEqual(output[0], "Hello, World!")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
