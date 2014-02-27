From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Feb 2014 23:44:26 +0100
Subject: [Buildroot] [PATCH v2] libdrm: bump to 2.4.52 and remove
 useless dependencies on libpciaccess
In-Reply-To: <1393539908-14365-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1393539908-14365-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20140227234426.324e0e42@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sebastien Bourdelin,

On Thu, 27 Feb 2014 17:25:07 -0500, Sebastien Bourdelin wrote:
> Since the version 2.4.32, libdrm no longer requires dependencies on
> the libpciaccess unless for the intel-dri.
> 
> For more information :
> http://cgit.freedesktop.org/mesa/drm/commit/?id=be30d350b64c1a83473a9ffbedf8e2c680a65fcd
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> (PATCH v1)
> ---
> Changes v1 -> v2:
>   - bump to version 2.4.52

Thanks a lot for your contribution!

However, the patch has two problems:

 *) You added a significant change (bumping the version number), but
 you kept the Reviewed-by tag of another person. This is typically
 considered as a bad practice: Arnout had endorsed your previous
 version, and maybe not this one.

 *) When your commit log title contains something like "do this *AND*
 do that", it's a strong indication that your patch is not correct, and
 should instead be split in two patches: one "doing this" and the other
 "doing that". In this case, the patch "doing that" could carry
 Arnout's Reviewed-by, since it wouldn't have changed since Arnout's
 review.

Would you mind resending an updated version that takes into account
those comments?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
