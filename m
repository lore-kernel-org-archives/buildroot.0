From: hkengblom <hkengblom@gmail.com>
Date: Tue, 30 May 2017 03:04:48 -0700 (PDT)
Subject: [Buildroot] genimage maintainers
Message-ID: <1496138688562-165972.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This post may not be related to Buildroot but rather to genimage, but I've
not been able to find any maintainer for genimage, so I'm posting here since
I found an issue with genimage when using Buildroot.

My problem is that there seem to be a bug in genimage making it impossible
to have a mountpoint specified like this:

image dummy.ext4 {
  ext4 {}
  mountpoint = "/mnt/subdirectory"
  size = 128M
}

however this works fine:

image dummy.ext4 {
  ext4 {}
  mountpoint = "/mnt"
  size = 128M
}

When looking at the code it looks like genimage cannot handle mountpoints
that is not a directory directly under /

I've made a patch for it, but I don't know where to send it, or make a
pull-request. Further, I'm not that familiar with genimage, so it would be
good if someone with more insight in genimage could take a look at it.

Can anyone point me to someone that might be the "receiver" of such a patch?

br H?kan



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/genimage-maintainers-tp165972.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
