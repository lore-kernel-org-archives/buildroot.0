From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:21:49 +0200
Subject: [Buildroot] [PATCH 1/2] nvme: fix libuuid test when cross
 compiling
In-Reply-To: <f2563e1cd77f4d5ca181a015d57d36ea3f561bc7.1502261950.git.baruch@tkos.co.il>
References: <f2563e1cd77f4d5ca181a015d57d36ea3f561bc7.1502261950.git.baruch@tkos.co.il>
Message-ID: <6d525170-243f-1698-f19b-45ec3ede8177@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-08-17 08:59, Baruch Siach wrote:
> Use $(LD) to test whether libuuid is installed, so that we check the target,
> not the host.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e26/e263ffbf8947374c2aac73ab42edcbf4d9a3600a/
> http://autobuild.buildroot.net/results/53b/53b2d1e0c3cdeafb980389bcfd8a10b6ca48fbc2/
> 
> Cc: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 Both applied to master, thanks.

[snip]
> +-LIBUUID = $(shell ld -o /dev/null -luuid >/dev/null 2>&1; echo $$?)
> ++LIBUUID = $(shell $(LD) -o /dev/null -luuid >/dev/null 2>&1; echo $$?)

 Even better would be to use pkg-config --exists uuid, but OK.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
