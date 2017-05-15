From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 11:45:13 +0200
Subject: [Buildroot] [PATCH] package/libubox: fix lua module install path
In-Reply-To: <20170506202610.19962-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 6 May 2017 22:26:10 +0200")
References: <20170506202610.19962-1-yann.morin.1998@free.fr>
Message-ID: <87d1balahi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The LUAPATH variable is only used when installing the lua module, and
 > cmake knows very well how to do out-of-tree isntalls, so there is no
 > reason to include the staging path in LUAPATH, which will cause our
 > post-install sanity checks to kick in and whine:

 >     libubox: installs files in /home/lhk/workspace/orangepi/host/usr/a
 >     rm-buildroot-linux-gnueabihf/sysroot//home/lhk/workspace/orangepi

 > As for libuci, just pass the runtime LUAPATH.

 > Fixes #9856

 > Reported-by: linhuikui at gmail.com
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
