From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 9 Feb 2021 08:06:18 +0100
Subject: [Buildroot] [PATCH] package/connman: add upstream security
 fixes for CVE-2021-2667{5, 6}
In-Reply-To: <87sg66s1u5.fsf@dell.be.48ers.dk>
References: <20210208093921.3216-1-peter@korsgaard.com>
 <CAEyMn7aqMeyjFmJcymQfDkhy6t4YJmeSPXYLAqj+KMdCfJ55yQ@mail.gmail.com>
 <87sg66s1u5.fsf@dell.be.48ers.dk>
Message-ID: <CAEyMn7aKi4oj-mjDVmRrfHMLNW=TwkX0Lq1myytpBUGw6RQftg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am Mo., 8. Feb. 2021 um 22:10 Uhr schrieb Peter Korsgaard <peter@korsgaard.com>:
>
> >>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:
>
>  > Hi Peter,
>  > Am Mo., 8. Feb. 2021 um 10:39 Uhr schrieb Peter Korsgaard <peter@korsgaard.com>:
>  >>
>  >> Fixes the following security issues:
>  >>
>  >> - CVE-2021-26675: Remote (adjacent network) code execution flaw
>  >> - CVE-2021-26676: Remote stack information leak
>  >>
>  >> For details, see the advisory:
>  >> https://www.openwall.com/lists/oss-security/2021/02/08/2
>  >>
>  >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  >> ---
>  >> ...ding-invalid-data-in-dhcp_get_option.patch | 226 ++++++++++++++++++
>  >> ...ing-stack-data-via-unitiialized-vari.patch |  27 +++
>  >> ...gth-checks-to-prevent-buffer-overflo.patch |  56 +++++
>  >> 3 files changed, 309 insertions(+)
>  >> create mode 100644
>  >> package/connman/0001-gdhcp-Avoid-reading-invalid-data-in-dhcp_get_option.patch
>  >> create mode 100644
>  >> package/connman/0002-gdhcp-Avoid-leaking-stack-data-via-unitiialized-vari.patch
>  >> create mode 100644
>  >> package/connman/0003-dnsproxy-Add-length-checks-to-prevent-buffer-overflo.patch
>
>  > A new version [1] was released today that has these patches
>  > integrated. Maybe we should bump to that.
>
>  > [1]
>  > https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=47bd7ab21bfbe115ca4a10b9b96bdbfeb6c35bff
>
> I would prefer to add the security patches now, as they are lower risk
> to backport to 2020.02.x (1.39 has ~100 changes on top of 1.38).

Ah ok .. that makes sense.


> But we can certainly bump to 1.39 on master, care to send a patch?

I will do it.

-- 
Heiko
