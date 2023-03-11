Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6306DC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 06:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA8A441B37;
	Sat, 11 Mar 2023 06:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA8A441B37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKWx0UMUoA_C; Sat, 11 Mar 2023 06:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A105641B98;
	Sat, 11 Mar 2023 06:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A105641B98
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6E801BF429
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 06:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B4B360B1E
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 06:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B4B360B1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JhKfUV3gEGal for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 06:14:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C523605E9
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C523605E9
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 06:14:00 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>) id 1pasUP-0006IQ-OU
 for buildroot@buildroot.org; Sat, 11 Mar 2023 09:13:58 +0300
Message-ID: <8caa8525-4fa6-046c-706e-a2a2dd27ef5b@inbox.ru>
Date: Sat, 11 Mar 2023 09:13:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: buildroot@buildroot.org
References: <20230311060001.657936-1-fido_max@inbox.ru>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20230311060001.657936-1-fido_max@inbox.ru>
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9BCEC41593EBD83573B8B9DD5B75D52A38603AAE0EB1505CE182A05F5380850404C771E276E0129EE0F81C6D669D78C26B609F9C4E340BBDC682F3387F34DA98D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F09446BC3D835A58EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063767500BC4578134A08638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8DE1C1F9D35C67CEC0A646A22F6D419946F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7328B01A8D746D8839FA2833FD35BB23D9E625A9149C048EEC65AC60A1F0286FECB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B972D20C7389F068BA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C289736CE4F78F08343847C11F186F3C59DAA53EE0834AAEE
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34E69981C39E7B068AC5BF31C3C6A57227E54A9A43FEFBEB7C81C4F6AD70831A40E477F57BB0DD97641D7E09C32AA3244C0B3A1D9DF3A3BD26DB1008C9D2AB0793408A6A02710B73043EB3F6AD6EA9203E
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojEg2t1XEOuWERttn7tLrUnw==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF57F99A9BF7268BE619CB4D4927C8E2BEB98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=V85z4lsT9+32RAOmfgzGGwiQvMLdBnTieAFnApmDZYc=; 
 t=1678515240;x=1678605240; 
 b=BoB4pC48dFBrNud9KZEIp/n/tcB05XZ1YhFDPSgtOEIvLu4Bd8CuKbip2m82EThnL8YVVK7QpXmWyuZ/NUqxVEF1jjcHlXlQZHlFMXZ+FV9LwAoxV99t0JEJbYMeArMUOYZho7Ne+5EthGK5jb6eJCnDItTh09BVHrr/Vsqh73gh5g/IMAbnXx+x+kJ3+CadqiP+USOEYyWXcxairU6vDyY1OUZUfrdRUZwwBiQYMGoewy/4I8Cup+WghU5nup+taNLhc02cOmpVRrhCyN/FkjGo2SARNsc3auKSYEIqzdUX5BeeMHYXTzdHYwxa89SUV+D9MqLVFK6Cp+VMHCfsSA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=BoB4pC48
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: Re: [Buildroot] [PATCH v2 1/1] package/gdal: bump version to 3.6.2
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



On 11.03.2023 09:00, Maxim Kochetkov via buildroot wrote:
> Release notes: https://github.com/OSGeo/gdal/blob/v3.6.2/NEWS.md
> License changes: https://github.com/OSGeo/gdal/commit/a394f9cb299b2c3c2159098483d1fece3a464fda
> 
> ISC License is added for FlatGeobuf and Flatbush
> Apache-2.0 is added for flatbuffers
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>   package/gdal/gdal.hash | 8 ++++----
>   package/gdal/gdal.mk   | 5 +++--
>   2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
> index ab77d7840d..d0b08b4535 100644
> --- a/package/gdal/gdal.hash
> +++ b/package/gdal/gdal.hash
> @@ -1,6 +1,6 @@
> -# md5 from: https://download.osgeo.org/gdal/3.5.2/gdal-3.5.2.tar.xz.md5, sha256 locally computed:
> -md5  821b3b0637ebada5d20dbefb2e3ec964  gdal-3.5.2.tar.xz
> -sha256  0874dfdeb9ac42e53c37be4184b19350be76f0530e1f4fa8004361635b9030c2  gdal-3.5.2.tar.xz
> +# md5 from: https://download.osgeo.org/gdal/3.6.2/gdal-3.6.2.tar.gz.md5, sha256 locally computed:
> +md5  6f22ffdbd8e00059ddb2b825c5920c4c  gdal-3.6.2.tar.xz
> +sha256  35f40d2e08061b342513cdcddc2b997b3814ef8254514f0ef1e8bc7aa56cf681  gdal-3.6.2.tar.xz
>   
>   # Hashes of license files:
> -sha256  fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a  LICENSE.TXT
> +sha256  1dae3468e81d00da56e2936f74d33b8b3ad09d726437f19ce209a5dabea41f77  LICENSE.TXT
> diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
> index a3b11c53af..08992ce73c 100644
> --- a/package/gdal/gdal.mk
> +++ b/package/gdal/gdal.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -GDAL_VERSION = 3.5.2
> +GDAL_VERSION = 3.6.2
>   GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
>   GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
> -GDAL_LICENSE = MIT, many others
> +GDAL_LICENSE = Apache-2.0, ISC, MIT, many others
>   GDAL_LICENSE_FILES = LICENSE.TXT
>   GDAL_CPE_ID_VENDOR = osgeo
>   GDAL_INSTALL_STAGING = YES
> @@ -32,6 +32,7 @@ GDAL_DEPENDENCIES = host-pkgconf jpeg json-c libgeotiff libpng proj tiff zlib
>   # Yes, even though they have -DDGDAL_USE options, a few libraries are
>   # mandatory. If we don't provide them, bundled versions are used.
>   GDAL_CONF_OPTS = \
> +	-DCMAKE_NO_SYSTEM_FROM_IMPORTED=ON \

Please don't use this patch. Something went wrong with my build 
environment. I'm facing with the issue like 
this:https://stackoverflow.com/questions/75065825/buildroot-cmake-arch64-none-linux-gnu-include-c-9-2-1-cstdlib7515-fatal-e

I've failed to build almost every cmake package in buildroot with this 
issue. I have no idea why CMAKE_NO_SYSTEM_FROM_IMPORTED=ON helps and 
needed for me.

>   	-DGDAL_USE_GEOTIFF=ON \
>   	-DGDAL_USE_JPEG=ON \
>   	-DGDAL_USE_JSONC=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
