From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 09:12:40 +0100
Subject: [Buildroot] [git commit] wget: bump to 1.19.1 to fix build issue
In-Reply-To: <56d19988-be8e-e7a7-a6a6-3fe613f5d73c@imgtec.com>
References: <20170213211546.74209821DB@busybox.osuosl.org>
 <56d19988-be8e-e7a7-a6a6-3fe613f5d73c@imgtec.com>
Message-ID: <20170214091240.104332b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 11:51:15 +0530, Rahul Bedarkar wrote:

> > In file included from str-two-way.h:44:0,
> >                  from c-strcasestr.c:37:
> > ./stdint.h:89:5: error: #if with no expression
> >  #if  
> 
> I was unable to reproduce these build failures at my end and also 
> suspecting that it is side effect of autoreconf. Thanks for version bump.

To reproduce the issue, you had to have host-gettext built before wget.
So something like:

$ make host-gettext
$ make gettext

Would trigger the issue (I was able to reproduce it).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
