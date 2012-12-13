From: Richard Braun <rbraun@sceen.net>
Date: Thu, 13 Dec 2012 14:26:15 +0100
Subject: [Buildroot] Getting It into Compact Flash
In-Reply-To: <000b01cdd932$eb5179f0$c1f46dd0$@co.uk>
References: <000901cdd883$889a6e70$99cf4b50$@co.uk>
 <20121212162225.GA15887@mail.sceen.net>
 <20121212204922.GA1265@mail.sceen.net>
 <000301cdd91f$572b9520$0582bf60$@co.uk>
 <20121213113223.GA13939@mail.sceen.net>
 <000b01cdd932$eb5179f0$c1f46dd0$@co.uk>
Message-ID: <20121213132615.GA21579@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 13, 2012 at 01:08:16PM -0000, Ted Wood wrote:
> I went into linux-menuconfig and set up support for ext4 and ext3
> 
> 
> I can't find any way of enabling the generation of ext3/ext4  File System
> images.

Read carefully what I wrote please: disable ext2 and ext3, and enable
ext4 (CONFIG_EXT4_FS) and the option to use the ext4 driver for ext2 and
ext3 too (CONFIG_EXT4_USE_FOR_EXT23). There is currently no way to build
an ext3 or ext4 image (you need to use tune2fs with some magic to enable
the new features), but with the configuration I'm suggesting, you'll
have good support for every ext file system.

-- 
Richard Braun
