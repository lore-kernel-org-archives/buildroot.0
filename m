From: =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@gmail.com>
Date: Wed, 2 Aug 2017 15:55:10 +0200
Subject: [Buildroot] genimage raw partition from multiple files
Message-ID: <cadb0fad-d46f-554c-05ee-ba70d0db7af1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been trying to figure out, how to create raw partition, without
filesystem, from 2 or more files. Here is a general idea


partition uboot {
    partition-type = 0xa2
    size = 1M

    image spl {
        image = "u-boot-spl.bin.crc"
	size = 64k
        offset = 0
    }

    image uboot-real {
        image = "u-boot.bin"
        offset = 256k
    }
}


Note that spl is 64k big, and uboot-real must be at offset 256k. Also
this *MUST* be a partition of type 0xa2. Can such thing be done fully in
genimage without post-install script?

-- 
Best Regards
?yszczek Micha?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170802/a449bafb/attachment.asc>
