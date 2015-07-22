From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 13:20:47 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <1530706203.3889145.1437559474733.JavaMail.root@openwide.fr>
References: <20150722094349.424e7a3e@free-electrons.com>
 <1530706203.3889145.1437559474733.JavaMail.root@openwide.fr>
Message-ID: <20150722132047.26889ba9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas M?n?gale,

On Wed, 22 Jul 2015 12:04:34 +0200 (CEST), Nicolas M?n?gale wrote:
> Hi Thomas,
> 
> > >          arm |                   cppcms-1.0.4 | NOK |
> > >          http://autobuild.buildroot.net/results/58d3d2605337fe1ce49d333cb712941711276100/
> > 
> > Weird C++ problem:
> > 
> >   error: 'template<class T, class A> std::size_t
> >   cppcms_boost::hash_value' conflicts with a previous declaration
> > 
> > Nicolas, you are the original submitter of cppcms, can you have a
> > look?
> > 
> 
> I just reproduced the problem but I have a different compilation error on my workstation:
> error: ?converter_to_utf? was not declared in this scope
> error: ?converter_between? was not declared in this scope
> 
> I added in CC Lucile which added the support of uCLibc, in the case she would have an idea of what is going on.
> 
> I continue to investigate on this problem. 

It is worth mentioning that the failing configuration at
http://autobuild.buildroot.net/results/58d3d2605337fe1ce49d333cb712941711276100/
uses glibc, not uClibc. However, this toolchain has something special:
it uses GCC 5.x, which is known to cause some build issues with various
packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
