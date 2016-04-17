From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Apr 2016 22:00:56 +0200
Subject: [Buildroot] [PATCH v3 2/4] board/minnowboard: Unify Minnowboard
	and Minnowboard MAX boards
In-Reply-To: <1460820203-6080-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Sat, 16 Apr 2016 12:23:21 -0300")
References: <1460820203-6080-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460820203-6080-3-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <87a8ksf1jb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > Given Minnowboard and Minnowboard MAX boards are very similar,
 > it's desirable to unify the support for them.

 > This commit does the following:

 >   1) Remove Minnowboard MAX's genimage.cfg, post-build.sh
 >      and post-image.sh. These are identical to Minnowboard's.

 >   2) Move Minnowboard MAX's linux config, and rename it.

 >      It would be lovely to have a single kernel config file.
 >      The kernel size penalty involved in adding support for
 >      all the peripherals on both boards is small enough to
 >      justify this.

 >      However, the original Minnowboard has some GPIO buttons
 >      that need to be registered by the kernel. This is not
 >      upstreamed, and hence we need to use the yocto v3.8 kernel
 >      to have this support.

 >   3) Rename each grub config to grub-{board}.cfg.

 >   4) Modify (the now unique) post-build script to use
 >      a different grub config, according to the board.

 >   5) Update both defconfigs, as per the above changes.

 >   6) Finally, update the readme.txt.

 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > --
 > Changes from v1:

 >   * New patch, not present in v1.

> +++ b/board/minnowboard/readme.txt
 > @@ -7,6 +7,10 @@ How to get started with the MinnowBoard
 
 >    $ make minnowboard_defconfig
 
 > +  Or, for the Minnowboard MAX board:
 > +
 > +  $ make minnowboard_max_defconfig
 > +

I've adjusted the title to make it clear this also applies to the MAX
and committed, thanks.

-- 
Bye, Peter Korsgaard
