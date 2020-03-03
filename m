From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Mar 2020 00:01:30 +0100
Subject: [Buildroot] [PATCH v1] package/gst1-plugins-base: fix static
 linking
In-Reply-To: <20200303163045.13431-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 3 Mar 2020 17:30:45 +0100")
References: <20200303163045.13431-1-ps.report@gmx.net>
Message-ID: <87pndtavqt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add patch to fix static linking of tools.
 > Fixes:

 >   http://autobuild.buildroot.net/results/b33019b3c9ad856aced34215c69bb292b536e25e

 >   .../bin/ld: .../usr/lib/libgstreamer-1.0.a(gstplugin.c.o): in function `gst_plugin_register_func':
 >   gstplugin.c:(.text+0x3bc): undefined reference to `g_module_make_resident'
 >   .../bin/ld: .../usr/lib/libgstreamer-1.0.a(gstplugin.c.o): in function `_priv_gst_plugin_load_file_for_registry':
 >   gstplugin.c:(.text+0x1228): undefined reference to `g_module_supported'
 >   .../bin/ld: gstplugin.c:(.text+0x126c): undefined reference to `g_module_open'
 >   .../bin/ld: gstplugin.c:(.text+0x1368): undefined reference to `g_module_symbol'
 >   .../bin/ld: gstplugin.c:(.text+0x1494): undefined reference to `g_module_supported'
 >   .../bin/ld: gstplugin.c:(.text+0x17f4): undefined reference to `g_module_close'
 >   .../bin/ld: gstplugin.c:(.text+0x1a2c): undefined reference to `g_module_error'

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
