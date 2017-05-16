From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 May 2017 08:55:08 +0200
Subject: [Buildroot] [PATCH] fxload: do not pass -g on Microblaze
In-Reply-To: <871srp9x9f.fsf@dell.be.48ers.dk>
References: <1494878505-27111-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <871srp9x9f.fsf@dell.be.48ers.dk>
Message-ID: <20170516085508.4e416332@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 May 2017 07:38:36 +0200, Peter Korsgaard wrote:

>  > A possible alternate solution is to disable fxload on Microblaze
>  > entirely. If you prefer this option, let me know, and I'll send a
>  > different patch.  
> 
> I wouldn't mind just disabling fxload. I personally haven't seen any hw
> with the cypress 8051's needing fxload in the last 10 years or so, and
> there are no reverse dependencies.

OK, I'll send a patch disabling fxload entirely then.

> I see that the bug is very old :/ I wonder why we don't have a lot of
> other fallout from it - Is fxload really the only package passing -g or
> is the fxload source code so special that the bug only triggers there?

We don't seem to see it with other packages, so there must be something
special in fxload's code that triggers the bug. But I must say I
haven't looked too deeply, fixing Microblaze gcc issues is not really my
top priority.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
