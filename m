From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Jul 2017 00:44:54 +0200
Subject: [Buildroot] [PATCH 1/1] capnproto: new package
In-Reply-To: <201707061544.v66FiZQQ020306@mx1.sonologic.net>
References: <201707061544.v66FiZQQ020306@mx1.sonologic.net>
Message-ID: <71345a75-5cbc-a857-fe29-6a48bdd8d7ea@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-07-17 17:40, Koen Martens wrote:
[snip]
> diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
> new file mode 100644
> index 0000000..d25ccf7
> --- /dev/null
> +++ b/package/capnproto/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_CAPNPROTO
> +	bool "capnproto"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11

 Something tells me that this needs

	depends on BR2_INSTALL_LIBSTDCPP


 Regards,
 Arnout

> +	help
> +	  Cap'n Proto is an insanely fast data interchange format
> +	  and capability-based RPC system. Think JSON, except
> +	  binary. Or think Protocol Buffers, except faster. In
> +	  fact, in benchmarks, Cap?n Proto is INFINITY TIMES
> +	  faster than Protocol Buffers.
> +
> +	  https://capnproto.org/index.html
> +
> +comment "capnproto needs host and target gcc >= 4.8"
> +	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
