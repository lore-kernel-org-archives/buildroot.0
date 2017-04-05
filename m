From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Apr 2017 16:37:23 +0200
Subject: [Buildroot] [PATCH 0/7 v4] support/test-pkg: fixes and
 enhancements
In-Reply-To: <cover.1487195062.git.yann.morin.1998@free.fr>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
Message-ID: <b39f073b-f6fb-d0e4-9977-31dc8c4d51e1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-02-17 22:44, Yann E. MORIN wrote:
> Hello All!
> 
> This series brings a few fixes and improvements to the test-pkg script.

 I was going to modify test-pkg to use the toolchains from configs/toolchains,
but then I noticed this series was still not committed. It obviously conflicts
heavily with what I'm going to do, so I'm taking this over, OK?

[snip]

> ----------------------------------------------------------------
> Yann E. MORIN (7):
>       docs/manual: document the test-pkg script

 I'll include Thomas's feedback, plus some more fixes from me.

>       support/test-pkg: add option to use an alternate list of toolchains

 I'll drop this, since we're not going to get toolchains from a URL anymore. IMO
the same feature can easily be achieved by having a directory with toolchain
configs inside the tree (or inside an external tree).

>       support/test-pkg: print number of toolchain and progress
>       support/test-pkg: the list of toolchains really contains URLs

 With the toolchain URLs gone, this is not true anymore.

>       support/test-pkg: cannonicalize paths early

 With the toolchain URLs gone, this is not relevant anymore.

>       support/test-pkg: create build dir from caller

 Took me a while to figure out what this patch was doing, so I'll reword the
commit message.


 Regards,
 Arnout

>       support/test-pkg: run legal-info
> 
>  docs/manual/adding-packages-tips.txt |  91 +++++++++++++++++++++++++++++++
>  support/scripts/test-pkg             | 101 +++++++++++++++++++++++------------
>  2 files changed, 159 insertions(+), 33 deletions(-)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
