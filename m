From: Yury Luneff <bitterman@ya.ru>
Date: Thu, 25 Mar 2010 20:12:40 +0300
Subject: [Buildroot] external toolchain and sysroot
In-Reply-To: <hog24r$1nu$1@dough.gmane.org>
References: <1272730299.20100325182803@ya.ru> <hog24r$1nu$1@dough.gmane.org>
Message-ID: <93399903.20100325201240@ya.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> In the busybox .mk file, I found that TARGET_LDFLAGS wasn't being used
> (it wasn't being passed to the "make" command).  I had to patch the
> .mk file to pass the TARGET_LDFLAGS value to make.

>> It is definetely not the problem of package as openvpn doesn't find 
>> openssl too and the corresponding .so files are in staging. Or it is 
>> a bug in both uemacs and openvpn which is unprobable.

as for uemacs, its link command disregarded even CFLAGS, so I had to 
patch the makefile of uemacs. So I did the uemacs (just for fun, 
really, it's old like heaven and hell :-). Same problem, I guess. 
Shouldn't it be fixed project-wide? Documentations says that CT-NG is 
ok, but reality says something different.

As for openvpn, I guess the precise commands are common for autotools 
packages, so it is not quite so easy to find the right place to 
strike.

> It sounds like the .mk files are missing something.  See the following
> bugs for patches that show how I fixed missing --sysroot problems for
> busybox and mtd-utils:

Busybox is ok :(
