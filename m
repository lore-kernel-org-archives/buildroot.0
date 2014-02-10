From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Feb 2014 18:10:52 +0100
Subject: [Buildroot] [git commit] kmod: really pass --disable-manpages
In-Reply-To: <87ob2g3asu.fsf@dell.be.48ers.dk>
References: <20140209083628.E9C0D9C8B1@busybox.osuosl.org>
 <7291a6ec-9696-4801-936d-fdab0d43bcdf@email.android.com>
 <87ob2g3asu.fsf@dell.be.48ers.dk>
Message-ID: <52F9081C.9050707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/09/14 10:17, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
> 
> Hi,
> 
>  >> +KMOD_CONF_OPT += --disable-manpages
>  >> +HOST_KMOD_CONF_OPT = --disable-manpages
>  >> +
>  >> ifeq ($(BR2_PACKAGE_ZLIB),y)
>  >> KMOD_DEPENDENCIES += zlib
>  >> KMOD_CONF_OPT += --with-zlib
> 
>  > Aargh, another oops, sorry.
> 
> No problem, that's why we have the autobuilders ;)
> 
>  > Isn't it safer to always use += for this type of variables?
> 
> Yes it is, but we typically don't do it for the first(/single)
> assignment.

 I think it would be a good idea to make it a habit to use += even for
the first/single assignment. It's pretty easy to make this kind of
mistake, and it's difficult to catch in review because you usually don't
see the whole file.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
