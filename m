From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2016 17:11:45 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts/apply-patches.sh:
 handle tar and mkdir failures
In-Reply-To: <1464178439-3333-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1464178439-3333-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20160525171145.6d8950d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 May 2016 14:13:59 +0200, S?bastien Szymanski wrote:
> With several archives in a space-separated list of patches, if one archive
> cannot be untar (i.e because it is not readable), Buildroot keeps going instead
> of aborting. Fix this by checking the tar return code.
> While at it, check if the unpack archive directory creation is successful.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  support/scripts/apply-patches.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Thanks for the patch. One question though: are you actually using the
capability of Buildroot to take a tarball, and apply the patches that
it contains? If so, for what use case?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
