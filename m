Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAE5C636CC
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 15:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C741841B83;
	Sat, 18 Feb 2023 15:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C741841B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftfmk4fDIGQt; Sat, 18 Feb 2023 15:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABBA841B91;
	Sat, 18 Feb 2023 15:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABBA841B91
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF4F31BF3EC
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 15:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9C794048C
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 15:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9C794048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNCvACLnEPix for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 15:32:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BF28400F2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BF28400F2
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 15:32:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 308225FFC6;
 Sat, 18 Feb 2023 16:32:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Feb 2023 16:32:16 +0100
Date: Sat, 18 Feb 2023 16:32:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230218153216.GD2718518@scaer>
References: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
 <20230218121940.7442410e@windsurf>
 <CADYjeSuzT5ueq5F5SQvib87d1HCKXLj565mW-Rm91N7Na1KrDQ@mail.gmail.com>
 <20230218141937.60c307f7@windsurf> <20230218142115.GC2718518@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230218142115.GC2718518@scaer>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676734340;
 bh=f9bNII5/Dqsu4IGK/iFl0u+fdqGcNP5NiHotQCYzOCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iKt9jcqT1ZgN+mJ0YBbVH0BojPjcdRxu3UxOxxW2kOa8ugWnBn8+C69ZDtJoEL1dL
 1TYwDZ8lyDMoV1f7r7OvtDS3CzYDivzS4mGQxWRWlytTv+kM8YRN84UTz+dG0Uk102
 o8rrke8Ss/mqH9+V0F8oQ8MnSFz5tS4qphMhglAmtyTYXkx2nBx6G6LCUaOlUUZeFC
 o14RnWIUIwIHwnNMbZc8USbVD8M11lv5VmUuDRhVWbg8r3Ysk4StONlufB7aTN0Njc
 JVRui8v1yLlEbOCxQMy7qe6JxjWSyj7AdlDoR62dvCrslvzw58f+p0xQiemmCJ7T9W
 Rn6Mpxw5nxhEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iKt9jcqT
Subject: Re: [Buildroot] Updating trust store using update-ca-certificates
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
Cc: Sourabh Hegde <hrsourabh011@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Sourabh, All,

On 2023-02-18 15:21 +0100, Yann E. MORIN spake thusly:
> On 2023-02-18 14:19 +0100, Thomas Petazzoni via buildroot spake thusly:
> > On Sat, 18 Feb 2023 13:54:15 +0100
> > Sourabh Hegde <hrsourabh011@gmail.com> wrote:
> > > I was thinking the ca-certificates package will take care of this. Maybe I
> > > was wrong.
> > > So, how should we add local CA to the trust store in the target?
> > I am not sure as I'm not super familiar with that aspect. If what you
> > need to do is to call update-ca-certificates during the build, then we
> > could potentially build it for the host, and run it as a post-build
> > script. Of course, this assumes update-ca-certificates is capable of
> > doing its work on a root filesystem that isn't at the root.

No, update-ca-certificates does not know how to work out-of-tree, which
is the reason why we already need to handle it manually when we install
ca-certificates.

Also, we do remove update-ca-certificates on purpose from TARGET_DIR,
because it is not expected that we need/can regenerate the root bundle
on the target.

> > Do you have more details about what needs to be done? With more
> > details, we could probably give some more useful hints.
> 
> I think we just need to split CA_CERTIFICATES_INSTALL_TARGET_CMDS in two:
> one part to actually instll the certifcates provided by ca-certificates
> itself, and the rest to update the castore with all certificate, as a
> target-finalize hook.
> 
> I.e. all that starts from "Remove any existing certificates under
> /etc/ssl/certs" should be moved to a target-finalize hook.

Basically, something around those lines (totally untested):

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 0b6962ab7b..cc55d39957 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -20,7 +20,9 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
 	rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
+endef
 
+define CA_CERTIFICATES_GEN_BUNDLE
 	# Remove any existing certificates under /etc/ssl/certs
 	rm -f $(TARGET_DIR)/etc/ssl/certs/*
 
@@ -30,14 +32,15 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	for i in `find usr/share/ca-certificates -name "*.crt" | LC_COLLATE=C sort` ; do \
 		ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem ;\
 		cat $$i ;\
-	done >$(@D)/ca-certificates.crt
+	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
 	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
-	$(INSTALL) -D -m 644 $(@D)/ca-certificates.crt \
+	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
 		$(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt
 endef
+CA_CERTIFICATES_TARGET_FINALIZE_HOOKS += CA_CERTIFICATES_GEN_BUNDLE
 
 $(eval $(generic-package))

Sourabh, can you test and adapt that and report, please?

Regards,
Yann E. MORIN.

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
