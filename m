From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 27 Jul 2011 21:46:35 +0000
Subject: [Buildroot] Getting Kconfig menu right
In-Reply-To: <CAMkyJgDML5mip30tPA9962uOjHnzAWFVWTKRr8RZei3LG6W1ew@mail.gmail.com>
References: <CAMkyJgDML5mip30tPA9962uOjHnzAWFVWTKRr8RZei3LG6W1ew@mail.gmail.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C60486D4@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi
> I'm trying to add python-fuse to buildroot. I have the makefile
> working, but there is only one little problem left. I would like
> the option for python-fuse to show up as a sub-item of libfuse,
> only when libfuse is checked. It should be similar, for example, to
> lua - when selected, some relevant sub-options appear as sub-items
> in the xconfig menu. I looked very closely on the lua Config.in,
> but found nothing that tells Kconfig to show all the options as a
> sub-items.
> How can I do this?

depends on BR2_<lib fuse pkg name>

OR

if BR2_<lib fuse pkg name>

endif

Must be done in the same Config.in as the lib fuse, however.

Andy
