From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jun 2016 15:52:33 +0200
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <20160629155233.510c456e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jun 2016 15:46:07 +0200, Julien Floret wrote:
> A lot of host packages are never built, because they don't have a
> Config.in option, and are never referenced in other packages'
> dependencies.
> 
> This series removes them to avoid maintaining unneeded code; they
> will still be in git history if some are needed again in the future.
> 
> The other motivation behind this cleanup is that I'm starting to think
> about a new proposal for speeding up the Makefile parsing, similar to
> what Thomas proposed here:
> http://lists.busybox.net/pipermail/buildroot/2014-March/092548.html
> 
> As Thomas explained, this change would imply adding blind Config.in
> options for all host packages. It's quite a big change, so a little
> preliminary cleanup could help.

I haven't looked at the series, but did you take into account that just
grepping for "host-foo" is not sufficient to know if the host-foo
package is used or not?

Indeed, if a package has:

BAR_DEPENDENCIES = foo

then host-bar automatically has a dependency on host-foo, without
host-foo being written anywhere.

Can you confirm this is something you have taken into account?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
