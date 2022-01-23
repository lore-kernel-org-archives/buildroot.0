Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1474C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 09:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7546281C58;
	Sun, 23 Jan 2022 09:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KR_v_x8lid3c; Sun, 23 Jan 2022 09:12:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B39C81C38;
	Sun, 23 Jan 2022 09:12:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D85501BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C53D7401CC
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_mAZExc8iXJ for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 09:11:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BAEB40407
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 09:11:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a491:f028:92d2:337e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6358E5FF9D;
 Sun, 23 Jan 2022 10:11:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642929112;
 bh=WFE9ahrNDaUU9axV4QSk1kdiHaP78WKrrk8WUWOTp1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BM0NMMp2fsQyr3kudnqXHoQixva78yfqWgPOKMjn94Tog16Gc9p60/qUAwJzJhMdg
 9mrBVvDjFUyuuAJnvGb5vDu7SDRYPQZOd0S9iCEn9ERd/idCNjvB0EiJd3mVD3rmCv
 lugeCSrFnydlXb9DPFeU15pN3VxKPZcrDB1v6R4jPmOyRIHkTWxjCiltzRt7bacoAK
 NbmXHqbu8z887sGDg1YdjyXevPp/OsJC3sBTiHVjIUt18YYmtmH3zVFI9zI2wWxp8D
 O01/WEL4E2Z+lj6+VNXFnx6BEUc257AkPiDm20fl8sfGdAphpmKZtXsR0KVIVbaCYQ
 3SeR61Bndsx2A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jan 2022 10:11:49 +0100
