From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Dec 2020 11:26:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/rhash: fix build failure due to
 gcc -v
In-Reply-To: <87o8ifd6ns.fsf@dell.be.48ers.dk>
References: <20201203202853.616174-1-fontaine.fabrice@gmail.com>
 <20201225223441.GH1680670@scaer> <87o8ifd6ns.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W81o7h3xRBb5_GjgrmuEpn+M+b4LrD4=D97tbPVrM0BKbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le dim. 27 d?c. 2020 ? 08:55, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > Fabrice, All,
>  > On 2020-12-03 21:28 +0100, Fabrice Fontaine spake thusly:
>  >> Fixes:
>  >> - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20
>  >>
>  >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
>  > Applied to master with the following changes:
>
>  >   - retain "$CC -v" as default, fallback to "$CC --version", in the hope
>  >     that it stands better chance with upstream
>  >   - write a commit log to explain the actual root-cause of the build
>  >     failure
>
> This is only an issue with rhash 1.4.0, and not the older versions we
> have on the stable branches, right?
Right, this issue is raised by the configure script which is available
since version 1.3.6.
We're using it since our bump to version 1.4.0 with commit
cdaf43862229fb0f10d2b6b7448bcded2ef8edde.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
