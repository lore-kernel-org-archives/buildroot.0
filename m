From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Jun 2018 22:13:12 +0200
Subject: [Buildroot] swapoff, but no swapon in initab
In-Reply-To: <87d0wlonmg.fsf@dell.be.48ers.dk>
References: <509563228.1507483.1528305257656.JavaMail.zimbra@datacom.com.br>
 <8b5f67de-8fe7-ffd2-6c20-9662908947de@mind.be>
 <2139346916.1818743.1528457899819.JavaMail.zimbra@datacom.com.br>
 <272b0e3a-7f9b-f18d-a430-97553e260019@mind.be>
 <87zi0074sa.fsf@dell.be.48ers.dk>
 <909872342.136921.1528804345151.JavaMail.zimbra@datacom.com.br>
 <87in6o6u5n.fsf@dell.be.48ers.dk>
 <598a385a-5693-8fff-876c-550063645a50@mind.be>
 <87sh5s5aa4.fsf@dell.be.48ers.dk>
 <4be26713-53f3-2b36-f696-2b8fcf227ec3@mind.be>
 <87d0wlonmg.fsf@dell.be.48ers.dk>
Message-ID: <3047d59a-46aa-7678-32a1-971a2c07e0bb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-06-18 10:42, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 12-06-18 16:50, Peter Korsgaard wrote:
>  >>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>  >> 
>  >> >> But it does require people to add swapon/swapoff to their busybox config
>  >> >> even if they aren't using swap, otherwise they would get error messages
>  >> 
>  >> >  I think if people start customizing the busybox config and remove stuff from
>  >> > it, then it's only reasonable that they also modify the default
>  >> > inittab.
>  >> 
>  >> Correct.
>  >> 
>  >> > Swaponand swapoff are both enabled in our busybox.config and busybox-minimal.config.
>  >> 
>  >> Hmm, does swap work on nommu? I would guess not. Looking at the kernel
>  >> option:
> 
>  >  Doesn't matter if it works or not; if the swapon executable exists, then the
>  > swapon in inittab will pass without error (if you don't have swap configured in
>  > fstab). Clearly, the swapon will fail if you indeed have swap enabled in fstab
>  > on a NOMMU system, but I don't think we have to protect against that situation,
>  > right? It will anyway also fail if you don't have swap enabled in the kernel.
>  > Just like mounting the ext2 rootfs will fail if you don't have ext2/3/4 enabled
>  > in your kernel...
> 
> Yes, so the only minor issue is that we need to have swapon/swapoff
> enabled in busybox-minimal.config even though it isn't useful just to
> not get an error message during bootup/shutdown.

 Well, it currently _is_ enabled in busybox-minimal.config... Admittedly, this
adds almost 1KB to the busybox size so perhaps it should be removed from
-minimal. But the we probably should also remove swapoff from inittab. Hell,
perhaps we should do that anyway, since doing swapoff for reboot is utterly
useless IMO.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
