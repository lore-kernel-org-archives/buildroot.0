From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 22:49:35 +0200
Subject: [Buildroot] [PATCH v2] kconfig: add script to manipulate
 .config files on the command line
In-Reply-To: <20170926211502.5248-1-marcus.folkesson@gmail.com>
References: <20170926211502.5248-1-marcus.folkesson@gmail.com>
Message-ID: <5a06ab74-25b6-df38-b58a-8c1316ded74f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26-09-17 23:15, Marcus Folkesson wrote:
> Default prefix is set to `BR2_` but may be overidden by setting
> BR2_PREFIX.
> 
> Example usage:
> 
> Enable `BR2_PACKAGE_GNUPG`:
> ./support/scripts/config --package --enable GNUPG
> 
> Check state of config option `BR2_PACKAGE_GNUPG`:
> ./support/scripts/config --package --state GNUPG
> y
> 
> Enable `BR2_PACKAGE_GNUPG`:
> ./support/scripts/config --package --disable GNUPG
> 
> Set `BR2_TARGET_GENERIC_ISSUE` to "Welcome":
> ./support/scripts/config --set-str  TARGET_GENERIC_ISSUE "Welcome"
> 
> Copied from the Linux kernel (4.13-rc6) source code and adapted to
> Buildroot.
> Thanks to Andi Kleen who is the original author of this script.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>


 Applied to master, thanks, with one small change...


> +	if [ "$MUNGE_CASE" = "yes" ] ; then
> +		ARG="`echo $ARG | tr a-z A-Z | tr - _`"

 I merged these into a single tr invocation:

		ARG="`echo $ARG | tr a-z- A-Z_`"


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
