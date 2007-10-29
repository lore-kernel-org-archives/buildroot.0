From: Jorge S. <jorgesolla@gmail.com>
Date: Mon, 29 Oct 2007 16:19:50 +0100
Subject: [Buildroot] BUG: ncftpbookmarks fails when building ncftp utils.
Message-ID: <6090c5eb0710290819s485f9e9dw581599ad5a97f9da@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Ncftp package fails if you've  selected "utils".

It fails while trying to make the "install -m 0755 <path>/ncftpbookmarks"
after compiling.

Since i don't need ncftpbookmarks, i solved this changing this in ncftp.mk:

ORIGINAL:

ifeq ($(strip $(BR2_PACKAGE_NCFTP_UTILS)),y)
NCFTP_TARGET_BINS+=ncftpbatch ncftpbookmarks ncftpget ncftpls ncftpput
endif


MODIFIED (simply removed ncftpbookmarks):

ifeq ($(strip $(BR2_PACKAGE_NCFTP_UTILS)),y)
NCFTP_TARGET_BINS+=ncftpbatch ncftpget ncftpls ncftpput
endif


It works fine now.

I can submit a patch if someone interested.


Regards,

Jorge.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071029/e83d3356/attachment.htm 
