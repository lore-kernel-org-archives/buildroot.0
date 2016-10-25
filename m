From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 23:49:53 +0200
Subject: [Buildroot] [PATCH 1/2 v2] support/download: make the git
 wrapper more robust
In-Reply-To: <dfa66e5e537b137b49627a284ad872c6676f916b.1470004037.git.yann.morin.1998@free.fr>
References: <cover.1470004037.git.yann.morin.1998@free.fr>
 <dfa66e5e537b137b49627a284ad872c6676f916b.1470004037.git.yann.morin.1998@free.fr>
Message-ID: <20161025234953.5b20eca8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Aug 2016 00:35:55 +0200, Yann E. MORIN wrote:
> Currently, there are two failure paths in the wrapper:
> 
>   - if the tar fails, then the error is ignored because it is on the
>     left-hand-side of a pipe;
> 
>   - if the find fails, then the error is ignored because it is a
>     process substitution (and there is a pipe, too).
> 
> While the former could be fixed with "set -o pipefail", the latter can
> not be fixed thusly and we must use an intemediate file for it.
> 
> So, fix both issues by using intermediate files, both to generate the
> list of files to include in the archive, and generate the archive in a
> temporary tarball.
> 
> Fixes the following build issue, where the find is failing for whatever
> unknown reason:
>     http://autobuild.buildroot.net/results/20f/20fd76d2256eee81837f7e9bbaefbe79d7645ae9/
> 
> And this one, where the process substitution failed, also for an unknown
> reason:
>     http://autobuild.buildroot.org/results/018/018971ea9227b386fe25d3c264c7e80b843a9f68/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2:
>   - also drop the pipe of the find command
> ---
>  support/download/git | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
