From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 24 Sep 2008 15:46:35 +0200
Subject: [Buildroot] Standalone toolchain
In-Reply-To: <48DA3D47.5060204@cetrtapot.si>
References: <48DA3D47.5060204@cetrtapot.si>
Message-ID: <20080924134635.GA14882@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 24, 2008 at 03:14:47PM +0200, Hinko Kocevar wrote:
>Hi,
>
>Is it possible to create a toolchain and then transfer it to another machine or just another folder, and have it work?

This is supposed to work, yes. The keyword is sysroot support.
Either configure your BR2_STAGING_DIR to e.g. /opt/my-target-tripplet
or just move the staging dir wherever you want and use the proper
--sysroot and -isysroot.
>
>I've experienced the case where I only transferred staging_dir and put it somewhere and when I tried compiling some software compiler was lacking some header files. Creating absolute path link to newly created toolchain dir to point to staging_dir where it was taken from solved the problem..
