From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 16 Aug 2011 19:27:50 +0000
Subject: [Buildroot] busybox .config
In-Reply-To: <CALo-6+gPAV892XX=cuDiEiH3WrwORvtFMSh99FObQKV8ZWLn-w@mail.gmail.com>
References: <CALo-6+gPAV892XX=cuDiEiH3WrwORvtFMSh99FObQKV8ZWLn-w@mail.gmail.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C60529D4@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Ok, it seems that Mr.Murphy demands I embarrass myself in public
> once
> a week to allow me to see how things work a little bit.

Know that feeling.

> 
> I can see in buildroot/package/busybox/busybox-1.18.x.config which
> I
> believe is the default .config for busybox. Is that correct?
> 
> So, I can go "make busybox-menuconfig" and manipulate the .config
> and
> then copy my "tuned" .config to
> buildroot/package/busybox/busybox-1.18.x.config and capture the
> changes back in svn and sidestep the fact that clean removes the
> output directories?
> 
> Is this the right path for keeping track of a busybox    .config ??

What I do is to use the BR2_PACKAGE_BUSYBOX_CONFIG set to an absolute
path (using some form of $(TOP_DIR) as the basename), then copy any
changes from busybox config to that file.  This works well even if you
update busybox.

Andy
