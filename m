Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08AEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 08:58:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E615B611CE
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 08:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E615B611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2EE781ABB;
	Thu, 11 Nov 2021 08:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYUhGp32_iGm; Thu, 11 Nov 2021 08:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAADD81AA7;
	Thu, 11 Nov 2021 08:58:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F9801BF282
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 08:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E7D2606A3
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 08:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qQu03BZP01n for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 08:58:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A62E605BD
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 08:58:10 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 38FFB31E0728; Thu, 11 Nov 2021 09:58:07 +0100 (CET)
Date: Thu, 11 Nov 2021 09:58:07 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <YYzbH6nnjt5O7SxF@waldemar-brodkorb.de>
References: <20211025212541.12280-1-ps.report@gmx.net>
 <20211028230131.5f50d6e7@gmx.net>
 <YX3NuMeoXJyNSD8S@waldemar-brodkorb.de>
 <20211104213045.1d702c3d@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211104213045.1d702c3d@gmx.net>
X-Operating-System: Linux 5.10.0-9-amd64 x86_64
Subject: Re: [Buildroot] [uclibc-ng-devel] Re: [PATCH v1] package/ntpsec:
 new package
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
Reply-To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Cc: devel@uclibc-ng.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,
Peter Seiderer wrote,

> Hello Waldemar,
> 
> On Sun, 31 Oct 2021 00:56:56 +0200, Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > Hi Peter,
> > Peter Seiderer wrote,
> >
> > > Hello Waldemar, *,
> > >
> > > On Mon, 25 Oct 2021 23:25:41 +0200, Peter Seiderer <ps.report@gmx.net> wrote:
> > >
> > > The resulting ntpd runs fine with the raspberrypi3_defconfig, but segfaults
> > > when compiled/used with raspberrypi3_64_defconfig (uclibc, -Os):
> > >
> > > 	$ /usr/sbin/ntpd -n -d -g
> > > 1970-01-01T00:04:18 ntpd[263]: INIT: ntpd ntpsec-1.2.0 2021-10-24T13:39:21Z: Starting
> > > 1970-01-01T00:04:18 ntpd[263]: INIT: Command line: /usr/sbin/ntpd -n -d
> > > 1970-01-01T00:04:18 ntpd[263]: INIT: precision = 7.291 usec (-17)
> > > 1970-01-01T00:04:18 ntpd[263]: INIT: successfully locked into RAM
> > > 1970-01-01T00:04:18 ntpd[263]: CONFIG: readconfig: parsing file: /etc/ntp.conf
> > > 1970-01-01T00:04:18 ntpd[263]: CONFIG: restrict nopeer ignored
> > > 1970-01-01T00:04:18 ntpd[263]: INIT: Using SO_TIMESTAMPNS
> > > 1970-01-01T00:04:18 ntpd[263]: IO: Listen and drop on 0 v6wildcard [::]:123
> > > 1970-01-01T00:04:18 ntpd[263]: IO: Listen and drop on 1 v4wildcard 0.0.0.0:123
> > > 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 2 lo 127.0.0.1:123
> > > 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 3 eth0 172.16.0.30:123
> > > 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 4 lo [::1]:123
> > > 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 5 eth0 [fe80::ba27:ebff:fea6:340%2]:123
> > > 1970-01-01T00:04:18 ntpd[263]: IO: Listening on routing socket on fd #22 for interface updates
> > > 1970-01-01T00:04:19 ntpd[263]: SYNC: Found 10 servers, suggest minsane at least 3
> > > 1970-01-01T00:04:19 ntpd[263]: INIT: MRU 10922 entries, 13 hash bits, 65536 bytes
> > > 1970-01-01T00:04:20 ntpd[263]: DNS: dns_probe: 0.pool.ntp.org, cast_flags:8, flags:101
> > > Segmentation fault (core dumped)
> >
> > Could you add a small C test program to uClibc-ng-test to trigger
> > the bug? That would help to find any regression to targets without
> > TLS support.
> 
> Did take a first look at the uClibc-ng-test regarding the problem,
> there is already one test/inet/tst-res test...
> 
> 
> For the raspberrypi3_defconfig case (uclibc unpatched):
> 
> 	$ sh uclibcng-testrunner.sh
> [...]
> FAIL tst-ethers-line got 1 expected 0
> 	Cannot open file /etc/ethers: No such file or directory
> FAIL tst-ethers got 1 expected 0
> 	Either /etc/ethers is missing or it has incorrect contents
> [...]
> FAIL tst-cancel18 got 1 expected 0
> 	going to cancel in-time
> 	Timed out: killed the child process
> [...]
> FAIL tst-cancelx18 got 1 expected 0
> 	going to cancel in-time
> 	Timed out: killed the child process
> [...]
> Total skipped: 15
> Total failed: 4
> Total passed: 460
> 
> 
> 
> For the raspberrypi3_64_defconfig case (uclibc unpatched):
> 
> 	$ sh uclibcng-testrunner.sh
> [...]
> FAIL tst-ethers-line got 1 expected 0
> 	Cannot open file /etc/ethers: No such file or directory
> FAIL tst-ethers got 1 expected 0
> 	Either /etc/ethers is missing or it has incorrect contents
> [...]
> FAIL tst-res got 139 expected 0
> 	Segmentation fault (core dumped)
> [...]
> FAIL tst-seekdir got 1 expected 0
> 	.
> 	..
> 	tst-seekdir.out
> 	tst-utmpx
> 	tst-inotify
> 	tst-mkostemps.out
> 	seek.out
> 	tst-scandir
> 	tst-seekdir
> 	tst-statvfs.out
> 	sem
> 	stdarg.out
> 	fdopen.out
> 	tst-utmp
> 	tst-preadvwritev.out
> 	bug-glob2.out
> 	popen
> 	dirent64.out
> 	tst-scandir.out
> 	tst-hasmntopt.out
> 	tst-statvfs
> 	bug-glob2
> 	popen.out
> 	Makefile
> 	opendir-tst1
> 	sem.out
> 	tst-inotify.out
> 	tst-syscall0
> 	tst-statfs.out
> 	bug-readdir1
> 	dirent.out
> 	tst-statfs
> 	tst-syscall1.out
> 	tst-syscall0.out
> 	stdarg
> 	tst-preadvwritev
> 	tst-syscall6.out
> 	tst-mkostemps
> 	Makefile.in
> 	tst-utmp.out
> 	tst-nftw
> 	opendir-tst1.out
> 	tst-syscall1
> 	bug-readdir1.out
> 	tst-hasmntopt
> 	tst-syscall6
> 	fdopen
> 	seek
> 	tst-nftw.out
> 	dirent64
> 	tst-fnmatch.input
> 	tst-utmpx.out
> 	dirent
> 	going back past 4-th entry...
> 	seekdir (d, -1600443765); telldir (d) == -1
> [...]
> FAIL tst-cancel18 got 1 expected 0
> 	going to cancel in-time
> 	Timed out: killed the child process
> [...]
> FAIL tst-cancelx18 got 1 expected 0
> 	going to cancel in-time
> 	Timed out: killed the child process
> [...]
> FAIL tst-tls3 got 1 expected 0
> 
> 	/usr/lib/uclibc-ng-test/test/tls/tst-tls3: symbol 'baz': can't handle reloc type 0x404
> FAIL tst-tls4 got 1 expected 0
> 
> 	/usr/lib/uclibc-ng-test/test/tls/tst-tls4: symbol 'foo': can't handle reloc type 0x404
> FAIL tst-tls5 got 1 expected 0
> 
> 	/usr/lib/uclibc-ng-test/test/tls/tst-tls5: symbol 'foo': can't handle reloc type 0x404
> FAIL tst-tls6 got 1 expected 0
> 
> 	/usr/lib/uclibc-ng-test/test/tls/tst-tls6: symbol 'foo': can't handle reloc type 0x404
> FAIL tst-tls7 got 1 expected 0
> 
> 	/usr/lib/uclibc-ng-test/test/tls/tst-tls7: symbol 'foo': can't handle reloc type 0x404
> FAIL tst-tls8 got 1 expected 0
> 
> 	/usr/lib/uclibc-ng-test/test/tls/tst-tls8: symbol 'foo': can't handle reloc type 0x404
> [...]
> Total skipped: 15
> Total failed: 12
> Total passed: 454
> 
> 
> The tst-res Segmentation fault failure can be fixed by
> this additional uclibc patch:
> 
> --- a/include/resolv.h
> +++ b/include/resolv.h
> @@ -457,7 +457,7 @@ __END_DECLS
>  #    ifndef NOT_IN_libc
>  #     define __resp __libc_resp
>  #    endif
> -#    define _res (*__resp)
> +#    define _res (*__res_state())
>  extern __thread struct __res_state *__resp attribute_tls_model_ie;
>  #   endif
>  #  else
> 
> 
> Will take a look at some glibc resolv tests and try to port
> them (and, if I find enough time, at some of the other
> failures)...

Can you sent the two existing patches with your SoB Line added?

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
