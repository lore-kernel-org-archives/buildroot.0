From: Chris Kerios <ckerios@gmail.com>
Date: Wed, 29 Feb 2012 19:40:39 -0500
Subject: [Buildroot] Buildroot 2012.02-rc3 released
In-Reply-To: <201203010017.12296.arnout@mind.be>
References: <87ehtg2r6n.fsf@macbook.be.48ers.dk>
 <201203010037.49778.yann.morin.1998@free.fr>
 <CAJJ6jxv1JvMsK7pMgQJ85DHDiz=on8zO3Mux0KigJHpq-a3_ZQ@mail.gmail.com>
 <201203010017.12296.arnout@mind.be>
Message-ID: <CAKyeDQ8=cGnDquvd1vdzCsKRR4a3n1_GohnmKZs4i85BUA+d9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 29, 2012 at 7:17 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Wednesday 29 February 2012 23:48:36 Steve Calfee wrote:
>> Both systems sit on a NAT LAN with 192.168* ip addresses. I don't know
>> if that affects things, shouldn't.
>
> ?It will. ?The DNS on the NAT will cache the authoritive server for
> uclibc.org. ?If the original uclibc.org DNS server still replies to DNS
> requests, but doesn't give answers for uclibc.org addresses, then the NAT
> will not look further. ?You can verify this by issuing
>
> host -v -t SOA uclibc.org
>
> which should reply
>
> uclibc.org. ? ? ? ? ? ? 86125 ? IN ? ? ?SOA ? ? ns1.auth.osuosl.org. hostmaster.osuosl.org. 1330554603 300 900 604800 86400
>
> but will probably reply with the old DNS server.
>
> ?There is unfortunately no way to force your NAT to forget the cached
> record. ?You can try to NOT access any uclibc.org site for 48 hours,
> which may expire the cache.
>
> ?To fix it, something must be done at the old DNS server. ?I don't know
> what needs to be done exactly.
>
> ?Regards,
> ?Arnout
>
> --
> Arnout Vandecappelle ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? arnout at mind be
> Senior Embedded Software Architect ? ? ? ? ? ? ? ? +32-16-286540
> Essensium/Mind ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium ? ? ? ? ? ? ? ?BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint: ?7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Arnout is definitely onto something.  Now that he brings it up this
way it also explains my work/home situation.  Both boxes are sitting
behind NAT'd devices.  I take it that I can't just reset my router to
clear the DNS cache record???  I tried it here at home and it didn't
work.

Regards,
Chris
