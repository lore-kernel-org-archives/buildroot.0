From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Feb 2014 22:42:52 +0100
Subject: [Buildroot] automated building of Opkg repository
In-Reply-To: <1391454473-6735-1-git-send-email-vmalkani@gmail.com>
References: <Add support for automated building of Opkg repository>
 <1391454473-6735-1-git-send-email-vmalkani@gmail.com>
Message-ID: <20140203224252.78e4b4fc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vinay Malkani,

On Mon,  3 Feb 2014 19:07:52 +0000, Vinay Malkani wrote:

> I updated the patch to work with Description and Version correctly (These were causing compilation errors).
> In addition, I updated the patch to apply cleanly to pre-generic.mk 
> I'm not sure if this is the correct process so I hope this is the correct way to do it.

Thanks for this contribution. I am not sure where the original patch
came from (you're saying that you updated the patch), but
unfortunately, the Buildroot community has collectively decided quite
some time ago that we would not support binary packages suck as ipkg
packages, due to the significant additional complexity that it would
add to the package infrastructure. The problem being that supporting
binary packages is *much* more complicated than just grouping the files
that each Buildroot package installs into different .ipk files.

Yann is currently working on adding a FAQ entry on this topic, see:

  http://lists.busybox.net/pipermail/buildroot/2014-January/086084.html

You can also find a more detailed explanation by reading the chapter
"Package management" in the report of a past Buildroot Developers
Meeting at
http://lists.busybox.net/pipermail/buildroot/2011-November/047229.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
