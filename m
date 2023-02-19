Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15481C61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 15:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9892681B53;
	Sun, 19 Feb 2023 15:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9892681B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d47JBGC3sPrl; Sun, 19 Feb 2023 15:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC0AC81B3E;
	Sun, 19 Feb 2023 15:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC0AC81B3E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16F581BF386
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 15:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4C32404A5
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 15:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4C32404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rO7NJhU3ydNI for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 15:00:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B23AC40AF0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B23AC40AF0
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 15:00:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp6-g21.free.fr (Postfix) with ESMTP id 6F9CA780380;
 Sun, 19 Feb 2023 16:00:24 +0100 (CET)
Received: from 37-174-20-96.coucou-networks.fr ([37.174.20.96])
 by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 19 Feb 2023 16:00:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <Y/Gk8rzGwX1O+vWa@debian.me>
References: <20230218101426.630874-1-bagasdotme@gmail.com>
 <20230218113939.526f0a76@windsurf>
 <96015d0268df72d3cdd58e7db09c1333@free.fr>
 <b5fef166-72c3-25ac-2427-e4255b68f2db@gmail.com>
 <1852709c493974b2588cc7c9c28bba7e@free.fr> <Y/Gk8rzGwX1O+vWa@debian.me>
Message-ID: <5bce31654ac7b25a0be6352770f90553@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676818824;
 bh=3sP/JwCP/a9mOqtBl+nOVhtd7wxLXtqp019BHY4Oatw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TGPpWJa+Sl6sZ68keN/sChKWTbwVJzkbLKNoc566m8wAVp0eDV5NUGx/xE1EAMLhI
 3y3WvLK0WTaWYDu2BldUApcKL5j2TC8w7SkdzhCNjK1vt+2NndTpzVJt6nnGcMz8hd
 7UopcNqzmGSX3FEsRfWInHTzsXZXXWbv5g970qdwV3h70a3Cipz6XCsfGKeW85JikD
 8j6B4Uuv7hubhTp4vGnsiajwkkYSQgsoOx2uriMkcaKx0vC2Mof1XMyNWtVmAKBMrR
 SZBZImn1HglQ50znIBxYYf+GnUk4BRtVMbnEWYvaSVgaJ1zgElwYscn1jSESYCI6KF
 xb8TZQG9kzxGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TGPpWJa+
Subject: Re: [Buildroot] Debugging gnupg2 unsafe search path error (was Re:
 [PATCH] Revert "package/gnupg2: bump to version 2.4.0")
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bagas,

On 19/02/2023 05:26, Bagas Sanjaya wrote:
> On Sat, Feb 18, 2023 at 06:40:35PM +0100, Julien Olivain wrote:
>> Thank you for testing.
>> 
>> I still can't reproduce the issue on my side.  Compilation works fine 
>> on my
>> system
>> (with and without a /usr/bin/gpgrt-config script), and also in the 
>> Buildroot
>> utils/docker-run (which does not include a /usr/bin/gpgrt-config 
>> script). My
>> system
>> has the same libgpg-error version 1.46 as Buildroot.
>> 
>> Could you tell me what is the distribution of your host system (or 
>> what is
>> the version
>> of the libgpg-error on the host)?  I'll try the same environment in a
>> docker.
>> 
>> Another way to force the gpgrt-config path without putting the full 
>> staging
>> usr bin
>> in the PATH (as Thomas recommended not to do) would be to add the 
>> following:
>> 
>>    GNUPG2_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
>> 
> 
> Hi Julien,
> 
> My setup is Debian 11.
> 
> For the host GnuPG, I compiled GnuPG 2.4.0 with libgpg-error 1.46. I
> source a script (gnupg-setup) to initialize the compiled version into 
> my
> ~/.bashrc.
> 
> The script is:
> 
> ---- >8 ----
> if ! (systemctl --user is-active -q dirmngr-local.socket); then
>     systemctl --user start
> {dirmngr,gpg-agent,gpg-agent-ssh,gpg-agent-browser,gpg-agent-extra}-local.socket
> fi
> 
> export PATH=$HOME/.local/gnupg/bin:$PATH
> 
> The actual .socket unit files are copied from GnuPG sources but I add
> Conflicts= against corresponding system-provided socket units.
> 
> For your suggestion above, the build successed only when the 
> initialization
> script above isn't sourced. However, when the script is sourced, the 
> build
> search for host version of libraries instead (and thus FTBFS).

Thanks for the tests and feedback.  I am now able to reproduce the issue
by installing the libgpg-error-dev package in the Buildroot Docker image
(which also happen to be a Debian 11).

I'll send my patch proposal to fix autobuild failures.

Right now, I don't see why your sourced file would prevent this fix to 
work.
Is it possible the same issue happen in other gnupg2 friend packages?
(such as libassuan, libgcrypt, libksba, ...) which I believe are all 
using
the AM_PATH_GPG_ERROR() macro from libgpg-error gpg-error.m4.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
