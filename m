Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4AAC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 07:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 426F560E8B;
	Thu, 10 Feb 2022 07:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Kz74a7nW7kl; Thu, 10 Feb 2022 07:56:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69BA460E86;
	Thu, 10 Feb 2022 07:56:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEA401BF340
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 07:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACF8E60E86
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 07:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-Jp05fCk6TJ for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 07:56:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F12660E82
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 07:56:39 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 9A8C62836C8;
 Thu, 10 Feb 2022 08:56:36 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 10 Feb 2022 07:56:36 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87zgmzw5ei.fsf@dell.be.48ers.dk>
References: <mailman.6747.1644442447.66748.buildroot@buildroot.org>
 <2378b58c9e724d2bb27ec019e165798e@umbiko.net>
 <87zgmzw5ei.fsf@dell.be.48ers.dk>
Message-ID: <0ae21fe17b6d8e56be3d19feb0480e3c@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 000/107] Drop python 2.7
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 2022-02-10 07:24, Peter Korsgaard wrote:
>>>>>> "Andreas" == Andreas Ziegler <br015@umbiko.net> writes:
> 
>  > Hi Yann,
>  > Hi Peter,
> 
>  > On 2022-02-09 21:34, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>  >> Peter ,All,
>  >>
>  >> On 2022-02-09 17:50 +0100, Peter Korsgaard spake thusly:
>  >>> Python 2.7 is EOL since April 2020 and almost all packages support
>  >>> python 3, so drop it before the 2022.02 release.
>  >>>
>  >>> It is a big series, but the changes are mainly mechanical in 
> nature.
>  >>>
>  >>> There is still some cleanup to do, E.G. the python2 support in
>  >>> pkg-python and the host python-setuptools package - But this is 
> IMHO
>  >>> the minimum changes before -rc1.
> 
>  > There seem to be some more references to python(2) in packages; this
>  > build failure is from package/crda:
> 
>  > # make clean && make
>  >   ...
>  > make[1]: *** No rule to make target 'host-python', needed by
>  >
> '/home/data/buildroot.x86_64/build/host-python-pycryptodomex-3.13.0/.stamp_configured'.
> Stop.
>  > make: *** [Makefile:23: _all] Error 2
> 
> Ahh yes, that is because we end up in package/pkg-python.mk with:
> 
> ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
> $(2)_DEPENDENCIES += $$(if 
> $$(BR2_PACKAGE_PYTHON3),host-python3,host-python)

Ah, this may be the reason I have two sets of host-python packages in my 
build tree :-D

> 
> And you (presumably) don't have python3 enabled. I'll send a fix.

Correct, I do not use Python on the target, but (at lest) one package 
insists on having host-python.

I'm currently testing by changing host-python to host-python3 in 
package/crda, and found another issue; this probably also needs a 
change:

[python3.mk]
# Some packages may have build scripts requiring python3, whatever is 
the
# python version chosen for the target.
# Only install the python symlink in the host tree if python3 is enabled
# for the target.
ifeq ($(BR2_PACKAGE_PYTHON3),y)
define HOST_PYTHON3_INSTALL_SYMLINK
	ln -fs python3 $(HOST_DIR)/bin/python
	ln -fs python3-config $(HOST_DIR)/bin/python-config
endef

Is there any need of keeping separate python3 packages, now that python 
== python3?

Kind regards,
Andreas

> --
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
