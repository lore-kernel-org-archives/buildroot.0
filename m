From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:32:46 +0100
Subject: [Buildroot] [PATCH 1/4] support/scripts/pkg-stats: import cve
 module only when needed
In-Reply-To: <20201119145354.1175043-1-thomas.petazzoni@bootlin.com>
References: <20201119145354.1175043-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210117153246.5e84374d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Nov 2020 15:53:51 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The cve module needs ijson, which may not be installed. Since cve
> matching is only enabled when --nvd-path is passed, it is a bit silly
> to error out about ijson being missing if it's not used.
> 
> So instead of unconditionally importing the cve module, only do it
> conditionally.
> 
> However, instead of doing it right at the point where it is used, we
> do it at the beginning of the main() function. Indeed, if the cve
> module is needed but cannot be imported, we want to error out
> immediately rather than doing a whole bunch of things, and failing on
> the user later on in the middle of the pkg-stats execution.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/pkg-stats | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Series applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
