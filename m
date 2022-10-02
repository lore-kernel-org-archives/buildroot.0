Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40CBC433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 20:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EDD940126;
	Sun,  2 Oct 2022 20:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EDD940126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xatlb2loUY2u; Sun,  2 Oct 2022 20:45:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 518C4400C7;
	Sun,  2 Oct 2022 20:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 518C4400C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10DC31BF3EF
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 20:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC587824A4
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 20:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC587824A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YEqIqrG33h6A for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 20:45:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 619788249E
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp1.osuosl.org (Postfix) with ESMTP id 619788249E
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 20:45:39 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.15.171])
 by Aruba Outgoing Smtp  with ESMTPSA
 id f5qCo1TlORFZ1f5qDonkOV; Sun, 02 Oct 2022 22:45:37 +0200
Message-ID: <bd00292c-2b79-4bf4-18ed-b6f4a8e23e43@benettiengineering.com>
Date: Sun, 2 Oct 2022 22:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Ankit Panchal <ankitpanchal202@gmail.com>, buildroot@buildroot.org
References: <20220615065406.2856780-1-ankit.panchal@einfochips.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220615065406.2856780-1-ankit.panchal@einfochips.com>
X-CMAE-Envelope: MS4xfOmmzH8vd7vDvLwkpNKGHII6jlwKXPOvnIyaWSXuIQyH6kyxC78Gby0Oi3AYNAOW5VOYcHHyfK0Cuss4y6ol6fvpRXMDCzK2Y0wMSw5TcNf6xVFJgnSb
 0u7+cbzMo0iYKUqBafIStLUWjJM+yHcpj+ew02syDN+FC9nERjWZWJqjThvEPubXmALDEEiunPSda3jgyTOhM70CS1HkEK1JjXfjSUsJwjtihEjziDHULyjZ
 gXATVrGvWGLijYbSWnbppNMPirOEIzG6hiSQ0VA60M4ppw+Muj4QUQoKxbtzNWW8MdqzDmLmAlyTxf10o7a2/5sBy3PLY3i/jMIuDR2TX++0nVtTaBzWlgS5
 V688BSL7iPJ+27gnHqVECGXHgovmAkKN1JwRNRjd9Ewpdza1AVw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664743537; bh=0D9Aw3htKeLH90i7wyvrAH7PnQSdFkDGKD2ASssiZ2I=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=L6eY/do2MYpkqZYhV8CUZVZMPpnfcCtnIEYjPfyEKVDd+Blk+xWkUttrD5cTojTcr
 8pdw6ea2JmMw/TMJCd1EBpmzSFxcsA19YZBNjV8pvmTcLqvJyOoPaaQyXdUgSfvpj+
 oQWBmXmEatdmvu6SOGI/VQvXRwIa1ncgEM1Qh+0A1LXtppJ7DEKl2QGaBR7JOUaRRB
 EcmtdF0t7qQBywT8HjL1PuP4zbrHD3QNHpeuoXqAkeBw3xdDZmOo1kX9vbF1oHR17g
 avsijQb8hbEIJUKyiuiHcoLYZ0Ai6w6FxiRlqnJ+0F7/bhNfIBZwxXqIdKx+JieqvW
 bc4rlbDxhefdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=L6eY/do2
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5webkit: fix qt-webkit-kisok
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, Peter Seiderer <ps.report@gmx.net>,
 Ankit Panchal <ankit.panchal@einfochips.com>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Ankit,

sorry for the late reply,

