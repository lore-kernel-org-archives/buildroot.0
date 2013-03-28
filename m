From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 28 Mar 2013 08:44:54 +0100
Subject: [Buildroot] media-ctl build failure (autobuild)
Message-ID: <CAAXf6LUxBkO6-g-dHs8_2cagNFiBYAWCE3KAEcuT=zWEsJdZMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The media-ctl package is failing to build on several autobuilds, like:
http://autobuild.buildroot.org/results/c85926967750bcdf5f21c54350ad2bd320a3ecfe/
http://autobuild.buildroot.org/results/f82329d4d37f8f2793e3be2b9a4f541f7aea1cb5/

The cause is the absence of kernel header linux/media.h, which was added in
2.6.39. The toolchains on which it fails (ARM201103, PPC201009, ..) have
older kernel headers than that.

What is the appropriate action here:
1. remove the old toolchains?
2. add some kind of fragile dependency between media-ctl and specific
toolchain config variables
3. introduce a way to specify which kernel header versions are used for
external toolchains, and check this for packages that need it
4. don't bother, let the package fail for these old toolchains

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130328/cdca1e01/attachment.html>
