Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF15606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 06:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G48nNajk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=N2uypBgR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FC38404E8;
	Tue, 27 Oct 2026 06:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nabgxesFVIrP; Tue, 27 Oct 2026 06:34:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F3B1840537
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793082883;
	b=Gu6ILvnMh0rGAOM8uLmPQufG/WVDLBM333Dcr6vphZJeiYgWVtKpRjrfhWbaFx0JKwhv
	 MbPLIGlQbJ0gqLB+c8e71IjgtbzzEQ9tTw5hiufi5SUlFXM2uggvGIegJH6k3AyVhOx5U
	 NsL0vGxeW/ygc/T5PBWhTbhVV4EIm6b8w9EB4Fm9oMLUZi0X//Rifgk1N/+nnb8Pq9/IQ
	 kgHQA6YXr2LZ3bxPDcKZphTltzyL+TBNnMlPztnV8HXykWottA9vIe0J9izBGwFP0YhCW
	 E0JHzswmClW2cdjVfqnX/hk4ScbptQwfQHt7CIp7lX10MUm6RVQrjPTKn2ZGjsobDYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793082883;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DlPpH9QfmniRB+RMlEbiD7KSb/QcmvAnTt4mwhOEk/M=;
	b=BiE15bRmR6KJyLLbHXoHkPDuejWCXr/r3zEW6LSzlzDysH4RxnHpwCqkdpDToPcFuM5h
	 KZOja7zBjdYEJSoCFH9MVhsg5zaLT6WJtPs6J4wmU/4fdZDaHD8IksAlszS/uJXNislka
	 pgadNeIYQ2EhmQGTmU3vXooaQAB0bdq+4i2NDQdhbN90GX2OBFmZNh+BRbdjUlThd58VA
	 RKhuPNWJZqe0sweeYhG+8xUnMUrVKle0e5VZMihKphfXZEFQHPtQV/JfWLtOyCeFq+l6m
	 JG4onzqkQn2FzGsjeydY3h43QaaO083YGnrpCtMXyS1oBUsx+Dwt7+s7w5Lw+K3aNGA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793082883;
	bh=DlPpH9QfmniRB+RMlEbiD7KSb/QcmvAnTt4mwhOEk/M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=G48nNajklISvod1nxNg/6LNlg4on082l4yD3q7Zjgs2iI37PHWfMQgvbULvm4peKD
	 kQqJ9lQS8xmwfmauAnPSzd+XJhRGGhlOyEX93MwAFK7leWd+mGVxmTL0PMo9IYFd0Z
	 2HxANc/csiI0W2jKN1hpBS1S9RqBR0+WpMiS1UKtkIvwlOnYW+Tu2FKLHa4/5/TNE1
	 ZQBkULUZdKiXV/ssdOYeEyQDOTHWpk1qi4XnHuiw23UF6unfb53Q86oanpvt1lt4X/
	 hbkZHD3JQ8Ew7KENsWRT5gPASMtOcs+ocmk9ZYcVNKzWLVbXxCXpH+H6YuI6bWyeU6
	 0yIRntnvKvTug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3B1840537;
	Tue, 27 Oct 2026 06:34:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FBDB120
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 06:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45D5580BE7
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 06:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gz7f7R5i36b4 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 06:34:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0242680A56
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793082878;
 b=bLPJMhZIcqsa5bNGOo1qMAzMP3v4C+mR0jESy04URoqcKV7j0xIVpCf1/Z6Ktn/t4w8e
 qLlj+9m1YTLX2p8MNdED+3H/O1PzIhVC3UM2aPNLDvjeCZD31tKWz8WlveN4KNocKejki
 18HcYK9dd+vMrHJ0XTedO0rKfaU5En9aa3JcmSc8zeH+5wCZ5IUvYm0w+5oW3CVQhw2s0
 41qNxib00AvJvJ17ccJjz+uhCiXsuYmYDVxK1uyZMKKsAZhUhS6V2CgzjN/8ijyVU8GDC
 5/m24GCuK1kIYcV9mn1McDCp/9RWGM0Hx3MVfwTSUjELGhfYPUf15inqnhTW9Xw8Vew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793082878;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=T3gusrANE6KhFbDUtgy4bYX/G9kzUQMVa2DI8PB/3AE=;
 b=jtuB1pod4vVNCZA0C8j0GDWBwhHq+x+EHHSMAzPi0kVmqZ+JMCHovS64I6t56k1/4OGf
 Sj1Nv0Cc6AewjPOw2PJvCUVcli+PUyqnSzKhzEC6fCWZHQYjg3VD8pm5xYQCRKL/c9zeD
 RHlsj6uJQ1Kw8i/RhjZHCV27IAxjBd6lw3zFdmeEh+HxCrwoTmeHq6Mqdsj6IBu+b3Fuu
 OdqQSytQ9Yts5xY6h3KiVjhIOKcDocB6HCSWCxE8/kDZeCHE9wnKPrCz0j0VopZgfk5BF
 4Mw6U77xvJ9gjExpFQlmhwRYqiDfxCUOw55x1GaaS0bIi+n9nfihhvXt4aqo8cTSNSw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=N2uypBgR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=N2uypBgR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0242680A56
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 06:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793082875;
 bh=T3gusrANE6KhFbDUtgy4bYX/G9kzUQMVa2DI8PB/3AE=;
 h=From:To:Cc:Subject:Date:From;
 b=N2uypBgRAXThJBb27Htpq8ycQUiKmvHb8t8zsiX8JJ5WbTNniJxDZiUjBPez3zZZF
 3hg54G9UQGrA1IZEBM5r5X5pjUqci+8t4W6xnIHpAWmBxOVYb+JX4kKtqMfk5vO+eL
 wLioL8JxBw+7H5/iMH70YCBDIxt9lH+glCjwBvwMq8S9BBhYHsB8nrxoIn+7GX6l6e
 QJHihMRe9iCte00hLKJLcxOy8Vwflgt1rqxfA6Rwsul7U1n8KEgS/TlaX6Beu/ktA4
 /C2Ywkn6ruypihFGwVjZPdCTdPKvSIOeiv3aAtFxbIh/JUUaFJay6wkztTgthy4OTX
 m+DAKOaQQWJ/Q==
