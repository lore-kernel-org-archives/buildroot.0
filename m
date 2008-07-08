From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 08 Jul 2008 10:14:17 +0200
Subject: [Buildroot] tslib: patch to replace the fixes of check_fd routine
Message-ID: <1215504857.12403.7.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

After being annoyed too long I took a look at the problem that AVR32 did
not fully work with tslib. There seems to be a little/big endian issue
somewhere in the input layer. The attached patch is a quick fix for
that. I will try to dig in later to see what the real issue is and
where.

In the same go please remove tslib-1.0-absbit.patch and
tslib-1.0-remove-return-on-error-from-check-df.patch, since they are now
no longer needed.

And rename tslib_add_finddef_and_inputattach_utils.patch to
tslib-1.0-add-finddef-and-inputattach-utils.patch.

This also fixes the spurious messages about unknown event 0 tslib was
puring into stderr.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
-------------- next part --------------
A non-text attachment was scrubbed...
Name: tslib-1.0-fix-check_fd-function.patch
Type: text/x-patch
Size: 1363 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080708/266e39b8/attachment.bin 
