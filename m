From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Nov 2013 00:17:44 +0100
Subject: [Buildroot] [PATCH 1/1] dbus-python: select pyexpat dependency
In-Reply-To: <1384814104-11809-1-git-send-email-vsergeev@kumunetworks.com>
References: <1384814104-11809-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <20131119001744.7047c794@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivan Sergeev,

On Mon, 18 Nov 2013 14:35:03 -0800, Ivan Sergeev wrote:

> dbus-python requires xml.parsers.expat, which is provided by the pyexpat module. This patch enables the pyexpat module when dbus-python is selected.

This looks good, but I don't see the patch in your e-mail :)

> NOTE: I had to delete output/build/python-2.7.3/ for the enabled pyexpat to take effect during a rebuild (simple "make") of buildroot. I presume this is because it's configured and built with python-2.7.3, but perhaps this should be handled automatically  -- marking python-2.7.3 "dirty" somehow?

No, Buildroot doesn't try to be smart about detecting what needs to be
rebuilt after a configuration change or a .mk/Config.in change. See
http://buildroot.org/downloads/manual/manual.html#full-rebuild. It's up
to the user to know what to rebuild, or to trigger a full rebuild when
in doubt.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
