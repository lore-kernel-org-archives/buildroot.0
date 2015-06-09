From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Jun 2015 23:57:33 +0200
Subject: [Buildroot] [PATCH 1/2] gflags: new package
In-Reply-To: <20150609090119.1523b5f6@free-electrons.com>
References: <1433831250-31968-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1433831250-31968-2-git-send-email-rahul.bedarkar@imgtec.com>
 <20150609090119.1523b5f6@free-electrons.com>
Message-ID: <20150609215733.GC3671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Rahul, All,

On 2015-06-09 09:01 +0200, Thomas Petazzoni spake thusly:
> On Tue, 9 Jun 2015 11:57:29 +0530, Rahul Bedarkar wrote:
> 
> > diff --git a/package/gflags/gflags.hash b/package/gflags/gflags.hash
> > new file mode 100644
> > index 0000000..9c8b27a
> > --- /dev/null
> > +++ b/package/gflags/gflags.hash
> > @@ -0,0 +1,2 @@
> > +# No hash for v2.1.2, comes from the github-helper:
> > +none	xxx	gflags-v2.1.2.tar.gz
> 
> I believe in this case, we generally do not provide a hash file at all.
> Though maybe in the future we will want to have a hash file for *all*
> packages. Yann, what is our policy on this?

Hmm. Ideally, I think we want a .hash file for all packages, so that can
eventually be a hard error when one is missing.

However, I can see that can be cumbersome to add a .hash file to just
say 'talk to my hand, I have no hash'. Especially as we're not enforcing
it so far...

But I was planning on working on .hash sometime this summer to add all
those missing at the time, so we have all .hash files for the lat
release of the year. I'm pretty happy to see so many hashes being added
in the meantime! ;-)

So, to answer the specific question: I think that is good to have a
none-hash file; and to top it off, it's nicely commented. :-)

Regards,
Yann E. MORIN.

> > +GFLAGS_VERSION = v2.1.2
> > +GFLAGS_SITE = $(call github,gflags,gflags,$(GFLAGS_VERSION))
> > +GFLAGS_INSTALL_STAGING = YES
> > +GFLAGS_LICENSE = BSD-3c
> > +GFLAGS_LICENSE_FILES = COPYING.txt
> > +
> > +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),n)
> 
> This should be:
> 
> ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
