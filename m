From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Apr 2014 00:34:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-04-02
In-Reply-To: <20140406203150.GC26684@free.fr> (Yann E. MORIN's message of
 "Sun, 6 Apr 2014 22:31:50 +0200")
References: <20140403063009.526E4101924@stock.ovh.net>
 <nki01bxvlk.ln2@ID-313208.user.individual.net>
 <20140406203150.GC26684@free.fr>
Message-ID: <87ppkudr4v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> During testing I did not see such an error here, but in the past this error 
 >> was already discussed:
 >> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/61929
 >> 
 >> But it seems that the discussion did not continue, libunwind landed one day 
 >> later in buildroot, quoting Andy: "Pending the outcome of that question, I'll 
 >> put in the config a dependency of !BR2_TOOLCHAIN_*_<uclibc>."
 >> 
 >> Maybe this is still necessary?

 > Yes, setcontext et al. were only added to uClibc master in early 2013:
 >     http://git.uclibc.org/uClibc/commit/?id=a8dc90eaaa5e6474beac828558d969b1aafee4af

 > So it is not yet in any release of uClibc.

 > Either we backport this (Hirk!) or we disable X.org on uClibc.
 > Count me in for disabling on uClibc.

It is libunwind that uses get/setcontext, not Xorg - And libunwind is
just an optional dependency for Xorg, so it is libunwind that shouldn't
be available for (non-snapshot) uClibc.

I'll send a patch to fix it.

-- 
Bye, Peter Korsgaard
