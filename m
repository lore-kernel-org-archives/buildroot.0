From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:28:43 +0100
Subject: [Buildroot] [PATCH] package/gd: add post-2.2.5 security fixes
 from upstream
In-Reply-To: <20191020090511.2135-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 20 Oct 2019 11:05:10 +0200")
References: <20191020090511.2135-1-peter@korsgaard.com>
Message-ID: <87sgna1kp0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerablities:
 > - CVE-2018-1000222: Libgd version 2.2.5 contains a Double Free Vulnerability
 >   vulnerability in gdImageBmpPtr Function that can result in Remote Code
 >   Execution .  This attack appear to be exploitable via Specially Crafted
 >   Jpeg Image can trigger double free

 > - CVE-2018-5711: gd_gif_in.c in the GD Graphics Library (aka libgd), as used
 >   in PHP before 5.6.33, 7.0.x before 7.0.27, 7.1.x before 7.1.13, and 7.2.x
 >   before 7.2.1, has an integer signedness error that leads to an infinite
 >   loop via a crafted GIF file, as demonstrated by a call to the
 >   imagecreatefromgif or imagecreatefromstring PHP function

 > - CVE-2019-11038: When using the gdImageCreateFromXbm() function in the GD
 >   Graphics Library (aka LibGD) 2.2.5, as used in the PHP GD extension in PHP
 >   versions 7.1.x below 7.1.30, 7.2.x below 7.2.19 and 7.3.x below 7.3.6, it
 >   is possible to supply data that will cause the function to use the value
 >   of uninitialized variable.  This may lead to disclosing contents of the
 >   stack that has been left there by previous code

 > - CVE-2019-6978: The GD Graphics Library (aka LibGD) 2.2.5 has a double free
 >   in the gdImage*Ptr() functions in gd_gif_out.c, gd_jpeg.c, and gd_wbmp.c

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>


Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
