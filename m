From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 30 Jul 2008 11:23:04 +1000
Subject: [Buildroot] Bash failing
In-Reply-To: <8bf7d05b0807291420n407ca0fn3fc4e01d43545ab7@mail.gmail.com>
References: <8bf7d05b0807260046q35afd439kf3d0a8b950dc5344@mail.gmail.com>
	<488D8691.6070904@cetrtapot.si>
	<8bf7d05b0807280413t58506a27jcfcf36ae301de559@mail.gmail.com>
	<488DC095.7000303@cetrtapot.si>
	<8bf7d05b0807280833x7cace636xa2b41176d306b6be@mail.gmail.com>
	<488EC7EF.4090203@cetrtapot.si>
	<8bf7d05b0807290449t58e05508yc8fe48edf12400a2@mail.gmail.com>
	<488F09C3.2090205@cetrtapot.si>
	<8bf7d05b0807291420n407ca0fn3fc4e01d43545ab7@mail.gmail.com>
Message-ID: <20080730012304.GA7254@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 29, 2008 at 10:20:18PM +0100, Jonathan and Caroline Moore wrote:
> Still no joy and it is all rather frustrating. Aren't these things
> meant to "work out of the box"? Are you able to send me the .config
> you have managed to get working and tell me the buildroot snapshot you
> used please?

> /opt/crosstool/gcc-4.1.0-glibc-2.3.2/arm-unknown-linux-gnu/lib/gcc/arm-unknown-linux-gnu/4.1.0/../../../../arm-unknown-linux-gnu/bin/ld:
> cannot find -lcurses

 $(BASH_DIR)/$(BASH_BINARY): $(BASH_DIR)/.configured
-       $(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(BASH_DIR)
+       $(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" CFLAGS="-I$(STAGING_DIR)/usr/include" -C $(BASH_DIR)

You probably also need an LDFLAGS="-L$(STAGING_DIR)/usr/lib" then.

As to working "out of the box", you'd probably have more luck if you
used the compiler that came out of the same box!


> make[3]: *** [info-recursive] Error 1

That's weird since no error was printed before that. Can you debug it?

> make[3]: Leaving directory
> `/home/jm/git/Arm.2410/buildroot/toolchain_build_arm/binutils-2.18-build/bfd'

Does this path imply you are using the unofficial buildroot Git
repository? Can you try the official svn?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
