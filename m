From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Thu, 8 Jun 2017 14:28:19 +0200
Subject: [Buildroot] [git commit] package/gnu-efi: bump version to 3.0.5
Message-ID: <20170608142819.4d3fc959@armant.office.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[
Not a genuine reply, my mailbox had a downtime when the original mail
was sent.

Refering to commit: 
https://git.buildroot.net/buildroot/commit/?id=d0402a6e72c8ca5088d860bb788084147a049968
]

Hi together,

It seems the version bump of gnu-efi (3.0.1 -> 3.0.5) is breaking at
least syslinux.

Our autobuilders don't exercise the bootloaders, so we missed it.

I've quickly tried to see how deep the differences are, first had
issues with conflicting function prototypes, then with structs which
changed name, and finally with conflicting definition of longjump
types. I gave up for now while investigating that last one.

syslinux ships with an included own version of gnu-efi, so they might
not be interested in fixing that immediately (I've not raised the issue
over there yet).

Thomas mentionned on IRC that reverting the version-bump might be the
best option for now. I don't know if grub & Co. are affected as well.

Regards,
Ben.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170608/51dca9b9/attachment.asc>
