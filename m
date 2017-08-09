From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 00:32:11 +0200
Subject: [Buildroot] [PATCHv2] fs/squashfs: honour the number of
 parallel jobs
In-Reply-To: <20170806154102.24807-1-yann.morin.1998@free.fr>
References: <20170806154102.24807-1-yann.morin.1998@free.fr>
Message-ID: <cdf52f07-6fbb-4b15-b846-99e243fa954b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-08-17 17:41, Yann E. MORIN wrote:
> By default, mksquashfs uses all the CPUs available, like us with
> BR2_JLEVEL=0.
> 
> However, by setting BR21_JLEVEL to non-zero, a user volutarily limits
> the number of jobbs allowed to run concurrently (for various reasons,
> like this is not a priority task on the machine; or like the
> autobuilders, to spread the load accross multiple runs without
> overloading the machine).
> 
> So, propagate tthe parallelisn settings down to mksquashfs, to repect
> the user's will.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

 Applied to next, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