X-KAS-Sym: v3:f51bdf72230551df:AJP1w9X8Yiu2XYEBoDHKmywhmcO7H/pVSEUb1Qw4dmtWx
 z3sSiQ3cxg33QYB2KEu1UhrDguhKMAwxpeOFCpoy0gvLAahZKrFkmtU/ypDVkWZS+MFSiimmgmG
 NthhXW7xLBMRAI+jns9pzSzJYQkT663YG9w7kvbEtczXZaZZYjrFeYo0+pabVYVROn3i7VCqT/h
 eYClSXBgUtx5aXQUysOwJklL/ZqnCSrO/8KSLve4g8aVKRU2+PPqnuO60sJC8DwoFygIZtgLC2o
 Cipxl7x65kZIHgrpskAtWzud+q2fJsE1YFFACwj7FSka3lRT8c0npenRtrc2TP3Hb0o6E8Mg==:
 2RYzCrp7DnGnMsyN9K8hlIN86mYuHZ9gAb1BOUlEKVTC3YcmS5YpzgiPHX8fRt+JhvSeG590VHm
 kdQdtGSf98kWM8X8mT2DLclx3H0u9WAyGbu7pfa96I8fX9iRivgVYMiLcgsLqKjI9EOaJLM3W3d
 e+t2ztxAMBmlI0ZSqaLQFM5eDFUfByLkYmkXWTEvUIhrBoWl8NAVLZ0AfVvfF2Aw+2zUzSrjUl8
 rNGOz3o1A812yZY7ZA0J8MLlR+zpxjDDVje9iiNT0gaBedyz/0PcGd5HoVI5bEXwqRnxZ0tHggb
 YNvRDiHNhDxjBjtbP3lHHZWEivb1p1nc2Km/+mHxKLLdVIhFEx+G5SbkB2XcD3yY8dghqIR8CTl
 XvoPhasaXCMhqxYnuLEzjPMQoKkjPdJgWDiB/H6IxFd89Xf33cLmmsk4MJqJojBN3Dqy/nW3jUz
 HPtGoI1Vn/rOvjKk+/BYqiJBhuHmDu6ka/s0t5h6hjL9QGodtY3yw/iVjPdo19d2Ug+JjttnFTg
 YwEi/UxvcLlhtf64rLpdPeHnbEg/cg0QV6FoQbsc94D6Lw3J4LZqBz4Xej5u5ysQ4s5T5SprW++
 cGv286rEz/AIi3TYB+sYB69aZH0pRKMJJyBVlaYGVPEslvW4HtPUePaKh3OPGmyHXWqGc/RqymJ
 KA51Lw/9SoenekyZLpXuwF8hUuErP/qoTwhO9Vz6CxyPumxGjkvnGEMh2UQA=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BBECAA4C6EB7;
 Tue, 27 Oct 2026 07:34:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41544)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xLalW-000000008C9-3XbW;
 Tue, 27 Oct 2026 06:34:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 07:34:34 +0100
Message-ID: <20261027063434.33572-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 1/1] package/fontconfig: bump version to
 2.18.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Daniel Lang <dalang@gmx.at>, Sergio Prado <sergio.prado@e-labworks.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Mario Rugiero <mrugiero@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>, Simon Dawson <spdawson@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://lists.freedesktop.org/archives/fontconfig/2026-May/007334.html
https://lists.freedesktop.org/archives/fontconfig/2026-June/007345.html
https://lists.freedesktop.org/archives/fontconfig/2026-July/007371.html
https://lists.freedesktop.org/archives/fontconfig/2026-August/007385.html

