Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F455C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 17:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3170408BC;
	Thu, 10 Feb 2022 17:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mi8K1Kb0oBNA; Thu, 10 Feb 2022 17:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8F21408BE;
	Thu, 10 Feb 2022 17:15:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2AF31BF228
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 17:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EE028247F
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 17:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jfIlHz73RAlh for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 17:15:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63BCD8242D
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 17:15:17 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id fy20so16828504ejc.0
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 09:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YPVLfd7L2gXXvjUBjWHCY3f9Y2TK6CPSN4SpYheu4+Y=;
 b=gTBbhkeq/aNC8QiDUfQxRhr/qt8GI9aO3Cmj/Yj3brMATmAfQ6rVqsyAScrtaKvk+U
 qxrn+l6mdUq18zbaw9hjEAXpfOSZi0nncWfWP8ZEET4AATlddaiZ/hcgwRfIWxsncgmX
 BDEdUGQjc7JhEIBL1oAq3fsugo/QEIBAO4c+AjGexhX3jUwkcLdfyQ89pBXuMkX+VA1h
 MPgYc1tMldyPVdxuo5dIalDl/jlV5W6Oh/UMhH/h/XgR7avK82f1E0dIWapPcATir7Qo
 N5sWpi2+qPRKPoCQiwNlJ5SorVshXW4vBfsoAholpqbRmE3Rklg5mLzHoIcCugkU59r1
 /Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YPVLfd7L2gXXvjUBjWHCY3f9Y2TK6CPSN4SpYheu4+Y=;
 b=zVI1gGxrzLkatWPhxMZIAkp8jU9JQUF0fGzOnFyX8VPXlil77R2a47bPWjK1pjIX4l
 I3pJl061uSrYYsraMDOKgkMaYMQDhc+LHW2+u8IbrwhQ07WH+qVuUf+jHepjjqnzct+I
 MmDX0KBVh8B3yz9Snze4ekRlk+MTNKOazrSluEGUT9iFURkhS6i5w6I39vlQihpm7wm+
 HrZkK8piMGKxlEwpiw0PhzrjzP9d70qzvxy0uuDcqt1kMfj2ER37VIrwDFVcOP+Ode67
 RtuOvlrqfp1pPRAbxIuVvOQ5a/8dTPV2r2squQX32xJtRLiMU8SJd9j464FtvpLF4Vgo
 aOzw==
X-Gm-Message-State: AOAM532wXlNPmVSL4cVsY5maNbb/VSLf+DT8AugW9u4+YzlOLAFEepxp
 HGoE0QPDIz8k05iGzB9Tumhj+1wgvZnaOg==
X-Google-Smtp-Source: ABdhPJzgn/lx7FnZpA0LRCgKTVthxufGZMk2bCIWBOevIvPchJ63PFlEo3pWD4eMd1B7y9YtBUj3jA==
X-Received: by 2002:a17:907:720b:: with SMTP id
 dr11mr7185982ejc.70.1644513313607; 
 Thu, 10 Feb 2022 09:15:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gu2sm7156113ejb.221.2022.02.10.09.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 09:15:12 -0800 (PST)
Message-ID: <2cba2cd6-ca70-6336-f2fe-60649a0f1a0d@mind.be>
Date: Thu, 10 Feb 2022 18:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Korsgaard <peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
 <20220209213312.GE2249818@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220209213312.GE2249818@scaer>
Subject: Re: [Buildroot] [PATCH 000/107] Drop python 2.7
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/02/2022 22:33, Yann E. MORIN wrote:
> Peter ,All,
> 
> On 2022-02-09 17:50 +0100, Peter Korsgaard spake thusly:
>> Python 2.7 is EOL since April 2020 and almost all packages support
>> python 3, so drop it before the 2022.02 release.
>>
>> It is a big series, but the changes are mainly mechanical in nature.
>>
>> There is still some cleanup to do, E.G. the python2 support in
>> pkg-python and the host python-setuptools package - But this is IMHO
>> the minimum changes before -rc1.
>>
>> Peter Korsgaard (107):
> ...
>>    package/python: drop target package
> ...
>>    package/python: drop host package
> ...
>>    docs/manual: drop python2 references
> 
> All 107 patches applied, thanks!
> 
> I'll reply further to two of them, with ultra-minor nits.
> 
> Pfew, 21st century, here we come at last! ;-)

  Thank you Peter and Yann for handling this!

  I did a bit of grepping for leftovers and found these:

package/pkg-python.mk:# BR2_PACKAGE_PYTHON=y, or a host-package with neither
package/pkg-python.mk:# BR2_PACKAGE_PYTHON3=y or BR2_PACKAGE_PYTHON=y.
docs/manual/adding-packages-python.txt: * It is not necessary to add +python+ or 
+host-python+ in the
package/gstreamer1/gst1-devtools/gst1-devtools.mk:GST1_DEVTOOLS_DEPENDENCIES += 
host-python python
package/omniorb/omniorb.mk:# omniorb is not python3 friendly, so force the 
python interpreter
package/omniorb/omniorb.mk:OMNIORB_CONF_OPTS = 
ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
package/omniorb/omniorb.mk:HOST_OMNIORB_CONF_OPTS = 
ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
package/pkg-python.mk:$(2)_DEPENDENCIES += $$(if 
$$(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
package/pkg-python.mk:ifeq ($$($(2)_NEEDS_HOST_PYTHON),python2)
package/pkg-python.mk:# setuptools for python2.
package/pkg-python.mk:# In all other cases, we install setuptools for python2. 
Those other
package/pkg-python.mk:else ifeq ($(4):$$($(2)_NEEDS_HOST_PYTHON),host:python2)
package/pkg-python.mk:# We may want to specify the python interpreter to be used 
for building a
package/pkg-python.mk:# - for target packages, we always use the default python 
interpreter (which
package/python-pyrex/python-pyrex.mk:HOST_PYTHON_PYREX_NEEDS_HOST_PYTHON = python2
package/python-setuptools/python-setuptools.mk:HOST_PYTHON_SETUPTOOLS_NEEDS_HOST_PYTHON 
= python2
package/python-web2py/python-web2py.mk:PYTHON_WEB2PY_DEPENDENCIES = $(if 
$(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python) \
package/python3/python3.mk:# python version chosen for the target.
package/python3/python3.mk:# Only install the python symlink in the host tree if 
python3 is enabled
package/python3/python3.mk:     ln -fs python3 $(HOST_DIR)/bin/python
package/qt5/qt5webengine/qt5webengine.mk:# QtWebengine's build system uses 
python, but only supports python2. We work
package/qt5/qt5webengine/qt5webengine.mk:# around this by forcing python2 early 
in the PATH, via a python->python2
package/qt5/qt5webengine/qt5webengine.mk:       ln -sf $(HOST_DIR)/bin/python2 
$(@D)/host-bin/python
package/rust/rust.mk:           echo 'python = 
"$(HOST_DIR)/bin/python$(HOST_RUST_PYTHON_VERSION)"'; \


The ones in gst1-devtools.mk and omniorb.mk look important, the rest is just 
cleanup. qt5webengine is also a bit worrisome...

Also, some cleanups that I think are needed:
- get rid of HOST_PYTHON_FOO_NEEDS_HOST_PYTHON
- symlink $(HOST_DIR)/bin/python to python3, and get rid of the workarounds in 
e.g. nodejs


  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
