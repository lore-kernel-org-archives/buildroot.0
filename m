From: Patrick Doyle <wpdster@gmail.com>
Date: Thu, 21 Apr 2016 10:24:09 -0400
Subject: [Buildroot] rootfs overlay best practices
Message-ID: <CAF_dkJDPv-Z6AW8u-AsTukovBhMNLR0q-1326qOxi7RfFtBL7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rather than invent my own, I thought I would query the list first.

NOTE: This post does not refer to the root file system overlay one can
use to customize the build process.  I am looking for information
regarding non-volatile storage of configuration data.

So here is the situation.  I have compiled my (very tiny!) rootfs into
my kernel and boot with that as my rootfs.  But I would like to allow
myself the luxury of making changes to the rootfs by overlaying
non-volatile storage over the rootfs, or, perhaps over selected
portions of the rootfs.

How do folks typically manage this?

I could mount my overlay nonvolatile storage right at / (I think... I
haven't actually tried this yet!) and I think that means that any
change I make to the running system will be preserved.  But there are
probably some weird issues with mount points and such.

Or, I could mount my overlay storage someplace like /config, create
symlinks from selected (or all?) files in /etc to /config/etc, and
thus be able to modify e.g. /config/etc/hostname to change the name of
my device.  It seems like it would be pretty straightforward to write
a post-build script that duplicates /etc into /config/etc and replaces
the files in /etc with symlinks.

Or I could overthink this too much and perhaps I should just stop here
and seek the wisdom of the community.  This is the option I have
selected :-)

--wpd
