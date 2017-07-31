From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 00:02:31 +0200
Subject: [Buildroot] [PATCH 02/14 v4] package/skeleton: drop dependency
 on host-mkpasswd
In-Reply-To: <6908ec7ba552d56e5a88087aa08e3c33bb5834e1.1501017251.git.yann.morin.1998@free.fr>
References: <cover.1501017251.git.yann.morin.1998@free.fr>
 <6908ec7ba552d56e5a88087aa08e3c33bb5834e1.1501017251.git.yann.morin.1998@free.fr>
Message-ID: <20170801000231.7b50ed95@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Jul 2017 23:14:23 +0200, Yann E. MORIN wrote:
> Setting the root pasword is done in a target-finalize hook, so we do not
> need to enforce a dependency from the skeleton onto host-mkpasswd.
> 
> Dropping that dependency will simplify making skeleton a virtual
> package (in up-coming changes).
> 
> Instead, it is now selected as any other package. As such, it is
> guaranteed to be built before target-finalize.
> 
> This however introduces a slight change in behaviour: previously,
> host-mkpasswd would only be built if we needed to hash the root password
> from its plain-text value. Now, host-mkpasswd is always built as soon as
> the root password is non-empty, even if already pre-hashed.
> 
> Since host-mkpasswd is a really tiny weeny package bundled in Buildroot,
> with only two C files, built as a single unit with a single gcc call,
> the overhead is really minimal. Compared to the simplifications this
> will allow in the skeleton packages (plural: common, sysv, systemd,
> custom) to come, this overhead is acceptable.
> 
> Yet another simplification, even if small, to ease providing multiple
> skeletons.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ---
> Changes v3 -> v4:
>   - add blurb that is is selected, so built before target-finalize
>     (Arnout)
> ---
>  package/skeleton/skeleton.mk | 1 -
>  system/Config.in             | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