Due to upstream commit
https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/7643efb77552076b035d3eb506ca836ed4764ca5
added in version 2.18.0 fontconfig now uses locale_t which adds a
dependency to BR2_ENABLE_LOCALE and wchar that needs to be propagated
to its reverse dependencies.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: updated dependencies (Thomas)
v2: updated dependencies (Thomas)

Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7d872f3f0bc331d81ae4503b2dcfdd69410700f1

 package/cairo/Config.in                        |  5 +++++
 package/cairomm/Config.in                      |  4 +++-
 package/cairomm1_14/Config.in                  |  4 +++-
 package/cups-filters/Config.in                 |  4 +++-
 package/efl/Config.in                          |  8 +++++++-
 package/fcft/Config.in                         |  5 ++++-
 package/fontconfig/Config.in                   |  5 +++++
 package/fontconfig/fontconfig.hash             |  4 ++--
 package/fontconfig/fontconfig.mk               |  2 +-
 package/foot/Config.in                         |  5 ++++-
 package/ghostscript/Config.in                  |  5 +++++
 package/gnuradio/Config.in                     |  4 ++++
 package/gstreamer1/gst1-plugins-bad/Config.in  |  9 +++++++--
 package/gstreamer1/gst1-plugins-base/Config.in |  4 +++-
 package/gstreamer1/gst1-plugins-good/Config.in |  5 +++++
 package/gtkmm3/Config.in                       |  4 +++-
 package/kodi/Config.in                         |  9 +++++----
 package/kodi/kodi.mk                           |  5 -----
 package/libdecor/Config.in                     |  4 +++-
 package/libfm/Config.in                        |  4 +++-
 package/libgdiplus/Config.in                   |  4 +++-
 package/libgtk3/Config.in                      |  8 ++++++--
 package/libgtk4/Config.in                      |  4 +++-
 package/librsvg/Config.in                      |  4 +++-
 package/matchbox/Config.in                     |  4 ++++
 package/openbox/Config.in                      |  4 +++-
 package/pango/Config.in                        |  4 +++-
 package/pangomm/Config.in                      |  4 +++-
 package/pangomm2_46/Config.in                  |  4 +++-
 package/pcmanfm/Config.in                      |  4 +++-
 package/poppler/Config.in                      |  4 +++-
 package/python-matplotlib/Config.in            |  4 +++-
 package/python-pycairo/Config.in               |  5 +++++
 package/qt5/qt5base/Config.in                  |  4 ++++
 package/qt5/qt5webengine/Config.in             |  4 +++-
 package/qt6/qt6base/Config.in                  |  4 ++++
 package/ratpoison/Config.in                    |  4 ++++
 package/rrdtool/Config.in                      |  4 +++-
 package/sway/Config.in                         |  4 +++-
 package/swaybg/Config.in                       |  5 +++++
 package/tk/Config.in                           |  6 ++++--
 package/vdr/Config.in                          |  4 +++-
 package/vte/Config.in                          |  4 +++-
 package/webkitgtk/Config.in                    |  4 +++-
 package/weston/Config.in                       | 16 ++++++++--------
 package/wireshark/Config.in                    |  4 +++-
 package/wmenu/Config.in                        |  4 +++-
 package/wpewebkit/Config.in                    |  4 +++-
 package/x11r7/xapp_x11perf/Config.in           |  4 ++++
 package/x11r7/xapp_xclock/Config.in            |  4 ++++
 package/x11r7/xapp_xfd/Config.in               |  4 ++++
 package/x11r7/xapp_xlogo/Config.in             |  4 ++++
 package/x11r7/xlib_libXft/Config.in            |  4 ++++
 package/x11r7/xserver_xorg-server/Config.in    |  4 ++++
 package/xscreensaver/Config.in                 |  4 +++-
 55 files changed, 203 insertions(+), 56 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index c41a12fe81..2fc66d1032 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_CAIRO
 	bool "cairo"
+	depends on BR2_USE_WCHAR # fontconfig
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
@@ -28,3 +30,6 @@ config BR2_PACKAGE_CAIRO_ZLIB
 	select BR2_PACKAGE_ZLIB
 
 endif
+
+comment "cairo needs a toolchain w/ wchar, locale"
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
index 174f3967ab..33d2bfe98f 100644
--- a/package/cairomm/Config.in
+++ b/package/cairomm/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CAIROMM
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_CAIRO
@@ -13,7 +14,8 @@ config BR2_PACKAGE_CAIROMM
 
 	  https://www.cairographics.org/cairomm/
 
-comment "cairomm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "cairomm needs a toolchain w/ C++, wchar, locale, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cairomm1_14/Config.in b/package/cairomm1_14/Config.in
index e369aa6f4a..c9aa593d6f 100644
--- a/package/cairomm1_14/Config.in
+++ b/package/cairomm1_14/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CAIROMM1_14
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_CAIRO
@@ -16,7 +17,8 @@ config BR2_PACKAGE_CAIROMM1_14
 
 	  https://www.cairographics.org/cairomm/
 
-comment "cairomm (1.14.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "cairomm (1.14.x) needs a toolchain w/ C++, wchar, locale, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index b5b9e04a28..8c8cecd516 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CUPS_FILTERS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP # qpdf
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
@@ -32,9 +33,10 @@ config BR2_PACKAGE_CUPS_FILTERS
 
 	  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters
 
-comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library, gcc >= 10"
+comment "cups-filters needs a toolchain w/ wchar, locale, C++, threads and dynamic library, gcc >= 10"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/efl/Config.in b/package/efl/Config.in
index c4f82b92e3..f824a212ca 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EFL
 	bool "efl"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-efl
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -280,16 +281,21 @@ config BR2_PACKAGE_EFL_SVG
 	bool "SVG loader"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
+	depends on BR2_ENABLE_LOCALE # librsvg -> cairo -> fontconfig
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
 	help
 	  This option enables the Evas generic SVG loader
 
+comment "SVG loader needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 endif # BR2_PACKAGE_EFL
 
-comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.9, host gcc >= 4.9, threads, wchar"
+comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.9, host gcc >= 4.9, threads, wchar, locale"
 	depends on !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| !BR2_HOST_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
diff --git a/package/fcft/Config.in b/package/fcft/Config.in
index 5393b95db3..19dda8821a 100644
--- a/package/fcft/Config.in
+++ b/package/fcft/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_FCFT
 	bool "fcft"
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # C11 threads
+	depends on BR2_USE_WCHAR # fontconfig
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_PIXMAN
@@ -48,5 +50,6 @@ config BR2_PACKAGE_FCFT_SVG_SUPPORT
 
 endif # BR2_PACKAGE_FCFT
 
-comment "fcft needs a glibc or musl toolchain"
+comment "fcft needs a glibc or musl toolchain w/ wchar, locale"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
diff --git a/package/fontconfig/Config.in b/package/fontconfig/Config.in
index 218fdb2e7a..e4c6e3da59 100644
--- a/package/fontconfig/Config.in
+++ b/package/fontconfig/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_FONTCONFIG
 	bool "fontconfig"
+	depends on BR2_USE_WCHAR
+	depends on BR2_ENABLE_LOCALE # locale_t
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_EXPAT
 	help
