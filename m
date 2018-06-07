From: qlb1234 <qlb1234@gmail.com>
Date: Thu, 7 Jun 2018 14:37:50 +0800
Subject: [Buildroot] Can we still opt to shallow clone in git?
Message-ID: <CABKM0pCD6pJ3-o9OyhGfpkRyk4cVsKhc+AwqojkzzRvnJvvUSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

It looks like this commit on Apr. 2 changed from shallow clone to full
clone.
https://git.busybox.net/buildroot/commit/?h=2018.05.x&id=6d938bcb524987f3e4a56fc311692ba9127417d9

I didn't have an issue with 2018.02. I was hosting the kernel repo myself.
I updated to 2018.05 yesterday and saw this error message when the kernel
was being built.



>>> linux master Downloading
PATH="/home/wesley/myproject/buildroot/buildroot/buildroot-2018.05/output/host/bin:/home/wesley/myproject/buildroot/buildroot/buildroot-2018.05/output/host/sbin:/usr/x86_64-pc-linux-gnu/gcc-bin/6.4.0:/usr/lib/llvm/5/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin"
BR2_DL_DIR="/home/wesley/myproject/buildroot/buildroot/buildroot-2018.05/dl"
BUILD_DIR=/home/wesley/myproject/buildroot/buildroot/buildroot-2018.05/output/build
O=/home/wesley/myproject/buildroot/buildroot/buildroot-2018.05/output flock
/home/wesley/myproject/buildroot/buildroot/buildroot-2018.05/dl/linux/
support/download/dl-wrapper -c 'master' -d
'/home/wesley/myproject/buildroot/buildroot/buildroot-2018.05/dl/linux' -D
'/home/wesley/myproject/buildroot/buildroot/buildroot-2018.05/dl' -f
'linux-master.tar.gz' -H 'linux//linux.hash' -n 'linux-master' -N 'linux'
-o
'/home/wesley/myproject/buildroot/buildroot/buildroot-2018.05/dl/linux/linux-master.tar.gz'
-u git+git at git.myserver.com:myproject/kernel.git -u http\|urlencode+
http://sources.buildroot.net/linux -u http\|urlencode+
http://sources.buildroot.net  --
Initialized empty Git repository in
/home/wesley/myproject/buildroot/src/linux/git/.git/
Fetching all references
remote: Counting objects: 5069030, done.
remote: Compressing objects: 100% (772357/772357), done.
Receiving objects: 100% (5069030/5069030), 949.13 MiB | 29.12 MiB/s, done.
remote: Total 5069030 (delta 4256445), reused 5068922 (delta 4256346)
Resolving deltas: 100% (4256445/4256445), done.
From git.myserver.com:myproject/kernel
 * [new branch]                master     -> origin/master
Could not fetch special ref 'master'; assuming it is not special.
Commit 'master' does not exist in this repository
.--2018-06-07 12:41:05--
http://sources.buildroot.net/linux/linux-master.tar.gz
Resolving sources.buildroot.net... 104.27.166.48, 104.27.167.48
Connecting to sources.buildroot.net|104.27.166.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-06-07 12:41:05 ERROR 404: Not Found.

--2018-06-07 12:41:05--  http://sources.buildroot.net/linux-master.tar.gz
Resolving sources.buildroot.net... 104.27.166.48, 104.27.167.48
Connecting to sources.buildroot.net|104.27.166.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-06-07 12:41:06 ERROR 404: Not Found.

make[1]: *** [package/pkg-generic.mk:137:
/home/wesley/myproject/buildroot/buildroot/buildroot-2018.05/output/build/linux-master/.stamp_downloaded]
Error 1
make[1]: Leaving directory
'/home/wesley/myproject/buildroot/buildroot/buildroot-2018.05'
make: *** [Makefile:130: /home/wesley/myproject/buildroot/image/SPL] Error 2



And why does it wants to fetch the linux source from
http://sources.buildroot.net? I put the kernel settings like this.
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git at git.myserver.com:myproject/kernel.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"

What's a quick work around?

Regards,
Wesley Chan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180607/1d735a5e/attachment.html>
