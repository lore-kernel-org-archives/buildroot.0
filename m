From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 27 Feb 2017 00:00:51 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-25
In-Reply-To: <20170226223353.39284983@free-electrons.com>
References: <20170226072845.0954E20755@mail.free-electrons.com>
 <20170226223353.39284983@free-electrons.com>
Message-ID: <20170226230051.GJ12810@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> Sam, Cyril, Frank, Gustavo, Waldemar, Vicente, see below.
> 
> 
> >          arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/605e36d65bd01310913701af0f9ed1e11fb49385
> 
> error: 'struct dqblk' has no member named 'dqb_curspace'; did you mean 'dqb_curblocks'?
> error: 'struct dqblk' has no member named 'dqb_valid'
> error: 'QIF_LIMITS' undeclared (first use in this function)
> 
> Weird. Is it a libc issue? Kernel headers issue?

Libc issue fixed here
https://cgit.openadk.org/cgi/cgit/uclibc-ng.git/commit/include/sys/quota.h?id=126ffbd45f65d3a6940afc8aaacfada8a73ea8a0

Another case of Synopsis using old uClibc-ng.
 
> > microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a318f0838a6a602046e719103ac81965c0084d52
> 
> internal compiler error: in merge_overlapping_regs, at regrename.c:304
> 
> Waldemar, a suggestion for this one ?

Not yet.

best regards
 Waldemar
