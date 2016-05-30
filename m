From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 30 May 2016 22:16:25 +0200
Subject: [Buildroot] gstreamer-1.0 and egl
In-Reply-To: <63233783-a7e5-8971-7403-4f52cb5af733@gmail.com>
References: <63233783-a7e5-8971-7403-4f52cb5af733@gmail.com>
Message-ID: <20160530221625.35629e6b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marco,

On Fri, 27 May 2016 17:49:18 +0200, Marco Trapanese <marcotrapanese@gmail.com> wrote:

[...]

> 
> Another weird thing about gstreamer. The very first time I launch any gstreamer command I get this errors:
> 
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_free': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_malloc': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'platform_memcpy': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_recv': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_write': can't resolve symbol
> (gst-plugin-scanner:407): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstopengl.so': unknown dl-error
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_free': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_malloc': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'platform_memcpy': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_recv': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_write': can't resolve symbol
> (gst-plugin-scanner:407): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstmpegtsdemux.so': unknown dl-error
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_free': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_malloc': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'platform_memcpy': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_recv': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_write': can't resolve symbol
> (gst-plugin-scanner:407): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstwaylandsink.so': unknown dl-error
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_free': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_malloc': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'platform_memcpy': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_recv': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_write': can't resolve symbol
> (gst-plugin-scanner:407): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstmpegtsmux.so': unknown dl-error
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_free': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_malloc': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'platform_memcpy': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_recv': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_write': can't resolve symbol
> (gst-plugin-scanner:407): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstmpegpsdemux.so': unknown dl-error
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_free': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_malloc': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'platform_memcpy': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_recv': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_write': can't resolve symbol
> (gst-plugin-scanner:407): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstrtmp.so': unknown dl-error
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_free': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_malloc': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'platform_memcpy': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_recv': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_write': can't resolve symbol
> (gst-plugin-scanner:407): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstautoconvert.so': unknown dl-error
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_free': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_malloc': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'platform_memcpy': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_recv': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_write': can't resolve symbol
> (gst-plugin-scanner:407): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstvoaacenc.so': unknown dl-error
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_free': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'khrn_platform_malloc': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'platform_memcpy': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_recv': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_begin': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_end': can't resolve symbol
> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_send_ctrl_write': can't resolve symbol
> (gst-plugin-scanner:407): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstmpegpsmux.so': unknown dl-error
> 
> 
> The second time it acts as expected.
> Any idea?

Gstreamer is building a binary registry the first time you start it (e.g. at
~/.cache/gstreamer-1.0/registry.x86_64.bin), which gives
the error messages (about some library mismatch (changed config and no rebuild?))
and disables all failed plugins in the registry, so no more warnings on second
invocation of a gstreamer command...

Regards,
Peter

> 
> Thanks in advance
> Marco
> 
> 
> 
