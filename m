From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 21:14:31 +0100
Subject: [Buildroot] Is it possible to override a package version from
 BR2_EXTERNAL?
In-Reply-To: <CAF_dkJDcBuOOe3Z5zGfS=eA8tJ9k54DqRahGuZeR8vGE1T+FBQ@mail.gmail.com>
References: <CAF_dkJDcBuOOe3Z5zGfS=eA8tJ9k54DqRahGuZeR8vGE1T+FBQ@mail.gmail.com>
Message-ID: <56D0B227.2060104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/26/16 16:03, Patrick Doyle wrote:
> I am asking because it appears (for the moment) that the 2016.01
> host-uboot-tools mkenvimage utility does not generate an environment
> file compatible with my non-2016.01 u-boot.

 That is weird... As far as I know, mkenvimage should stay backward-compatible.
Unless, of course, your u-boot has some hacks that make it incompatible with
upstream u-boot...


> 
> I will try changing UBOOT_TOOLS_VERSION to 2015.01 in uboot-tools.mk,
> but that is not a long term solution -- I would rather use a pristine
> buildroot source tree with by BR2_EXTERNAL customizations for kernel
> _defconfig files & the like.
> 
> Or, it's possible that something else entirely is wrong with my
> environment file and it has nothing to do with mkenvimage.  But I am
> still curious about overriding specific package revisions on a
> case-by-case basis.

 Nope, that's not possible. It's been discussed a couple of times on the list,
search the archives for details. In short, because of the order in which make
evaluates things, by the time you get to the BR2_EXTERNAL customisations it's
too late.

 It's also not possible to override the version in the override file, because
then the package file will just override your assignment.

 What you _can_ do, is to get a local copy and use UBOOT_TOOLS_OVERRIDE_SRCDIR.
But that's also not a long-term solution.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
