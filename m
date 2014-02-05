From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 22:21:30 +0100
Subject: [Buildroot] [PATCH 4 of 7] packages: remove support for
 documentation on target
In-Reply-To: <20140205141626.654ac08a@skate>
References: <patchbomb.1391597406@argentina>
 <ab1e96c7872d5567b2a4.1391597410@argentina> <20140205134957.463211f6@skate>
 <CAAXf6LV0DwSccqT8Ur7p=NXn70FFka212O4t9pBbsS6t1VmuOQ@mail.gmail.com>
 <20140205141626.654ac08a@skate>
Message-ID: <52F2AB5A.8000006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/14 14:16, Thomas Petazzoni wrote:
> Dear Thomas De Schampheleire,
> 
> On Wed, 5 Feb 2014 14:10:09 +0100, Thomas De Schampheleire wrote:
> 
>>> > > So the DISABLE_DOCUMENTATION variable now always has the same value,
>>> > > and is only used in pkg-autotools.mk in one place. So I believe it
>>> > > makes sense to remove this variable altogether, and simply pass all the
>>> > > appropriate --<something> options directly in the <pkg>_CONFIGURE_CMDS
>>> > > of pkg-autotools.mk.
>> > 
>> > OK.
>> > By the way, I added on my own todo list that we should try to expand
>> > the automatically passed options, for example:
>> > --disable-manpages --disable-man-pages --disable-manuals etc. as some
>> > of them are used in several packages...
> I have a mixed feeling about this. The problem is that those options
> are not standard, so by far not all configure scripts understand them.
> Which means that when a given configure script is called, you often
> have a warning:
> 
> WARNING: options --disable-foo --enable-bar unsupported
> 
> If you have gazillions of options that are unsupported, then you may
> very well miss an option passed by your .mk file on which you made a
> typo, for example.
> 
> So having a long list of options to disable documentation is not
> something that I personally like that much, but I believe Arnout does
> not share the same opinion :)

 I have a mixed opinion about this...

 I do think that the configure options should ideally be as exact as
possible. However, documentation is something that is wont to cause hard
to track build failures, e.g. trying to run system asciidoc with host
python, or system makeinfo with host-perl. So if we remove it from the
defaults, then we should make sure that _all_ autotools packages disable
their documentation.

 Hm, now I think about that, it would actually be a good idea to do
that... We currently still miss some of these cases because we assume
--disable-documentation works, but if we make a habit of paying attention
to it, then there is less risk of this happening.


 Regards,
 Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
