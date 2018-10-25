From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 25 Oct 2018 23:43:13 +0200
Subject: [Buildroot] Antwort: Re: [PATCH v3] merge_config.sh: merge also
 buildroot config files
In-Reply-To: <OF54A89E59.8DBA5497-ONC1258331.0034C458-C1258331.00357034@local-dmz.de>
References: <20181025011343.29512-1-afshin.nasser@gmail.com>
 <20181025022031.14043-1-afshin.nasser@gmail.com>
 <20181025074309.GB18528@dell5510>
 <OF54A89E59.8DBA5497-ONC1258331.0034C458-C1258331.00357034@local-dmz.de>
Message-ID: <20181025214311.GB31691@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Hi Petr,

> > Not sure whether all packages using kconfig-package are using prefix 
> CONFIG_,
> > but probably yes.

> at least the uclibc package does not use this prefix.

Looking in the code uclibc-ng uses several prefixes: CONFIG_, TARGET_, UCLIBC_
and sometimes even configs without prefix: VERSION, WARNINGS, EXTRA_WARNINGS [1].

But their SED_CONFIG_EXP uses also CONFIG_.

BTW their kconfig is from linux-3.11, suppose our recent merge_config.sh would work with it.


Kind regards,
Petr


[1] https://cgit.openadk.org/cgi/cgit/uclibc-ng.git/tree/extra/Configs/Config.in
[2] https://cgit.openadk.org/cgi/cgit/uclibc-ng.git/tree/extra/config/merge_config.sh#n84
