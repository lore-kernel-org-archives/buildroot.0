Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A88FC43334
	for <buildroot@archiver.kernel.org>; Sat, 18 Jun 2022 04:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D94FC83EE7;
	Sat, 18 Jun 2022 04:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D94FC83EE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6FvFUcXv2jTL; Sat, 18 Jun 2022 04:57:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE3B983ED1;
	Sat, 18 Jun 2022 04:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE3B983ED1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E80C1BF2B3
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 04:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8657E4048C
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 04:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8657E4048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hkWDJwut4Hw for <buildroot@lists.busybox.net>;
 Sat, 18 Jun 2022 04:57:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FD4E400BF
Received: from delivery19.mailspamprotection.com
 (delivery19.mailspamprotection.com [185.56.84.10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FD4E400BF
 for <buildroot@buildroot.org>; Sat, 18 Jun 2022 04:57:54 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se19.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1o2QWt-000AZU-54; Fri, 17 Jun 2022 23:57:53 -0500
Received: from [127.0.0.1] (port=20042 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1o2QWq-000CbJ-T5; Sat, 18 Jun 2022 04:57:48 +0000
MIME-Version: 1.0
Date: Sat, 18 Jun 2022 07:57:48 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220618044659.4800-1-dimi@tpm.dev>
References: <20220615075028.41612-1-dimi@tpm.dev>
 <20220618044659.4800-1-dimi@tpm.dev>
Message-ID: <12968eeabd209ead5eec34e099c93ff4@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9yaTj/AyOmnQP2HiZJYHQZPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zHcgQ1GLCGZipGdBYX2IdejIhOyETOLJV5VgRmbWjZJaaj
 T7GK+pV+DB0C1T8MJSONp1orT0zdSv/EvZ56A6zU1bRLw0l0eFkfJMZI/mVoFxC4nBKpXq9V+eEL
 83sI3osI2QyQ+IxgL7AzMcQws+it3T2BM0wZ9MfJsfZ8ZSuB0QDxxiMAICz6P3g28tGAMvzqPqRB
 dN4gdbyCA2Yz2XfKiNHvZXVfQIZKaNTSUmy92zyhculNL4Kv1B7pfkqZpiV9qWu12vVUj5xBQUrw
 t1bFYx3aPgw+VqqMKwjqRu7K//WEQZ1uDRaTscddvLdr0QzPDWNoiICP4PAhem3nWa0O5HHYEJjr
 oOvfkvm+jbvsKiuQW3c6bXX7k8uCnNwITeLhCcHQv+Vda3nPaVK0EfymGFvlHOQsi9fJrQH2HB7K
 cikRseCyBjclZpv6D8yHWO2ec6cBx3r3HXymDSnwWpGuuZvJzloHvXAavZZu2bOHz0lNEHF1LSWF
 /K4qKVXG9aOiuE2WsMQKCIxVc/Bl0gEhwVT9QLcFEqMOHs14qjRwSf50uDIqf2FGuXt/l8wgSCTl
 gTl6fJxyntEfhZCKje4ZxFsEtcI97jKG1Za36v45kS7/+fOTvqVqTiiM4NskccTteUmL4DvFRPqm
 f+YW413FfGpYrEmIO9Je9m9d+jZQRhH0bwch8ObQw9ZPNCJxML0amUdylUIKhf3z2GAHxH7IBbK/
 eM19BnY8mlAFVuN6s5mUgaBN4bo7hTxb5E4lTONJSSfbLV/99FyrutoKmkRJWg6oRp35gg3qDJwP
 8wHKkjLBoFfyud/FVRu0TQWChfHkO4nQueuBz0AYsNXQnmLXHd+BAOzpe0YNJX8u15qwPYMB2RLO
 KZul3x62AerXkYXf+uxvy1lCBH8fC2Ac8ytg6S5fRubGYS0excxZoCNdffSli7jFBx0mvgNNdu90
 o3WCpEsqhRjkToTaXjlW8ScxhtJKxcjZcXlumi9j4Q83tX9YK233ILvfWCCyoRJ2OsZ+pvlHhV6a
 5QjptwQBGybQs/UIhpzDzPyd6gBEWyWvSiug7dgyzdfCR6mf5/MQtWtnQ/KlZv3ZxKWOL6n+dyEJ
 Z66lhh3M+bth9ENpQs5TaWOv9Ee7NkW4waBhhZVuD2IUhUJeLVVmBuwbgu+woevdQiTPXbfr/wQl
 6qdG9GOfMQ==
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] [PATCH v5,
 1/1] package/wolftpm: Add config options for TPM 2.0 extra
 capabilities
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

This patch is ready for review. Thanks to Fabrice for the good feedback.

ps: I am unable to enter patchwork after password reset, so v4 still 
holds new status.

Regards,
Dimi
-- 
Founder of TPM.dev

On 2022-06-18 07:46 AM, Dimi Tomov wrote:
> From: Dimitar Tomov <dimi@tpm.dev>
> 
> Some TPM 2.0 chips offer extra capabilities. This patch adds additional
> configuration options to the wolftpm package, so such capabilities can
> be available to the user. For example, the STMicroelectronics ST33 and
> Nuvoton NPCT750 both offer secure GPIO. Due to chip differences, 
> wolfTPM
> requires explicit configuration options to enable the extra 
> capabilities.
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
> ---
> Changes v4 -> v5:
> - Style: Fix some lines in Config.in that were longer than 72 
> characters
> Changes v3 -> v4:
> - Fix commit message. For some reason the update was not included in 
> patch v3.
> Changes v2 -> v3:
> - Better commit message
> Changes v1 -> v2:
> - Remove a not needed package description change
> ---
>  package/wolftpm/Config.in  | 14 ++++++++++++++
>  package/wolftpm/wolftpm.mk | 12 ++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
> index 0b964c3d7e..52a9005d66 100644
> --- a/package/wolftpm/Config.in
> +++ b/package/wolftpm/Config.in
> @@ -23,6 +23,20 @@ config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
>  	  encryption. Disabling this option is not recommended as it
>  	  could create a security breach in most environments.
> 
> +config BR2_PACKAGE_WOLFTPM_ST33
> +	bool "st33"
> +	default n
> +	help
> +	  Enable support of TPM 2.0 extra functionality offered by the
> +	  STMicroelectronics ST33 chip.
> +
> +config BR2_PACKAGE_WOLFTPM_NUVOTON
> +	bool "npct750"
> +	default n
> +	help
> +	  Enable support of TPM 2.0 extra functionality offered by the
> +	  Nuvoton NPCT750 chip.
> +
>  comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> 
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index a4a9edce85..d0423cd06b 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -35,4 +35,16 @@ else
>  WOLFTPM_CONF_OPTS += --disable-wolfcrypt
>  endif
> 
> +ifeq ($(BR2_PACKAGE_WOLFTPM_ST33),y)
> +WOLFTPM_CONF_OPTS += --enable-st33
> +else
> +WOLFTPM_CONF_OPTS += --disable-st33
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WOLFTPM_NPCT750),y)
> +WOLFTPM_CONF_OPTS += --enable-nuvoton
> +else
> +WOLFTPM_CONF_OPTS += --disable-nuvoton
> +endif
> +
>  $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
