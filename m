From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 11:00:06 +0100
Subject: [Buildroot] [PATCH] support/graph-depends: fix package names
 starting with a non-char
In-Reply-To: <20181124093452.12350-1-yann.morin.1998@free.fr>
References: <20181124093452.12350-1-yann.morin.1998@free.fr>
Message-ID: <20181124110006.76144259@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 10:34:52 +0100, Yann E. MORIN wrote:
> Graphviz' dot utility does not like nodes which names does not start
> with an ^[[:alpha:]], i.e. 18xx-ti-utils would cause grievance:
> 
>     Warning: syntax ambiguity - badly delimited number '18x' in line 4 [...]/graph-depends.dot splits into two tokens
>     Warning: syntax ambiguity - badly delimited number '18x' in line 5 [...]/graph-depends.dot splits into two tokens
>     Warning: syntax ambiguity - badly delimited number '18x' in line 6 [...]/graph-depends.dot splits into two tokens
>     Warning: syntax ambiguity - badly delimited number '18x' in line 7 [...]/graph-depends.dot splits into two tokens
> 
> Prefix nodes with an underscore to fix that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/graph-depends | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master after changing "non-char" to "non-alpha" in the
commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
