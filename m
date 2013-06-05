From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 05 Jun 2013 14:05:22 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-06-04
In-Reply-To: <20130605170058.GA3185@free.fr>
References: <20130605063004.4425352C13E@lolut.humanoidz.org>
 <20130605182924.71a07679@skate> <20130605170058.GA3185@free.fr>
Message-ID: <51AF6FD2.1090803@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/05/2013 02:00 PM, Yann E. MORIN wrote:

>> PowerPC does not have a.out.h. But mipsel also doesn't
>> (http://autobuild.buildroot.org/results/019/019091312ec547520370ffad967b53e23f54a14b/build-end.log),
>> libbsd doesn't have support for AArch64
>> (http://autobuild.buildroot.org/results/87c/87c3a8bf2248606d80ddcfd96132de4c5fe869ed/build-end.log).
>> And SH4 doesn't have a.out.h
>> (http://autobuild.buildroot.org/results/589/5891f539ce3f3ff2e3411228472c8833fdd0d7c0/build-end.log).
> 
> Mine! ;-)

Already tried guarding the a.out.h include with __NO_A_OUT_SUPPORT in
src/nlist.c, but that's not enough, it's using the N_EXT and other
defines from a.out.h
(to avoid going a path that's been walked before!)
Regards.
