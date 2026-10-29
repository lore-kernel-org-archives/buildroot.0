Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2250606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AxKC5l2k
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA7AB40DFD;
	Fri, 30 Oct 2026 14:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mo_uJbQjF82H; Fri, 30 Oct 2026 14:20:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EA50440DF8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370021;
	b=kNbmnrVEvBcIenyDrwKC4b4gDNa/A/GTrf17dwHTIik5NMp1HHkO3E5BuKL6Co/yS7In
	 gJ0pNHcdJ1ekuQtvLcUdceNCUVacjK+NGUss/EJCpefaqcSkjNjCRxJgk7it/7dVB0/E3
	 5P8jMcXeVmplQdABD64nlfKzg3FXbfOOZnNEY0HP8ALbieR//DPdDC9sm2U2MQKbZXqnZ
	 bcSK6vAeb9gS7nF0BNC449f0oDgR8bYsiH3z+nG6vY7Vpd/Y3H2qaXYa8LUUSOWEHqD6Z
	 z2aPkGpdlrpuKA5+stEfwhFSYgz3UX1unPMqA4SfTTxXdmjnTcsq+gleDu6pexeYVMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370021;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=NKoU51c9ounwWn48sTyI6A//TecKHqV9hSuhU+H2X6E=;
	b=B5uMLCvT7+SPwQMWA3WDxTDUcLX19xHL6Kx06eO/+lUP578eRfsHVg09AkxQjdTcO74B
	 IaNBe3blkXTH6mnAshnia6RgeWpWUBd7cKYfliEUcgq6CrjWDZMkqyIi+oK83zG0Tpnrw
	 vtT4VGe/LyjD3phwBeUyhChtVrLyMhAnKE8d044jV5W60ggU3p79FWf/TcWux+FDYXkpY
	 nm3QkixmjqY056sjANtiVUZZJqseBfuCeYR3jwrCRoEFTtqlNJ3zYgGLoRvV9a1XTzCJj
	 FPzAS21oOg7RPf7ejYObQKn2lHwADmnjnqpfm9Ts13/p7ewGGHKDv5J4/nobSmsPJiA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370021;
	bh=NKoU51c9ounwWn48sTyI6A//TecKHqV9hSuhU+H2X6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AxKC5l2kPaPldWGsZgcULQonAonZHynxS93g/elBfN2kNVVXSypcVNs/DaUj2anGp
	 OMXXKsbQqZxZbP3dJ0UZhhLCtpuVQyMGw2AGHfeuabhe1H1Q8n3QQwhmufP+yDPsYT
	 uzlecb9hpNFEOAx5vVOMWckMNw85IUED76fdnsqEvbSmGYT/dVvsy34vVAjVQ5wjB6
	 3O+4q0Pxkoj0f3ON0VEjMRW8HPg7rfpFvFJEJZ75Wmh/d/yUJ3i+P+7/dqAFN3q4rl
	 /Lj7z5fk65iSu7uZk6vsu3lLETB8J+t4aDem87IU0XBfkaL2ZKz25HnsLvi5Oo724v
	 txJD66NdecbiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA50440DF8;
	Fri, 30 Oct 2026 14:20:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6399F712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54EF8812D4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bY-By1SYPDH2 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 993F0812BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369892;
 b=dl1tzChtmStuVpz8afn/ppPvuDbO0XILTfn2ZmO4NMUJ6DYR/7RryGCyEXQGd5RHc0QZ
 z92thPg7yit609PrKfoZZdnhr5ytF4fybyOrtnS6UqX4XW7b0o+UQ32arX7rt+XXm6BNe
 PGDPJNOEDys4incVLr0knxqhIrxIRtJAHbh7bfmlJ3aLxLBbkR9WAkNP9vWtfCBJbZzlv
 VVx+j/Vzs7xGGn5F5lZwa8icMlw7taLTCKKDPVbiOhlyxlRweii88pUzc6KJKCBatbomC
 gtpZxIbIjA0hwcNDhGloDxEAHedOzUhoqzRRSFNn8goBOJZq8gC0LTx5PPJbE5hapSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369892;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CQy26oOwMSZ4W8uQTxFHhvbTnhUKEHZRGQq1omjZUVg=;
 b=HscuemIp0tA5X3v74Z663o5qom/0l0lUg6TvdbZLRz9HXAyshqidLouNvVQgxNHSit/M
 2UOvgNBzg+M3dQ+jrJ61ZH9vClQeoeEo7DAH+NXb6pEIFd3EHTBAZ3W/wkjA7f1FxS2Bv
 Hgs5wSdevzodE4eOm4tTRwNBe2tWzmsbT6gdUsnKiBHiB+jcvfI83WrGSYOLmMWMzYNM9
 XQ5NJCY36sP/YRG1bww35ngO6SyfYWMUklP0aCWnxiF0qp93XQ9WbZgjt1fHJZhwRTtFX
 33LwPy1g/pZdQ4l++k+Hi181jTpuNsHOF4KaZdjEQWT5NcjMo76aiOWixZkjDXl1IaA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 993F0812BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B82BD9D388; Fri, 30 Oct 2026 14:16:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:08 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5c286c6f1560621330aca83d2ce21aa00e1693cc
