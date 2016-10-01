From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Oct 2016 00:11:44 +0200
Subject: [Buildroot] [PATCH 1/2] efivar: bump to version 28
In-Reply-To: <1475246804-26748-1-git-send-email-nunes.erico@gmail.com> (Erico
 Nunes's message of "Fri, 30 Sep 2016 16:46:43 +0200")
References: <1475246804-26748-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <87d1jjra73.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Erico" == Erico Nunes <nunes.erico@gmail.com> writes:

 > Upstream has changed version numbering scheme since version 25, which
 > came after version 0.24.

 > The two patches that we had in package/efivar/ were backports and so can
 > be dropped with this bump.

Then we should also update the comment about the patch in Config.in.

 > This new version also fixes the build failure with gcc 6.x, so:
 > Fixes:
 > http://autobuild.buildroot.net/results/ea6/ea6968d5d0fd0d8ee64e045e2aa56c8e8a0b7b14

A quick test build with a GCC 4.8.x based toolchain fails on access to
_Generic, which was only added in 4.9:

https://gcc.gnu.org/wiki/C11Status

So I've adjusted the toolchain dependencies for that.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
