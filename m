From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Feb 2017 11:11:20 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-02-15
In-Reply-To: <20170216102154.4f896bea@free-electrons.com>
References: <20170216072900.AAE4920BC6@mail.free-electrons.com>
 <CALdGskKtWsQOyKehenpwZHyaMuYHQ600kiMr4w080DNYGRcBKQ@mail.gmail.com>
 <20170216102154.4f896bea@free-electrons.com>
Message-ID: <20170216111120.107a7a61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Feb 2017 10:21:54 +0100, Thomas Petazzoni wrote:

> commit a44d7f2dbb19a54a8f2beb5c0f0adb0680999319
> Author: Waldemar Brodkorb <wbx@openadk.org>
> Date:   Sun Dec 4 12:20:27 2016 +0100
> 
>     uclibc: update to 1.0.20
>     
>     The test suite is removed from the package and is already a separate
>     package in buildroot. All patches are upstream, so remove them.
>     The UCLIBC_HAS_LFS option is removed upstream.
>     
>     Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>     [Thomas: remove BR2_UCLIBC_INSTALL_TEST_SUITE option, add it to
>     Config.in.legacy.]
>     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Seems like the story is more complicated. I did a build of czmq right
before the uClibc bump to 1.0.20, and right after, and both builds were
successful.

Two options:

 - This commit is not the culprit.

 - My simple configuration with just czmq doesn't trigger the problem,
   and it's only czmq with some optional dependencies that triggers the
   problem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
