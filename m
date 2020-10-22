From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Oct 2020 15:43:28 +0200
Subject: [Buildroot] [PATCH] package/syslog-ng: Ignore CVE-2008-5110
In-Reply-To: <20201021074424.13589-1-judge.packham@gmail.com>
References: <20201021074424.13589-1-judge.packham@gmail.com>
Message-ID: <20201022154328.26b50fad@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Wed, 21 Oct 2020 20:44:24 +1300
Chris Packham <judge.packham@gmail.com> wrote:

> This as fixed in syslog-ng 2.0.10 but the NVD database hasn't been
> updated.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/syslog-ng/syslog-ng.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> index 7c2368efba..8587da746a 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -17,6 +17,10 @@ SYSLOG_NG_AUTORECONF = YES
>  SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
>  	--disable-java --disable-java-modules --disable-mongodb
>  
> +# CVE-2008-5110 was fixed in syslog-ng 2.0.10 but the NVD database is not
> +# aware of the fix, ignore it
> +SYSLOG_NG_IGNORE_CVES += CVE-2008-5110

But as proposed over e-mail separately, the proper fix is to modify the
NVD database. Have you had the chance to report the issue to the NVD
database maintainers ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
