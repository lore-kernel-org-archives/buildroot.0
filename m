Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A3DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6280C60B08;
	Wed, 29 Dec 2021 09:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ohzHbFAQNIIe; Wed, 29 Dec 2021 09:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B87EE60ABE;
	Wed, 29 Dec 2021 09:59:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E070D1BF20F
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAE8860ABE
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWbU8W95ay-c for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:59:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A97560A9B
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:59:18 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 2VjonK2P3Zs8s2VjonBcRX; Wed, 29 Dec 2021 10:59:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640771956; bh=4ulmS7CGtGtkdNuIitzc9UbBObM5wg3pvQDHb270SUY=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=RnYvys482WSsZRYiL3wokrgQZHxz5uMxSxEMdTm1YAHaPEPduZmFgaoHTWMF/bjwf
 Seylz4X+gP/IlUBpsyDFm5uTb97b4nLP0Sd4MlMObGtTyCc+jBHgJNDunIwm6F24Hx
 Tva+VzvAEHBSKbCLGN0+FyVW/O0OLT4RGY0hngqp1uVEXJcKmnmpkBfAU6blmSYluU
 y7zb494fCtgCSqvQfjninuBBA6KIWRaYbhOGgalWaLKAoi8zzmC9ZFyVLrK0sEmbam
 zCI2OpRO+HoGN/QC5ADz9NebUWTlBIUgE7JEySF2ktEYQRDUg2FhlX/bIAwH38HxOd
 FU3Wx3sLHwtHQ==
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211229094225.512279-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <d5242043-76c4-1e06-56e6-af419bb07f40@benettiengineering.com>
Date: Wed, 29 Dec 2021 10:59:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211229094225.512279-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfEblpQ8AOZ80U15XsSjBFA6n84tORUUepXAzdBNJp6ZiKL/d+ilfQoQP6nzA5XG9IX8UCbcWQo9lkhF/Byjo4nSfG+mq8JNFrCWgp5NGRXNdG6y3Dfzl
 deTzHPEWl9LRflIYSnCRDnO5vEd8cLVc5PgcJ6SguLb5euUiyHYMQhS+lF5xhDUUI2KS4H8AB9Jf67UZ+a3VZ4H2VFZo6y2vR+uKIOfX2sO8oQfqHjPubAoN
 RglqBrDiO84qDAoEhdb/G8aRcEhi+nsoT/HhZVkwF/81IemTCJzLTubGEtPuMOkU
Subject: Re: [Buildroot] [PATCH 1/1] package/glibmm: link with -latomic if
 needed
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
Cc: James Knight <james.knight@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice, All,

I've just sent a worse patch for this:
https://patchwork.ozlabs.org/project/buildroot/patch/20211229095600.212449-1-giulio.benetti@benettiengineering.com/

So please drop that and keep this one.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 29/12/21 10:42, Fabrice Fontaine wrote:
> Link with -latomic if needed to avoid the following build failure since
> bump to version 2.68.2 in commit
> dddb65efbdf2c7952f22a1e51009f17f1676db4a:
> 
> /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: glib/glibmm/libglibmm-2.68.so.1.3.0.p/main.cc.o: in function `Glib::Source::reference() const':
> main.cc:(.text+0xd40): undefined reference to `__atomic_fetch_add_4'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6a2709956fbb16ac3cbf676acb242c88f83fcdae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/glibmm/glibmm.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
> index 578267c75e..525da6b618 100644
> --- a/package/glibmm/glibmm.mk
> +++ b/package/glibmm/glibmm.mk
> @@ -15,9 +15,15 @@ GLIBMM_DEPENDENCIES = libglib2 libsigc host-pkgconf
>   GLIBMM_CONF_OPTS = -Dbuild-examples=false
>   
>   GLIBMM_CXXFLAGS = $(TARGET_CXXFLAGS)
> +GLIBMM_LDFLAGS = $(TARGET_LDFLAGS)
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>   GLIBMM_CXXFLAGS += -O0
>   endif
>   
> +# Uses __atomic_fetch_add_4
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +GLIBMM_LDFLAGS += -latomic
> +endif
> +
>   $(eval $(meson-package))
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
