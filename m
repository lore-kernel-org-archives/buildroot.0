From: Charles Manning <cdhmanning@gmail.com>
Date: Mon, 10 Dec 2012 16:11:34 +1300
Subject: [Buildroot] Alternate sources for custom Linux kernels
Message-ID: <CAE21AQogKvT+PpiXuy62-rkRKkT5N0pQF9n=qywuYZQWfbuhuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello root builders

I am working on a project that stores everything, including a custom
Linux kernel, under svn rather than git. Yes... I know, i know....
we'll leave that discussion for another day!

I also sometimes need to point to a kernel in a local directory.


It seams that the place to modify is linux/linux.mk ( and
linux/Config.in to create new configs to match).

It seems there are two ways of approaching this:

1) Create a whole lot of new defines parallel to the existing *GIT*
defines eg. BR2_LINUX_KERNEL_CUSTOM_SVN_REPO_URL
-or-
2) Rationalize the existing stuff into
BR2_LINUX_KERNEL_CUSTOM_SITE (can be anything from svn, http,...)
and
BR2_LINUX_KERNEL_CUSTOM_METHOD (selects one of the legal
xxx_SITE_METHODs [wget, scp,svn...]

It would seem that (2) gives something far more flexible and less verbose.

Does this sound useful?

-- Charles
