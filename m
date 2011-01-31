From: Phil Edworthy <PHIL.EDWORTHY@renesas.com>
Date: Mon, 31 Jan 2011 08:58:21 +0000
Subject: [Buildroot] FW: x11vnc compile error
In-Reply-To: <35FC1A56EEC91A42A0EB92079193ED8D02E6E24C@ASISML10.asia-idc.local>
References: <35FC1A56EEC91A42A0EB92079193ED8D02E6E24C@ASISML10.asia-idc.local>
Message-ID: <AB12B32E73474741A2C5361C433A44DE028C4E43@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Feng,

> cc1: warning: include location "/usr/include" is unsafe for cross-
> compilation
> cc1: warning: include location "/usr/include" is unsafe for cross-
> compilation
> In file included from ../rfb/rfb.h:51,
>                  from x11vnc.h:33,
>                  from gui.c:3:
> /usr/include/pthread.h:655: warning: '__regparm__' attribute directive
> ignored
> /usr/include/pthread.h:667: warning: '__regparm__' attribute directive
> ignored
> /usr/include/pthread.h:712: warning: '__regparm__' attribute directive
> ignored
> In file included from ../rfb/rfb.h:51,
>                  from x11vnc.h:33,
>                  from connections.c:3:
> /usr/include/pthread.h:655: warning: '__regparm__' attribute directive
> ignored
> /usr/include/pthread.h:667: warning: '__regparm__' attribute directive
> ignored
> /usr/include/pthread.h:712: warning: '__regparm__' attribute directive
> ignored
> connections.c: In function 'check_gui_inputs':
> connections.c:2024: error: impossible constraint in 'asm'

The version of x11vnc used by BR is quite old, 0.9.3 is from Oct 2007. The
first thing I would try is editing package/x11vnc/x11vnc.mk to bump the
package to the latest release, 0.9.12

Phil
