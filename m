From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:16:13 +0100
Subject: [Buildroot] [PATCH 01/11] support/graph-depends: drop legacy
 target-exceptions
In-Reply-To: <4c3fd092071356256474df1e9b3f6cdb42c5dcf7.1543741464.git.yann.morin.1998@free.fr>
References: <cover.1543741464.git.yann.morin.1998@free.fr>
 <4c3fd092071356256474df1e9b3f6cdb42c5dcf7.1543741464.git.yann.morin.1998@free.fr>
Message-ID: <20181206221613.7633af89@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Dec 2018 10:04:33 +0100, Yann E. MORIN wrote:
> Currently, we avoid drawing the dependencies that we call 'target
> exceptions', becasue they initially were returned by 'show-targets',
> when they in fact were not really packages and thus should not be on
> the graph.
> 
> However, those two exceptions have no longer been reported in the output
> of show-targets since we merged very old initial top-level parallel
> build way back in 2014, with commit a24877586a56 (Makefile: add support
> for top-level parallel make), where they had been converted into purely
> internal rules.
> 
> 4 years have passed, we can now drop those exceptions from the
> graph-depends script.
> 
> This concludes the cleanup initiated three years ago with commit
> 0b32791f0076 (graph-depends: remove absent targets from
> TARGET_EXCEPTIONS).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/graph-depends | 9 ---------
>  1 file changed, 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
