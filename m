From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 22 Jul 2008 15:54:59 -0600
Subject: [Buildroot] [PATCH] busybox insmod.c on powerpc
Message-ID: <bbbeeccd0807221454v112a5f97ya204c176e45e48d1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch was needed to compile busybox on powerpc.

I'm using a kernel without loadable module support so I'm not sure of
the accuracy.

But, there's ppc code in that file that references the 'ifile' symbol.
 (USE_PLT_ENTRIES is defined for powerpc but 'ifile' isn't defined for
powerpc without this patch)

So someone else may have to take a look.

Wade
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-busybox_ppc_insmod.patch
Type: text/x-diff
Size: 810 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080722/ba4b58a0/attachment-0001.patch 