@@ -7,3 +9,6 @@ config BR2_PACKAGE_FONTCONFIG
 	  access.
 
 	  http://www.fontconfig.org/
+
+comment "fontconfig needs a toolchain w/ wchar, locale"
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
index e6f2e0771c..f1373ae75f 100644
--- a/package/fontconfig/fontconfig.hash
+++ b/package/fontconfig/fontconfig.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.17.1/fontconfig-2.17.1.tar.xz.sha256sum
-sha256  9f5cae93f4fffc1fbc05ae99cdfc708cd60dfd6612ffc0512827025c026fa541  fontconfig-2.17.1.tar.xz
+# From https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.3/fontconfig-2.18.3.tar.xz.sha256sum
+sha256  4f7b554a38cdf78c033f666c8871f3749e14a094f65a07f630c91ed0b43d35e3  fontconfig-2.18.3.tar.xz
 
 # Locally calculated
 sha256  51a51aa9823704fd90bccc616cdd17ebabb5b2b3e9cbde886ca02c7002288067  COPYING
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 639f6ed51d..4cd11dd898 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FONTCONFIG_VERSION = 2.17.1
+FONTCONFIG_VERSION = 2.18.3
 FONTCONFIG_SITE = https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/$(FONTCONFIG_VERSION)
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.xz
 FONTCONFIG_INSTALL_STAGING = YES
diff --git a/package/foot/Config.in b/package/foot/Config.in
index b0ec2e3926..09777ea478 100644
--- a/package/foot/Config.in
+++ b/package/foot/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_FOOT
 	bool "foot"
+	depends on BR2_USE_WCHAR # fontconfig
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # fcft
 	depends on !BR2_STATIC_LIBS # wayland
 	select BR2_PACKAGE_FCFT
@@ -32,6 +34,7 @@ config BR2_PACKAGE_FOOT_THEMES
 
 endif # BR2_PACKAGE_FOOT
 
-comment "foot needs a glibc or musl toolchain w/ dynamic library"
+comment "foot needs a glibc or musl toolchain w/ dynamic library, locale"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		!BR2_USE_WCHAR || !BR2_ENABLE_LOCALE || \
 		BR2_STATIC_LIBS
diff --git a/package/ghostscript/Config.in b/package/ghostscript/Config.in
index 023ef5f2ba..fda6d0bc11 100644
--- a/package/ghostscript/Config.in
+++ b/package/ghostscript/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_GHOSTSCRIPT
 	bool "ghostscript"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # fontconfig
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_GHOSTSCRIPT_FONTS
 	select BR2_PACKAGE_JPEG
@@ -12,3 +14,6 @@ config BR2_PACKAGE_GHOSTSCRIPT
 	  Document Format (PDF) files.
 
 	  http://ghostscript.com
+
+comment "ghostscript needs a toolchain w/ wchar, locale"
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 0e8dc66dc4..055a6d5b9f 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -162,6 +162,7 @@ config BR2_PACKAGE_GNURADIO_QTGUI
 	bool "gr-qtgui"
 	depends on BR2_PACKAGE_GNURADIO_PYTHON
 	depends on BR2_PACKAGE_QT5
+	depends on BR2_ENABLE_LOCALE # qt5base -> fontconfig
 	select BR2_PACKAGE_GNURADIO_FFT
 	select BR2_PACKAGE_GNURADIO_FILTER
 	select BR2_PACKAGE_PYTHON_PYQT5
@@ -172,6 +173,9 @@ config BR2_PACKAGE_GNURADIO_QTGUI
 	help
 	  GNU Radio Qt scopes
 
+comment "gr-qtgui support needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 config BR2_PACKAGE_GNURADIO_TRELLIS
 	bool "gr-trellis support"
 	select BR2_PACKAGE_GNURADIO_DIGITAL
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index fd518c228d..4d6f97dbb4 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -475,6 +475,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML
 	bool "ttml"
 	depends on BR2_USE_WCHAR # pango -> glib2
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2
 	depends on BR2_USE_MMU # pango -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
@@ -486,10 +487,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML
 	help
 	  Timed Text Markup Language (TTML) subtitle plugin
 
-comment "ttml needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "ttml needs a toolchain w/ wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
@@ -568,13 +570,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # librsvg -> pango -> harfbuzz
+	depends on BR2_USE_WCHAR # librsvg -> cairo -> fontconfig
+	depends on BR2_ENABLE_LOCALE # librsvg -> cairo -> fontconfig
 	select BR2_PACKAGE_LIBRSVG
 	help
 	  RSVG plugin library
 
-comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.9"
+comment "rsvg plugin needs a toolchain w/ wchar, locale, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_USE_WCHAR || !BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 6eff685c2f..2da9e9da22 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -265,6 +265,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OPUS
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_USE_WCHAR # pango -> glib2
+	depends on BR2_ENABLE_LOCALE # pango -> cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2
 	depends on BR2_USE_MMU # pango -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
@@ -274,10 +275,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	help
 	  Pango-based text rendering and overlay
 
-comment "pango plugin needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "pango plugin needs a toolchain w/ C++, wchar, locale, threads, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index c4eb4efb65..26fe649a3a 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -328,11 +328,16 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2_PROBE
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO
 	bool "cairo"
+	depends on BR2_USE_WCHAR # cairo -> fontconfig
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	help
 	  Cairo-based elements
 
