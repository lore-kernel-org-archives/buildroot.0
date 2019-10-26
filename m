From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 12:02:25 +0200
Subject: [Buildroot] [PATCH v1] package/qt5multimedia: fix
 gstreamer-0.10 compile failure
In-Reply-To: <20190930184446.15558-1-ps.report@gmx.net>
References: <20190930184446.15558-1-ps.report@gmx.net>
Message-ID: <20191026120225.17e066fa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Sep 2019 20:44:46 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes [1] (by adding upstream patch [2]):
> 
>   qgstreamerplayersession.cpp: In member function 'bool QGstreamerPlayerSession::play()':
>   qgstreamerplayersession.cpp:986:9: error: 'gst_debug_bin_to_dot_file_with_ts' was not declared in this scope
>            gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_pipeline), GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL), "session.play");
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [1] http://autobuild.buildroot.net/results/fc3cc1de4f910c46f8b18237e215ba9efcd68ef5
> [2] https://code.qt.io/cgit/qt/qtmultimedia.git/commit/?id=8756a20821305eabb6026400e6d3cdc79df1690d
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Thanks Peter. However, this patch is upstream since Qt 5.12.5, and we
are now using Qt 5.12.5, so we no longer need to apply this fix
separately.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
