From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 10 Feb 2014 00:02:02 +0100
Subject: [Buildroot] custom kernel tarball does not use the path.
Message-ID: <20945F1C02CA42F18AD8B241C4EEE215@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  
Hi

In my config file I have the custom kernel path set to :

$(TOPDIR)/board/karo/linux-3.13.0-RC7.tar.bz2

But when building :

bzcat /home/johan/dl/linux-3.13.0-RC7.tar.bz2 | tar --strip-components=1 -C /home/buildroot12git/output/build/linux-custom  -xf -
bzcat: Can't open input file /home/johan/dl/linux-3.13.0-RC7.tar.bz2: No such file or directory.
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors

It looks like buildroot does not use the full path of the specified file.

Regards Johan
