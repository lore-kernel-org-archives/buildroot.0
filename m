Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFE6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 20:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D9BB415EC;
	Tue, 10 May 2022 20:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUDdzzTCaf1J; Tue, 10 May 2022 20:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10A7741596;
	Tue, 10 May 2022 20:03:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BB321BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 20:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6937282F13
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 20:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GeyFRGrqjCIG for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 20:03:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BB4D82F37
 for <buildroot@buildroot.org>; Tue, 10 May 2022 20:03:43 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-ee1e7362caso287386fac.10
 for <buildroot@buildroot.org>; Tue, 10 May 2022 13:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+8Hl1uHzXeRq88ygJqNWMVjPAn2UrIBsyd9qwEI8TIs=;
 b=dBHPjQ86kp4g8ZcK5SaQ6rowFyVS4Y4itlCq9ekt3qBvFz3RGYEjmPlxEmCMScSeIs
 uLkJS8pH4UxOHPXXHUSTUHABPyT/7iXhx7ehvEZpeBuctc8tPN5/iHdtsFxPm2pOpnJ/
 88kUG3GUKfcoEtnK0loPck8dViR9yNLlzKMi/AOhcTMoC3cuV05n4skQH1omP0N6IG70
 WOa3ewda6oWtyKUsyFDoQ8lTExJp93QsyzBE9JaAM9N1gFe1NUjGFSq73HQkRxWQ3+68
 OIoHniSatHx6q+jv3cN3AeKcKldai64pQY9FJm+r/JVxxBz5GiVI887PK0FnsTeQEn7W
 GQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8Hl1uHzXeRq88ygJqNWMVjPAn2UrIBsyd9qwEI8TIs=;
 b=uO8pp84d5w15XEHmbvhmGx7g1PcmgMyD3v+LiEIBh/L1/9qJF0ifu1zsno9FtR8xEx
 BHBozHMG60s19m2ehi5XRLryqf9XM+r6NVbl7xThLdBZNyVAc2uZFJHPDdt6J05qhYH6
 Hgvt3dMCXoUpnHeqwcB8SeGW/0XXNDUQcE1wDXcJDoJbcL9KwEnr9guxh8PRhAOciPtX
 ny0gB750sgtiKQc7ux5GIxt4+0XjCgHkEzvysRqDfd/2LLXjjdg9fjSqwBkxuv7UJmIQ
 AC0eckHipLsRZhdQYaGF730GCo87oLXHmoTZj+3kseIGi0NQFpH+lnWuORDeajKQbAJW
 3xBQ==
X-Gm-Message-State: AOAM532QBSYVog8cwsa5gzHyIm51ykoF6KmsPh+dEdcEFHtdszYuqhnQ
 OLEO8P+UoeaxLgJfr46Vx5gnAPa8gBaL6wfQyxA=
X-Google-Smtp-Source: ABdhPJz54PCRZdTcx4VGjpHgq1y9MKh9uDBVHRaJBQzbLaoS1Quu3KnxN80fB+SjD89fCaF0mqcNyrWESWbkngLPEi8=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr994916oaa.200.1652213022002; Tue, 10
 May 2022 13:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220510003116.336797-1-james.hilliard1@gmail.com>
 <20220510003116.336797-2-james.hilliard1@gmail.com>
 <123fec62-0841-8dff-9da6-61f2cc9614d3@mind.be>
In-Reply-To: <123fec62-0841-8dff-9da6-61f2cc9614d3@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 May 2022 14:03:31 -0600
Message-ID: <CADvTj4pdG9Uk6UaWHkgAVjex3Ef7L2yvH8rN4MMoFeKn_dPjrg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-orjson: bump to
 version 3.6.8
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 10, 2022 at 1:01 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 10/05/2022 02:31, James Hilliard wrote:
> > Convert package to use python infrastructure instead of cargo
> > infrastructure.
>
>   AFAIU, maturin was already available in 3.6.7, so the conversion should be
> separate from the bump.

