From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 15:42:17 +0200
Subject: [Buildroot] [PATCH 03/20] package/skeleton: add macro to rsync
 skeleton directory
In-Reply-To: <05879dad2f97f99ddce2b01753aae0e3111f4a43.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <05879dad2f97f99ddce2b01753aae0e3111f4a43.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <20170722154217.07e08c36@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 19:25:29 +0200, Yann E. MORIN wrote:
> The rsync command is currently called from a single location. In
> follow-up patches, it will be called from various places then.
> 
> It will be easier to update and fix this command if it is defined in a
> single location, rather than if duplicated in many places.
> 
> Define a macro that skeleton packages can call to install their skeleton
> directories. Since at least one occurence of it will want to install in
> staging, the macro must accept a destination path, rather than hard-code
> target as the destination.
> 
> Since it is to be used by other skeleton packages, define it early,
> outside of any conditional block.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/skeleton/skeleton.mk | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

I know Arnout was not entirely happy about this solution, but Arnout
comments can be addressed later on, they were not really crucial, and I
want to move forward with applying the rest of the series. Therefore:
patch applied, after fixing the typo pointed by Arnout in the commit
log.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
