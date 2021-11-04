Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C224C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:30:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCFFF61186
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCFFF61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9048081852;
	Thu,  4 Nov 2021 20:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YP8eLV3UipCp; Thu,  4 Nov 2021 20:30:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 342898186B;
	Thu,  4 Nov 2021 20:30:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CA8E1BF335
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F014E40114
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bahUTRoumG0O for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 20:30:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1564E401E7
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636057846;
 bh=ZrK3eTxJe910+Ml65w5C0snF/pY1zhuuPEZuagUrtnA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ibdPT3biomir+Fkxao+U88rd61tTjwxCZvJRBvfuZ5VE5TLqSyZAfRFCyuK90oPUr
 Swbd0BW70UokVqp9VmDlYRbCr6RpR2CPTJSebFWNQbhGLOpANO9lvr6+ArW3RvNjpW
 DlViRSkpzSYgprkdQrmxaFWtCDJX5gCHIY9lHF4I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.39]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M42nY-1mijNm153w-0004v7; Thu, 04
 Nov 2021 21:30:46 +0100
Date: Thu, 4 Nov 2021 21:30:45 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20211104213045.1d702c3d@gmx.net>
In-Reply-To: <YX3NuMeoXJyNSD8S@waldemar-brodkorb.de>
References: <20211025212541.12280-1-ps.report@gmx.net>
 <20211028230131.5f50d6e7@gmx.net>
 <YX3NuMeoXJyNSD8S@waldemar-brodkorb.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:qP515agaoefRua5fAdH5zRtNyoxcOVFMNxHsDfa4MXmWBHxJNeA
 E4Uxte+JPRK15BfIXq8aoInmOVvsOwYC+FDkTuC8QUkEnlW2/r9z4z/wXSMcy8LCQggqfuC
 2Gnt5Pji8p9k5Iq126BL4Lv/43deuGUQarYDPJa8JOiyeqlgIGBY1aiNkOW4Dwlp3JiB+tn
 Cm5qD+u6e3UiEXbP7Dxcw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ayrq2ujQfjY=:GYHZ16mxIC9Wzl8ZY2xRwl
 Jz6dvuK+f68VOpYsHipZIsP1w/Ag3cIl3MqnGS8R2FdycD6QtHZPFOQtM/VQtilE0emBegGea
 kHGA/CBFcB0EqHBquGCDOuRnpZjc4q/6X5gWEpchq5psjFa020aOj3VQ/I/7+kVWXkpKD+nsF
 msnTtJf1DoNNW2g37ohZZrgd3JWbs0ZlNTx5UL8i/pvg3gguc2xW/sBgHROXDaRMs2Yjb2TyR
 4+oMHGMrVQz9z0Alung9MOMKeNvN5Arngw29TroAMgWtPyESDlDi1WbsqMCs4swXdQrDKiFMl
 iN/vB3Z9OzZ8TQMgnqKlNDupPgPbyE0/6EHcR9m8jnGB2bjjZulkpgViSYenyZF38d2xRsIFh
 Ik/OyrhuxKRDsCxWs179NHMeeOLqOEmcKE2X79uwEPhuKviVFk3DWBjv/WvFmgyBhvXY9tgeE
 yYDsUx2XOE7xpc8NUxCF+MR6hL1/6NWqqL8KwnsbmriYx/nzGew4fnzMFxbgoyYNtCnHHZhx6
 /M1YIqM6yovLTlr84fZmJHw1rka+Mb37jOuYbHl4JuFQ+TNz8YwHCsZz2i3FkzJ2c1QSecOgQ
 MDawB+jKujtd0+bJco2riF3Vq/TlL+YHtoyBYKa5p5QPnVDwYGduutqEg+evd7W3HFN0sZ/Zv
 YH/Zoh8SYLJOf3sqXCy+jYXLwKSDTkjDRYc7WjtjryOMhk4xSaALiRvnSwc3bGXmjBqL3jb19
 D0mdWiK6PUl1jBDK1evEsxB8KMnz8t3nGHNBlGBm0/6oqfPuBIWgsFalwuBb1WC0D0ArPCUuZ
 qcTPRn0O6IE8AUxvXiEPU0LBIycZvyApZ7MCtT7fUETjjuO9wsytFPRu5YNw7XLwqr+Ae4pNr
 qxqlAUzNFPp/EfN7lLTVbBOZD45yq/+RoqXiWPThmXFykG22So7rlR0QrrUCsrluiFjvHQZCs
 ZvAJdhGezh6ajmpVY2znNU3DUI/ThklfZNVt+KrSV9luWmcTJiwQpiLQbpHaL9PergwqG1Y2v
 exSKheZaKHpnswphh24KWy5DNLY3Dy1mY1SDlT2L8Lkko6nl3Af8lF1Ah02eRhuY8BzTyUzaZ
 yx0HECLQxMfJ7w=
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
Cc: devel@uclibc-ng.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Waldemar,

