Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC34C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 18:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DE964026D;
	Sun,  6 Aug 2023 18:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DE964026D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlPqRF2G33DZ; Sun,  6 Aug 2023 18:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4524D40276;
	Sun,  6 Aug 2023 18:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4524D40276
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDE3E1BF5A9
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 18:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30ABC4011C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 18:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30ABC4011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fs1Wr6uvDZWA for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 18:39:44 +0000 (UTC)
Received: from smtpcmd14173.aruba.it (smtpcmd14173.aruba.it [62.149.156.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCA6640471
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 18:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCA6640471
Received: from [10.10.6.40] ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SifFq6NiQXI7ySifFqGg3h; Sun, 06 Aug 2023 20:39:42 +0200
Message-ID: <1f870f14-4bc1-1f8d-aa4e-e9f3e32f7f3c@benettiengineering.com>
Date: Sun, 6 Aug 2023 20:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZM/aaG0d/pzoYgp1@waldemar-brodkorb.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <ZM/aaG0d/pzoYgp1@waldemar-brodkorb.de>
X-CMAE-Envelope: MS4xfMqqnO7pYWlhNEwyuvVspbPp89TPwniJKW6WTu3x8kLwjnQpA6GjzIqensp9HQNJfzi5kDSuRet+CFLz+nqN6eORq0dULYbtumQqSAlDRbagELVRkk0g
 akawTJSyuDFlkbQNayKx6lGSUBd0zGUPUBumVlfAlnv4kFcYBEcQbk8K7sVmOGnS14Li4P8zeGfxBCgzdFpDbbftQm451+KFO87d0FhhzhGUtgnQ0/S+hsxM
 6htwDeotJ8H84yS6Pa89Ug==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691347182; bh=z0h8pRVm97FvAZBck/bsYhpVx7Q3MCEucP8hZXzv/0w=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=MiOaSRJLKv4tqmmi8aU3sPugcQlGa/5rvQxdJ46DHfDLqxR6KGW4V2gBrFBnU51P7
 ITl95HBmCciM9t/mFtnDgbVTe/92YhzyFkW/yyYvyqcAi+OM5ld1/8MDDeQ2SvtVga
 aMg2awFO0w5thQ7cTe7ldOJSCnbD9dmoLJaF7W8NxvRRDk6UjwzPZ68R3cwxcDJeX0
 krmuQsVGtqXzIVhZSRLrc8SLkV8KFyrdfvbQM0Ydqjz4+NMrOxZthM2+4Hs9xIVq8E
 X/bCtfAcy5150tHUPFMQt9V8CZTQMqH0rnPjZ8oKLkpLDBS77xLyRHlOipR6qk72so
 Iu4/szvimx/RQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=MiOaSRJL
Subject: Re: [Buildroot] [PATCH] package/openssh: fix compile issue for m68k
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

On 06/08/23 19:37, Waldemar Brodkorb wrote:
> Following ICE occurs:
> (cd openbsd-compat && /home/autobuild/make/make)
> make[2]: Entering directory '/home/autobuild/autobuild/instance-10/output-1/build/openssh-9.3p1/openbsd-compat'
> /home/autobuild/autobuild/instance-10/output-1/host/bin/m68k-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -pipe -Wno-error=format-truncation -Wall -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -D_GNU_SOURCE -DHAVE_CONFIG_H -c bsd-asprintf.c
> /home/autobuild/autobuild/instance-10/output-1/host/bin/m68k-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -pipe -Wno-error=format-truncation -Wall -Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE -D_GNU_SOURCE -DHAVE_CONFIG_H -c bsd-closefrom.c
> during RTL pass: zero_call_used_regs
> bsd-closefrom.c: In function 'closefrom':
> bsd-closefrom.c:151:1: internal compiler error: in change_address_1, at emit-rtl.c:2275
>    151 | }
>        | ^
> 0x7fa76f4bad09 __libc_start_main
> 	../csu/libc-start.c:308
> Please submit a full bug report,
> with preprocessed source if appropriate.
> Please include the complete backtrace with any bug report.
> See <http://bugs.buildroot.net/> for instructions.
> make[2]: *** [Makefile:106: bsd-closefrom.o] Error 1
> 
> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870e728bcc7050563/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>   package/openssh/openssh.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index e14d752290..65f02088a0 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -35,6 +35,11 @@ define OPENSSH_PERMISSIONS
>   	/var/empty d 755 root root - - - - -
>   endef
>   
> +# workaround gcc ICE with 11.x/12.x and 13.x
> +ifeq ($(BR2_m68k),y)
> +OPENSSH_CONF_OPTS += --without-hardening
> +endif
> +

This deserves a gcc bug that I've added with this patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20230806183738.257006-1-giulio.benetti@benettiengineering.com/

this is the bug:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80786

and for consistency in Buildroot we tend to work-around gcc/binutils
bugs, whenever possible, by lowering the optimization to -O0, so I ask
you to send a patch doing this.
You can take as a model this commit for the commit log too:
https://gitlab.com/buildroot.org/buildroot/-/commit/803247337d35643afdca9718c4616500b9930f2d

Thank you
Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