Date: Sun, 23 Jan 2022 10:11:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220123091149.GA2502@scaer>
References: <20220122223516.306713-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122223516.306713-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cereal: bump to version 1.3.1
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-22 23:35 +0100, Fabrice Fontaine spake thusly:
> - Drop patch (already in version)
> - Update hash of LICENSE file (license updated to match BSD template:
>   https://github.com/USCiLab/cereal/commit/8291f44e05d3e3ee3c4fc9e088231789b701e17e)
> - Update indentation in hash file (two spaces)
> 
> https://github.com/USCiLab/cereal/releases/tag/v1.3.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...alized-shared_ptr-within-the-archive.patch | 67 -------------------
>  package/cereal/cereal.hash                    | 10 +--
>  package/cereal/cereal.mk                      |  5 +-
>  3 files changed, 6 insertions(+), 76 deletions(-)
>  delete mode 100644 package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
> 
> diff --git a/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch b/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
> deleted file mode 100644
> index 3458ec1b59..0000000000
> --- a/package/cereal/0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From f27c12d491955c94583512603bf32c4568f20929 Mon Sep 17 00:00:00 2001
> -From: Michael Walz <code@serpedon.de>
> -Date: Tue, 2 Feb 2021 00:50:29 +0100
> -Subject: [PATCH] Store a copy of each serialized shared_ptr within the archive
> - to prevent the shared_ptr to be freed to early. (#667)
> -
> -The archives use the memory address pointed by the shared_ptr as a
> -unique id which must not be reused during lifetime of the archive.
> -Therefore, the archives stores a copy of it.
> -This problem was also reported as CVE-2020-11105.
> -
> -[Retrieved from:
> -https://github.com/USCiLab/cereal/commit/f27c12d491955c94583512603bf32c4568f20929]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - include/cereal/cereal.hpp       | 13 +++++++++++--
> - include/cereal/types/memory.hpp |  2 +-
> - 2 files changed, 12 insertions(+), 3 deletions(-)
> -
> -diff --git a/include/cereal/cereal.hpp b/include/cereal/cereal.hpp
> -index 99bed9d6..f0d15e8b 100644
> ---- a/include/cereal/cereal.hpp
> -+++ b/include/cereal/cereal.hpp
> -@@ -369,12 +369,17 @@ namespace cereal
> -           point to the same data.
> - 
> -           @internal
> --          @param addr The address (see shared_ptr get()) pointed to by the shared pointer
> -+          @param sharedPointer The shared pointer itself (the adress is taked via get()).
> -+                               The archive takes a copy to prevent the memory location to be freed
> -+                               as long as the address is used as id. This is needed to prevent CVE-2020-11105.
> -           @return A key that uniquely identifies the pointer */
> --      inline std::uint32_t registerSharedPointer( void const * addr )
> -+      inline std::uint32_t registerSharedPointer(const std::shared_ptr<const void>& sharedPointer)
> -       {
> -+        void const * addr = sharedPointer.get();
> -+
> -         // Handle null pointers by just returning 0
> -         if(addr == 0) return 0;
> -+        itsSharedPointerStorage.push_back(sharedPointer);
> - 
> -         auto id = itsSharedPointerMap.find( addr );
> -         if( id == itsSharedPointerMap.end() )
> -@@ -645,6 +650,10 @@ namespace cereal
> -       //! Maps from addresses to pointer ids
> -       std::unordered_map<void const *, std::uint32_t> itsSharedPointerMap;
> - 
> -+      //! Copy of shared pointers used in #itsSharedPointerMap to make sure they are kept alive
> -+      //  during lifetime of itsSharedPointerMap to prevent CVE-2020-11105.
> -+      std::vector<std::shared_ptr<const void>> itsSharedPointerStorage;
> -+
> -       //! The id to be given to the next pointer
> -       std::uint32_t itsCurrentPointerId;
> - 
> -diff --git a/include/cereal/types/memory.hpp b/include/cereal/types/memory.hpp
> -index 59e9da9b..cac1f334 100644
> ---- a/include/cereal/types/memory.hpp
> -+++ b/include/cereal/types/memory.hpp
> -@@ -263,7 +263,7 @@ namespace cereal
> -   {
> -     auto & ptr = wrapper.ptr;
> - 
> --    uint32_t id = ar.registerSharedPointer( ptr.get() );
> -+    uint32_t id = ar.registerSharedPointer( ptr );
> -     ar( CEREAL_NVP_("id", id) );
> - 
> -     if( id & detail::msb_32bit )
> diff --git a/package/cereal/cereal.hash b/package/cereal/cereal.hash
> index ddaf54e7b4..18889b4d42 100644
> --- a/package/cereal/cereal.hash
> +++ b/package/cereal/cereal.hash
> @@ -1,6 +1,6 @@
>  # Locally computed
> -sha256 329ea3e3130b026c03a4acc50e168e7daff4e6e661bc6a7dfec0d77b570851d5  cereal-1.3.0.tar.gz
> -sha256 18fd7618c44c9fe28b5f54cd19747df3c0472ed33e8507fea571e2acf6e72f34  LICENSE
> -sha256 d9e523e8736ac0c68064c7ad312a222f285e82bf6c96a1b1c2cadaffff9fc64f  include/cereal/external/base64.hpp
> -sha256 7fb69c707f0ed3a8b59b8f949f0928a9cc06d67bc15d599094693703ff70ea26  include/cereal/external/rapidjson/rapidjson.h
> -sha256 794bf3b2ecf5cf0c740ac6c524d66ce6284c4b1de1f983d21a242b8abbeb9720  include/cereal/external/rapidxml/license.txt
> +sha256  65ea6ddda98f4274f5c10fb3e07b2269ccdd1e5cbb227be6a2fd78b8f382c976  cereal-1.3.1.tar.gz
> +sha256  58604a126af6a671ea390ee3d5b3e42228aa59b2858fb7af1d5b20b31739ccbb  LICENSE
> +sha256  d9e523e8736ac0c68064c7ad312a222f285e82bf6c96a1b1c2cadaffff9fc64f  include/cereal/external/base64.hpp
> +sha256  7fb69c707f0ed3a8b59b8f949f0928a9cc06d67bc15d599094693703ff70ea26  include/cereal/external/rapidjson/rapidjson.h
> +sha256  794bf3b2ecf5cf0c740ac6c524d66ce6284c4b1de1f983d21a242b8abbeb9720  include/cereal/external/rapidxml/license.txt
> diff --git a/package/cereal/cereal.mk b/package/cereal/cereal.mk
> index 19faa2ac4e..a44f09c743 100644
> --- a/package/cereal/cereal.mk
> +++ b/package/cereal/cereal.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CEREAL_VERSION = 1.3.0
> +CEREAL_VERSION = 1.3.1
>  CEREAL_SITE = $(call github,USCiLab,cereal,v$(CEREAL_VERSION))
>  # For licensing, see also: https://github.com/USCiLab/cereal/issues/609
>  CEREAL_LICENSE = BSD-3-Clause (cereal), Zlib (base64.hpp), MIT (rapidjson), BSL-1.0 or MIT (rapidxml)
> @@ -16,7 +16,4 @@ CEREAL_CONF_OPTS = \
>  	-DTHREAD_SAFE=ON \
>  	-DJUST_INSTALL_CEREAL=ON
>  
> -# 0001-Store-a-copy-of-each-serialized-shared_ptr-within-the-archive.patch
> -CEREAL_IGNORE_CVES += CVE-2020-11105
> -
>  $(eval $(cmake-package))
> -- 
> 2.34.1
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
