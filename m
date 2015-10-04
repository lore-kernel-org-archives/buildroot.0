From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 15:55:11 +0100
Subject: [Buildroot] [PATCH v4 1/3] skeleton: Clean up profile file
In-Reply-To: <1443884002-13585-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443884002-13585-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151004155511.047ca1ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime,

On Sat,  3 Oct 2015 16:53:20 +0200, Maxime Hadjinlian wrote:
> There's a lot of code in /etc/profile, which doesn't really belong in a
> minimal default skeleton.
> 
> Also, add an 'unset i' to avoid clutter.
> 
> If the user has a specific needs, it needs to be added in
> /etc/profile.d/ by a post-build script.
> 
> Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v3 -> v4:
>     - Enclose export PS1 in a "if [ "$PS1" ]; then" so it's only for an
>       interactive session.
>     - Fix commit log (add unset i)
> v1 -> v2:
>     - Don't change indent and don't fix 'pretty' stuff
>     - Keep PS1 , PAGER and EDITOR setted.
>     - At the end of the for loop, add unset i
> ---
>  system/skeleton/etc/profile         | 56 +++++--------------------------------
>  system/skeleton/etc/profile.d/umask |  1 +
>  2 files changed, 8 insertions(+), 49 deletions(-)
>  create mode 100644 system/skeleton/etc/profile.d/umask

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
