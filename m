From: Eric Malkowski <eric@bvwireless.net>
Date: Thu, 19 Feb 2009 00:12:32 -0500
Subject: [Buildroot] Shell history w/ ASH spans multiple ash instances
Message-ID: <499CEA40.1000907@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all-

In the past, if multiple shells were started on console and ssh for 
instance, the command history was always unique per shell instance.

It seems the "ash" shell now likes to save history in /root/.ash_history 
periodically?   and at odd points, command history from one shell starts 
showing up in another.
This gets very annoying when I'm trying to recall the last command I 
CTRL-C'd out of for instance, but I get the "top" of the history from 
some "other" shell instance.

I tried making /etc/profile and /root/.bashrc NOT set the env vars 
HISTSIZE and HISTFILESIZE, but ash still keeps writing stuff to 
/root/.ash_history and "polluting" history for my various shell instances.

I'm tempted to turn off CONFIG_FEATURE_EDITING_HISTORY and 
CONFIG_FEATURE_EDITING_SAVEHISTORY in the busybox config, but I still 
want to be able to use up-arrow in shells to get history -- I just don't 
want it being saved to .ash_history and loaded into the history of other 
shells -- just saving history to .ash_history when a shell exits is 
fine, it's this "live updating" of it I'd like to get rid of.

Any advice greatly appreciated.

BTW: I'm using busybox 1.13.2 per stock buildroot config.

-Eric Malkowski
