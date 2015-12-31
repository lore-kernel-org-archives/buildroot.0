From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 10:33:43 +0100
Subject: [Buildroot] [PATCH] Config.in: add symbols for
 BR2_HOST_GCC_AT_LEAST_X_Y
In-Reply-To: <1451522053-2797-1-git-send-email-arnout@mind.be>
References: <1451522053-2797-1-git-send-email-arnout@mind.be>
Message-ID: <20151231103343.31187340@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Thu, 31 Dec 2015 01:34:13 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Arnout Vandecappelle <arnout@mind.be>
> 
> Some host packages need a recent gcc version. Add symbols to Config.in
> to specify the HOSTCC version. The values are passed through the
> environment, and this environment is generated in a new support script.
> 
> Also update the documentation to mention the new symbols.
> 
> [Thomas: simplify by using only make logic instead of an external
> shell script.]
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v4: Further simplification by Arnout: no post-processing is needed for
>     4.X versions if we keep the space in "4 9". Also use extended regex
>     to simplify the sed script a little.
> v3: Alternative version by Thomas that removes the external shell
>     script.
> v2: Use a single environment variable and select statements (Yann)
>     This makes the shell script ridiculously simple. I've tried to move
>     it to the Makefile, but then all the additional quoting etc. makes
>     it complicated again.
> ---
>  Config.in                                 | 24 ++++++++++++++++++++++++
>  Makefile                                  |  9 +++++++++
>  docs/manual/adding-packages-directory.txt |  7 +++++++
>  3 files changed, 40 insertions(+)

I had also thought about keeping the space in the value, but found the
"subst" wasn't too bad. But well, I agree that your solution further
simplifies the thing.

I'm glad we've been able to move from a somewhat complicated and
convoluted solution (a shell script that generates a list of
environment variables) to a solution that is in fact completely trivial.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
