From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 22 Jul 2014 21:55:21 +0200
Subject: [Buildroot] [PATCH 1 of 2] generic packages: rename
	FOO_MAKE_OPTS into FOO_MAKE_OPT
In-Reply-To: <9d1a7e2626ad1d2e4b42.1406056891@localhost>
References: <9d1a7e2626ad1d2e4b42.1406056891@localhost>
Message-ID: <b37fc9fb-54e1-42b1-b386-4e6e0ce99b5a@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin@gmail.com> schreef:
>The autotools infrastructure allows packages to specify FOO_MAKE_OPT and
>FOO_MAKE_ENV. The generic infrastructure does not use this variable, but
>some individual packages define them for use in their own BAR_CMDS.
>
>However, some of these packages call this define FOO_MAKE_OPTS, rather than
>FOO_MAKE_OPT. This is currently not a real problem, but it is inconsistent.
>Moreover, the upcoming kconfig-package infrastructure will also use
>FOO_MAKE_OPT, so generic packages that also use kconfig-package have no
>choice but use the singular name.

This last reason isn't really valid as the kconfig infra could choose to use OPTS iso OPT.

Note that I personally find OPTS more logical, but I do think we should be consistent between autotools and generic.
We could also go in the other direction and change pkg-autotools and the depending packages to use OPTS. What do you think of that?
Thinking twice about this patch, this last approach has my preference, it would also avoid the strange situation regarding TARGET_CONFIGURE_OPTS, see second patch.

Thanks,
Thomas
