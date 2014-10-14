From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Oct 2014 22:58:28 +0200
Subject: [Buildroot] using BR2 variables to find a specific header file
In-Reply-To: <20141013123003.49dcf374@core2quad.morethan.org>
References: <543C0775.3090701@green-communications.fr>
 <20141013123003.49dcf374@core2quad.morethan.org>
Message-ID: <543D8E74.8080109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/10/14 19:30, Mike Zick wrote:
> On Mon, 13 Oct 2014 19:10:13 +0200
> Sylvain Raybaud <sylvain.raybaud@green-communications.fr> wrote:
> 
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> > 
>> > Dear all
>> > 
>> > I'm trying to integrate a cmake based package wich is not very
>> > cross-compiling friendly (MariaDB galera cluster). During normal
>> > compile this package runs some tests in order to determine if stacks
>> > grows downward or upward. During cross-compile these tests cannot be
>> > run therefore the package expects -DSTACK_DIRECTION=+/-1 to be passed
>> > to cmake. Of course you cannot do it in buildroot.
>> >
> I think that the only processor where the stack grows up is PA-RISC.
> Which is not one of the Buildroot supported processors.
> 
> So just hard code it (by patching if required) to down.

 I did a quick check in the gcc 4.9.1 sources, and indeed it seems that the only
architectures that don't have it downward are PA-RISC, Xstormy16 and VMS. So
you're safe with hardcoding it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
