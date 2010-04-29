From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 29 Apr 2010 16:48:46 +0200
Subject: [Buildroot] package/*/*.mk overwrites target_skeleton's files
Message-ID: <L1N7TA$C9701F0D319A3BC583D87B5B4481628B@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've activated tslib in my buildroot setup, and written my own tslib
config file in $(BOARD_PATH)/target_skeleton/etc/ts.conf.
But the final image contains the ts.conf installed by the tslib package,
not mine.
I suppose the target_skeleton is processed before the package install.

How can I force buildroot to use _my_ file instead?

It would be pretty easy to do it in a quick and dirty way. I'm looking
for a reasonably clean way though, as I suppose I'm not the first one
to hit this problem.
For example commit ee0bbc04ff solved a similar problem, but in a way
that's not applicable to tslib.mk.

Thanks,
Luca
