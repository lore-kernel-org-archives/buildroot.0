From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Mar 2016 17:03:40 +0100
Subject: [Buildroot] [PATCH 6/6] linux/perf: build the host perf tool
In-Reply-To: <20160319145515.32875737@free-electrons.com>
References: <cover.1457720152.git.yann.morin.1998@free.fr>
 <b5f50fa3c517ddd37dbf339c011f6bf0621f55ac.1457720152.git.yann.morin.1998@free.fr>
 <20160319145515.32875737@free-electrons.com>
Message-ID: <56ED785C.4050005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/16 14:55, Thomas Petazzoni wrote:
> On Fri, 11 Mar 2016 19:19:59 +0100, Yann E. MORIN wrote:
>> >Currently, we only build the target variant of the perf tool. However,
>> >perf on the target may generate a bunch of data files that may have to
>> >be analysed on the host.
>> >
>> >There is no host-variant of the linux-tools infrastructure, so we just
>> >build the host perf at the same time we build the target one.
>> >
>> >Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
>> >Cc: Thomas De Schampheleire<patrickdepinguin@gmail.com>
> First of all, I have to say I hate this target package that builds and
> installs host stuff. But, since I don't have a better solution to
> offer, and it's anyway not the only package in this case (qt/qt5 are
> also target packages, and they install stuff in host), I'm fine with
> the general approach.

  I think it's OK to build and install host tools that are bound tightly with 
the target package. E.g. qmake only makes sense when you have qt for the target. 
perf is in the same boat.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
