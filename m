From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 6 Aug 2017 00:29:35 +0200
Subject: [Buildroot] [PATCH] uclibc: fix issue with gdb 8.0
In-Reply-To: <d8716f27-f8b8-b78b-71d3-59d6d5730153@gmail.com>
References: <20170805104858.GA31479@waldemar-brodkorb.de>
 <d8716f27-f8b8-b78b-71d3-59d6d5730153@gmail.com>
Message-ID: <20170805222935.GA7270@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Romain Naour wrote,

> Hi Waldemar,
> 
> Le 05/08/2017 ? 12:49, Waldemar Brodkorb a ?crit :
> > gdb 8.0 is now compiled and linked with C++, the thread_db
> > headers need to use extern "C", to be usable for C++ code.
> 
> I got the same issue with gdb-7.12.1.

Yeah, when --disable-build-with-cxx is _not_ used the problem
happens even for earlier versions. May be the commit message should
be adjusted before pushing.
 
> gdb build fine with this patch applied and the one from Thomas [1]
> 
> [1] http://patchwork.ozlabs.org/patch/797022/
> 
> Tested-by: Romain Naour <romain.naour@gmail.com>

Thanks for testing,
 Waldemar
