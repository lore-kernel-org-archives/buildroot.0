From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Aug 2019 21:40:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix build without libyaml
In-Reply-To: <20190813180225.12350-1-fontaine.fabrice@gmail.com>
References: <20190813180225.12350-1-fontaine.fabrice@gmail.com>
Message-ID: <20190813214006.24a2b087@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Aug 2019 20:02:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Pass NO_YAML=1 to make when libyaml is disabled
> - Move BR2_PACKAGE_LIBYAML block outside
>   BR2_PACKAGE_DTC_PROGRAMS block to avoid duplicating NO_YAML=1 even if
>   libyaml is only used / needed with dtc program
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/68a1ba8d615951931567bc8a409c1d16624c902b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dtc/dtc.mk | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
