From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 00:04:08 +0200
Subject: [Buildroot] [PATCH 6/8] sysklogd: add logging configuration file
In-Reply-To: <20180709033134.22175-7-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
 <20180709033134.22175-7-casantos@datacom.com.br>
Message-ID: <7059f810-54a7-dc55-d4e3-d3f20dbc2573@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-07-18 05:31, Carlos Santos wrote:
> +# Use KLOGD_RELOAD to select the "S01logging reload" behavior.
> +# - "USR1" will cause the kernel module symbols to be reloaded.
> +# - "USR2" will cause both the static kernel symbols and the kernel module
> +#   symbols to be reloaded.
> +# - "0" will do nothing.
> +# - Do not use any other value here. Use kill(1) for fine-grained control of
> +#   klogd, as documented in its manual page.
> +# KLOGD_RELOAD="0" # (default value)

 I don't really think it makes much sense to have this configurable. I don't see
any real need to ever do reloading of klogd in buildroot context (you're not
going to dynamically install kernel modules, are you?). In the rare cases that
this does happen, the user should be smart enough to send a SIGUSR1/2. Let's
just drop all this klogd reloading.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
