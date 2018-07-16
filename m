From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 13:18:44 +0200
Subject: [Buildroot] [PATCH] package/automake: bump version to 1.16.1
In-Reply-To: <20180706212709.10376-1-jean-francois.tetu@savoirfairelinux.com>
References: <20180706212709.10376-1-jean-francois.tetu@savoirfairelinux.com>
Message-ID: <20180716131844.5173b878@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Jul 2018 17:27:09 -0400, Jean-Fran?ois T?tu wrote:
> If Buildroot is run from a folder containing a '@' in the path, automake
> will fail since the aclocal Perl script will interpret what is after the
> '@' as an array in its system include paths. This was fixed in automake
> 1.16.1.
> 
> Signed-off-by: Jean-Fran?ois T?tu <jean-francois.tetu@savoirfairelinux.com>
> ---
>  package/automake/automake.hash | 2 +-
>  package/automake/automake.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Since this commit was causing breakage at least in squid, for which the
fix was not yet accepted, I've for now reverted the automake bump.
Could you resend a patch series that includes the automake bump as well
as the fixes for the different packages causing build breakage (i.e at
least squid) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
