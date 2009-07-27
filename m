From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 27 Jul 2009 08:59:43 +0200
Subject: [Buildroot] Write Access to buildroot?
References: <4A689265.6030308@atmel.com><87skgmwm6h.fsf@macbook.be.48ers.dk>	<4A69741A.8010903@atmel.com><20090724085603.GL13236@buzzloop.caiaq.de><9E543F22BF68405185D6B77291E4E5EF@aeglos>	<20090724121641.2c4cf8bd@surf><4A699CDD.7060703@atmel.com>	<20090724152448.4d1f5934@surf><4A69D04E.9040408@atmel.com>	<20090724224516.15b39e30@surf><4A6BEE7C.4080308@atmel.com>	<87r5w3syn7.fsf@macbook.be.48ers.dk><4A6C242F.8040704@atmel.com>
	<878wibslsk.fsf@macbook.be.48ers.dk> <4A6CBAAC.2060309@atmel.com>
	<522C1DF17AF50042AD8AE87F7887BD3D015DF9ADBA@exch.hq.tensilica.com>
Message-ID: <1D0E98F5231848838DD9AD8143F38F12@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>

> For what it's worth, we have a shared git tree on linux-xtensa.org
> for Xtensa arch development of buildroot (we've had it there for
> many months before the buildroot project itself switched over to git).

> We had to be careful with file ownership/protection (and maybe umask)
> to make sure it works smoothly, but once setup, it works quite well.
> Everybody has their own userid, no shared user or anything.

Thanks, it is the model used by Openembedded as well.

I do not specifically need a shared user,
I just want the http://git.uclibc.org/ to report

~common/<myproject>

instead of

~/ulf/git/common/<myproject>.

since the former better illustrates how I'd like to work.

It seems easier to just create a new user though.

> We always use the git+ssh://... method to access the tree if we want
> to be able to write to it, else anyone can access it read-only using
> the usual git://... method -- if you're curious, see:

>    http://wiki.linux-xtensa.org/index.php/Repository_Access

> One also has to be careful to only push things to this tree.
> No playing directly with the tree (such as rebase or otherwise
> pointing HEAD backwards in time and possibly committing new changes
> from there) which plays havoc with others' clones of the tree.
> As long as it's only accessed remotely, this is pretty easy.

> In case you notice it out of sync... we've only merged this tree with
> the official buildroot tree once in a long while -- were waiting for
> the Xtensa arch port to get submitted (which it just has, yeah! :-) and
> to setup things to make it easier to catch merges that break things.

> -Marc



Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
