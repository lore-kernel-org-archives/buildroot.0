Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A29C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 653C482881;
	Thu, 30 Dec 2021 17:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pps9OszvHQhB; Thu, 30 Dec 2021 17:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 854B482894;
	Thu, 30 Dec 2021 17:43:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44D411BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3393660C23
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fN7f3fsRe6qg for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:43:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E69760B7B
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1640886198;
 bh=uE+8CHlPdvjl+GiJGiqy9eNRUnMUId2RGXI9X447Ps4=;
 h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
 b=AaORHRohCkNTu0dkBRTM/NGuKT97XZkNlUtMgAyyy+V6wqkOeHohk/jMrlJQIXuV9
 R3l6//TgYWyDIBfml1Ork6cYPfRWoUUAszc92FSq2qnUhYkX8eBLGrOzfe3NNgqWfg
 xO7zu6GpjTu9o1Ni/r0Id+M7zwK6y/RWpvO2nk8E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.96]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbivM-1mQtDc1O98-00dESk for
 <buildroot@buildroot.org>; Thu, 30 Dec 2021 18:43:18 +0100
Date: Thu, 30 Dec 2021 18:43:17 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Message-ID: <20211230184317.2694d761@gmx.net>
In-Reply-To: <20211230172507.30212-1-ps.report@gmx.net>
References: <20211230172507.30212-1-ps.report@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:MEPUNdfdqMNRRTVSNXIGsFz8YbGLjk7zWKMi0NfcUN/h287QbTs
 KsFQLXbnZ3hmvtKxJeh6pwjuVNUcl3BdAZvA4JDNfNBeR0GNt54EKdeq+qXVstVknenYgEV
 QgvwScZBSe7VeeT95pFHe3lsRxy9dvnYfN5fAj18p0VhDGLj6koYa0ciPPDy2JR5kQCMCUS
 IS0DeYnUgrBN9p8PtOhHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1+FzceMGLgQ=:R+yN1PDKp4UrBCwKoJTKwL
 yx3llXeHwVqOzrcUdxEuQqz48O59Hgg5l8uG9H9supqKJtEg47cso2Xly8a0EIGQ0Kl1P+aGH
 gAUhq3/ykBTiqrAUblJDWZOoyvEORzx60RgGFSF8nWqOw+4dURmWy9DGSV6rQwDtckz4/LM4m
 u46O8zRjSTUb3bkuq1V+OW+/7yOnFpKwpA+Wc8yb9/c0Rs285hf+/Nirw5maGCoGQYwlL0Znv
 GvB6OJv07l8A5egvfSEV4quSV40TmijHA9GiCqO/L1jSew6Ec/sC3OXo5txkYfRda90X0HCWs
 Ytg90IC5/CZ8GLgED7txk6U77aFSO8ZfAv9uWbVyfkszmgGVtAJFkhErBlqwF7WkgJd6jpyhY
 tEY8KCf2Wcf3cKV+AWsrJEZgbPX+L2oFxdGD6ATvtkEUe+mEWEH2yzssULDAwJZiJoh5b/OSw
 5ZRmSx8YuJzBevVAnjB/jkwpFl8NgB+kjqj9rfNLd3GnNQTV4dOvXFEgzoLIGMSL9K8P3Zpo0
 9TzlVE3QiRwr40KI4YQcA0HKY0CdfBOK7PLIeMuxV1J/PF+F0RrL3RCXZNxFFIMpa/WqEMQh9
 oXfWck+xLn1Y4eVkH2OP3wEkzs04KBaSct4lQhEbYs7rWZzdPeecPhsHNrux649FKshCDscwo
 o0ooflFxbeg+rOx+r1uQdHKqvGNRzd6/Cxklh0ZhxbOOC7+7/LP7rev+Lc9b5H5bU+bCCINpt
 cNpu+bcdJN4xPJ7MxokvnaDZMfAyUab+9a5EZpE1phs1GS3MOGmFnMV9xXSUyrx5lEbsnqiVR
 z4aSGJnSkZMWZp2iBoy8KQRxFnNFaHXZr+BH9+30yPaaS9eCK3MG39u266GWw1jSVF7whGT5z
 zX/uVi5kZku8YKreMSVSlrK2SXPpJQvZPwaoNmDqrBDW6A2W/B5mNF63XbEcCBR+ZfUYa6knH
 +EhGzcyZHz47UvIE+0InzmCJYRx0J7jhhNoAZaOgA3tWrkmgHOLAzn3BysOlgBu3QpEUvD5UG
 lTEKnCPu40XvBQoJx41FFFhSZeMBwClQVUq7bBWyTfWxEqUm60tat6Syj4BT9LAEF9puWseB2
 XUGQ11+MAlE9RQ=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

On Thu, 30 Dec 2021 18:25:07 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

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

Upstream: https://github.com/assimp/assimp/pull/4314

Regards,
Peter

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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
