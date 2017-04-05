From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Apr 2017 17:02:36 +0200
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
	BR2_GENIMAGE_CFG_FILES
In-Reply-To: <87wpazuaa1.fsf@dell.be.48ers.dk>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
 <ccc877c5-1ea5-e2d6-1739-c913f4d6d0a7@mind.be>
 <20170401155116.66464885@free-electrons.com>
 <8760ilvozx.fsf@dell.be.48ers.dk>
 <2ce8812c-d95e-bd4a-9cde-f02ab8e3ca60@mind.be>
 <87wpazuaa1.fsf@dell.be.48ers.dk>
Message-ID: <02a1a330-c947-2a64-29bb-88f6ac7d9c9f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-04-17 23:34, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> Hi,
> 
>  >> >> What do the others think?
>  >> 
>  >> > I agree that the new option doesn't seem really useful.
>  >> 
>  >> I'm not sure. One of the problems with genimage is that it calls a
>  >> number of external utilities depending on the content of
>  >> genimage.cfg, and it isn't directly clear what host packages you need to
>  >> enable to ensure it works. If we add explicit BR2_GENIMAGE_FAT / CPIO /
>  >> EXT2 / ISO / JFFS2 / UBI / .. options selecting the needed host packages
>  >> then that would solve that issue.
> 
>  >  So, how would you do that? To know which host packages to select, we need to
>  > parse the genimage.cfg file. This is not possible from Kconfig....
> 
> I would simply leave it to the user to select the correct sub
> options. The point is just that explicit sub options are clearer than
> having to reverse engineer genimage to figure out what programs it
> executes (and then figure out what host packages provide them).

 OK, makes sense.

 Combined with the other discussion in this thread, long-term I see us evolving
towards:

- deprecate some of the finer-grain fs tuning options we have now;
- always using genimage to generate the target filesystems;
- position our fs targets more as a 'quick fix' solution than for production;
- make host-e2fsprogs etc. blind options again.

 With that in mind, I'd tend to move the BR2_GENIMAGE_CFG_FILES option to top of
the filesystem menu rather than the Build menu. Although perhaps even better
would be to disable the filesystem menu entirely if BR2_GENIMAGE_CFG_FILES is
not empty (though that would only be if everything can be built with genimage).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
