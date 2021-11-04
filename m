Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961FBC433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 18:00:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBB5B611EE
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 18:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBB5B611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B6A381A3B;
	Thu,  4 Nov 2021 18:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SECZKB7hbYPY; Thu,  4 Nov 2021 18:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D2FE81A24;
	Thu,  4 Nov 2021 18:00:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1941BF32B
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 18:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2A1981A24
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 18:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSBF4F-whBGc for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 18:00:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E42DE818B5
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636048845;
 bh=b8BoG0NzAdLUyci2YuiGbXBxsrcFyBtXu3nP0Q+LsB8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=PlLX+vc/H18nVDfrdgDLZFfshdVpMawN/ib79nD2P3FaVSpwcQqKbLDAc56sKzPDH
 00103wc9hPaH/p8/QtPRwq+Z6gvInVZr9BfCf7FuraypyqyW6yrcZ1AtHkPSJQczzi
 DhFH08UpNhG6sRkAfmufHb+hNPe0g6bvdmW27TgM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.39]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1n5Z5L4Boh-00MqQZ; Thu, 04
 Nov 2021 19:00:45 +0100
Date: Thu, 4 Nov 2021 19:00:43 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211104190043.568cfc81@gmx.net>
In-Reply-To: <20211026163222.3912644-1-fontaine.fabrice@gmail.com>
References: <20211026163222.3912644-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:1sn3EIWWqJ/H+rT10rleGTBQFr4718p28EupD7WNF8cx0rjGBqr
 ktaK5wawkHUJAPsMG8EZzeahElOn9VyE7DR2U3diNhEQtSxtmNSuJh3tmMoo+/furWsTAB/
 w9O3iLhEJ2bjJ65SnRCSdZR3McmYjcq9Zl13q+Cw0O+Y2y5WHGTruipOHK10Zp0g5W7c1PB
 dZwOjvDMCwKo16FdvFvwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BNBAxofZvD0=:uQYvijdzrMuwSeHAlpKZAD
 t96ju7QnwF1v3Ji8UHzCNu/K6IhWgXakUkbtevOYEXrzy+Qv+k4P0Kuq1/bXo1F8PFs9+1z4/
 hgE20qPx3CLLYzEbyFllWjKXgLfQ1QF7wqOgSBf7NIswO5fTgjUWhk/dEjhm9aKmpocHTPItV
 F8yTACEonkc992xElkApLEaZ5TGzg+l+0/my+Ud7vv3kfE3AeNhV2i+ovYvQHItEF8q2y+77I
 71iRRjdFyjgLeLuw/dM+o5vkoOMrLa8dmzP8pyHb56/ueM4zOr+p/4wFlJBzWGJ1yXV0lO2TB
 kDUtkDb0m0JSAT5eIjo7zQ/NULBxi+CChYW+VVipVvufPokNBOTgICJcVm5frURWoY1Ig/Oya
 x+ll0/C4VQffyPlVvSc8Si6iDmNP8dGoDMxjtEcoMarbOS0KJUTrQ5qoSTNHT5zl4YyoiNpEP
 pDFPBWsQioAYjnL9hnrbCB0ZNZGrrIxeLY38YaT9iCmmetY2wF9ShFZQ0I+08K//p+uypY0XM
 Ce6MYm5LsnEhcbmp8f24EguBFqgMXCNGhbDfM2qENWD7+TfgZTKF33puiEq0xjs2WBahAht7o
 6oQKIaNEcZo9ZkxssahCuC8J94BI224PKwjG8DGB95KiVk5m5JdJ40llsXdbPCf/VTvtje9mr
 gR9bxcfxPCoDr1AvXPjkO7MfVWjLfleUojbYOeFBcrEC8Ac2EU6aKm9bqD3+8NhIZe0rAgW8e
 0y0Ba0B9sfZCN3bXfJl4O9aZ2JPW0rXfkO4njhzNtPQIJV/TT57gxugXnAFKKOL/a9/x1EvpC
 xMXpL+AlOI3X7spcwd1+SI7YsdFmN+uW2eiB6etQmT37Mm1W657Tn44ZREMdgdQRVCccVP3Pd
 PBgxoKJJzif+0P9VFr8kwlzbEFjFd/QSw1en9xc6ePNbZQ240du3Vm//HNGm0DiIUUUzeXsCb
 UVjIUMqSM3Zx//yvoKW8BR3rL7+/BBFxQWQPURMuzjWp8q1s5XjE/ldlRsQzadBqkVcdHy53+
 HPkrvoPKOcAEhNOe4jmKJ9vs3gECCKbhNkatAoxKj1UeLEJQqyjuRyGMB8e1Mu/XyyrMdy22p
 eCI0W73FSXJd6o=
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/python-cryptography: add host-python-six dependency
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Tue, 26 Oct 2021 18:32:22 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the wrong assumption that six is not a dependency with python3 made
> in commit 95a63a34ac9204c4fe069154783bd97ed48c3ae2 to avoid the
> following build failure with ca-certificates:
>
> Traceback (most recent call last):
>   File "/home/buildroot/autobuild/instance-2/output-1/build/ca-certificates-20211016/mozilla/certdata2pem.py", line 31, in <module>
>     from cryptography import x509
>   File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/__init__.py", line 7, in <module>
>     from cryptography.x509 import certificate_transparency
>   File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/certificate_transparency.py", line 10, in <module>
>     import six
> ModuleNotFoundError: No module named 'six'
>
> Fixes:
>  - http://autobuild.buildroot.org/results/2b6872eec31362bf3edf88c69b67d681b2f016aa
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - Use host-python-six instead of host-python3-six
>
>  package/python-cryptography/python-cryptography.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index e21b9db042..acc21c1227 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -14,7 +14,7 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
>  PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
>  PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
>  HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
> -HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
> +HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-python-six host-openssl
>
>  $(eval $(python-package))
>  $(eval $(host-python-package))

Tested-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
