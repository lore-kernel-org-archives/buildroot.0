From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 15:46:01 +0200
Subject: [Buildroot] [PATCH] [RFC] system: add option to choose what
	/bin/sh points to
In-Reply-To: <543A7EF9.2080106@mind.be> (Arnout Vandecappelle's message of
 "Sun, 12 Oct 2014 15:15:37 +0200")
References: <1413049741-1340-1-git-send-email-yann.morin.1998@free.fr>
 <87h9z91ug0.fsf@dell.be.48ers.dk> <543A7EF9.2080106@mind.be>
Message-ID: <87siitxuxy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> But we default to BR2_INIT_BUSYBOX, so you still need to go into the
 >> system menu and disable that before you can deselect busybox.
 >> 
 >> Another issue with the 'depends on' is that if you disable busybox the
 >> choice then jumps to the next option which pulls in bash (which might
 >> not really be what you want when you try to save space by disabling
 >> busybox).
 >> 
 >> So I think it is better to use selects everywhere.

 >  I disagree.

 >  For people who want to avoid busybox, it is already annoying that they have to
 > change their init system first. Adding more implicit selects of busybox is not
 > going to make their life easier.

 >  For the jumping, it's better to fix it by adding a 'default dash if !busybox' line.

 >  And since busybox is on by default, there is no strong need for a select - if
 > the user deselects busybox I guess they know what they're doing.

 >  And also using a depends solves the issue you mention below :-)

Ok, that's also fine by me.

-- 
Bye, Peter Korsgaard