+comment "cairo needs a toolchain w/ wchar, locale"
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
+
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC
 	bool "flac (libFLAC)"
 	depends on BR2_USE_WCHAR # flac
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index ac38ba06fc..d6f59efef6 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,7 +1,8 @@
-comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9, dynamic library"
+comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, locale, threads, gcc >= 4.9, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
@@ -14,6 +15,7 @@ config BR2_PACKAGE_GTKMM3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
+	depends on BR2_ENABLE_LOCALE # cairomm -> cairo -> fontconfig
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on !BR2_STATIC_LIBS # atkmm
 	select BR2_PACKAGE_ATKMM2_28
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 16b86f3fe5..53b3a31360 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -9,11 +9,13 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_m68k
 	depends on BR2_USE_MMU # libcdio, and others
 
-comment "kodi needs python3 w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 9.x, host gcc >= 9.x"
+comment "kodi needs python3 w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, locale, dynamic library, gcc >= 9.x, host gcc >= 9.x"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_ENABLE_LOCALE \
+		|| !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
 		|| !BR2_HOST_GCC_AT_LEAST_9 \
 		|| BR2_TOOLCHAIN_USES_MUSL \
@@ -63,6 +65,7 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_HOST_GCC_AT_LEAST_9 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # gnutls, python3 and others
 	depends on BR2_PACKAGE_HAS_LIBEGL
@@ -88,8 +91,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBFRIBIDI
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LZO
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 32dd9a3ada..d374ce80bb 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -144,11 +144,6 @@ endif
 
 KODI_CONF_OPTS += -DCORE_PLATFORM_NAME="$(KODI_CORE_PLATFORM_NAME)"
 