On Sun, 31 Oct 2021 00:56:56 +0200, Waldemar Brodkorb <wbx@openadk.org> wrote:

> Hi Peter,
> Peter Seiderer wrote,
>
> > Hello Waldemar, *,
> >
> > On Mon, 25 Oct 2021 23:25:41 +0200, Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > The resulting ntpd runs fine with the raspberrypi3_defconfig, but segfaults
> > when compiled/used with raspberrypi3_64_defconfig (uclibc, -Os):
> >
> > 	$ /usr/sbin/ntpd -n -d -g
> > 1970-01-01T00:04:18 ntpd[263]: INIT: ntpd ntpsec-1.2.0 2021-10-24T13:39:21Z: Starting
> > 1970-01-01T00:04:18 ntpd[263]: INIT: Command line: /usr/sbin/ntpd -n -d
> > 1970-01-01T00:04:18 ntpd[263]: INIT: precision = 7.291 usec (-17)
> > 1970-01-01T00:04:18 ntpd[263]: INIT: successfully locked into RAM
> > 1970-01-01T00:04:18 ntpd[263]: CONFIG: readconfig: parsing file: /etc/ntp.conf
> > 1970-01-01T00:04:18 ntpd[263]: CONFIG: restrict nopeer ignored
> > 1970-01-01T00:04:18 ntpd[263]: INIT: Using SO_TIMESTAMPNS
> > 1970-01-01T00:04:18 ntpd[263]: IO: Listen and drop on 0 v6wildcard [::]:123
> > 1970-01-01T00:04:18 ntpd[263]: IO: Listen and drop on 1 v4wildcard 0.0.0.0:123
> > 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 2 lo 127.0.0.1:123
> > 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 3 eth0 172.16.0.30:123
> > 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 4 lo [::1]:123
> > 1970-01-01T00:04:18 ntpd[263]: IO: Listen normally on 5 eth0 [fe80::ba27:ebff:fea6:340%2]:123
> > 1970-01-01T00:04:18 ntpd[263]: IO: Listening on routing socket on fd #22 for interface updates
> > 1970-01-01T00:04:19 ntpd[263]: SYNC: Found 10 servers, suggest minsane at least 3
> > 1970-01-01T00:04:19 ntpd[263]: INIT: MRU 10922 entries, 13 hash bits, 65536 bytes
> > 1970-01-01T00:04:20 ntpd[263]: DNS: dns_probe: 0.pool.ntp.org, cast_flags:8, flags:101
> > Segmentation fault (core dumped)
>
> Could you add a small C test program to uClibc-ng-test to trigger
> the bug? That would help to find any regression to targets without
> TLS support.

Did take a first look at the uClibc-ng-test regarding the problem,
there is already one test/inet/tst-res test...


For the raspberrypi3_defconfig case (uclibc unpatched):

	$ sh uclibcng-testrunner.sh
[...]
FAIL tst-ethers-line got 1 expected 0
	Cannot open file /etc/ethers: No such file or directory
FAIL tst-ethers got 1 expected 0
	Either /etc/ethers is missing or it has incorrect contents
