From: Roy Arav <roy.arav@shieldiot.io>
Date: Thu, 28 Jun 2018 10:19:11 +0300
Subject: [Buildroot] Docker missing statistics
Message-ID: <CAM27=5itBcZ_H=CEzVUA2Ow8sfOztB76ekEeWZfMEn2y9MjYpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am running buildroot on raspberry Pi3 and I fail to see docker statistics.
I can see CPU statistics but not memory nor network statistics.

Notes:
1. When running docker info I see the following warnings
WARNING: No memory limit support
WARNING: No swap limit support
WARNING: No kernel memory limit support
WARNING: No oom kill disable support

2.  I ran the following check script
https://raw.githubusercontent.com/moby/moby/master/contrib/check-config.sh
and the result is that there are 2 kernel flags missing
CONFIG_CGROUP_HUGETLB=y
CONFIG_AUFS_FS=y

3. I tried adding them and two more flags that I thought they might depend
on:
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y

But from some reason they are not shown during runtime.

Any ideas?
Thanks
Roy
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180628/4a4a2b60/attachment.html>
