From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Aug 2016 23:21:41 +0200
Subject: [Buildroot] [PATCH 2/8] package/rpcbind: include cdefs.h where
 needed
In-Reply-To: <f7f60956c8c50882df893c4aff93799f398d2e8b.1471033837.git.yann.morin.1998@free.fr>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
 <f7f60956c8c50882df893c4aff93799f398d2e8b.1471033837.git.yann.morin.1998@free.fr>
Message-ID: <5216b384-eb69-5f90-c1c2-54e145760da6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-08-16 22:49, Yann E. MORIN wrote:
> rpcbind uses a macro defined in sys/cdefs.h but does not included it
                                                           include
> explicitly, relying on the glibc behaviour to include it from its own
> headers.
> 
> Now that we also have a sys/cdefs.h for musl (which completes the triade
> glibc/uClibc/musl), sys/cdefs.h is always available.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/346/346c5b562c244ddb039db2f86f71d670a01ed9ce/
>     http://autobuild.buildroot.org/results/d77/d77454265c45539178c008c5d92509c441447675/
>     and numerous such autobuild failures
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout
[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
