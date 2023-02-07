Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74881C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED89B4026F;
	Tue,  7 Feb 2023 10:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED89B4026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tNY6yOhQwbGb; Tue,  7 Feb 2023 10:55:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFB8740273;
	Tue,  7 Feb 2023 10:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB8740273
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1E91BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27A8A818E8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27A8A818E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PceYLQJ3UMpM for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:55:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC66C818DC
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC66C818DC
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:55:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so12864282wmb.2
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 02:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/lbPXeAHijizKTCK0iUP80YSRhyhBql2CrNg85YCzes=;
 b=md3K/yhcb3rJK6pZu/BoriGl5gWLk/ZbGv2ZPF2xYl7wmd56uLE9eM9fkicdqkSeQe
 9Yqy7k6bZ48WqY0qRQScwocxymSuvbjfYTRDcVu6GNEnkuBPp6jq4DBHhf3kb2IoGTIB
 4uX1dyrEy+jfe6TMGac9+v4gzUzISn4n5uxUG1bLWAkY2KMe3pVMOWKQo23C7fRpjFS3
 gX6wkoxFONQoREOFz08RjjxyGKcdpeUkBPc4y2Y2gINcPtzXoiluLqPKn5lYtir2cyBo
 ebA0Uw9NeJ28hh5SoGE/HoibOKl8cEVhNzyCad93OcXz30aaG1z7z9fKoRYfwstb/fkL
 LasA==
X-Gm-Message-State: AO0yUKVz1Oz6fYqxMPyD4pI5G1+oA6NzVa893raWZFlmXovcuYdP+iOP
 Es/qUkHsGMyA1rgypRpFnQqvtQ==
X-Google-Smtp-Source: AK7set8fFU6H/7qvfnoP05MvwNmIpOVGWvRMI6+TiagffqffIaSDQi2Yu24O2dkBKB40ZPkDrvuEOA==
X-Received: by 2002:a05:600c:4496:b0:3dc:de85:5007 with SMTP id
 e22-20020a05600c449600b003dcde855007mr2596688wmo.21.1675767330813; 
 Tue, 07 Feb 2023 02:55:30 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 o37-20020a05600c512500b003c6bbe910fdsm20460321wms.9.2023.02.07.02.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 02:55:29 -0800 (PST)
Message-ID: <11b5699c-ebc7-7a6c-e8f8-c3824fe166d3@mind.be>
Date: Tue, 7 Feb 2023 11:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Adam Gausmann <adamg@esdemc.com>, buildroot@buildroot.org
References: <20220518213933.2475-1-adamg@esdemc.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220518213933.2475-1-adamg@esdemc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/lbPXeAHijizKTCK0iUP80YSRhyhBql2CrNg85YCzes=;
 b=b/n1UBjDkUi9S/GtYie+KWvHMvEvQKvI+AOt9UyRA2qGQ9h6AmLNFVUXKrmcE3IhH6
 mdpGBJvRtaeuAnSW5wkKZM/KNRG5toIzM3kfq2lP/h+WgEhSfK6OTK4tAorprUlhR/5c
 v6Fxv/N7OoTqX08BmNdVtiQexJI6cq1Nm9tsMxvV9VL86RCAA9GzQgz5lh/SQDrkJFX4
 ewWXaP+eSWGsju/9S24wbIbPxI7PmKqPAaMUmxBQP0bLJpknqbnW9fAKqM3Ro0B3IGub
 FvSqIlFGN9JAemXmweECcc8mT5pzspy8J2wtdyiSlg62uWsjYj/Z7kdAIvJ4f9yyIMMk
 kCSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b/n1UBjD
Subject: Re: [Buildroot] [PATCH v2 1/1] add package/python-pyqtchart
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 =?UTF-8?Q?Manuel_V=c3=b6gele?= <develop@manuel-voegele.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Adam,

  Sorry for the very late reply to your contribution. Unfortunately, there are 
some issues still that I can't easily resolve by myself, see below. Therefore, 
the patch has been marked as Changes Requested in patchwork.

  Small nitpick: the subject line should be
package/python-pyqtchart: new package

On 18/05/2022 23:39, Adam Gausmann via buildroot wrote:
> Signed-off-by: Adam Gausmann <adamg@esdemc.com>

[snip]

> diff --git a/package/python-pyqt5/0005-configure-emit-sip-flags.patch b/package/python-pyqt5/0005-configure-emit-sip-flags.patch
> new file mode 100644
> index 0000000000..ad524f1e53
> --- /dev/null
> +++ b/package/python-pyqt5/0005-configure-emit-sip-flags.patch
> @@ -0,0 +1,25 @@
> +configure.py: emit sip_flags
> +
> +Other PyQt packages (e.g. PyQtChart) obtain their sip_flags from PyQt5. The
> +default mechanism is for PyQt5 to embed it in the QtCore package and the other
> +packages will try to import PyQt5.QtCore and read it; however, because this is
> +not a host package, it cannot be imported during configuration.
> +
> +Another option is to provide those flags as a command-line option to the other
> +packages' configure.py scripts. So, this patch emits the sip_flags generated by
> +PyQt5 to a file which will be installed in staging dir for the other packages
> +to read.
> +
> +Signed-off-by: Adam Gausmann <adamg@esdemc.com>

  Please also send this patch upstream (to the PyQt5 mailing list), and add a 
reference to the upstream submission here:

Upstream: https://www.riverbankcomputing.com/pipermail/pyqt/...


  Also, this should probably be  added to Buildroot as a separate commit, 
