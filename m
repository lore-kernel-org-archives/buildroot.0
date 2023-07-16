Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1938EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 07:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18F1B408FC;
	Sun, 16 Jul 2023 07:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18F1B408FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYyulNu7t7DG; Sun, 16 Jul 2023 07:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C27414090D;
	Sun, 16 Jul 2023 07:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C27414090D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 638BF1BF2CC
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 07:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BA88408AF
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 07:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BA88408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUOWRG_54d0j for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 07:28:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CBD340508
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CBD340508
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 07:28:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 670C1A4C0285
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:28:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32934)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKwBG-0004D7-0O
 for buildroot@buildroot.org; Sun, 16 Jul 2023 09:28:34 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 09:28:33 +0200
Message-Id: <20230716072833.2117113-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689492514;
 bh=fqNw+lM+umBWxL/dUUWfVzDy2rob4K67Jwxfz9F/1hc=;
 h=From:To:Subject:Date:From;
 b=lpo+H1P5Jb3XWRmItGVTSw3IfdGOp/BadCwhlmt1lLsJM1ZWmEV83X/QGD+ODJnrx
 Z6BqqN55XdvNl+LZhk8pWpgK4yvI7FNILr+eMpYvaC0X7X81OG64msnmxONDjKlVec
 YkwMUuWN+0dKBO3y/wZF4PxNJNSIqjKCX3ST4h5PTaV71kr9jx2OtzWr5/QyXLuWPT
 ip87O650vaHhs/bTV/Ux6kR3+laTRHj5QrXwG2swFFOtKyw3Cx/zt0rCNAG6guKSg3
 XNQqnrnh1KEAB9y0qPLdH7B6g+t67cBB2JFI16j9BQG4nml1Zjqy6fYxfMlu9O10g8
 YbI+BlMMWUnwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=lpo+H1P5
Subject: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
 require IPC::Cmd perl package for libopenssl
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

Fixes:
http://autobuild.buildroot.net/results/b85/b85b64162b3889d96c713030b46401e3e0a9a4e2/
http://autobuild.buildroot.net/results/fea/fea92e9c2a87a317675a7d0610c2ee467a373b69/

Since the bump to 3.0.9 with buildroot commit
3c66f65a6a549930870f2c0d98abb5ca9321d2a5 the configure script of
(host-)libopenssl needs the FindBin perl module on the host:

Can't locate IPC/Cmd.pm in @INC (you may need to install the IPC::Cmd
module) (@INC contains: /home/buildroot/autobuild/instance-1/output-1/
build/host-libopenssl-3.0.9/util/perl /home/buildroot/autobuild/instance
-1/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/
perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl
/usr/lib64/perl5 /usr/share/perl5 /home/buildroot/autobuild/instance-1/
output-1/build/host-libopenssl-3.0.9/external/perl/Text-Template-1.56/
lib) at /home/buildroot/autobuild/instance-1/output-1/build/host-lib
openssl-3.0.9/util/perl/OpenSSL/config.pm line 19.
BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance
-1/output-1/build/host-libopenssl-3.0.9/util/perl/OpenSSL/config.pm line
19.

As this is needed for both libopenssl and host-libopenssl (which does not
have a corresponding config symbol in the .config), we have to require it
unconditionally.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 support/dependencies/dependencies.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 58f44c8723..6e7d067ccd 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -280,6 +280,7 @@ required_perl_modules="$required_perl_modules English" # Used by host-libxml-par
 required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by host-libxml-parser-perl
 required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
 required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
+required_perl_modules="$required_perl_modules IPC::Cmd" # Used by (host-)libopenssl
 
 if grep -q ^BR2_PACKAGE_MOSH=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules diagnostics"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
