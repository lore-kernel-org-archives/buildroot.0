From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jun 2010 22:27:16 +0200
Subject: [Buildroot] package/games/Config.in usage
In-Reply-To: <87zkytbwgo.fsf@macbook.be.48ers.dk>
References: <4C1A1F22.70500@free.fr>
	<87zkytbwgo.fsf@macbook.be.48ers.dk>
Message-ID: <20100617222716.468feb2e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Jun 2010 15:49:27 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Julien> Hello,
>  Julien> it seems package/games/Config.in is not used. Indeed package/Config.in
>  Julien> do not "source" it but copy its content (line 76).
> 
>  Julien> What is the actual philosophy in BR: regroup packages by "classes" (ex
>  Julien> games, multimedia...) in package/ subdirs and then source these
>  Julien> sub-Config.in in package/Config.in or put all packages in package/ and
>  Julien> organize the stuff in package/Config.in ?
>  Julien> (I prefer the second one)
> 
> Me too.

Why not, but in that case, we need non ambiguous names. I'm referring
to the recent introduction of several Lua packages: some of them have
fairly common names:

 http://git.buildroot.net/buildroot/commit/?id=50d6f2dde4db8c9d042294a09d5e8e120aec9987

Maybe they should be named "lua-XXX" instead ?

Another strategy would be to mimick in the directory layout the
organization of options in the menuconfig.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
