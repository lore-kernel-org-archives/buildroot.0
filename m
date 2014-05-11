From: Tal Zilcer <talz@ezchip.com>
Date: Sun, 11 May 2014 09:36:52 +0000
Subject: [Buildroot] ccache and uclibc build
Message-ID: <6D74E24018EBA548A6FC5B2CE98D10AB15A1CA@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Im using buildroot for a long time now,
and I noticed that when building uclibc (as a part of building the toolchain), buildroot doesn't use ccache for the "target compiler" objects for uclibc.
Is there a specific reason why it should not use ccache for build?
Is it because the compiler didn't finish building itself? (although the gcc binary does exists)
I added a patch to use ccache("CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" ) and it worked fine and much faster.
Does anybody knows why don't use ccache for this part of the build?

Thanks,
tal

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140511/aef31523/attachment.html>