because it affects python-pyqt, not python-pyqtchart.

> +
> +--- a/configure.py	2022-05-12 14:45:48.624851781 -0500
> ++++ b/configure.py	2022-05-12 14:44:24.704852510 -0500
> +@@ -1450,6 +1450,8 @@ def generate_makefiles(target_config, ve
> +
> +     # Set the SIP platform, version and feature flags.
> +     sip_flags = get_sip_flags(target_config)
> ++    with open('sip_flags', 'w+') as f:
> ++        f.write(sip_flags)
> +
> +     # Go through the modules.
> +     pyqt_modules = list(target_config.pyqt_modules)
> diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
> index af32f63796..2698a1e0ad 100644
> --- a/package/python-pyqt5/python-pyqt5.mk
> +++ b/package/python-pyqt5/python-pyqt5.mk
> @@ -157,7 +157,6 @@ PYTHON_PYQT5_CONF_OPTS = \
>   	-w --confirm-license \
>   	--no-designer-plugin \
>   	--no-docstrings \
> -	--no-sip-files \
>   	$(foreach module,$(PYTHON_PYQT5_MODULES),--enable=$(module))
>   
>   define PYTHON_PYQT5_CONFIGURE_CMDS
> @@ -180,6 +179,7 @@ define PYTHON_PYQT5_INSTALL_TARGET_CMDS
>   	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
>   	touch $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5/__init__.py
>   	$(RM) -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5/uic/port_v2
> +	install -D $(@D)/sip_flags $(STAGING_DIR)/usr/share/PyQt5/sip_flags
>   endef
>   
>   $(eval $(generic-package))
> diff --git a/package/python-pyqtchart/Config.in b/package/python-pyqtchart/Config.in
> new file mode 100644
> index 0000000000..a985927db7
> --- /dev/null
> +++ b/package/python-pyqtchart/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_PYQTCHART
> +	bool "python-pyqtchart"
> +	depends on BR2_PACKAGE_PYTHON_PYQT5

  Instead of depending on pyqt5, it would be beter to depend on qt5 and select 
pyqt5.

> +	select BR2_PACKAGE_QT5CHARTS
> +	help
> +	  Python bindings for Qt Charts.
> +
> +	  http://www.riverbankcomputing.com/software/pyqt/

  The actual upstream is

https://www.riverbankcomputing.com/software/pyqtchart/


> diff --git a/package/python-pyqtchart/python-pyqtchart.hash b/package/python-pyqtchart/python-pyqtchart.hash
> new file mode 100644
> index 0000000000..79852741da
> --- /dev/null
> +++ b/package/python-pyqtchart/python-pyqtchart.hash
> @@ -0,0 +1,5 @@
> +# Locally-computed:

  You should probably download from pypi and get the hash from there:

https://pypi.org/project/PyQtChart/#copy-hash-modal-8c261058-8981-4409-8b07-6610f35ddd52


> +sha256	91c9c6857e8c8891faa3875e3714392150016f365a63cdff8bfd40b6c33ea277  PyQtChart_gpl-5.7.tar.gz
> +
> +# Hash for license file
> +sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
> diff --git a/package/python-pyqtchart/python-pyqtchart.mk b/package/python-pyqtchart/python-pyqtchart.mk
> new file mode 100644
> index 0000000000..56bbc5d643
> --- /dev/null
> +++ b/package/python-pyqtchart/python-pyqtchart.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# python-pyqtchart

  Wouldn't it make more sense to call this python-pyqt5chart, given that there's 
python-pyqt5, and that there's PyQt6-Charts? Normally we prefer to use the 
upstream name, which is pyqtchart (or PyQt-Charts or PyQtChart, depending on 
where you look), but in this case I feel OK calling it python-pyqt5chart.

> +#
> +################################################################################
> +
> +PYTHON_PYQTCHART_VERSION = 5.7

  Why this ancient version released 7 years ago? There's a 5.15.6... I'm 
surprised this ancient version even works with our current Qt version!

> +PYTHON_PYQTCHART_SOURCE = PyQtChart_gpl-$(PYTHON_PYQTCHART_VERSION).tar.gz
> +PYTHON_PYQTCHART_SITE = http://downloads.sourceforge.net/project/pyqt/PyQtChart/PyQtChart-$(PYTHON_PYQTCHART_VERSION)

  As mentioned earlier, better download from pypi

> +PYTHON_PYQTCHART_LICENSE = GPL-3.0
> +
> +PYTHON_PYQTCHART_DEPENDENCIES = python-pyqt5 qt5charts
> +
> +PYTHON_PYQTCHART_CONF_OPTS = \
> +	--destdir $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/PyQt5 \
> +	--qmake $(HOST_DIR)/bin/qmake \
> +	--sysroot $(STAGING_DIR)/usr \
> +	--no-docstrings \
> +	--no-sip-files \
> +	--pyqt-sip-flags "$(file <$(STAGING_DIR)/usr/share/PyQt5/sip_flags)" \
> +	--qtchart-version=2.0.1 \

  Where does this version number come from? Please explain in the commit message.

  Regards,
  Arnout

> +
> +define PYTHON_PYQTCHART_CONFIGURE_CMDS
> +	(cd $(@D); \
> +		$(TARGET_MAKE_ENV) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(HOST_DIR)/bin/python configure.py \
> +			$(PYTHON_PYQTCHART_CONF_OPTS) \
> +	)
> +endef
> +
> +define PYTHON_PYQTCHART_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define PYTHON_PYQTCHART_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
