From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 29 Nov 2007 15:39:32 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/asterisk
References: <20071129130145.210C130048@busybox.net>
	<d6cda7730711290551m497fb4fah54dbb7e6c67d5218@mail.gmail.com>
Message-ID: <01d701c83296$1cfb65e0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi all, Ulf,
> 
>    Doesn't changing the selects to depends on packages (such as
> asterix, ipsec, etc) affect usability quite negatively?

I am trying to get rid of the problem, that packages
"disappear" when the "depends on" are invalid.

There are also a lot of broken packages, and you 
decide that you do not want a certain package, 
since it is broken, then it takes a long time to find out what is causing 
package to be built 

This approach gives you better finetuning capabilities.

Note that once you have done your configuration, you can:

$ make saveconfig
and your project file will be saved.

If you make the "local" directory a symbolic link
to a project directory, then you can download
a new trunk, and do

make BOARD=<yourboard> getconfig

and you have all your settings back.



>    If I want to have asterisk, I go for asterisk, just to find out I
> have to enable packages in other places. If they are not optional,
> what is the point in making the user manually go thru menus looking
> for packages to select? It's not like I will give up on asterisk
> because you are making it harder to enable, right?
> 
>    So, why the changes?
> 


Best Regards
Ulf Samuelsson
