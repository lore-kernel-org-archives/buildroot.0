From: Ken Cecka <ceckak@alumni.washington.edu>
Date: Thu, 28 Jun 2007 16:28:51 -0700 (PDT)
Subject: [Buildroot] Debugging across uClibc calls
Message-ID: <Pine.LNX.4.64.0706281628150.7887@pitt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I've got a PPC405 target up and running with a buildroot/uClibc linux
environment, and now I'm trying to debug an application.  I can launch the
application using gdbserver and then connect to it using my host gdb, and
everything is great as I step through the code... until I reach a C 
library
call.  Any time I try to step over one of these (e.g. print, memcpy, etc),
I end up getting stuck in call___do_global_ctors_aux.

I did a little searching around on the web and the only thing I could find
about this is that this symbol is related to runtime linking of shared
library functions.  That's fine and dandy, but how do I get past it?  I'm
not trying to step into the call, just over it so I can continue debugging
my high level code.

Any suggestions?

Thanks,
Ken
