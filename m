From: Wade Berrier <wberrier@gmail.com>
Date: Mon, 11 Aug 2008 12:41:26 -0600
Subject: [Buildroot] samba and fpie
Message-ID: <bbbeeccd0808111141t7828b2eeq1ed0b2d9f7227697@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

In upgrading from uClibc 0.9.28.3 to 0.9.29 I had issues with samba segfaulting.

The segfaulting was fixed by pulling the following revisions from the
0.9.29 branch:

r20786
r20881

That fixed the segfault but I wasn't able to get samba running without doing:

+               samba_cv_fpie=no \

In it's configure line.  (The patch also forces mkstemp to avoid
warnings in uclibc)

Wade
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-samba_uclibc_0.9.29_nopie_mkstemp.patch
Type: text/x-diff
Size: 438 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080811/5333a424/attachment-0001.patch 
