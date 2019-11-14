From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Nov 2019 06:44:24 +0100
Subject: [Buildroot] [PATCH 05/11] package/kodi: drop readline dependency
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-6-peter@korsgaard.com>
Message-ID: <o66v9gx235.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 13 Nov 2019 16:17:18 +0100 schrieb Peter Korsgaard:

> {python-,}readline is (no longer) a required dependency of kodi, and
> readline (GPL-3.0+) is not license compatible with kodi (GPL-2.0), so 
drop
> the dependency.

Hi,

readline is an optional dependency of cpluff as of Kodi 18.x:
https://github.com/xbmc/xbmc/blob/Leia/lib/cpluff/configure.ac#L210

Snippet of kodi build log:

	configure: C-Pluff configuration
	configure:   release version:                0.1.3
	configure:   multi-threading support:        yes (Posix)
	configure:   dlopening mechanism:            dlopen
	configure:   localization support:           no
	configure:   use GNU readline library:       no
	configure:   assertion checks for debugging: no
	configure:   file name separator character:  '/'

In the next kodi release cpluff will not be present anymore:
https://github.com/xbmc/xbmc/commit/
b4f4ada89714538b98173dd7304b653d6e1eab31

The upstream PR which removed cpluff describes the usage of cpluff:

"cpluff was designed to run a complete addon management. This includes 
not only loading the addon data, but also using and running these addons.

Kodi has only used the loading of addon.xml."

So I think kodi does not need readline at all.

Regards, Bernd
