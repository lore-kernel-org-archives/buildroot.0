From: Kees van Unen <Keesvanunen@hotmail.com>
Date: Mon, 23 Oct 2017 09:11:35 -0700 (MST)
Subject: [Buildroot] Implicit declaration of mblen
In-Reply-To: <bc9fed74-546a-a9f6-26b5-4698562b051e@mind.be>
References: <1508584234482-0.post@n4.nabble.com>
 <87bml0cvqq.fsf@dell.be.48ers.dk> <1508618665952-0.post@n4.nabble.com>
 <0836e4ea-a773-fbe0-4c52-4414ad82389c@mind.be>
 <1508620062609-0.post@n4.nabble.com>
 <bc9fed74-546a-a9f6-26b5-4698562b051e@mind.be>
Message-ID: <1508775095198-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Copy the the make command line from the xlib_libX11, append V=1 to it, and 
> you'll see the compilation commands. Copy the compilation command for the 
> failing file, replace the -c with -E and the -o with some filename, so you
> get 
> the preprocessed file. Then in that preprocessed file check which stdlib.h
> it 
> includes. stdlib.h should be included from include/X11/Xlibint.h. 

Hi, I managed to get the preprocessor file (see uploaded file). It includes
the next stdlib.h:

output/host/arm-buildroot-linux-uclibc/gnueabihf/sysroot/usr/include/stdlib.h

In this version of stdlib.h there is no reference to mblen (see uploaded
file).

Regards,
Kees

imCallbk.o
<http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/imCallbk.o>  
stdlib.h
<http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/stdlib.h>  






--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
