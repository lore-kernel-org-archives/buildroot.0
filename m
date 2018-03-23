From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Mar 2018 23:39:47 +0100
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <20180322164144.GY14461@australia>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 <87muz5fp2n.fsf@dell.be.48ers.dk> <20180318161530.GA2478@scaer>
 <87efkhfimu.fsf@dell.be.48ers.dk> <20180322164144.GY14461@australia>
Message-ID: <491c4cfa-b468-7208-2e38-690cdcec222f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-03-18 17:41, Thomas De Schampheleire wrote:
> Hi all,
> 
> On Sun, Mar 18, 2018 at 05:33:45PM +0100, Peter Korsgaard wrote:
>>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
[snip]
> The current timestamp-based approach not guaranteeing an accurate list is
> problematic for many such uses. And as you already mentioned, since we don't have
> full control over the build steps done in any given package, we don't know which
> timestamps they will use. There may be very good reasons to install certain
> files with their original timestamp and not the one from the build.

 We could revert to the original before/after file list approach, and just use
something like "stat -c '%N %Y %f'" instead of md5sum.

 Though I certainly like Trent's idea of installing each package in a separate
directory, too. With PPS we're more or less there anyway. We'd just need to step
up the adoption rate of PPS then :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
