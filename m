From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 30 Jan 2014 11:42:46 +0100 (CET)
Subject: [Buildroot] Project layout : where to put the .config files
In-Reply-To: <CAAXf6LVcyT1O41enwqPrWLuY0Mz8yO2Wn8kX=3NviVWEHtw7Dg@mail.gmail.com>
Message-ID: <1837704479.4894137.1391078566256.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All

> 
> I find it a strange strategy to put .config in git: this is why we
> have the configs/ directory, and a target 'make savedefconfig' to
> store the .config configuration in a defconfig file. If you don't
> like
> defconfigs, you can still copy .config directly in the configs/
> subdirectory.
> 
> Best regards,
> Thomas
> 

This is my own little project I am building here it is not a new
board I am trying to support. I have been bitten multiple times 
by .config not being saved until I do a savedefconfig. savedefconfig
should not be a "my change are good let's validate" step. That's 
what git commit is for.

Defconfigs are a great way to define templates for a board and
distribute them with buildroot, but when you are building a final
product they are not the right tool. 

In particular the fact that you have to do a savedefconfig before 
any git commit is very error prone. moreover savedefconfig won't
warn you if defconfig has been modified by a pull and will overwrite
it.

This is even worse for the kernel/busybox case where the config
files are hidden in output/build/xxx/.config
