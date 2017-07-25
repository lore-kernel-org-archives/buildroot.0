From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:24:58 +0200
Subject: [Buildroot] [PATCH] autobuild-run: add --repo option
In-Reply-To: <20170717212859.12581-1-arnout@mind.be>
References: <20170717212859.12581-1-arnout@mind.be>
Message-ID: <20170725222458.53c4992b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jul 2017 23:28:59 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This option allows to specify which Buildroot git repository to clone.
> This can be useful in several situations:
> - to use a different mirror in case you don't have a good connection to
>   github;
> - for debugging this script;
> - to point to a local, patched repository you want to test.
> 
> Note that the clone/pull will use the currently checked out branch of
> the repository if it is non-bare, which is ideal for testing.
> 
> Since switching repositories may also switch branches, we use a git
> fetch/checkout sequence instead of doing a git pull. With git pull, the
> branches would be merged instead of switched. To avoid polluting the
> log with the long git message about a detached head, while still
> getting some useful output from git, pass the --detach option to
> git checkout.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Ideally the contents of this commit message would be put somewhere as
> documentation, but I couldn't find a good spot for it.
> ---
>  scripts/autobuild-run | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Applied to buildroot-test, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
