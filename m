From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 22 Aug 2016 10:41:42 +0200
Subject: [Buildroot] systemd-timesyncd doesn't start with default config and
	skeleton
Message-ID: <e487aac1-f199-42d0-1211-4add9c5718bf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,
with version 2016.08-rc2, with the default systemd configuration the
systemd-timesyncd start fails with the error msg:

buildroot systemd[115]: systemd-timesyncd.service: Failed at step
NAMESPACE spawning /lib/systemd/systemd-timesyncd: No such file or directory

 It seems that the problem is that in the default rootfs skeleton the
/var/tmp dir is a symlink to /tmp, and in
/usr/lib/systemd/system/systemd-timesyncd.service the PrivateTmp
variable is set.
Either removing the PrivateTmp=yes or making /var/tmp a directory on its
own solves the issue. What solution would be preferable to fix this?

Thanks, regards
zgyarmati

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160822/96d67122/attachment.asc>
