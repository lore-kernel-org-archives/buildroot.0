From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Jan 2019 14:40:47 +0100
Subject: [Buildroot] [PATCH] package/systemd: set vconsole support
 option to default y
In-Reply-To: <1dc021862b1041c3990d6ce25bb331ca@exitstrategytech.com>
References: <1dc021862b1041c3990d6ce25bb331ca@exitstrategytech.com>
Message-ID: <20190105144047.552d69d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

Thanks for this contribution!

On Fri, 4 Jan 2019 21:35:23 +0000, David J. Fogle wrote:
> package/systemd:? set vconsole support option to default y

There is no need to repeat the commit title twice.

> Without this support option enabled, systemd does not allow vterm switching, and could possibly lead to user lockout on tty1. 
> 
> We prevent these scenarios by enabling the vconsole tool default y, as console login is much more prevalent than not.

I am not sure why you say "much more prevalent than not". I would say
quite the opposite: in embedded systems, either there is no screen at
all, or when there is a screen, it is used to display an end-user
application and not a console login.

> This allows the option to disable the tool if needed, but as this is a
> rare usage, it is better to let a user decide they do *not* need it
> than to expect them to know they *do*.

I'm a bit unconvinced. What is the size impact of having this option
enabled by default ?

Also, make sure your commit log is wrapped to 72 characters.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
