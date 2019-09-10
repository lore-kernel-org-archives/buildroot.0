From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 12:02:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/capnproto: require GCC 5 for
 C++14
In-Reply-To: <20190909185215.26744-1-JoelsonCarl@gmail.com>
References: <20190909185215.26744-1-JoelsonCarl@gmail.com>
Message-ID: <20190910120224.5fb7f508@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joel,

On Mon,  9 Sep 2019 12:52:14 -0600
Joel Carlson <joelsoncarl@gmail.com> wrote:

> Adds dependency on at least GCC 5 to have C++14 language features that
> are required starting in version 0.7.0 of capnproto.
> 
> Fixes:
> http://autobuild.buildroot.org/results/5c09e745cab822d830f73e33647f3b0e765c9181
> (capnproto build failure)
> 
> Fixes:
> http://autobuild.buildroot.org/results/743c750e9932658c20965a25de89c3f21a1d43e9
> (host-capnproto build failure)
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> 
> ---
> Picking this up from https://patchwork.ozlabs.org/patch/1150841/
> which only changed the config comment dependencies and not the actual
> build dependencies.
> ---
>  package/capnproto/Config.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

I've applied both, but after squashing them together. Indeed,
c-capnproto selects capnproto, so applying 1/2 without 2/2 would not
work, so it's really one change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
