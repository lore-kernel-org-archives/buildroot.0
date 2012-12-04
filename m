From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Dec 2012 11:37:12 -0800
Subject: [Buildroot] xapp_init: bad substitution of mcookie path in
	startx
In-Reply-To: <50BDEE24.6010601@wanadoo.fr> (Thierry Bultel's message of "Tue, 
 04 Dec 2012 13:35:48 +0100")
References: <50BDEE24.6010601@wanadoo.fr>
Message-ID: <871uf5obh3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thierry" == Thierry Bultel <thierry.bultel@wanadoo.fr> writes:

 Thierry> Hi,
 Thierry> The generated "startx" has the host path for mcookie:



 Thierry> ----------
 Thierry>    esac

 Thierry>     authdisplay=${display:-:0}


 Thierry> mcookie=`/nous/BASYSTEMES/Buildroot/output.imx6neon/host/usr/bin/mcookie`

What buildroot version are you using? It seems to be correct here with
current git:

grep bin/mcookie output/target/usr/bin/startx
    mcookie=`/usr/bin/mcookie`

-- 
Bye, Peter Korsgaard
