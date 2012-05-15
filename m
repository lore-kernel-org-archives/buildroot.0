From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 May 2012 08:32:31 +0200
Subject: [Buildroot] autobuild: group similar failures
In-Reply-To: <201205142322.44867.yann.morin.1998@free.fr>
References: <201205142322.44867.yann.morin.1998@free.fr>
Message-ID: <4FB1F87F.5060505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/14/12 23:22, Yann E. MORIN wrote:
> Although successful builds are nice, the interesting logs are those that
> relate to build failures. Having the ability to sort and categorise those
> failed logs would hopefully help in solving the most common build failures.

  +1

> For example, in the recent past, there were two related alsa-libs build
> failures on PowerPC:
>    http://autobuild.buildroot.net/results/a8471598a379e5dbecef539479b968947474ef22/
>    http://autobuild.buildroot.net/results/05b306ee2fa909420e4bc1f9faa7a35d17d786a7/
>
> I did not look in details, but it may well be that there are other similar
> build failures of alsa-libs on PowerPC. Solving the error in one of those
> builds would also solve the other(s).
>
> So, we need a heuristic to detect how similar two failed build logs are, and
> eventually group those failures together. Below is such simple heuristic:
>
>   1- extract the last 100 lines-or-so from two build logs (already done)
>   2- sort each extract
>   3- diffstat the sorted extracts
>   4- the lower the number of different lines, the higher the similarity

  A much simpler heuristic would be to put failures of the same package together.
It's very likely that they're the same.  The diffstat has the disadvantage that
it can still be pretty different if the compiler path is different (for packages
that don't do a quiet make like alsa-libs does).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
