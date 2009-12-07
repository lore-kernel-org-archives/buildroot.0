From: Joachim Pihl <jpihl@nevion.com>
Date: Mon, 7 Dec 2009 09:36:15 +0100
Subject: [Buildroot] Strange MTD problem (ARM)
Message-ID: <op.u4j7ikxlyqa4qb@jap>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This may not be related to Buildroot, but I am completely stumped:

# ls -al /dev/mtdblock*
brw-r-----    1 root     root      31,   0 Dec  3 12:26 mtdblock0
brw-r-----    1 root     root      31,   1 Dec  3 12:26 mtdblock1
brw-r-----    1 root     root      31,   2 Dec  3 12:26 mtdblock2
brw-r-----    1 root     root      31,   3 Dec  3 12:26 mtdblock3
#
#
#
# cp mtdblock2 /dev/mtdblock2
#
# ls -al /dev/mtdblock*
brw-r-----    1 root     root      31,   0 Dec  3 12:26 mtdblock0
brw-r-----    1 root     root      31,   1 Dec  3 12:26 mtdblock1
-rw-r--r--    1 root     root      6815744 Dec  7 17:58 mtdblock2
brw-r-----    1 root     root      31,   3 Dec  3 12:26 mtdblock3
#


Running 2009.11 on PXA255 with a 2.6.27.39 preemptible kernel, EABI,  
running the same patches used for 2.6.27.10 (OABI and non-preemptible)  
where it worked.

mtd_debug write /dev/mtd2 0 0x680000 mtdblock2 works, results does not  
seems correct for /dev/mtd1.


Does anyone know where to look, so far I strike out on the google searches.

-- 
Joachim Pihl
Senior R&D Engineer
Nevion Europe

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

------------------------------------------------------
The Global Video Transport Leader
------------------------------------------------------
