From: Pickett, Neale T <neale@lanl.gov>
Date: Fri, 17 Aug 2012 18:20:17 +0000
Subject: [Buildroot] Custom kernel with git
Message-ID: <8F452AD7563B864F966F95FF2A46BC37224084B4@ECS-EXG-P-MB03.win.lanl.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm having trouble getting the 2012.08-rc2 to build a custom kernel from git.  I had trouble with rc1 also.  What am I doing wrong?

crazyharry:/home/neale/src/buildroot-2012.08-rc2$ grep GIT .config
BR2_GIT="git clone"
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/lp0/linux.git"
BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="v3.4-rc5"
crazyharry:/home/neale/src/buildroot-2012.08-rc2$ make
.
.
.
>>> linux v3.4-rc5 Downloading
Too many arguments.

usage: git clone [options] [--] <repo> [<dir>]
.
.
.
--2012-08-17 11:04:57--  http://sources.buildroot.net//linux-v3.4-rc5.tar.gz
Resolving sources.buildroot.net... 176.9.16.109
Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2012-08-17 11:04:57 ERROR 404: Not Found.

make: *** [/home/neale/src/buildroot-2012.08-rc2/output/build/linux-v3.4-rc5/.stamp_downloaded] Error 1
