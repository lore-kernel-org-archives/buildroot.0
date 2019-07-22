From: Gamble, Bradley <bradley.gamble@ncipher.com>
Date: Mon, 22 Jul 2019 13:10:59 +0000
Subject: [Buildroot] Patchelf: Execution error against host libraries
Message-ID: <1563801059238.32443@ncipher.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


I am currently attempting to perform a build using Buildroot 2019.05.1 targetting PowerPC. I am performing this build from within a Docker container based upon Debian.

When attempting a build within this container most steps will complete successfully until near "Finalizing target directory", when the build will fail. The output is as follows:


    >>>   Sanitizing RPATH in target tree
    /home/bgamble/buildroot-2019.05.1/support/scripts/fix-rpath target
    Error: can't execute patchelf utility '/home/bgamble/buildroot-2019.05.1/output/host/bin/patchelf'
    make[1]: *** [target-finalize] Error 1
    make: *** [_all] Error 2

Attempting to execute this binary indicates that it is expecting a newer version of libstdc++:


    $ ./output/host/bin/patchelf
    ./output/host/bin/patchelf: /usr/lib/libstdc++.so.6: version `GLIBCXX_3.4.20' not found (required by ./output/host/bin/patchelf)


The container I am using currently has version GLIBCXX_3.4.13, which we are required to use in order to maintain compatibility with additional software packages that we support.


Is it expected behaviour that this application should depend on a newer version of libstdc++ than is available on the current system? If so, is there a workaround to force compatibility with older versions of the library?


Regards,

bdg

________________________________

 [cid:image205928.PNG at e5d4a7c1.46a003c2] <http://www.ncipher.com>
Bradley Gamble
Software Engineer
Tel: +44 1293 580000


nCipher Security
Manor Royal
Crawley RH10 9HA
United Kingdom

www.ncipher.com<http://www.ncipher.com>

[cid:imagef00b1d.JPG at 915576c7.4a884da0]<https://www.ncipher.com/lp/2019/blackhat-usa>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190722/b4afac42/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image205928.PNG
Type: image/png
Size: 3675 bytes
Desc: image205928.PNG
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190722/b4afac42/attachment.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: imagef00b1d.JPG
Type: image/jpeg
Size: 46854 bytes
Desc: imagef00b1d.JPG
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190722/b4afac42/attachment.jpe>
