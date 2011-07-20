From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Jul 2011 13:00:38 +0200
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <874o2h2pif.fsf@macbook.be.48ers.dk>
References: <201107191222.19313.arnout@mind.be>
 <201107201057.48006.arnout@mind.be> <874o2h2pif.fsf@macbook.be.48ers.dk>
Message-ID: <201107201300.39616.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 20 July 2011 12:52:08, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> Hi,
> 
>  >> > #!/bin/sh
>  >> > # devtmpfs does not get automounted for initramfs'es
>  >> > /bin/mount -t devtmpfs devtmpfs /dev
>  >> > exec /sbin/init $*
>  >> > 
>  >> > Unless BR2_ROOTFS_DEVICE_CREATION_STATIC is enabled.
>  >> 
>  >> Sorry, but this solution smells just like my socks. I think wk can find
>  >> a better one :)
> 
>  Arnout>  Yeah, I also would prefer not to proliferate the number of
>  Arnout> ways that the init process is influenced...
> 
> I don't see what there is to dislike. With this, the non-standard
> behaviour of initramfs'es is nicely self contained within the initramfs
> support code, and nothing else needs to know about it. There's nothing
> to tweak, and it just works out of the box (tm), no matter what init
> implementation or custom inittab is used.


 But next thing you know, some other piece of Makefile also wants to do 
something with /init...

 Since it potentially interacts with other parts of the build, I would argue 
that it _should_not_ be self-contained.

 That said, I'm not too enthousiastic about the rc.S solution either, since it 
may also interact badly with alternative init procedures.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
