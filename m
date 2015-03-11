From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Mar 2015 23:04:19 +0100
Subject: [Buildroot] Reduce toolchain options
In-Reply-To: <550069E9.5060403@zacarias.com.ar>
References: <550069E9.5060403@zacarias.com.ar>
Message-ID: <5500BBE3.2030709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/15 17:14, Gustavo Zacarias wrote:
> 
> Hi.
> How about we kill non-lfs and non-ipv6 toolchains?

 Sounds like a good idea!

> It's 2015 after all, and the size delta is minor:
> 
> tar file delta, arm926 uclibc+busybox
> =====================================
> Threading (NPTL)        +153600 bytes
> Largefile               +20480 bytes
> IPv6                    +10240 bytes
> RPC                     +61440 bytes
> WCHAR                   +30720 bytes

 Could you calculate this with STATIC and thumb and also report the baseline?
IIRC a minimal statically linked busybox was only about 200K so the 20K
largefile is borderline significant...


 Regards,
 Arnout

> 
> Benefits:
> * Less toolchain options to test/care for in packages
> * More bang for the buck for autobuilders with less combinations to test
> 
> Even though the size delta would be somewhat more (tiny though) when
> adding packages/libraries that's generally offset by the added size of
> said packages.
> 
> The only downside i can think of is badly designed packages that won't
> work well on a non-ipv6 linux kernel. These should be very few, if any.
> 
> LFS is a no brainer IMO.
> 
> Regards.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
