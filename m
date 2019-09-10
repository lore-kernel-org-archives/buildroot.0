From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 12:04:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: increase gcc version
 dependency
In-Reply-To: <20190821132153.GC26497@coltrane>
References: <20190821132153.GC26497@coltrane>
Message-ID: <20190910120427.09e0857a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 21 Aug 2019 15:21:54 +0200
Koen Martens <gmc@sonologic.nl> wrote:

> The new version of capnproto requires c++14, therefore
> the dependency has been increase from at least gcc 4.8
> to at least gcc 5.x.
> 
> This patch should be applied to a branch that already
> has the patch that increases the capnproto version to
> 0.7.0. At the time of writing this, that means the next
> branch.
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>

Thanks for this contribution. Unfortunately, your patch wasn't correct:
it was only updating the Config.in, but not the dependency of the
package itself, so it was in fact doing nothing. Also, c-capnproto had
to be fixed as well, as it selects capnproto. In the mean time, Joel
Carlson provided correct patches, which I just merged.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
