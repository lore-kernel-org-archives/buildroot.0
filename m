From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 04 Sep 2013 22:13:15 +0200
Subject: [Buildroot] [git commit] kmod: disable manpages for host-kmod
In-Reply-To: <20130904181903.165c5cd4@skate> (Thomas Petazzoni's message of
 "Wed, 4 Sep 2013 18:19:03 +0200")
References: <20130904103707.9F2B29B6EB@busybox.osuosl.org>
 <b95086f02b4d393fa6f90f388a0f20d3@www.sysmic.org>
 <20130904181903.165c5cd4@skate>
Message-ID: <87mwns4a78.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear J?r?me Pouiller,
 Thomas> On Wed, 04 Sep 2013 17:50:47 +0200, J?r?me Pouiller wrote:

 >> >  ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 >> >  KMOD_CONF_OPT += --disable-manpages
 >> >  endif
 >> What happens when BR2_HAVE_DOCUMENTATION is enabled? I think same 
 >> problem happens.
 >> 
 >> We should add a dependency to host-libxslt and I think we can pass 
 >> variable XSLTPROC= to ./configure to use a specific location of 
 >> xsltproc.

 Thomas> Yes, we normally should. But nobody seems to be testing or using
 Thomas> BR2_HAVE_DOCUMENTATION. I would personally be in favor of just getting
 Thomas> rid of BR2_HAVE_DOCUMENTATION. Who needs the documentation to be
 Thomas> installed on the target?

I'm also starting to think so. With Buildroot focused on cross
compilation (and the development on target stuff gone), I don't see much
use for documentation on the target either.

-- 
Bye, Peter Korsgaard
