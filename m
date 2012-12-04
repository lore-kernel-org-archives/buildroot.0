From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Tue, 04 Dec 2012 22:12:32 +0100
Subject: [Buildroot] xapp_init: bad substitution of mcookie path in
	startx
In-Reply-To: <871uf5obh3.fsf@dell.be.48ers.dk>
References: <50BDEE24.6010601@wanadoo.fr> <871uf5obh3.fsf@dell.be.48ers.dk>
Message-ID: <50BE6740.3030909@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I can reproduce it with the latest release:

thierry at thierry-desktop:/nous/BASYSTEMES/Buildroot2012.11/buildroot-2012.11$ 
cat output/target/usr/bin/startx | grep mcook
     mcookie=`/nous/BASYSTEMES/Buildroot2012.11/buildroot-2012.11/output

However, an important clue is that is has work once.
My build from scratch was OK. Then I have changed my .config, adding 
some packages, and then it was broken.

I am trying to reverse it step by step to understand what has happened.

Regards
Thierry

Le 04/12/2012 20:37, Peter Korsgaard a ?crit :
>>>>>> "Thierry" == Thierry Bultel <thierry.bultel@wanadoo.fr> writes:
>
>   Thierry> Hi,
>   Thierry> The generated "startx" has the host path for mcookie:
>
>
>
>   Thierry> ----------
>   Thierry>    esac
>
>   Thierry>     authdisplay=${display:-:0}
>
>
>   Thierry> mcookie=`/nous/BASYSTEMES/Buildroot/output.imx6neon/host/usr/bin/mcookie`
>
> What buildroot version are you using? It seems to be correct here with
> current git:
>
> grep bin/mcookie output/target/usr/bin/startx
>      mcookie=`/usr/bin/mcookie`
>
