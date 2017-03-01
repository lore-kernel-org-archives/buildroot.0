From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 Mar 2017 08:49:47 +0100
Subject: [Buildroot] [PATCH 0/5] package/cmake: re-introduce cmake-3.7
In-Reply-To: <cover.1488305206.git.yann.morin.1998@free.fr>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
Message-ID: <1e11d59e-9274-f4fb-f966-002c26ca6247@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-02-17 19:07, Yann E. MORIN wrote:
> Once we have this support, we can bump cmake again. We reuse the four
> original patches, to keep authoorship (although they could well all be
> squashed into one).

 I don't think it makes much sense to keep the 4 separate patches. The history
shows the authorship of the original bump. Having the 4 separate patches just
adds noise to the history. Also, Thomas reported that the libuv dependency
introduced by the bump is probably incorrect, so we'd have to revert patch 4/5
and part of patch 2/5 again later on... And if the dependency on libuv *is*
needed, then you re-introduce a non-bisectable commit between patch 2/5 and 4/5.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
