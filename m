From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Nov 2012 11:09:36 +0100
Subject: [Buildroot] GTK vs Qt
In-Reply-To: <1353405771.50495.YahooMailNeo@web164602.mail.gq1.yahoo.com>
References: <1353393604.95219.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <20121120100105.4cafd18d@skate>
 <1353405771.50495.YahooMailNeo@web164602.mail.gq1.yahoo.com>
Message-ID: <20121120110936.4ca119a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoran Djordjevic,

On Tue, 20 Nov 2012 02:02:51 -0800 (PST), Zoran Djordjevic wrote:

> Does it mean that I cannot start?Qt programs built the way 
> to use X (on Buildroot built linux)?

Sorry, I don't understand your question. I'll try to explain things
differently.

At the moment, Buildroot is only capable of building a Qt library that
works on top of the framebuffer. It is possible to add support to build
Qt on X.org, but no-one has worked on that until now. So for your
target, with the current Buildroot, if you use Qt, it's on the
framebuffer.

That said, your Qt application itself, if written correctly, can also
be compiled for your desktop machine, and in this case, the Qt you have
in your desktop distribution uses X.org as its graphic backend.

> Or does it mean that I must use QtCreator if I want GUI on embedded
> boards with Buildroot built linux ?

I really don't see the relation between QtCreator and the whole
discussion. QtCreator is an IDE that has some interesting features to
do Qt development, but:

 * You can do Qt development without QtCreator. I've done quite a bit
   of Qt development in Emacs.

 * You can do non-Qt development with QtCreator.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
