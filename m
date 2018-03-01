From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Mar 2018 20:41:13 +0100
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <877eqzshgt.fsf@dell.be.48ers.dk>
References: <20180226070010.28C8620727@mail.bootlin.com>
 <20180226113319.7e3bcf6b@windsurf.lan> <87fu5nsyrg.fsf@dell.be.48ers.dk>
 <20180226140029.45325514@windsurf.lan> <87bmgbsv4z.fsf@dell.be.48ers.dk>
 <20180226154724.4e87f072@windsurf.lan> <877eqzshgt.fsf@dell.be.48ers.dk>
Message-ID: <096b2356-52d1-ee4d-0dc4-504d4a0dfee7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-02-18 20:01, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
>  > Hello,
>  > On Mon, 26 Feb 2018 15:06:20 +0100, Peter Korsgaard wrote:
> 
>  >> > mplayer upstream is dead ? If that is the case, then indeed we should
>  >> > just take those patches as-is.  
>  >> 
>  >> I haven't followed development in details, but the latest mplayer
>  >> release is more than 2 years old and several forks exists (E.G. mpv).
> 
>  > But isn't mplayer one of those projects that says that releases are
>  > useless, and people should always use the latest trunk/master/tip
>  > because it's obviously "the best".
> 
> Maybe. I do see some recent changes in subversion, but mainly small
> things (tweaks to the handwritten configure script).
> 
>  >> >> Or deprecate qt4?  
>  >> 
>  >> > Just because it's broken on powerpc?  
>  >> 
>  >> Well, mainly because it is no longer maintained upstream. Even Debian is
>  >> removing Qt4:
>  >> 
>  >> https://wiki.debian.org/Qt4Removal
> 
>  > True, but we are not going to remove it for 2018.02, right ?
> 
> It is indeed getting quite late for 2018.02, but given that:
> 
> - It isn't supported upstream
> - The package is orphaned in Buildroot
> - Other distributions (like Debian) no longer supports it
> 
> Makes me think that we won't be able to do a good job supporting it
> throughout the 2018.02 support cycle.

 Well, for most packages, the "support" is limited to "it's still there and it
still doesn't fail in autobuilders". Which will not happen because we don't use
any new toolchains or anything during the LTS support cycle.

> 
> We don't have a good way of handling deprecations, so I'm not sure what
> the best option is:
> 
> - Do nothing
> - Change prompt to "Qt (obsolete)"

 I like this one. It costs us nothing, it makes it clear that you can't expect
support updates on this package, and it's an advance warning that it may be removed.

> - Remove package

 Eventually, yes, with legacy handling. I would remove it only when it breaks.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