[...]
FAIL tst-cancel18 got 1 expected 0
	going to cancel in-time
	Timed out: killed the child process
[...]
FAIL tst-cancelx18 got 1 expected 0
	going to cancel in-time
	Timed out: killed the child process
[...]
Total skipped: 15
Total failed: 4
Total passed: 460



For the raspberrypi3_64_defconfig case (uclibc unpatched):

	$ sh uclibcng-testrunner.sh
[...]
FAIL tst-ethers-line got 1 expected 0
	Cannot open file /etc/ethers: No such file or directory
FAIL tst-ethers got 1 expected 0
	Either /etc/ethers is missing or it has incorrect contents
[...]
FAIL tst-res got 139 expected 0
	Segmentation fault (core dumped)
[...]
FAIL tst-seekdir got 1 expected 0
	.
	..
	tst-seekdir.out
	tst-utmpx
	tst-inotify
	tst-mkostemps.out
	seek.out
	tst-scandir
	tst-seekdir
	tst-statvfs.out
	sem
	stdarg.out
	fdopen.out
	tst-utmp
	tst-preadvwritev.out
	bug-glob2.out
	popen
	dirent64.out
	tst-scandir.out
	tst-hasmntopt.out
	tst-statvfs
	bug-glob2
	popen.out
	Makefile
	opendir-tst1
	sem.out
	tst-inotify.out
	tst-syscall0
	tst-statfs.out
	bug-readdir1
	dirent.out
	tst-statfs
	tst-syscall1.out
	tst-syscall0.out
	stdarg
	tst-preadvwritev
	tst-syscall6.out
	tst-mkostemps
	Makefile.in
	tst-utmp.out
	tst-nftw
	opendir-tst1.out
	tst-syscall1
	bug-readdir1.out
	tst-hasmntopt
	tst-syscall6
	fdopen
	seek
	tst-nftw.out
	dirent64
	tst-fnmatch.input
	tst-utmpx.out
	dirent
	going back past 4-th entry...
	seekdir (d, -1600443765); telldir (d) == -1
[...]
FAIL tst-cancel18 got 1 expected 0
	going to cancel in-time
	Timed out: killed the child process
[...]
FAIL tst-cancelx18 got 1 expected 0
	going to cancel in-time
	Timed out: killed the child process
[...]
FAIL tst-tls3 got 1 expected 0

	/usr/lib/uclibc-ng-test/test/tls/tst-tls3: symbol 'baz': can't handle reloc type 0x404
FAIL tst-tls4 got 1 expected 0

	/usr/lib/uclibc-ng-test/test/tls/tst-tls4: symbol 'foo': can't handle reloc type 0x404
FAIL tst-tls5 got 1 expected 0

	/usr/lib/uclibc-ng-test/test/tls/tst-tls5: symbol 'foo': can't handle reloc type 0x404
FAIL tst-tls6 got 1 expected 0

	/usr/lib/uclibc-ng-test/test/tls/tst-tls6: symbol 'foo': can't handle reloc type 0x404
FAIL tst-tls7 got 1 expected 0

	/usr/lib/uclibc-ng-test/test/tls/tst-tls7: symbol 'foo': can't handle reloc type 0x404
FAIL tst-tls8 got 1 expected 0

	/usr/lib/uclibc-ng-test/test/tls/tst-tls8: symbol 'foo': can't handle reloc type 0x404
[...]
Total skipped: 15
Total failed: 12
Total passed: 454


The tst-res Segmentation fault failure can be fixed by
this additional uclibc patch:

--- a/include/resolv.h
+++ b/include/resolv.h
@@ -457,7 +457,7 @@ __END_DECLS
 #    ifndef NOT_IN_libc
 #     define __resp __libc_resp
 #    endif
-#    define _res (*__resp)
+#    define _res (*__res_state())
 extern __thread struct __res_state *__resp attribute_tls_model_ie;
 #   endif
 #  else


Will take a look at some glibc resolv tests and try to port
them (and, if I find enough time, at some of the other
failures)...

Regards,
Peter

>
> best regards
>  Waldemar

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
