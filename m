From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 14:56:32 +0200
Subject: [Buildroot] [PATCH] package/openipmi: bump to version 2.0.27
In-Reply-To: <1f209d13368b27eceee508150bcd9bd44a183ee0.1565940270.git.baruch@tkos.co.il>
References: <1f209d13368b27eceee508150bcd9bd44a183ee0.1565940270.git.baruch@tkos.co.il>
Message-ID: <20190817145632.1c626683@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Fri, 16 Aug 2019 10:24:30 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Bundled editline has been removed; readline is a mandatory dependency
> now.
> 
> Add patch fixing build with editline is not installed.
> 
> Add license files hashes.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...ine-include-in-ipmi_serial_bmc_emu.c.patch | 31 +++++++++++++++++++
>  package/openipmi/Config.in                    |  1 +
>  package/openipmi/openipmi.hash                |  7 +++--
>  package/openipmi/openipmi.mk                  |  4 +--
>  4 files changed, 39 insertions(+), 4 deletions(-)
>  create mode 100644 package/openipmi/0002-sample-fix-readline-include-in-ipmi_serial_bmc_emu.c.patch

Applied to next, thanks. However, it is weird that the configure.ac
script doesn't check for the availability of libreadline, and it simply
gets used directly with -lreadline from two Makefile.am.

Another question is whether the maintainers of openipmi realized that
readline is under GPLv3, and that therefore they are forcing openipmi
users to bring GPLv3 software to their system. I personally have
nothing against GPLv3, but I know some people/companies don't really
like GPLv3.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
