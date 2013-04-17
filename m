From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Apr 2013 08:23:22 +0200
Subject: [Buildroot] modifying buildroot for non- linux freertos
In-Reply-To: <516C76DC.3000607@gmail.com>
References: <516C76DC.3000607@gmail.com>
Message-ID: <516E3FDA.6040109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Peter,

On 15/04/13 23:53, Peter Saunderson wrote:
[snip]
> The problem originates because newlib (http://sourceware.org/newlib/) has
> a different build style to uClibc but using uclibc.mk as a starting point
> for newlib.mk and making major mods I can get most things working.  I
> have built all the output/host/usr/bin tools but
> $(GCC_BUILD_DIR3)/.installed target has not been run so there is no
> $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc but my newlib build is trying
> to use it.  So what I think I need to do is delay the build of newlib and
> I am not sure how to do that yet.  So I am puzzling over
> $(GCC_BUILD_DIR1)/.configured:, $(GCC_BUILD_DIR2)/.configured: and
> $(GCC_BUILD_DIR3)/.configured: targets and wondering to myself what bit
> in buildroot sequences these and how can I fit my new newlib targets into
> the right place in the build sequence.  If you have read up to this point
> you may have a view or some tips. Perhaps there is a good guide that I
> have missed that could help?  I did a search of the archive but did not
> find anything that was of immediate assistance.  Perhaps there is a
> better place to ask this question?  Perhaps is such an interesting
> problem that you would like to see me create a new git project for it?

  I'm afraid that the expertise on the internal buildroot toolchain build 
process is not here anymore. Some buildroot developers understand how the 
.mk file works, but not really why things were done in that particular way...

  But anyway, I don't think you really need buildroot for this. Buildroot 
is meant for building packages for the target, and just builds some host 
packages that are needed for building some of these packages. I think 
crosstool-NG is a much better fit for your purpose. It's build system is 
pretty complex, but I think it's still easier to understand than the 
buildroot system. Also, crosstool-NG might be interested in adding 
support for newlib (as an alternative to uClibc) in its core infrastructure.

  BTW, you could also consider looking at musl instead of newlib.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
