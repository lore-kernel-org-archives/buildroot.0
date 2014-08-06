From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 13:19:20 +0200
Subject: [Buildroot] [PATCH 1/1] jack2: Added staging
In-Reply-To: <CAFfn7UnVM+P0KXgSX3OXSv1fYAFBOR8ikfFZzexFo=-+NvyfOw@mail.gmail.com>
References: <1407311713-30045-1-git-send-email-pieter.degendt@gmail.com>
 <fb1133f6-4157-4458-9fb4-ede779eb6dea@email.android.com>
 <CAFfn7Uk7k+q1QxhOteqy_NT+4-cPYN8UMRi1wP7ASi4_RVi2Tw@mail.gmail.com>
 <c70f3b3c-8ff0-4237-8633-9d893a935eb9@email.android.com>
 <CAFfn7UnVM+P0KXgSX3OXSv1fYAFBOR8ikfFZzexFo=-+NvyfOw@mail.gmail.com>
Message-ID: <20140806131920.39351d62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pieter De Gendt,

On Wed, 6 Aug 2014 10:53:32 +0200, Pieter De Gendt wrote:

> Ok but from the waf build system help I don't see the option to copy the
> header files.. Would this mean that the manual copy is still valid?

Just do the installation, as done in JACK2_INSTALL_TARGET_CMDS. I.e, do:

define JACK2_INSTALL_STAGING_CMDS
	(cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) install)
endef

Most likely waf is installing the header files. You simply don't seem
them at the end of the target because Buildroot removes all header
files from the target directory at the end of the build.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
