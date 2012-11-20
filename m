From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Nov 2012 11:45:07 +0100
Subject: [Buildroot] GTK vs Qt
In-Reply-To: <1353407015.92864.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1353393604.95219.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <20121120100105.4cafd18d@skate>
 <1353405771.50495.YahooMailNeo@web164602.mail.gq1.yahoo.com>
 <20121120110936.4ca119a4@skate>
 <1353407015.92864.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <20121120114507.0a14be55@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoran Djordjevic,

On Tue, 20 Nov 2012 02:23:35 -0800 (PST), Zoran Djordjevic wrote:
> OK -let me put question this way. If I successfully compile/run 
> QT program on desktop, and then recompile the same source with
> let's say Builtroot built compiler (for ARM), should I expect that 
> this program will understand -qws option (which I thought is strictly
> related to QtCreator). The only way I succeeded to start Qt demo 
> programs was with -qws. Hope it's more clear question.

Aaah. Ok. No, -qws *has* nothing to do with Qt Creator.

-qws is the option to tell Qt to start the Qt Windowing System.

When you run a Qt application on your desktop, there is already a
windowing system (X.org) and a window manager. So Qt is just a toolkit
like any other, it just draws inside a window provided by the windowing
system.

However, when you build Qt for your embedded system so that it runs
directly on the framebuffer, there is no windowing system provided. So
Qt has its own, that you must enable for the *first* Qt application you
run, using the -qws option.

You can run multiple Qt applications on your embedded system thanks to
this. The first one will have to be started with -qws, the other ones
will automatically connect to the first one thanks to a Unix socket,
and therefore be able to share the screen.

You probably want to read:

 http://doc.qt.digia.com/qt/qt-embedded-architecture.html
 http://doc.qt.digia.com/qt/qt-embedded-running.html

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
