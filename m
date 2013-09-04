From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 04 Sep 2013 22:27:45 +0200
Subject: [Buildroot] [git commit] kmod: disable manpages for host-kmod
In-Reply-To: <87mwns4a78.fsf@dell.be.48ers.dk>
References: <20130904103707.9F2B29B6EB@busybox.osuosl.org>
 <b95086f02b4d393fa6f90f388a0f20d3@www.sysmic.org>
 <20130904181903.165c5cd4@skate> <87mwns4a78.fsf@dell.be.48ers.dk>
Message-ID: <522797C1.7040002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/13 22:13, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>   Thomas> Dear J?r?me Pouiller,
>   Thomas> On Wed, 04 Sep 2013 17:50:47 +0200, J?r?me Pouiller wrote:
>
>   >> >  ifneq ($(BR2_HAVE_DOCUMENTATION),y)
>   >> >  KMOD_CONF_OPT += --disable-manpages
>   >> >  endif
>   >> What happens when BR2_HAVE_DOCUMENTATION is enabled? I think same
>   >> problem happens.
>   >>
>   >> We should add a dependency to host-libxslt and I think we can pass
>   >> variable XSLTPROC= to ./configure to use a specific location of
>   >> xsltproc.
>
>   Thomas> Yes, we normally should. But nobody seems to be testing or using
>   Thomas> BR2_HAVE_DOCUMENTATION. I would personally be in favor of just getting
>   Thomas> rid of BR2_HAVE_DOCUMENTATION. Who needs the documentation to be
>   Thomas> installed on the target?
>
> I'm also starting to think so. With Buildroot focused on cross
> compilation (and the development on target stuff gone), I don't see much
> use for documentation on the target either.

  Well, if you have a less space-constrained system it's kind of 
convenient to be able to pull up a man page for some tool that you're 
less familiar with and that is not installed on your host (not that I can 
think of an example :-). However, in its current incarnation, including 
documentation adds a huge amount of bloat. Taking one random output I 
find 105MB in the target dir and 40MB of various bits of documentation in 
the staging dir.

  Bottom line: yes, BR2_HAVE_DOCUMENTATION can be killed.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
