Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A9FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3149F60BCD;
	Tue,  4 Jan 2022 18:30:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GIPdT37R4R0u; Tue,  4 Jan 2022 18:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C2ED60B8F;
	Tue,  4 Jan 2022 18:30:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7303F1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DF7960BBE
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ocqXC5hWu-dN for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:30:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 718D260B8F
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:30:29 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id bm14so151916020edb.5
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=jqjUeLM5uRyx5zlVdQ2F6ZJIcYyh5RJX87fGwLPn4dw=;
 b=DqqyngRT3WFOqREni4P/LoPDSX2DNQ2+KFmnCvKlrgkylQkhqEtuM3yYQfyfwyO42P
 BS0nLg12e5fAAAQlhGsz1SikMp6NQLwck6NLQhUnrKhL4xG3jKSeo5l8hZv4W7NnJPY1
 tR9mYu5/smU0nR+zmwrjBF0cgR6sC2u6oBbku6pxEAeosW4RW2MjfzJaKG8OB6b6Xlzf
 yoqDpAqYWR9LXSFBuZO++B2RuyetZUoss+XiPBCrULX2KjR/j06aNLeAGrDdthRyJhSm
 oKavmyUKQcftSwl0MfynU/C4GkCW4ei0nkMavhzlkp/Kgx6nk4X0GFK1fGnrdulBQuwk
 qJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jqjUeLM5uRyx5zlVdQ2F6ZJIcYyh5RJX87fGwLPn4dw=;
 b=DJK38/U3yKT3z4lh7kHHpuRGdpsBM+r9dFLtXMfvhcSegIE2HdjJRQ+IIH0bcwgiyf
 1K8pNRkRhagRivDpoTxw0ftOS4PSmsO/CxU10vWRVe7OC1z42X2OxwQUq7HrNYskw6Zc
 IkqIJvmKmHAzWJ1OUAVJ75wf6Ki10Kho/2wbtNwNaciaoaN101Uxf5aC8inVOPCeHMzR
 ntLSbMeVtErwiI/nKIqRl7x3Kohu1HuH/8FtFQ84Y2mVyBOFnMESOVDwkrNuzK0u0xTD
 xWRCwusPRlY/oNu0Ecc8Nf3vqYVCLA5ZK1ENCryxa8/Pd7i99MPwbkODN/TZqfgYrU9H
 lXwg==
X-Gm-Message-State: AOAM532szDgBn2jwL/oK6NWdqHBoZ0afZ508bpSnqKnigRn4/Sz49x0/
 6LVLFOl+OZW2Wu0rNirXvkd6VQ==
X-Google-Smtp-Source: ABdhPJx016C/2jPSMDXGFOjOB0ux+ce6sXes4ei/W/GtGfVEIxSfQNtVNxXQnxciVzVHKlY7Uaqy/g==
X-Received: by 2002:a17:906:4fc9:: with SMTP id
 i9mr39969050ejw.673.1641321027749; 
 Tue, 04 Jan 2022 10:30:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a1sm14814298edu.17.2022.01.04.10.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:30:27 -0800 (PST)
Message-ID: <9103e134-aa44-0218-da7e-5face2b74edc@mind.be>
Date: Tue, 4 Jan 2022 19:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220103210816.26410-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220103210816.26410-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/assimp: bump version to 5.1.5
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



On 03/01/2022 22:08, Peter Seiderer wrote:
> - remove 0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
>    (upstream applied [1]).
> 
> For details see [2].
> 
> [1] https://github.com/assimp/assimp/commit/a099fe7cd331a839137115db5df1733c4c1c8070
> [2] https://github.com/assimp/assimp/releases/tag/v5.1.5
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-explicit-namespace-instead-of-using.patch | 57 -------------------
>   package/assimp/assimp.hash                    |  2 +-
>   package/assimp/assimp.mk                      |  2 +-
>   3 files changed, 2 insertions(+), 59 deletions(-)
>   delete mode 100644 package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
> 
> diff --git a/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch b/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
> deleted file mode 100644
> index c83e9c50a4..0000000000
> --- a/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From a099fe7cd331a839137115db5df1733c4c1c8070 Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Thu, 30 Dec 2021 18:01:54 +0100
> -Subject: [PATCH] BlenderScene: use explicit namespace instead of using
> - namespace
> -
> -Fixes (using g++ Sourcery CodeBench Lite 2014.05-29 - 4.8.3 20140320):
> -
> -  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:101:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
> -           const FileDatabase &db) const {
> -                                   ^
> - In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
> -                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
> -  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
> -       void Convert(T &dest, const FileDatabase &db) const;
> -            ^
> -  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:121:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
> -           const FileDatabase &db) const {
> -                                   ^
> -  In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
> -                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
> -  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
> -       void Convert(T &dest, const FileDatabase &db) const;
> -            ^
> -
> -[backport from upstream commit a099fe7cd331]
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - code/AssetLib/Blender/BlenderScene.cpp | 7 +++++--
> - 1 file changed, 5 insertions(+), 2 deletions(-)
> -
> -diff --git a/code/AssetLib/Blender/BlenderScene.cpp b/code/AssetLib/Blender/BlenderScene.cpp
> -index c93d913fc..9ad086fe6 100644
> ---- a/code/AssetLib/Blender/BlenderScene.cpp
> -+++ b/code/AssetLib/Blender/BlenderScene.cpp
> -@@ -49,8 +49,8 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> - #include "BlenderDNA.h"
> - #include "BlenderSceneGen.h"
> -
> --using namespace Assimp;
> --using namespace Assimp::Blender;
> -+namespace Assimp {
> -+namespace Blender {
> -
> - //--------------------------------------------------------------------------------
> - template <>
> -@@ -885,4 +885,7 @@ void DNA::RegisterConverters() {
> -     converters["CollectionObject"] = DNA::FactoryPair(&Structure::Allocate<CollectionObject>, &Structure::Convert<CollectionObject>);
> - }
> -
> -+} // namespace Blender
> -+} //namespace Assimp
> -+
> - #endif // ASSIMP_BUILD_NO_BLEND_IMPORTER
> ---
> -2.34.1
> -
> diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
> index 89b8d168c2..8f6d613bb4 100644
> --- a/package/assimp/assimp.hash
> +++ b/package/assimp/assimp.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  bd32cdc27e1f8b7ac09d914ab92dd81d799c97e9e47315c1f40dcb7c6f7938c6  assimp-5.1.4.tar.gz
> +sha256  d62b58ed3b35c20f89570863a5415df97cb1b301b444d39687140fc883717ced  assimp-5.1.5.tar.gz
>   sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
> diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
> index ead5d73bca..b5f84ef56f 100644
> --- a/package/assimp/assimp.mk
> +++ b/package/assimp/assimp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ASSIMP_VERSION = 5.1.4
> +ASSIMP_VERSION = 5.1.5
>   ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
>   ASSIMP_LICENSE = BSD-3-Clause
>   ASSIMP_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