I mostly did it at the same time to avoid any potential conflicts/confusion
with mirrored assets.

>
>   That said, I think Graeme intentionally did not use maturin because it doesn't
> really offer much benefit over calling cargo directly. Do you have a reason to
> prefer using maturin?

It should be more correct, I mean calling cargo directly doesn't really properly
install say pure python files and is more likely to break in weird ways.

>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/python-orjson/python-orjson.hash |  5 +++--
> >   package/python-orjson/python-orjson.mk   | 24 ++++++++++++------------
> >   2 files changed, 15 insertions(+), 14 deletions(-)
> >
> > diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
> > index 5ef2726d82..06cc5cae79 100644
> > --- a/package/python-orjson/python-orjson.hash
> > +++ b/package/python-orjson/python-orjson.hash
> > @@ -1,4 +1,5 @@
> > -# Locally calculated
> > -sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  python-orjson-3.6.7.tar.gz
> > +# Locally calculated after vendoring
> > +sha256  40b95576b81916d167f7a44829401acb3b6cbbfe9840b5ed88c9535a86507d7b  orjson-3.6.8.tar.gz
> > +# Locally computed sha256 checksums
> >   sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
> >   sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> > diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
> > index 5de4b2c5fa..ccbaf37c6d 100644
> > --- a/package/python-orjson/python-orjson.mk
> > +++ b/package/python-orjson/python-orjson.mk
> > @@ -4,19 +4,19 @@
> >   #
> >   ################################################################################
> >
> > -PYTHON_ORJSON_VERSION = 3.6.7
> > -PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))
> > +PYTHON_ORJSON_VERSION = 3.6.8
> > +PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
> > +PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/14/8e/7e745d867466bdafb12ab7b0179d40f23f55639f7cd14bd375acfa74aca2
>
>   Kind of an aside, since this applies to many other packages: is there a reason
> we prefer to get Python packages from pypi rather than the upstream source itself?

These are sdist's(release tarball equivalents for python packages)
while upstream
source is not.

>
> > +PYTHON_ORJSON_SETUP_TYPE = pep517
> >   PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
> >   PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> > -PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
> > -PYTHON_ORJSON_CARGO_ENV = \
> > +PYTHON_ORJSON_DEPENDENCIES = host-python-cffi host-python-maturin
> > +PYTHON_ORJSON_ENV = \
> > +     $(PKG_CARGO_ENV) \
> >       PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
> > +# We need to vendor the Cargo crates at download time
> > +PYTHON_ORJSON_DOWNLOAD_POST_PROCESS = cargo
> > +PYTHON_ORJSON_DOWNLOAD_DEPENDENCIES = host-rustc
> > +PYTHON_ORJSON_DL_ENV = $(PKG_CARGO_ENV)
>
>   Is this going to be needed for all maturin packages? If yes, it will make
> sense to move this into a maturin setup type (but preferably only after we have
> at least 3 packages that use it).

Yes, I'm planning on adding that along with a setuptools-rust setup type, I have
some upstream work that should making things clearer as well like this:
https://github.com/PyO3/maturin/pull/909

I'm going to rework this to handle maturin as well(both are pyo3 build tools):
https://patchwork.ozlabs.org/project/buildroot/patch/20220501074401.1135229-1-james.hilliard1@gmail.com/

>
>   Regards,
>   Arnout
>
> >
> > -# orjson uses "maturin" to generate distribution packages - rather than teach
> > -# buildroot how to understand this, we reach in and install directly.
> > -define PYTHON_ORJSON_INSTALL_TARGET_CMDS
> > -     $(INSTALL) -m 0755 -D $(@D)/target/$(RUSTC_TARGET_NAME)/release/liborjson.so \
> > -             $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/orjson.so
> > -endef
> > -
> > -$(eval $(cargo-package))
> > +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
