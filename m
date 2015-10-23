From: David Kosir <david.kosir@bylapis.com>
Date: Fri, 23 Oct 2015 23:00:19 +0200
Subject: [Buildroot] BR2_EXTERNAL and chioce, how to solve it?
Message-ID: <CAOcYpt12JmY3ZOd6tSLdvuRF7kc1bXSCsk5Qb9BsO+Vdc+PGxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've ran onto interesting problem while making my own package in BR2_EXTERNAL.
I see no info about it in manual or Internet, ony this conversation
[1] which was not very informative on how to solve problem.

Here is my situation:
I'm using BR2_EXTERNAL method for customization buildroot to my needs.
I'm using buildroot as git submodule in my repo and I prefer not to touch it.

I needed to make some changes to eudev package to fit my needs, so I
made BR2_EXTERNAL/package/eudev_custom and did my changes there.
Everything is good so far.

Now, when want to configure buildroot to use my eudev_custom I come to problems.
There is choice in system/Config.in (lines 107-132) where I can select
my eudev_custom (obviously).

Also, I can't add options there as I can't change buildroot files.
Also I can't leave BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV selected
because that selects eudev automatically and I have conflict between
eudev and eudev_custom.

Is there any smart way to handle this kind of situation?

I've managed to solve it by selecting
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS but that was just because
I was lucky that this option existed as such. I did couple more
modifications to my eudev_custom like provide UDEV and to select
INOTIFY in kernel config but it wasn't very clean way of doing it.

[1] http://lists.busybox.net/pipermail/buildroot/2014-May/096517.html
