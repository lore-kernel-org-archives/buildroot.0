From: Kees van Unen <Keesvanunen@hotmail.com>
Date: Sun, 22 Oct 2017 06:34:41 -0700 (MST)
Subject: [Buildroot] Implicit declaration of mblen
In-Reply-To: <bc9fed74-546a-a9f6-26b5-4698562b051e@mind.be>
References: <1508584234482-0.post@n4.nabble.com>
 <87bml0cvqq.fsf@dell.be.48ers.dk> <1508618665952-0.post@n4.nabble.com>
 <0836e4ea-a773-fbe0-4c52-4414ad82389c@mind.be>
 <1508620062609-0.post@n4.nabble.com>
 <bc9fed74-546a-a9f6-26b5-4698562b051e@mind.be>
Message-ID: <1508679281272-0.post@n4.nabble.com>
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
>  includes. stdlib.h should be included from include/X11/Xlibint.h. 

Need some more help... When following steps above the following error
appears:

fatal error: cannot specify -o with -c, -S or -E with multiple files.

I noticed that when executing abc_new the options -fPIC -DPIC -o
.libs/imCallbk.o were automatically placed behind the compilation command

abc_old is initial compilation command
abc_new is adjusted compilation command to obtain preprocessed file

abc_old.abc_old
<http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/abc_old.abc_old>  
abc_new.abc_new
<http://buildroot-busybox.2317881.n4.nabble.com/file/t2263/abc_new.abc_new>  



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