-ifeq ($(BR2_ENABLE_LOCALE),)
-KODI_DEPENDENCIES += libiconv
-KODI_EXTRA_LIBS += -liconv
-endif
-
 ifeq ($(BR2_arcle),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arc -DWITH_CPU=arc
 else ifeq ($(BR2_armeb),y)
diff --git a/package/libdecor/Config.in b/package/libdecor/Config.in
index 782fe855b4..113f154c1e 100644
--- a/package/libdecor/Config.in
+++ b/package/libdecor/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBDECOR
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_USE_MMU # pango
 	depends on BR2_USE_WCHAR # pango
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
 	depends on BR2_INSTALL_LIBSTDCPP # pango
@@ -18,8 +19,9 @@ config BR2_PACKAGE_LIBDECOR
 
 	  https://gitlab.freedesktop.org/libdecor/libdecor
 
-comment "libdecor needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libdecor needs a toolchain w/ wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index abb35ca3dd..6a64d1fb50 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBFM
 	bool "libfm"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
 	depends on BR2_USE_WCHAR # libgtk3, libglib2
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
@@ -27,11 +28,12 @@ config BR2_PACKAGE_LIBFM
 
 	  http://wiki.lxde.org/en/Libfm
 
-comment "libfm a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
+comment "libfm a toolchain w/ dynamic library, wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
diff --git a/package/libgdiplus/Config.in b/package/libgdiplus/Config.in
index d26a997d46..c53abe78de 100644
--- a/package/libgdiplus/Config.in
+++ b/package/libgdiplus/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBGDIPLUS
 	bool "libgdiplus"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -14,8 +15,9 @@ config BR2_PACKAGE_LIBGDIPLUS
 
 	  https://github.com/mono/libgdiplus
 
-comment "libgdiplus needs a toolchain w/ wchar, threads, C++"
+comment "libgdiplus needs a toolchain w/ wchar, locale, threads, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index dac2d17974..08dfbc9178 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,8 +1,11 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, dynamic library"
+comment "libgtk3 needs a toolchain w/ wchar, locale, threads, C++, gcc >= 4.9, dynamic library"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+	depends on \
+		!BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || \
+		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
@@ -16,6 +19,7 @@ comment "libgtk3 needs an OpenGL or an OpenGL-EGL backend"
 config BR2_PACKAGE_LIBGTK3
 	bool "libgtk3"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-libgtk3 -> host-librsvg
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libepoxy
 	depends on BR2_USE_MMU # glib2
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index c1f3928b8a..5c21b34531 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -1,8 +1,9 @@
-comment "libgtk4 needs a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
+comment "libgtk4 needs a toolchain w/ dynamic library, wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS
@@ -16,6 +17,7 @@ config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_ENABLE_LOCALE # librsvg -> cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene, libepoxy
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 9f5c2f388e..46e431f700 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBRSVG
 	bool "librsvg"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
@@ -21,10 +22,11 @@ config BR2_PACKAGE_LIBRSVG
 
 	  https://gitlab.gnome.org/GNOME/librsvg
 
-comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "librsvg needs a toolchain w/ wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 9d212902a0..7eb9990160 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,5 +1,6 @@
 menuconfig BR2_PACKAGE_MATCHBOX
 	bool "matchbox"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_FONTCONFIG
@@ -33,3 +34,6 @@ source "package/matchbox-panel/Config.in"
 source "package/matchbox-startup-monitor/Config.in"
 
 endif
+
+comment "matchbox needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/openbox/Config.in b/package/openbox/Config.in
index e042ed2b48..ca2adead88 100644
--- a/package/openbox/Config.in
+++ b/package/openbox/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OPENBOX
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_ENABLE_LOCALE # xlib_libXft -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
@@ -20,10 +21,11 @@ config BR2_PACKAGE_OPENBOX
 
 	  http://openbox.org
 
-comment "openbox needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
+comment "openbox needs a toolchain w/ C++, threads, wchar, locale, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/pango/Config.in b/package/pango/Config.in
index e2b2e7fe2b..d6d48efa20 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PANGO
 	bool "pango"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
@@ -24,9 +25,10 @@ config BR2_PACKAGE_PANGO
 
 	  https://pango.gnome.org/
 
-comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pango needs a toolchain w/ wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
index 6ddad9e6ef..b8b70cfd28 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PANGOMM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
 	depends on BR2_USE_MMU # *mm/pango -> libglib2
 	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
+	depends on BR2_ENABLE_LOCALE # pango -> cairo -> fontconfig
 	select BR2_PACKAGE_CAIROMM
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_PANGO
@@ -15,8 +16,9 @@ config BR2_PACKAGE_PANGOMM
 
 	  http://www.gtkmm.org/
 
-comment "pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "pangomm needs a toolchain w/ C++, wchar, locale, threads, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pangomm2_46/Config.in b/package/pangomm2_46/Config.in
index 772b523c83..95d069d823 100644
--- a/package/pangomm2_46/Config.in
+++ b/package/pangomm2_46/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_PANGOMM2_46
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
 	depends on BR2_USE_MMU # *mm/pango -> libglib2
 	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
+	depends on BR2_ENABLE_LOCALE # cairomm -> cairo -> fontconfig
 	select BR2_PACKAGE_CAIROMM1_14
 	select BR2_PACKAGE_GLIBMM2_66
 	select BR2_PACKAGE_PANGO
@@ -18,8 +19,9 @@ config BR2_PACKAGE_PANGOMM2_46
 
 	  http://www.gtkmm.org/
 
-comment "pangomm (2.46.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "pangomm (2.46.x) needs a toolchain w/ C++, wchar, locale, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 5250176c1f..2e7203ad8b 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libfm
 	depends on BR2_USE_WCHAR # libfm
+	depends on BR2_ENABLE_LOCALE # libfm -> cairo -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libfm
 	depends on BR2_USE_MMU # libfm
 	depends on BR2_INSTALL_LIBSTDCPP # libfm
@@ -23,11 +24,12 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://wiki.lxde.org/en/PCManFM
 
-comment "pcmanfm a toolchain w/ dynamic library, wchar, threads, C++, gcc >= 4.9"
+comment "pcmanfm a toolchain w/ dynamic library, wchar, locale, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 208126a327..52e8c4e2d8 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_POPPLER
 	bool "poppler"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -31,7 +32,8 @@ config BR2_PACKAGE_POPPLER_UTILS
 
 endif
 
-comment "poppler needs a toolchain w/ wchar, C++, threads, dynamic library, gcc >= 7"
+comment "poppler needs a toolchain w/ wchar, locale, C++, threads, dynamic library, gcc >= 7"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 13894004aa..3077ac7a4d 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -36,13 +36,15 @@ if BR2_PACKAGE_PYTHON_MATPLOTLIB
 config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
 	bool "qt display"
 	depends on BR2_PACKAGE_QT5 # python-pyqt5
+	depends on BR2_ENABLE_LOCALE # qt5base -> fontconfig
 	select BR2_PACKAGE_PYTHON_PYQT5
 	select BR2_PACKAGE_QT5BASE_FONTCONFIG
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 
 endif
 
-comment "python-matplotlib needs a glibc or musl toolchain w/ C++, gcc >= 9, host gcc >= 9"
+comment "python-matplotlib needs a glibc or musl toolchain w/ C++, locale, gcc >= 9, host gcc >= 9"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_9 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_9
diff --git a/package/python-pycairo/Config.in b/package/python-pycairo/Config.in
index 0d8de977e1..80cdf78a71 100644
--- a/package/python-pycairo/Config.in
+++ b/package/python-pycairo/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_PYTHON_PYCAIRO
 	bool "python-pycairo"
+	depends on BR2_USE_WCHAR # cairo -> fontconfig
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_CAIRO
 	help
 	  Python interface for cairo.
 
 	  https://pycairo.readthedocs.io
+
+comment "python-pycairo needs a toolchain w/ wchar, locale"
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index dfaa798bd4..2068ffa6d1 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -238,11 +238,15 @@ config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 
 config BR2_PACKAGE_QT5BASE_FONTCONFIG
 	bool "fontconfig support"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FONTCONFIG
 	help
 	  This option enables Fontconfig and Freetype support using
 	  the system fontconfig and freetype2 libraries.
 
+comment "fontconfig support needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 config BR2_PACKAGE_QT5BASE_HARFBUZZ
 	bool "harfbuzz support"
 	select BR2_PACKAGE_HARFBUZZ if \
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 2c16d819d2..9ebe30a965 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -10,11 +10,12 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
 
-comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 7, threads, wchar, host gcc >= 7"
+comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 7, threads, wchar, locale, host gcc >= 7"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_HOST_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "qt5webengine needs an OpenGL and EGL-capable backend"
@@ -29,6 +30,7 @@ config BR2_PACKAGE_QT5WEBENGINE
 	depends on BR2_HOST_GCC_AT_LEAST_7 # qt5base-icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libvpx
 	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_ENABLE_LOCALE # qt5base -> fontconfig
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
 	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
 	depends on BR2_PACKAGE_HAS_UDEV
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index e6bb99de28..2d8c5ceeac 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -125,11 +125,15 @@ endif
 
 config BR2_PACKAGE_QT6BASE_FONTCONFIG
 	bool "fontconfig support"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FONTCONFIG
 	help
 	  This option enables Fontconfig support using the system
 	  fontconfig library.
 
+comment "fontconfig support needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 config BR2_PACKAGE_QT6BASE_HARFBUZZ
 	bool "harfbuzz support"
 	select BR2_PACKAGE_HARFBUZZ if \
diff --git a/package/ratpoison/Config.in b/package/ratpoison/Config.in
index 7b724290c3..81a1f8c334 100644
--- a/package/ratpoison/Config.in
+++ b/package/ratpoison/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RATPOISON
 	bool "ratpoison"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_LIBERATION
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -15,3 +16,6 @@ config BR2_PACKAGE_RATPOISON
 	  advantage of your precious screen real estate.
 
 	  http://www.nongnu.org/ratpoison/
+
+comment "ratpoison needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index d954fd1214..b36202e466 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_CAIRO_ZLIB
@@ -26,8 +27,9 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	  This enables the graphing capabilities ('rrdgraph').
 	  Without this it will only act as a database backend.
 
-comment "rrd_graph support needs a toolchain w/ C++, gcc >= 4.9"
+comment "rrd_graph support needs a toolchain w/ locale, C++, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
diff --git a/package/sway/Config.in b/package/sway/Config.in
index c89c0607d3..f80f73031a 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_SWAY
 	depends on BR2_PACKAGE_HAS_UDEV # wlroots
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, pango
 	depends on BR2_USE_WCHAR # pango
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_USE_MMU # pango
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
@@ -61,10 +62,11 @@ comment "sway needs systemd, udev, EGL, OpenGL ES and GBM support"
 		!BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_LIBGBM
 
-comment "sway needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
+comment "sway needs a toolchain w/ wchar, locale, threads, C++, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/swaybg/Config.in b/package/swaybg/Config.in
index 63aa8cdb6a..b5aac60c39 100644
--- a/package/swaybg/Config.in
+++ b/package/swaybg/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_SWAYBG
 	default y if BR2_PACKAGE_SWAY
 	depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	depends on BR2_USE_WCHAR # fontconfig
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_WAYLAND
@@ -11,3 +13,6 @@ config BR2_PACKAGE_SWAYBG
 	  Wallpaper tool for Wayland compositors.
 
 	  https://github.com/swaywm/swaybg
+
+comment "swaybg needs a toolchain w/ wchar, locale"
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
diff --git a/package/tk/Config.in b/package/tk/Config.in
index 507b0bf979..7c958fe8e1 100644
--- a/package/tk/Config.in
+++ b/package/tk/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TK
 	depends on BR2_USE_MMU # tcl
 	depends on BR2_TOOLCHAIN_HAS_THREADS # tcl
 	depends on !BR2_STATIC_LIBS # tcl
+	depends on BR2_ENABLE_LOCALE # xlib_libXft -> fontconfig
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_TCL
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -12,7 +13,8 @@ config BR2_PACKAGE_TK
 
 	  http://www.tcl.tk
 
-comment "tk needs a toolchain w/ threads, dynamic library"
+comment "tk needs a toolchain w/ locale, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_ENABLE_LOCALE
diff --git a/package/vdr/Config.in b/package/vdr/Config.in
index 38502729a7..c7b22e6fa2 100644
--- a/package/vdr/Config.in
+++ b/package/vdr/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_VDR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
@@ -17,9 +18,10 @@ config BR2_PACKAGE_VDR
 
 	  http://www.tvdr.de
 
-comment "vdr needs a toolchain w/ C++, dynamic library, NPTL, wchar, headers >= 3.9"
+comment "vdr needs a toolchain w/ C++, dynamic library, NPTL, wchar, locale, headers >= 3.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
diff --git a/package/vte/Config.in b/package/vte/Config.in
index af6bfae890..38ae3f8c44 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_VTE
 	bool "vte"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3 -> host-libgtk3 -> host-librsvg
 	depends on BR2_USE_WCHAR
+	depends on BR2_ENABLE_LOCALE # libgtk3 -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -23,11 +24,12 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a uClibc or glibc toolchain w/ dynamic library, wchar, threads, C++, gcc >= 10"
+comment "vte needs a uClibc or glibc toolchain w/ dynamic library, wchar, locale, threads, C++, gcc >= 10"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 6600ac17cd..f5c05349f5 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,11 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
+comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, locale, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on (!BR2_PACKAGE_LIBGTK3 && !BR2_PACKAGE_LIBGTK4) || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
 		!BR2_HOST_GCC_AT_LEAST_7
@@ -36,6 +37,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	depends on BR2_PACKAGE_LIBGTK3 || BR2_PACKAGE_LIBGTK4
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
diff --git a/package/weston/Config.in b/package/weston/Config.in
index dcb5c7544e..d227c8b513 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,6 +1,7 @@
-comment "weston needs udev and a toolchain w/ C++, locale, threads, dynamic library, headers >= 3.0"
+comment "weston needs udev and a toolchain w/ C++, wchar, locale, threads, dynamic library, headers >= 3.0"
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR || \
 		!BR2_ENABLE_LOCALE || !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_WESTON
@@ -10,6 +11,8 @@ config BR2_PACKAGE_WESTON
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_USE_WCHAR # cairo -> fontconfig
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_LIBXKBCOMMON
@@ -48,7 +51,6 @@ config BR2_PACKAGE_WESTON_DEFAULT_RDP
 	bool "rdp"
 	depends on BR2_USE_MMU # freerdp, libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_USE_WCHAR # freerdp
 	depends on BR2_INSTALL_LIBSTDCPP # freerdp
 	depends on BR2_PACKAGE_XORG7 # freerdp-server
 	select BR2_PACKAGE_WESTON_RDP
@@ -83,7 +85,6 @@ config BR2_PACKAGE_WESTON_RDP
 	bool "RDP compositor"
 	depends on BR2_USE_MMU # freerdp, libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_USE_WCHAR # freerdp
 	depends on BR2_INSTALL_LIBSTDCPP # freerdp
 	depends on BR2_PACKAGE_XORG7 # freerdp-server
 	select BR2_PACKAGE_FREERDP
@@ -101,10 +102,10 @@ config BR2_PACKAGE_WESTON_RDP
 	  /etc/freerdp/server/ so you may want to change them in a
 	  post-build script or a rootfs overlay.
 
-comment "RDP compositor needs a toolchain w/ wchar, C++, X.org"
+comment "RDP compositor needs a toolchain w/ C++, X.org"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_WESTON_HEADLESS
@@ -202,7 +203,6 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
-	depends on BR2_USE_WCHAR # pango
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_PANGO
@@ -221,11 +221,11 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	  Note: Weston has two sets of clients. See also the weston
 	  "simple clients" option.
 
-comment "demo clients needs an OpenGL ES/EGL provider and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "demo clients needs an OpenGL ES/EGL provider and a toolchain w/ threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
+		!BR2_PACKAGE_HAS_LIBGLES || \
 		!BR2_PACKAGE_HAS_LIBEGL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 endif
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 894e629b1a..ac73dbcf8a 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -28,6 +28,7 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qt5
 	depends on BR2_PACKAGE_HAS_UDEV # qt5 input
+	depends on BR2_ENABLE_LOCALE # qt5base -> fontconfig
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_FONTCONFIG # runtime
 	select BR2_PACKAGE_QT5BASE_PNG # runtime
@@ -39,8 +40,9 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	help
 	  Enable Qt5 GUI
 
-comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, host gcc >= 5.0, gcc >= 5.0"
+comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, locale, NPTL, host gcc >= 5.0, gcc >= 5.0"
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
diff --git a/package/wmenu/Config.in b/package/wmenu/Config.in
index ce9e70f9f8..a8e0a33d58 100644
--- a/package/wmenu/Config.in
+++ b/package/wmenu/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_WMENU
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_USE_WCHAR # libglib2, pango
+	depends on BR2_ENABLE_LOCALE # cairo -> fontconfig
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_LIBGLIB2
@@ -21,9 +22,10 @@ config BR2_PACKAGE_WMENU
 
 	  https://codeberg.org/adnano/wmenu
 
-comment "wmenu needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
+comment "wmenu needs a toolchain w/ wchar, locale, threads, C++, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 91de3868bb..0cc6c55efa 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -16,10 +16,11 @@ config BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "wpewebkit needs a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
+comment "wpewebkit needs a toolchain w/ C++, wchar, locale, NPTL, dynamic library, gcc >= 11, host gcc >= 7"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11 \
 		|| !BR2_HOST_GCC_AT_LEAST_7
@@ -37,6 +38,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_LIBEGL # wpebackend-fdo
diff --git a/package/x11r7/xapp_x11perf/Config.in b/package/x11r7/xapp_x11perf/Config.in
index 0f1eca8938..eb02375fe8 100644
--- a/package/x11r7/xapp_x11perf/Config.in
+++ b/package/x11r7/xapp_x11perf/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_XAPP_X11PERF
 	bool "x11perf"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	select BR2_PACKAGE_XLIB_LIBXFT
 	help
 	  summarize x11perf results
+
+comment "x11perf needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/x11r7/xapp_xclock/Config.in b/package/x11r7/xapp_xclock/Config.in
index 083a6d1e40..36113049a0 100644
--- a/package/x11r7/xapp_xclock/Config.in
+++ b/package/x11r7/xapp_xclock/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XCLOCK
 	bool "xclock"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXFT
@@ -7,3 +8,6 @@ config BR2_PACKAGE_XAPP_XCLOCK
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	help
 	  analog / digital clock for X
+
+comment "xclock needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/x11r7/xapp_xfd/Config.in b/package/x11r7/xapp_xfd/Config.in
index f006b1e488..1312501bde 100644
--- a/package/x11r7/xapp_xfd/Config.in
+++ b/package/x11r7/xapp_xfd/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_XAPP_XFD
 	bool "xfd"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXFT
 	help
 	  X.Org xfd application
+
+comment "xfd needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/x11r7/xapp_xlogo/Config.in b/package/x11r7/xapp_xlogo/Config.in
index aacb75ffb0..dc7a20ccf0 100644
--- a/package/x11r7/xapp_xlogo/Config.in
+++ b/package/x11r7/xapp_xlogo/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_XAPP_XLOGO
 	bool "xlogo"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXFT
 	help
 	  X Window System logo
+
+comment "xlogo needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/x11r7/xlib_libXft/Config.in b/package/x11r7/xlib_libXft/Config.in
index 84967a55e3..16261b485b 100644
--- a/package/x11r7/xlib_libXft/Config.in
+++ b/package/x11r7/xlib_libXft/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXFT
 	bool "libXft"
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -8,3 +9,6 @@ config BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org Xft library
+
+comment "libXft needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 89410f22bb..23f49ea7dd 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,6 +1,10 @@
+comment "xorg-server needs a toolchain w/ locale"
+	depends on !BR2_ENABLE_LOCALE
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_ENABLE_LOCALE # fontconfig
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 5763f12601..d4f59ed945 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
 	depends on BR2_USE_WCHAR # libgtk3, libglib2
+	depends on BR2_ENABLE_LOCALE # libgtk3 -> fontconfig
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libepoxy, libgtk3, libglib2
 	depends on BR2_USE_MMU # libgtk3, libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
@@ -31,7 +32,7 @@ config BR2_PACKAGE_XSCREENSAVER
 
 	  http://www.jwz.org/xscreensaver/
 
-comment "xscreensaver needs a toolchain w/ dynamic library, wchar, C++, threads, gcc >= 4.9, OpenGL backend"
+comment "xscreensaver needs a toolchain w/ dynamic library, wchar, locale, C++, threads, gcc >= 4.9, OpenGL backend"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
@@ -39,4 +40,5 @@ comment "xscreensaver needs a toolchain w/ dynamic library, wchar, C++, threads,
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		BR2_STATIC_LIBS || \
+		!BR2_ENABLE_LOCALE || \
 		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
