From: Christian Stewart <christian@paral.in>
Date: Fri, 22 Dec 2017 20:38:52 -0800
Subject: [Buildroot] systemd: blkid support requested but libraries not
 found
In-Reply-To: <20171220065038.yeyp6gimwldxpsal@sapphire.tkos.co.il>
References: <874lom2fy5.fsf@paral.in>
 <20171220053213.cmceyta4gjxryugi@sapphire.tkos.co.il>
 <87zi6e0wbi.fsf@paral.in> <87wp1h29gw.fsf@paral.in>
 <20171220065038.yeyp6gimwldxpsal@sapphire.tkos.co.il>
Message-ID: <878tduxdlv.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Baruch Siach <baruch@tkos.co.il> writes:
> Current BR2_PACKAGE_SYSTEMD selects BR2_PACKAGE_UTIL_LINUX_LIBBLKID 
> unconditionally as of commit f21cbabb2f21e. Is BR2_PACKAGE_UTIL_LINUX_LIBBLKID 
> selected in your full .config? If not, which version of Buildroot are you 
> using?

I went back after a day or so, and re-did the build:

 make clean
 make

.. and it passed, strangely enough, with the defconfig I gave you a
couple messages ago. Weird!

I try using my full .config, however, and the build fails:

>   CCLD     busctl
>   CCLD     systemd-socket-activate
> /lib/libpam.so: file not recognized: File format not recognized
> collect2: error: ld returned 1 exit status

This is the same error I reported in another thread -

 systemd: build failure against pam on arm

I'm still stuck, there. But that's another issue.

Thanks for the help.

Best,
Christian
