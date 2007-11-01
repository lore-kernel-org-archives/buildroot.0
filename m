From: Taylan Develioglu - DSV <taylan.develioglu@nl.dsv.com>
Date: Thu, 1 Nov 2007 10:50:10 +0100
Subject: [Buildroot] undefined reference to `_dl_app_init_array'
Message-ID: <000801c81c6c$97cf73a0$cd10da91@w1613amsl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

 

Something is wrong with a toolchain I recently built with buildroot:

 

To illustrate trying to compile:

 

main () 

{

  return 0;

}

 

Fails with:

 

/lib/libc.so.0: undefined reference to `_dl_app_init_array'

/lib/libc.so.0: undefined reference to `_dl_app_fini_array'

collect2: ld returned 1 exit status

 

ldd tells me ld-uClibc-0.9.29.so is not a dynamic executable.

 

Buildroot used was snapshot 20071024

 

Anyone have any idea why this is happening? All binaries linked to it are
functioning fine, so apparently the library does have the function, making
me think this is a linker issue.

 

Regards,

 

Taylan

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071101/e3e12aec/attachment.htm 
