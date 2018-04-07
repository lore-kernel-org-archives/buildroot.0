From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Apr 2018 12:11:44 +0200
Subject: [Buildroot] make linux-menuconfig
In-Reply-To: <a0288febbc3c4ff89997c83587592e20@SVR-ORW-MBX-04.mgc.mentorg.com>
References: <a0288febbc3c4ff89997c83587592e20@SVR-ORW-MBX-04.mgc.mentorg.com>
Message-ID: <20180407101144.GA2267@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, All,

[please, use plain-text email, reading HTML code is not nice...]
[some people are reading this with a text-to-speech or a braille reader]

On 2018-04-06 20:57 +0000, Bradley, Mike spake thusly:
> % git clone [1]https://github.com/Xilinx/linux-xlnx
> % git checkout tags/zynq-soc-for-4.3

Why are you explicitly prefixing with 'tags/'?

> Initialized empty Git repository in
> ???../buildroot-2016.11.3/output/build/.linux-zynq-soc-for-4.3.tar.gz.xSOjlD/linux-zynq-soc-for-4.3/.git/

Buildroot 2016.11 is getting pretty old now. You should upgrade.

> remote: Counting objects: 812346, done.
> remote: Compressing objects: 100% (317542/317542), done.
> remote: Total 812346 (delta 664056), reused 602764 (delta 488026), pack-reused 0
> Receiving objects: 100% (812346/812346), 639.34 MiB | 676 KiB/s, done.
> Resolving deltas: 100% (664056/664056), done.
> warning: Remote branch zynq-soc-for-4.3 not found in upstream origin, using HEAD instead
> Could not fetch special ref 'zynq-soc-for-4.3'; assuming it is not special.

Those messages are perfectly expected.

And for me, the download does work when using the current Buildroot
master:

$ cat my_defconfig
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="zynq-soc-for-4.3"
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y

$ make clean
$ make linux-menuconfig
[--SNIP--]
>>> linux zynq-soc-for-4.3 Downloading
Initialised empty Git repository in /home/ymorin/dev/buildroot/O/yem-dl/linux/git/.git/
Doing a shallow fetch
remote: Counting objects: 53876, done.
remote: Compressing objects: 100% (51004/51004), done.
remote: Total 53876 (delta 4351), reused 16173 (delta 2119), pack-reused 0
Receiving objects: 100% (53876/53876), 144.75 MiB | 5.18 MiB/s, done.
Resolving deltas: 100% (4351/4351), done.
From https://github.com/Xilinx/linux-xlnx
 * tag               zynq-soc-for-4.3 -> FETCH_HEAD
Could not fetch special ref 'zynq-soc-for-4.3'; assuming it is not special.
WARNING: no hash file for linux-zynq-soc-for-4.3.tar.gz
>>> linux zynq-soc-for-4.3 Extracting
[--SNIP--]

I also tested (just for the sake of losing time) on 2016.11.3, and it
also works as expected:

>>> linux zynq-soc-for-4.3 Downloading
Doing shallow clone
Cloning into 'linux-zynq-soc-for-4.3'...
remote: Counting objects: 53876, done.
remote: Compressing objects: 100% (51004/51004), done.
remote: Total 53876 (delta 4351), reused 16173 (delta 2119), pack-reused 0
Receiving objects: 100% (53876/53876), 144.75 MiB | 5.32 MiB/s, done.
Resolving deltas: 100% (4351/4351), done.
Checking connectivity... done.
Note: checking out 'e4a9288942392965bd5cfad93d9996b83c0dc4a6'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

Checking out files: 100% (50821/50821), done.
Could not fetch special ref 'zynq-soc-for-4.3'; assuming it is not special.
>>> linux zynq-soc-for-4.3 Extracting

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
