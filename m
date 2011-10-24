From: Rickard Lind <rille@tutus.se>
Date: Mon, 24 Oct 2011 13:18:57 +0200
Subject: [Buildroot] x86_64 and grub
Message-ID: <84EE5802-5412-4BE2-BF4B-DB29FDB7094B@tutus.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using buildroot-2011.08 with a x86_64 target to build an ext2 image and I would like to include grub, but building grub fails when linking for not finding libgcc. I think this is because grub wants to be built 32 bit (presumably something to do with booting) and gcc is only built with a 64 bit libgcc due to the --disable-multilib configure option. I tried to remove the --disable-multilib option but then the gcc build dies with "cannot find -lc" while building libgcc. I switched from the default gcc to the latest (4.6.1) but that made no difference. I could not find anything in the bugzilla; is there some workaround or should I file a bug? Or am I doing something wrong?

Regards, Rickard

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 1243 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111024/a3a51aec/attachment.p7s>
