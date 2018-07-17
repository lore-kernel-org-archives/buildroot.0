From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Tue, 17 Jul 2018 12:43:53 +0000
Subject: [Buildroot] Unable to download Linux "master" on 2018.05 release
Message-ID: <c67d510c5c14ddb0f5f4661317f1801e921eedc7.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

Recently I have faced with an error trying to download "master" version of Torvalds Linux branch. I am using 2018.05 tag of buildroot.
Here is part of my defconfig:
-----------------------------------------------8<----------------------------------------------------------------------------------------------
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
----------------------------------------------->8----------------------------------------------------------------------------------------------

I got this log:

----------------------------------------------8<-----------------------------------------------------------------------------------------------
make linux-patch
...
>>> linux master Downloading
BR2_DL_DIR="/home/didin/WORK/tmp/buildroot/dl" BUILD_DIR=/home/didin/WORK/tmp/buildroot/output/build O=/home/didin/WORK/tmp/buildroot/output flock
/home/didin/WORK/tmp/buildroot/dl/linux/ support/download/dl-wrapper -c 'master' -d '/home/didin/WORK/tmp/buildroot/dl/linux' -D '/home/didin/WORK/tmp/buildroot/dl' -f 'linux-
master.tar.gz' -H 'linux//linux.hash' -n 'linux-master' -N 'linux' -o '/home/didin/WORK/tmp/buildroot/dl/linux/linux-master.tar.gz'  -u git+https://git.kernel.org/pub/scm/linux/ker
nel/git/torvalds/linux.git -u http\|urlencode+http://sources.buildroot.net/linux -u http\|urlencode+http://sources.buildroot.net??-- 
Initialized empty Git repository in /home/didin/WORK/tmp/buildroot/dl/linux/git/.git/
Fetching all references
remote: Counting objects: 6124840, done.
remote: Compressing objects: 100% (930267/930267), done.
remote: Total 6124840 (delta 5154037), reused 6120229 (delta 5150657)
Receiving objects: 100% (6124840/6124840), 1.03 GiB | 2.81 MiB/s, done.
Resolving deltas: 100% (5154037/5154037), done.
From https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux
 * [new branch]      master     -> origin/master
 * [new tag]         v4.18-rc5  -> v4.18-rc5
 * [new tag]                   v2.6.12     -> v2.6.12
... ...
 * [new tag]                   v4.9-rc8    -> v4.9-rc8
remote: Counting objects: 18014, done.
remote: Compressing objects: 100% (17161/17161), done.
remote: Total 18014 (delta 1940), reused 7067 (delta 669)
Receiving objects: 100% (18014/18014), 49.32 MiB | 1.70 MiB/s, done.
Resolving deltas: 100% (1940/1940), done.
From https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux
 * [new tag]                   v2.6.11      -> v2.6.11
 * [new tag]                   v2.6.11-tree -> v2.6.11-tree
Could not fetch special ref 'master'; assuming it is not special.
Commit 'master' does not exist in this repository
.--2018-07-16 19:17:00--  http://sources.buildroot.net/linux/linux-master.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.27.167.48, 104.27.166.48
Connecting to sources.buildroot.net (sources.buildroot.net)|104.27.167.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-07-16 19:17:01 ERROR 404: Not Found.

--2018-07-16 19:17:01--  http://sources.buildroot.net/linux-master.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.27.166.48, 104.27.167.48
Connecting to sources.buildroot.net (sources.buildroot.net)|104.27.166.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-07-16 19:17:01 ERROR 404: Not Found.

make[1]: *** [package/pkg-generic.mk:138: /home/didin/WORK/tmp/buildroot/output/build/linux-master/.stamp_downloaded] Error 1
make: *** [Makefile:79: _all] Error 2

----------------------------------------------->8----------------------------------------------------------------------------------------------------------

At the same time at 2018.02 release linux-master is downloading well.

-----------------------------------------------8<----------------------------------------------------------------------------------------------------------
>>> linux master Downloading
Doing shallow clone
Cloning into 'linux-master'...
remote: Counting objects: 64767, done.
remote: Compressing objects: 100% (60661/60661), done.
remote: Total 64767 (delta 5862), reused 19870 (delta 3222)
Receiving objects: 100% (64767/64767), 172.30 MiB | 2.98 MiB/s, done.
Resolving deltas: 100% (5862/5862), done.
Checking out files: 100% (60998/60998), done.
Could not fetch special ref 'master'; assuming it is not special.
WARNING: no hash file for linux-master.tar.gz
>>> linux master Extracting
...
----------------------------------------------->8----------------------------------------------------------------------------------------------------------

One thing I have noticed is some difference in dl:
dl in 2018.02 contains: linux-master.tar.gz  lzip-1.19.tar.gz
dl in 2018.05 contains: linux(dirctory with git dir) 

Is it now impossible to download HEAD of master branch of Linux kernel?
Any thoughts?

Thank you,
Evgeniy Didin
