Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39185C71153
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 19:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A454094C;
	Sun,  3 Sep 2023 19:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1A454094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8Q3OvZiqvCT; Sun,  3 Sep 2023 19:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E3640325;
	Sun,  3 Sep 2023 19:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9E3640325
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE46B1BF3C8
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 877A660EE4
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 877A660EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkk7xQTIlt9m for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 19:33:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79E6C60EDE
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 19:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79E6C60EDE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A80F20002;
 Sun,  3 Sep 2023 19:33:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qcsqL-0032Ez-CD; Sun, 03 Sep 2023 21:33:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230902221425.3577627-1-thomas.petazzoni@bootlin.com>
Date: Sun, 03 Sep 2023 21:33:09 +0200
In-Reply-To: <20230902221425.3577627-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 3 Sep 2023 00:14:24 +0200")
Message-ID: <87o7ijjbm2.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-pip: ignore CVE-2018-20225
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > See https://security-tracker.debian.org/tracker/CVE-2018-20225 for the
 > rationale of ignoring this CVE. Things basically work as intended.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  package/python-pip/python-pip.mk | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
 > index 35ad7bede2..040767930e 100644
 > --- a/package/python-pip/python-pip.mk
 > +++ b/package/python-pip/python-pip.mk
 > @@ -12,6 +12,9 @@ PYTHON_PIP_LICENSE = MIT
 >  PYTHON_PIP_LICENSE_FILES = LICENSE.txt
 >  PYTHON_PIP_CPE_ID_VENDOR = pypa
 >  PYTHON_PIP_CPE_ID_PRODUCT = pip
 > +# Disputed CVE: things work as designed, and only affects the
 > +# --extra-index-url option. This CVE will never be fixed.
 > +PYTHON_PIP_IGNORE_CVES += CVE-2018-20225

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
