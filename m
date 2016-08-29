From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 09:03:53 +0200
Subject: [Buildroot] [PATCH 2/2] package/sconeserver: needs shared libs
	or non uClibc toolchain
In-Reply-To: <20160828221524.GF5758@free.fr> (Yann E. MORIN's message of "Mon, 
 29 Aug 2016 00:15:24 +0200")
References: <1472408394-20573-1-git-send-email-yann.morin.1998@free.fr>
 <1472408394-20573-2-git-send-email-yann.morin.1998@free.fr>
 <87wpj07dga.fsf@dell.be.48ers.dk> <20160828221524.GF5758@free.fr>
Message-ID: <87k2f06opy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 >> Ehh, this I don't get. Why not simply depend on !BR2_STATIC_LIBS like we
 >> do for other users of dlfcn.h?
 >> 
 >> If BR2_STATIC_LIBS is enabled then there won't be any .so files in the
 >> target rootfs, so even if the C library has dlopen support it won't
 >> work.

 > Not necessarily true.

 > One can use dlopen() to load "addons" even from a staticaly linked
 > executable.

Generally speaking, yes - But not in Buildroot. We have a single global
BR2_STATIC_LIBS setting, so it is all or nothing.

 > However, I don't care about sconeserver; I was just looking at build
 > failures and trying to make it the least broken as possible.

 > If you're fine with making it depend on non static-only and drop the
 > uclibc condition, that's fine with me. ;-)

Ok, I'll adjust the patch and commit message and apply, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
