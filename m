From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:31:46 +0100
Subject: [Buildroot] [PATCH v2 1/1] pkg-utils: mask tput failure for
 non-interactive sessions
In-Reply-To: <BLU436-SMTP109FC79F88920A925196F40A0A20@phx.gbl>
References: <BLU436-SMTP109FC79F88920A925196F40A0A20@phx.gbl>
Message-ID: <20160221183146.673c827c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Sun, 21 Feb 2016 11:04:58 -0500, James Knight wrote:
> When invoking a build from a non-interactive session (for example, a
> Jenkins build), there is no terminal session to modify. When preparing
> variables to track the bold and boldoff mode sequences, the `tput`
> command will always fail as there is no terminal to query. The following
> change masks the error message when `tput` fails; leaving the TERM_BOLD
> and TERM_RESET variables empty.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
> Changes v1 -> v2:
>   - Removed space in stderr redirection (suggested by Yann E. MORIN).
> ---
>  package/pkg-utils.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
