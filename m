From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 3 Sep 2008 15:26:24 +1000
Subject: [Buildroot] modifying autoreconf parameters
Message-ID: <20080903052624.GB11847@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A package I'm working on needs to pass extra args to autoreconf
(specifically -I... because it has .m4 files in a subdirectory).

I tried adding a FOO_AUTORECONF_CONF_OPT variable, but it's more
complicated than that because package/autoconf/autoconf.mk overrides
the options to aclocal, which is where the switch really needs to go.
Does anyone know why, or have a proposed solution?

For now I'm using the post-extract hook to symlink the relevant file
into the default search path.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
