Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAF9C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 906C760D93;
	Sat,  1 Jan 2022 10:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9N6gzhe434Yh; Sat,  1 Jan 2022 10:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C712360D6A;
	Sat,  1 Jan 2022 10:43:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C74411BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B56A960D6A
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ns70aZazGaqe for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:43:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3B6660BCB
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:43:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C16255FFAE;
 Sat,  1 Jan 2022 11:43:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641033796;
 bh=ruw6F2zvLiwK2m1o57pksrpHD2owlOSNIIvmQ7tIuhk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tvdOZN0wt1mkZWS2ZVHiFdP1H24Bww/XiyfY1Shq4pRyKgAlBB91Sq2sjR23j90Xq
 Qxyt59Ol9iolGhd+0vS90cEtuw+8RvcNDr4T4XmsEqM+TDyxvAJGRkHuT+aYJ/djvo
 BBq9ExBkhXwY4YGjxRwRGBo5XIEmHM2LHK1i6Zt6xuXgu8Dd8YzkV3gWYONzodnFZY
 LCYbc2CqXKJ2WBa+8Bt9pUQqC+5IZBC4GmFHEVYlP+ZkeCu08ga2rYS+YQsCxlyD43
 LHd+g2pK+h0X4PrtnqVi+S8KbaRvfGm9vCak6LbRwRVkdzAhfcS2itD/fzLWN3D/c8
 oDF0ao5XlXtbw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 11:43:11 +0100
Date: Sat, 1 Jan 2022 11:43:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220101104311.GD3390456@scaer>
References: <20211230172507.30212-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230172507.30212-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC v1] package/assimp: fix namespace related
 compile failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-12-30 18:25 +0100, Peter Seiderer spake thusly:
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/0861c66ec02a55e984577094e28b65c78b95a330
> 
>   .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:101:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
>            const FileDatabase &db) const {
>                                    ^
>  In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
>                    from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
>   .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
>        void Convert(T &dest, const FileDatabase &db) const;
>             ^
>   .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:121:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
>            const FileDatabase &db) const {
>                                    ^
>   In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
>                    from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
>   .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
>        void Convert(T &dest, const FileDatabase &db) const;
>             ^
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Note:
>   - patch fixes the compile failure but did not find the root cause
>     and/or a good explanation why the template spezialisation failes
>     for Structure::Convert<CollectionObject> and
>     Structure::Convert<CollectionChild> (but not the other ones) and
>     why it is fixed by the patch...

Since this is now an upstream commit, I've applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-explicit-namespace-instead-of-using.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
> 
> diff --git a/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch b/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
> new file mode 100644
> index 0000000000..b498c3be3f
> --- /dev/null
> +++ b/package/assimp/0002-BlenderScene-use-explicit-namespace-instead-of-using.patch
> @@ -0,0 +1,56 @@
> +From a099fe7cd331a839137115db5df1733c4c1c8070 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Thu, 30 Dec 2021 18:01:54 +0100
> +Subject: [PATCH] BlenderScene: use explicit namespace instead of using
> + namespace
> +
> +Fixes (using g++ Sourcery CodeBench Lite 2014.05-29 - 4.8.3 20140320):
> +
> +  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:101:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
> +           const FileDatabase &db) const {
> +                                   ^
> + In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
> +                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
> +  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
> +       void Convert(T &dest, const FileDatabase &db) const;
> +            ^
> +  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:121:33: error: specialization of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' in different namespace [-fpermissive]
> +           const FileDatabase &db) const {
> +                                   ^
> +  In file included from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.h:49:0,
> +                   from .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderScene.cpp:47:
> +  .../build/assimp-5.1.4/code/AssetLib/Blender/BlenderDNA.h:266:10: error:   from definition of 'template<class T> void Assimp::Blender::Structure::Convert(T&, const Assimp::Blender::FileDatabase&) const' [-fpermissive]
> +       void Convert(T &dest, const FileDatabase &db) const;
> +            ^
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + code/AssetLib/Blender/BlenderScene.cpp | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/code/AssetLib/Blender/BlenderScene.cpp b/code/AssetLib/Blender/BlenderScene.cpp
> +index c93d913fc..9ad086fe6 100644
> +--- a/code/AssetLib/Blender/BlenderScene.cpp
> ++++ b/code/AssetLib/Blender/BlenderScene.cpp
> +@@ -49,8 +49,8 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + #include "BlenderDNA.h"
> + #include "BlenderSceneGen.h"
> + 
> +-using namespace Assimp;
> +-using namespace Assimp::Blender;
> ++namespace Assimp {
> ++namespace Blender {
> + 
> + //--------------------------------------------------------------------------------
> + template <>
> +@@ -885,4 +885,7 @@ void DNA::RegisterConverters() {
> +     converters["CollectionObject"] = DNA::FactoryPair(&Structure::Allocate<CollectionObject>, &Structure::Convert<CollectionObject>);
> + }
> + 
> ++} // namespace Blender
> ++} //namespace Assimp
> ++
> + #endif // ASSIMP_BUILD_NO_BLEND_IMPORTER
> +-- 
> +2.34.1
> +
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
