From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 23:14:39 +0100
Subject: [Buildroot] [PATCH v5] toolchain: allow side by side sysroot
 directories
In-Reply-To: <1452620978-60112-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1452620978-60112-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160119231439.4b63712c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 12 Jan 2016 17:49:38 +0000, Vicente Olivert Riera wrote:
> Currently our toolchain infrastructure assumes that every toolchain has
> nested sysroot directories. However that's not true for all of them. The
> Codescape toolchains from Imagination Technologies use a side by side
> sysroot structure, for instance.
> 
> This patch allows our toolchain infrastructure to detect what kind of
> sysroot structure we have (nested or side by side) and performs the
> appropriate actions.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> ---
> Changes v4 -> v5:
>  - Add an echo to display what is being symlinked. (Suggested by Romain)
> Changes v1 -> v4:
>  - This patch didn't exist before. It has been introduced in v4.

I've applied after updating the comment above the function to explain
what's going on. It's a pity we can't have inline comments in those big
shell blocks. Part of my mid-term goal is to move some of this crap to
helper shell scripts, which would simplify the syntax and allow the
addition of comments everywhere.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
