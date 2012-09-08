From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 7 Sep 2012 21:46:55 -0400
Subject: [Buildroot] vsftpd fix (Build results for 2012-09-06)
Message-ID: <CANxTyt71aD4jYVSe7pQs0YW5bTAteW36RarzTEyHM-qAsELkoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I noticed this vsftpd break:

Build d37c36b54f6b4564831020cbf73ad91fdb5d735a

==============================================

Status         : NOK
Failure reason : vsftpd-2.3.5
Architecture   : i686
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-09-06 23:45:27
Git commit ID  :
http://git.buildroot.net/buildroot/commit/?id=2b595d6c923c197b8410470b663720e339682b70
End of log     :
http://autobuild.buildroot.net/results/d37c36b54f6b4564831020cbf73ad91fdb5d735a/build-end.log
Complete log   :
http://autobuild.buildroot.net/results/d37c36b54f6b4564831020cbf73ad91fdb5d735a/build.log.bz2
Configuration  :
http://autobuild.buildroot.net/results/d37c36b54f6b4564831020cbf73ad91fdb5d735a/config
Defconfig      :
http://autobuild.buildroot.net/results/d37c36b54f6b4564831020cbf73ad91fdb5d735a/defconfig

sysdeputil.o: In function `vsf_sysdep_check_auth':
sysdeputil.c:(.text+0x9c9): undefined reference to `pam_start'
sysdeputil.c:(.text+0x9f6): undefined reference to `pam_set_item'
sysdeputil.c:(.text+0xa0b): undefined reference to `pam_end'

....


This problem is fixed by a patch that was previously submitted:

http://lists.busybox.net/pipermail/buildroot/2012-August/057370.html
http://patchwork.ozlabs.org/patch/176787/

Apologies, I should have waited for the linux-pam patches to actually be
accepted before submitting the above, and the similar openssh patch
submitted at the same time:

http://patchwork.ozlabs.org/patch/176786/
http://lists.busybox.net/pipermail/buildroot/2012-August/057369.html

Regards,
Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120907/17bdd342/attachment.html>
