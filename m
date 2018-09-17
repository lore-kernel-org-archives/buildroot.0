From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Sep 2018 18:30:48 +0930
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-09-16
In-Reply-To: <20180917060013.C3F5720733@mail.bootlin.com>
References: <20180917060013.C3F5720733@mail.bootlin.com>
Message-ID: <CACPK8Xf9jt4KUow27Um6+VZP35LsCL9s3G=JxcBNUGdaxn1QyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Sep 2018 at 15:30, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Build statistics for 2018-09-16
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  35 |   3 |   0 |  38 |
>    2018.05.x |  25 |   1 |   0 |  26 |
>       master | 213 | 100 |   0 | 313 |
>
> Results for branch '2018.02.x'
> ==============================

>  powerpc64le |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/bf0bd861ee3abf16c372df5a597f574ab0452632 | ORPH

I tried to reproduce this locally, and I think it is related to the
glibc-2.28 issue. We need these two cherry picked to the 2018.02.x
branch:

c48f8a64626c60bd1b46804b7cf1a699ff53cdf3 package/m4: fix build on host
with glibc-2.28
373ac58b82d2430b745e90c7c8b39e319949882a package/bison: fix build on
host with glibc-2.28

(I only tested 'make host-flex', so there might be further failures).

Cheers,

Joel
