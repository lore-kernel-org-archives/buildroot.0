From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Jan 2019 11:21:30 +0100
Subject: [Buildroot] Xtensa toolchain issue ?
Message-ID: <20190102112130.0b8d32f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Max,

We have a build failure of the libtorrent-rasterbar package that seems
to be toolchain related, and happens on Xtensa:

  http://autobuild.buildroot.net/?reason=libtorrent-rasterbar-1.1.11

The failure looks like this:

In file included from peer_connection.cpp:56:0:
../include/libtorrent/peer_connection.hpp:550:8: error: generic thunk code fails for method 'virtual void libtorrent::peer_connection::_ZThn96_NK10libtorrent15peer_connection8peer_logENS_14peer_log_alert11direction_tEPKcS4_z(libtorrent::peer_log_alert::direction_t, const char*, const char*, ...) const' which uses '...'
   void peer_log(peer_log_alert::direction_t direction
        ^~~~~~~~
  CXX      packet_buffer.lo

It is worth mentioning though that the exact same issue happens on the
OpenRISC architecture, and that Xtensa and OpenRISC seem to be the two
only affected architectures.

It is apparently a bug in gcc 7.x, that has been fixed in gcc 8.x,
according to https://bugzilla.redhat.com/show_bug.cgi?id=1511021, but
this bug report doesn't give any detail on which commit could have
fixed that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
