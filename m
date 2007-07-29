From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 29 Jul 2007 08:24:20 +0200
Subject: [Buildroot] [bug] util-linux
References: <0707281915430.10821@somehost>
Message-ID: <003c01c7d202$c2d25400$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Problem: building util-linux fails with umount.c: undefined reference to
> `xdr_string'
> 
> One of the reasons is BR2_INET_RPC was not priorly enabled.
> BR2_PACKAGE_UTIL-LINUX should depend on BR2_INET_RPC.
> If BR2_PACKAGE_UTIL-LINUX (and implicitly BR2_INET_RPC) is enabled when
> the buildroot is already built, uclibc (and all other packages depending
> on uclibc) should also be rebuilt. WCHAR is also in there somewhere...
> 

I guess one way would be to have a target which depends on ".config".
If triggered, 
    it will build grep ".config" for the uClibc configuration stuff ,
      into "toolchain_build_dir/.uClibc.configuration-new"
    diff with "toolchain_build_dir/.uClibc.configuration-new"
        if not same, then touch toolchain_build_dir/.uClibc.rebuild"


> Oh dear, this is going nowhere :(
> 
> Is there some sort of make target that will clean all that's built (and
> doesn't also clean my local modifications, dl-dir and stuff)?
> 
> 


Best Regards
Ulf Samuelsson
