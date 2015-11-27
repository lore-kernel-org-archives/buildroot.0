From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Nov 2015 09:57:49 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-11-26
In-Reply-To: <20151127073014.F0A24102391@stock.ovh.net>
References: <20151127073014.F0A24102391@stock.ovh.net>
Message-ID: <20151127085749.GA4144@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-27 08:30 +0100, Thomas Petazzoni spake thusly:
> Detail of failures
>         i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/b0060f16c7464c240bc7d3b0ff17c9cb311fe30d/

This one is because it does not look in the correct place to find
gstreamer-1 headers:

    fatal error: gst/gstconfig.h: No such file or directory

That's because the header is in:

    staging/usr/lib/gstreamer-1.0/include/gst/gstconfig.h

However, gstreamer-1.0.pc has proper CFLAGS:

    Cflags: -I${includedir} -I${libdir}/gstreamer-1.0/include

So, it seems FreeRDP somwhow does not use the output from pkg-config
when it builds...

Investigation in progress...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
