From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Dec 2015 17:19:00 +0000
Subject: [Buildroot] [Bug 8541] fail to build host-fakeroot-1.20.2
In-Reply-To: <bug-8541-163@https.bugs.busybox.net/>
References: <bug-8541-163@https.bugs.busybox.net/>
Message-ID: <bug-8541-163-uG2h1AoYGf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8541

--- Comment #3 from aborniak <aborniak@gmail.com> ---
I can't patch fakeroot package  due to error. 

```
root at FrontendKernel:~/buildroot# find ./ -name "libfakeroot.c"
./output/build/host-fakeroot-1.20.2/libfakeroot.c
root at FrontendKernel:~/buildroot# patch
./output/build/host-fakeroot-1.20.2/libfakeroot.c /tmp/glibc-xattr-types
patching file ./output/build/host-fakeroot-1.20.2/libfakeroot.c
patching file ./output/build/host-fakeroot-1.20.2/libfakeroot.c
Hunk #1 FAILED at 168.
1 out of 1 hunk FAILED -- saving rejects to file
./output/build/host-fakeroot-1.20.2/libfakeroot.c.rej
root at FrontendKernel:~/buildroot# 
```

Also I am on the master branch. 

```
root at FrontendKernel:~/buildroot# git branch 
* master
root at FrontendKernel:~/buildroot# git pull
Already up-to-date.
root at FrontendKernel:~/buildroot# 

```

My system is ubuntu 

```
root at FrontendKernel:~/buildroot# uname -a 
Linux FrontendKernel 3.19.0-41-generic #46-Ubuntu SMP Fri Dec 4 18:18:11 UTC
2015 x86_64 x86_64 x86_64 GNU/Linux


root at FrontendKernel:~/buildroot# cat /etc/os-release 
NAME="Ubuntu"
VERSION="15.04 (Vivid Vervet)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 15.04"
VERSION_ID="15.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
root at FrontendKernel:~/buildroot# 

```

-- 
You are receiving this mail because:
You are on the CC list for the bug.
