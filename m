From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 16:05:28 +0100
Subject: [Buildroot] [PATCH v2 1/1] board: add support for RIoTboard
In-Reply-To: <54F86F27.7070806@mail.bg>
References: <1425565907-26222-1-git-send-email-picmaster@mail.bg>
 <20150305153739.6ae1bbf0@free-electrons.com>
 <54F86F27.7070806@mail.bg>
Message-ID: <20150305160528.1591f186@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nikolay Dimitrov,

On Thu, 05 Mar 2015 16:58:47 +0200, Nikolay Dimitrov wrote:

> Not really. Now as you're asking, I found that I'm doing this by habit
> (probably inherited by some weird ARM board boot-requirements in the
> past).

Yes, some boards/bootloader configuration have the limitation that the
first partition must be a FAT partition. In this case, it definitely
makes sense to have two partitions, since a Linux root filesystem can
hardly be stored in a FAT filesystem.

> Would you prefer me to re-send the patch with instructions only for
> single partition layout?

Well, in the situation of this board, where the bootloader is stored
raw and is capable of reading an ext2 filesystem, yes I believe a
single partition makes more sense.

You can ask Buildroot to install the uImage and DTB to /boot in the
root filesystem. However, for the extlinux.config file, you'll have to
add a post-build script to do this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
