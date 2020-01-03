From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 16:23:52 +0100
Subject: [Buildroot] [PATCH 03/11] support/scripts/pkg-stats: store
 patch info in a hash
In-Reply-To: <20200103151849.10956-4-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-4-heiko.thiery@gmail.com>
Message-ID: <20200103162352.6df5fb35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jan 2020 16:18:40 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> This patch changes the variable to store the patch count to a hash. This
> variable holds the patch count of the packages as well a list of the patch
> file names.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Instead of "hash" you should use "dict", which is the actual name used
in the Python world for this data type, if I'm correct. This is also
valid for PATCH 01/11.

> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 9cfbcf1acc..92fc01d655 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -56,7 +56,7 @@ class Package:
>          self.has_license = False
>          self.has_license_files = False
>          self.has_hash = False
> -        self.patch_count = 0
> +        self.patches = {'count':0, 'files': None}

I am wondering if a dict here is really appropriate, shouldn't we
instead keep a simpler:

	self.patch_count
	self.patch_files

and be done with it ?

Note: I haven't looked at the other patches in your series yet. Maybe
you add more entries to the dict that make it more relevant.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
