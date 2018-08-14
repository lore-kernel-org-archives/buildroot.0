From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 22:14:13 +0200
Subject: [Buildroot] [Next v2] openresolv: new package
In-Reply-To: <20180814173348.31148-1-matthew.weber@rockwellcollins.com>
References: <20180814173348.31148-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180814221413.42a17798@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 12:33:48 -0500, Matt Weber wrote:
> From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> 
> This patch added 'openresolv' package support. This tool
> provides a dns management framework to track currently
> available nameservers.
> 
> A key feature of this tool vs resolvconf is the ability to
> manage multiple name server input configuration files and
> generate the /etc/resolv.conf.  This is handy when you have
> multiple dynamic communication paths providing nameserver
> information.
> 
> REF: https://github.com/rsmarples/openresolv
> 
> Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> Changes
> v1 -> v2
> [Thomas
>  - Added DEVELOPERS file entry
>  - Removed bash dependency as our original testing was invalid and the
>    tool works fine with busybox as along as CONFIG_ASH_GETOPTS is
>    enabled which is the default in buildroot.
>  - Fixed pkg to build as a generic vs autotools (they tried to mimic
>    autotools and we missed it in the orignal patch)
> ---
>  DEVELOPERS                         |  1 +
>  package/Config.in                  |  1 +
>  package/openresolv/Config.in       |  8 ++++++++
>  package/openresolv/openresolv.hash |  3 +++
>  package/openresolv/openresolv.mk   | 25 +++++++++++++++++++++++++
>  5 files changed, 38 insertions(+)
>  create mode 100644 package/openresolv/Config.in
>  create mode 100644 package/openresolv/openresolv.hash
>  create mode 100644 package/openresolv/openresolv.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
