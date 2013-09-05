From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 10:04:59 +0200
Subject: [Buildroot] [PATCH] apply-patches.sh: detect missing patches
In-Reply-To: <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
References: <20130813160017.GA2590@harvey.netwinder.org>
 <CAAXf6LXBHm7nG__780PqUaO+v9+4j2KON7UO0dw4Ej2qC3=XGg@mail.gmail.com>
 <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
Message-ID: <20130905100459.13173009@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 5 Sep 2013 09:03:33 +0200, Thomas De Schampheleire wrote:

> > Although I agree with the concept of checking for existence, I'm not
> > sure about the action to take.
> > Earlier in apply-patches.sh, if a patch is in an unsupported format,
> > it is simply skipped (and a message printed). I think the action in
> > that case should line up with the nonexisting patch case, so either
> > give a warning and continue, or an error and stop.
> 
> Any input from others?

My general feeling is that when something goes wrong or looks wrong, we
should abort with an error, and not try to continue with something
more-or-less broken/incorrect.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
