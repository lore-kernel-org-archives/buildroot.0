From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 25 Nov 2016 10:47:34 +0000
Subject: [Buildroot] Analysis of build results for 2016-11-23
In-Reply-To: <20161124094429.4152c19b@free-electrons.com>
References: <20161124073011.C2C1620BD5@mail.free-electrons.com>
 <20161124094429.4152c19b@free-electrons.com>
Message-ID: <1480070793.3217.9.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

On Thu, 2016-11-24 at 09:44 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Christian, Waldemar, Sam, Bernd, Alexey, Vlad, Vicente, J?rg, Fran?ois,
> please see below, there are some questions for you.
> 
> Summary of the build failures:
> 
> ?- musl related:		8
> ?- misc:			7
> ?- static linking:		4
> ?- PowerPC64le libtool:		2
> ?- ARC related:			2
> ?- uClibc-ng related:		1
> ?- unknown:			1

> > 
> > ?????????arc |??????????????????????gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/e8593a8ebf2f05cc93235a8
> > 129a2ba8b839d6d90
> > ?????????arc |??????????????????????gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/ff766f4f514c9cb48918731
> > 67f4e9b7870051883
> 
> error: 'memory_order_seq_cst' was not declared in this scope
> 
> Alexey, Vlad, could you have a look?

This is upstream problem with gcc 6.x being discussed in this thread:
http://lists.nongnu.org/archive/html/gpsd-dev/2016-09/msg00082.html

That said on my Fedora 24 I'm easily seeing the same problem trying to build gpsd.

The only work-around for gcc 6.x now is adding "-std=gnu++98" to both CFLAGS and CXXFLAGS.
I'll try to come up with something for BR in the meantime.

-Alexey
