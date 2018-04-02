From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 10:40:41 +0200
Subject: [Buildroot] [v4 01/13] core/pkg-download: change all helpers to
 use common options
In-Reply-To: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402104041.1d8ead45@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Apr 2018 10:14:22 +0200, Maxime Hadjinlian wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently all download helpers accepts the local output file, the remote
> locations, the changesets and so on... as positional arguments.
> 
> This was well and nice when that's was all we needed.
> 
> But then we added an option to quiesce their verbosity, and that was
> shoehorned with a trivial getopts, still keeping all the existing
> positional arguments as... positional arguments.
> 
> Adding yet more options while keeping positional arguments will not be
> very easy, even if we do not envision any new option in the foreseeable
> future (but 640K ought to be enough for everyone, remember? ;-) ).
> 
> Change all helpers to accept a set of generic options (-q for quiet and
> -o for the output file) as well as helper-specific options (like -r for
> the repository, -c for a changeset...).
> 
> Maxime:
> Changed -R to -r for recurse (only for the git backend)
> Changed -r to -u for URI (for all backend)
> Change -R to -c for cset (for CVS and SVN backend)
> Add the export of the BR_BACKEND_DL_GETOPTS so all the backend wrapper
> can use the same option easily
> Now all the backends use the same common options.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
