From: Stefan Becker <chemobejk@gmail.com>
Date: Wed, 13 Jun 2018 10:59:29 +0300
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <4d151eb4-bc60-fc45-e6af-8979af2d994e@mind.be>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
 <9ca7c9e9-061c-1dfb-f348-b92407b2f7e0@mind.be>
 <1528825657.28705.168.camel@impinj.com>
 <4d151eb4-bc60-fc45-e6af-8979af2d994e@mind.be>
Message-ID: <CAOJ2eMdA-yHVt3uOAoc8_yA_iMQY4Efo5T45Z_DrmBsFtnJD0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

On Wed, Jun 13, 2018 at 10:46 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Is the idea that you have one buildroot build, it creates a docker image, and
> that docker image is then used for several application builds? Sounds like a
> pretty neat setup.

Docker isn't really a requirement for such an approach, but it can
make life much simpler in a fractured IT environment.

We use the sdk build artefact from a common buildroot automated build
in our CI system without using docker. Having fast CI builds (< 5mins)
for our own components/device images and that no developer ever has to
run slow buildroot builds are a big plus :-) As there is only one
buildroot build makes tracking buildroot upstream much easier.

Regards, Stefan
