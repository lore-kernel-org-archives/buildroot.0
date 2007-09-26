From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 27 Sep 2007 00:57:12 +0200
Subject: [Buildroot] svn commit: trunk/buildroot: package
	package/busyboxproject target etc...
References: <20070926211240.7B063A48ED@busybox.net>
Message-ID: <081901c800a6$023666f0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> Author: aldot
> Date: 2007-09-26 14:12:38 -0700 (Wed, 26 Sep 2007)
> New Revision: 20045
> 
> Log:
> - revert some bad checkins, fixup bad settings in atmel targets and move the gcc target abi back to a place where the other arch-specific settings live
> 

I think that your motivation for revert is not professional.
I think you need to study man-machine interface, because
the current meunconfig violates many principles on how
to let humans interact with machines.

First of all, You are not following your own gu?delines for how the menu should look like.
The $(PROJECT) is needed for generating the directories.
Therefore this is something which should be the first choice.
The fact that you dont like the PROJECT stuff should not be motivation enough.

I do not think you see the difference between a project and a board support package.

Can you explain why, on ARM, you want the Target ABI selection on the top level????
This is something which belongs in GCC configuration, and not on the top level.

It does not make sense to generate contents of the root skeleton in two different
parts of the configuration.

Busybox you configure ONCE.
Why do you need to see the busybox menu every time you enter the package selection?
Why do you insist on having 5 pages of applications under the package selection
before you get access to the Networking/Graphics menu?

Why, is it not possible to see the board selection and the target arch
in the same menu?

--------------------------
Personally, I am of the opinion that a man-machine interface
should avoid long tedious operation and the efficiency
can be easily measured in how many keystrokes is needed to 
accomplish a certain task.
Things done seldom or once should be configured at the bottom of the menu.
Things done often should require less keystrokes.

The interface needs to simple enough that the absolute novice
shoudl be able to learn the system without much external help.

---------------------------

Since we can't agree, I think this warrants a wider discussion.
Would like to have people opinion if they really like the way
the menuconfig is built up, or if they think that the interface
can be made more effient.


Best Regards
Ulf Samuelsson
