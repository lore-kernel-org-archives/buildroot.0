From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 23:10:52 +0200
Subject: [Buildroot] [PATCH 01/10] libssl: new virtual package
In-Reply-To: <20170804185521.12320-2-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
 <20170804185521.12320-2-Adamduskett@outlook.com>
Message-ID: <2c8f9301-1fbf-a14c-fd6c-ab17ea0a0bd0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 20:55, Adam Duskett wrote:
[snip]
> +choice
> +	prompt "ssl variant"
> +	default BR2_PACKAGE_OPENSSL
> +	help
> +	  Select OpenSSL or LibreSSL.
> +
> +	source "package/openssl/Config.in"

 Don't ever source a Config.in file within a choice. It's too easy to add more
options in the sourced Config.in file and that will fail dramatically. Instead,
move the symbol definition into the choice (possibly deleting the original
Config.in file).
[snip]
> +++ b/package/libssl/libssl.mk
> @@ -0,0 +1,8 @@
> +################################################################################
> +#
> +# libssl
> +#
> +################################################################################
> +
> +$(eval $(host-virtual-package))
> +$(eval $(virtual-package))

 We usually do first target then host.


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