X-Git-Newrev: d55adba6e1b3a5d1b759c55505885e44b6635861
X-Patchwork-Hint: ignore
Message-Id: <20261030141644.B82BD9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sdl3: fix X11
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9034499050149733750=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9034499050149733750==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d55adba6e1b3a5d1b759c55505885e44b6635861
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Add handling for optional X11 dependencies to fix configure errors like:

CMake Error at cmake/macros.cmake:433 (message):
  Couldn't find dependency package for XCURSOR.  Please install the needed
  packages or configure with -DSDL_X11_XCURSOR=OFF

Please note that SDL3 only checks for these dependencies when X11
support is enabled so we do not need to add =OFF options to the else-
clause -DSDL_X11=OFF:
https://github.com/libsdl-org/SDL/blob/release-3.4.12/cmake/sdlchecks.cmake#L325

The problem exists since the package was added with buildroot commit
2dd13e328f118363165b47258429604a5ffd3b41 so a backport to the 2026.08.x
branch should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 02a4df08f99fa4ce205b5dfe510f20a6d3b8bfd8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sdl3/sdl3.mk | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/sdl3/sdl3.mk b/package/sdl3/sdl3.mk
index ecbcbf4bc2..ddd2e2d0b9 100644
--- a/package/sdl3/sdl3.mk
+++ b/package/sdl3/sdl3.mk
@@ -59,6 +59,49 @@ endif
 ifeq ($(BR2_PACKAGE_SDL3_X11),y)
 SDL3_DEPENDENCIES += xlib_libX11 xlib_libXext
 SDL3_CONF_OPTS += -DSDL_X11=ON
+
+ifeq ($(BR2_PACKAGE_XAPP_XINPUT),y)
+SDL3_DEPENDENCIES += xapp_xinput
+SDL3_CONF_OPTS += -DSDL_X11_XINPUT=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XINPUT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+SDL3_DEPENDENCIES += xlib_libXcursor
+SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+SDL3_DEPENDENCIES += xlib_libXfixes
+SDL3_CONF_OPTS += -DSDL_X11_XFIXES=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XFIXES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+SDL3_DEPENDENCIES += xlib_libXrandr
+SDL3_CONF_OPTS += -DSDL_X11_XRANDR=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XRANDR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
+SDL3_DEPENDENCIES += xlib_libXScrnSaver
+SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXTST),y)
+SDL3_DEPENDENCIES += xlib_libXtst
+SDL3_CONF_OPTS += -DSDL_X11_XTEST=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XTEST=OFF
+endif
+
 else
 SDL3_CONF_OPTS += -DSDL_X11=OFF
 endif

--===============9034499050149733750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9034499050149733750==--
