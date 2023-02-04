Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4E7C636CC
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 20:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 288CE813A2;
	Sat,  4 Feb 2023 20:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 288CE813A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aaWjlYkyT6FW; Sat,  4 Feb 2023 20:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E8B812DE;
	Sat,  4 Feb 2023 20:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66E8B812DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 460301BF408
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 20:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2936A81F89
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 20:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2936A81F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id thy-WdW19Ozn for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 20:40:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4C0681F87
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4C0681F87
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 20:40:53 +0000 (UTC)
Received: from [192.168.50.169] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id OPL8phBnkNDg8OPL8pjYnT; Sat, 04 Feb 2023 21:40:51 +0100
Message-ID: <a27c816c-cd9f-9c44-fd0a-3904ea83970e@benettiengineering.com>
Date: Sat, 4 Feb 2023 21:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <20230131153608.434059-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230131153608.434059-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfIST/koqcasy3zzLlaZGh6wHlsAlSDieSX7OntQProFnuWnb3ATUn2aOW/g/Dt0Dm/pbnT3zlbnN2kDnU7eGlDj7+datZ/4xgnNz0tK44aKkucmc404V
 5NsQLkZoWCdlCuUMZWmFOK3903JTt8QjZYgGDU5UYcetOx2F5uO68hXMeOlVpPahIUy/JqYSCpdlZBj3vPFUd4kprOOGufN3WHs4+J9Rrgi2QWmCpva072Jy
 jOekbMaryXUq8cHM6FjWaQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675543251; bh=7Rvg3i8WSSFxU0RUxahKAN5TBmLwO77taPkiJztDbgw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ISKG3NztSFXfzEinYyL1Nn8WVaPQG6qg9jlyDJRfIg1asWcCvnUjubMmrLfBo5hlI
 /5yqc26Ib6oYBaz2FzyoYLbgmSdjGq1RxLSNbqGZudu6mvVP1nB1+HRGxWbgY+Q5HM
 S1LCmAtuLnpcQk9mOfypqUiMpHAAwgHJvT7al8WRu8pYikXWiklpbdqHFeu0HlterX
 EIibgXynP2tedlttVN7seOtpnXn53E8xmrENxFE2za0L/VyYFS7TV6iiimQtg9cP3E
 eHOvCu810Ge/mMJnCGaDBWEWzJjYMXpqrF4kZ6ssrlpFcqqEFLWtnVgFnywrH89qBd
 k3WHNIIo9yKpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ISKG3Nzt
Subject: Re: [Buildroot] [PATCH] package/libfuse3: fix build failure due to
 missing __off64_t in musl
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is superseded by this one:
https://patchwork.ozlabs.org/project/buildroot/patch/20230204203750.513283-1-giulio.benetti@benettiengineering.com/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 31/01/23 16:36, Giulio Benetti wrote:
> Add upstream patch[0] that substitute __off64_t with off64_t that is
> present in glibc, uclibc and musl.
> 
> [0]: https://github.com/libfuse/libfuse/commit/19d95c0e701076407dc1f3cfd39e12e28b332927
> 
> Fixes:
> http://autobuild.buildroot.net/results/a98/a984d275d949e8dc989870d2d2b6f6c7168d52bb/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   .../0001-use-off_t-over-__off64_t.patch       | 56 +++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 package/libfuse3/0001-use-off_t-over-__off64_t.patch
> 
> diff --git a/package/libfuse3/0001-use-off_t-over-__off64_t.patch b/package/libfuse3/0001-use-off_t-over-__off64_t.patch
> new file mode 100644
> index 0000000000..ce29ba0f44
> --- /dev/null
> +++ b/package/libfuse3/0001-use-off_t-over-__off64_t.patch
> @@ -0,0 +1,56 @@
> +From 19d95c0e701076407dc1f3cfd39e12e28b332927 Mon Sep 17 00:00:00 2001
> +From: psykose <alice@ayaya.dev>
> +Date: Sat, 14 Jan 2023 21:31:56 +0000
> +Subject: [PATCH] use off_t over __off64_t
> +
> +when -D_FILE_OFFSET_BITS=64 is defined, the off_t type is 64 bits wide
> +already. the fuse_common.h header already checks for this, and errors
> +when it is not, so be consistent with all the other uses of off_t.
> +
> +some libcs like musl do not have a 32-bit off_t type, and don't define
> +__off64_t.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + example/hello_ll_uds.c  | 4 ++--
> + include/fuse_lowlevel.h | 8 ++++----
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/example/hello_ll_uds.c b/example/hello_ll_uds.c
> +index c1f64d7..f291fed 100644
> +--- a/example/hello_ll_uds.c
> ++++ b/example/hello_ll_uds.c
> +@@ -277,8 +277,8 @@ static ssize_t stream_read(int fd, void *buf, size_t buf_len, void *userdata) {
> +     return  (res == -1) ? res : (res + prev_res);
> + }
> +
> +-static ssize_t stream_splice_send(int fdin, __off64_t *offin, int fdout,
> +-					    __off64_t *offout, size_t len,
> ++static ssize_t stream_splice_send(int fdin, off_t *offin, int fdout,
> ++					    off_t *offout, size_t len,
> +                                   unsigned int flags, void *userdata) {
> + 	(void)userdata;
> +
> +diff --git a/include/fuse_lowlevel.h b/include/fuse_lowlevel.h
> +index ff0d966..96088d7 100644
> +--- a/include/fuse_lowlevel.h
> ++++ b/include/fuse_lowlevel.h
> +@@ -130,11 +130,11 @@ struct fuse_forget_data {
> + struct fuse_custom_io {
> + 	ssize_t (*writev)(int fd, struct iovec *iov, int count, void *userdata);
> + 	ssize_t (*read)(int fd, void *buf, size_t buf_len, void *userdata);
> +-	ssize_t (*splice_receive)(int fdin, __off64_t *offin, int fdout,
> +-					  __off64_t *offout, size_t len,
> ++	ssize_t (*splice_receive)(int fdin, off_t *offin, int fdout,
> ++					  off_t *offout, size_t len,
> + 				  	  unsigned int flags, void *userdata);
> +-	ssize_t (*splice_send)(int fdin, __off64_t *offin, int fdout,
> +-				     __off64_t *offout, size_t len,
> ++	ssize_t (*splice_send)(int fdin, off_t *offin, int fdout,
> ++				     off_t *offout, size_t len,
> + 			           unsigned int flags, void *userdata);
> + };
> +
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
