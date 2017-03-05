From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 15:11:25 +0100
Subject: [Buildroot] [PATCH 2/5] support/testing: add core tests
In-Reply-To: <58b779b582a46_1c373ff16a8e2ec09216c@ultri3.mail>
References: <1486467363-19881-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <58b779b582a46_1c373ff16a8e2ec09216c@ultri3.mail>
Message-ID: <20170305151125.13a32242@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 01 Mar 2017 22:47:33 -0300, Ricardo Martincoski wrote:
> Thomas,
> 
> On Tue, Feb 07, 2017 at 09:36 AM, Thomas Petazzoni wrote:
> 
> [snip]
> > +++ b/support/testing/tests/core/test_post_scripts.py  
> [snip]
> > +    # TODO  
> 
> This comment can be removed. The method is already implemented.

Indeed.

> > +        emulator.login("root")  
> 
> Shouldn't it be like this?
>         emulator.login()

Correct. I did the mistake in a number of places. I guess the fact that
I chose "root" as the root password for the Dropbear test confused me
into thinking that the argument was the user name, and not the
password. So I've also changed the root password of the Dropbear test
case to be "testpwd" instead.

I've fixed all instances of emulator.login("root") that should have
been emulator.login().

While doing this, I also noticed that the emulator.login() method did
not ensure we reached the shell prompt. So I've changed it to make sure
we reached the prompt, and if not, abort.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