On 15/06/22 08:54, Ankit Panchal wrote:
> From: Ankit Panchal <ankitpanchal202@gmail.com>
> 
> While compilation of qt-webkit-kiosk package we get following error:
> ERROR: Unknown module(s) in QT: webkit webkitwidgets
> 
> more detail about the bug is provided at:
> https://bugs.buildroot.org/show_bug.cgi?id=14606
> 
> Following are the changes done:
> 1. The installation paths of the qt5webkit modules in the .pri files
> has been modified.
> 2. And softlinks of the webkit and webkitwidgets packages has been
> created at the expected paths.
> 
> Signed-off-by: Ankit Panchal <ankit.panchal@einfochips.com>
> ---
>   package/qt5/qt5webkit/qt5webkit.mk | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> index 6912359674..a850a03ca9 100644
> --- a/package/qt5/qt5webkit/qt5webkit.mk
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -50,6 +50,23 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>   QT5WEBKIT_CONF_OPTS += -DENABLE_SAMPLING_PROFILER=OFF
>   endif
>   
> +define QT5WEBKIT_CONF_PRI
> +	$(SED) 's/QT.webkit.includes =.*/QT.webkit.includes = \$$\$$QT_MODULE_INCLUDE_BASE \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKit/g' -e 's/QT.webkit.libs =.*/QT.webkit.libs = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkit.rpath =.*/QT.webkit.rpath = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkit.bins =.*/QT.webkit.bins = \$$\$$QT_MODULE_BIN_BASE/g' -e 's/QMAKE_RPATHDIR +=.*/QMAKE_RPATHDIR += \$$\$$QT_MODULE_LIB_BASE/g' $(@D)/Source/WebKit/qt_lib_webkit.pri
> +
> +	$(SED) 's/QT.webkit_private.includes =.*/QT.webkit_private.includes = \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKit\/5.212.0 \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKit\/5.212.0\/QtWebKit/g' -e 's/QT.webkit_private.libs =.*/QT.webkit_private.libs = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkit_private.bins =.*/QT.webkit_private.bins = \$$\$$QT_MODULE_BIN_BASE/g' $(@D)/Source/WebKit/qt_lib_webkit_private.pri
> +
> +	$(SED) 's/QT.webkitwidgets.includes =.*/QT.webkitwidgets.includes = \$$\$$QT_MODULE_INCLUDE_BASE \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKitWidgets/g' -e 's/QT.webkitwidgets.libs =.*/QT.webkitwidgets.libs = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkitwidgets.rpath =.*/QT.webkitwidgets.rpath = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkitwidgets.bins =.*/QT.webkitwidgets.bins = \$$\$$QT_MODULE_BIN_BASE/g' -e 's/QMAKE_RPATHDIR +=.*/QMAKE_RPATHDIR += \$$\$$QT_MODULE_LIB_BASE/g' $(@D)/Source/WebKit/qt_lib_webkitwidgets.pri
> +
> +	$(SED) 's/QT.webkitwidgets_private.includes =.*/QT.webkitwidgets_private.includes = \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKitWidgets\/5.212.0 \$$\$$QT_MODULE_INCLUDE_BASE\/QtWebKitWidgets\/5.212.0\/QtWebKitWidgets/g' -e 's/QT.webkitwidgets_private.libs =.*/QT.webkitwidgets_private.libs = \$$\$$QT_MODULE_LIB_BASE/g' -e 's/QT.webkitwidgets_private.bins =.*/QT.webkitwidgets_private.bins = \$$\$$QT_MODULE_BIN_BASE/g' $(@D)/Source/WebKit/qt_lib_webkitwidgets_private.pri
> +endef

Generally we prefer having a local patch instead of SED tweaks since
they are difficult to understand.

I've become only 1 week ago qt5 package maintainer so I haven't seen
your patch, but I've seen this patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com/
that I've reviewed.

Feel free to check it and comment it since you've faced the same problem.

All future patches are welcome.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> +QT5WEBKIT_POST_CONFIGURE_HOOKS += QT5WEBKIT_CONF_PRI
> +
> +define QT5WEBKIT_CREATE_SYMLINK
> +	ln -sf $(HOST_DIR)/arm-buildroot-linux-gnueabihf/sysroot/usr/mkspecs/modules/*.pri $(HOST_DIR)/mkspecs/modules/
> +	ln -sf $(HOST_DIR)/arm-buildroot-linux-gnueabihf/sysroot/usr/include/QtWebKit* $(HOST_DIR)/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/
> +endef
> +QT5WEBKIT_POST_INSTALL_STAGING_HOOKS += QT5WEBKIT_CREATE_SYMLINK
> +
>   QT5WEBKIT_CONF_OPTS += \
>   	-DENABLE_TOOLS=OFF \
>   	-DPORT=Qt \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
