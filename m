From: =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@gmail.com>
Date: Sun, 30 Jul 2017 14:51:25 +0200
Subject: [Buildroot] Patch: new board Socrates Cyclone 5
Message-ID: <aafbf1fc-74ab-1be4-5c58-76a2db9b97e3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is my first contribution so please correct me if I did something wrong.

I attach patch with new board support - EVB SoCrates based on Altera's
Cyclone 5. I had to add a single binary file - preloader.bin. This is
uboot based SPL from Altera. Problem with altera is that boot images
must be signed with mkpimage tool, that is bundled with Quartus and it
is not possible to sign SPL from buildroot. Yes, supposedly there is
option in config to create signed SPL, but it doesn't work for none of
my Altera's board, hence this binary SPL. Good side is that this SPL
loads uboot that is made during compilation, so there is still place for
customization and patching if someone needs it.

-- 
Best Regards
?yszczek Micha?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Added-new-board-EVB-SoCrates-based-on-Altera-Cyclone.patch
Type: text/x-patch
Size: 47132 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170730/da0e1e48/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170730/da0e1e48/attachment.asc>
