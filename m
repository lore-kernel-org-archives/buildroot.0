From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Tue, 20 Nov 2012 03:06:44 -0800 (PST)
Subject: [Buildroot] GTK vs Qt
In-Reply-To: <20121120114507.0a14be55@skate>
References: <1353393604.95219.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <20121120100105.4cafd18d@skate>
 <1353405771.50495.YahooMailNeo@web164602.mail.gq1.yahoo.com>
 <20121120110936.4ca119a4@skate>
 <1353407015.92864.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20121120114507.0a14be55@skate>
Message-ID: <1353409604.65065.YahooMailNeo@web164606.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks, it's more clear now. I will read articles you
pointed at. Maybe I will have some more questions then.
?
Regards
 

________________________________
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Zoran Djordjevic <djdjdjole@yahoo.com> 
Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
Sent: Tuesday, November 20, 2012 11:45 AM
Subject: Re: [Buildroot] GTK vs Qt
  
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
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121120/eec4210b/attachment.html>
