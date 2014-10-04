From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 19:07:49 +0200
Subject: [Buildroot] [PATCH 00 of 15] packages: rename FOO_BAR_OPT into
 FOO_BAR_OPTS
In-Reply-To: <patchbomb.1411846357@localhost>
References: <patchbomb.1411846357@localhost>
Message-ID: <20141004190749.2a9c9e31@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sat, 27 Sep 2014 21:32:37 +0200, Thomas De Schampheleire wrote:

> Thomas De Schampheleire (15)
>   packages: rename FOO_MAKE_OPT into FOO_MAKE_OPTS
>   packages: rename FOO_INSTALL_OPT into FOO_INSTALL_OPTS
>   packages: rename FOO_INSTALL_TARGET_OPT into FOO_INSTALL_TARGET_OPTS
>   packages: rename FOO_INSTALL_STAGING_OPT into FOO_INSTALL_STAGING_OPTS
>   packages: rename FOO_INSTALL_HOST_OPT into FOO_INSTALL_HOST_OPTS
>   packages: rename FOO_AUTORECONF_OPT into FOO_AUTORECONF_OPTS
>   packages: rename FOO_CONF_OPT into FOO_CONF_OPTS
>   packages: rename FOO_BUILD_OPT into FOO_BUILD_OPTS
>   packages: rename FOO_GETTEXTIZE_OPT into FOO_GETTEXTIZE_OPTS
>   packages: rename FOO_KCONFIG_OPT into FOO_KCONFIG_OPTS
>   pkg-generic: introduce helper function to check for a deprecated variable
>   pkg-generic: add checks on deprecated variables FOO_BAR_OPT
>   packages: rename misc. occurrences of _OPT into _OPTS

I've applied those 13 first patches. I only have a comment about
"pkg-generic: introduce helper function to check for a deprecated
variable" and "pkg-generic: add checks on deprecated variables
FOO_BAR_OPT", which I'll make on the relevant patches. My comments can
be handled as followup patches now that those patches have been merged.

>   .mk files: remove alignment of line continuation characters
>   .mk files: remove alignment of assignments

On those ones, I must say I'm not sure. Do we really have a coding
style for line continuation characters? In some cases, I found the
original code (i.e before your patch) to actually be nicer than after
your change.

For the alignment of assignments, I generally agree, but:

 1/ I believe there should be exceptions to the rules. Especially
 inside the package infrastructure themselves, aligning = signs is
 sometimes good for readability

 2/ Your regex doesn't handle cases such as:

FOO         ?=
BAR         ?= $(SOMETHING)

    The second assignment gets changed, but not the first one.

So on those last two patches, I'd like to have more community feedback.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
