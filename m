From: Tomasz Chmielewski <mangoo@wpkg.org>
Date: Wed, 20 Aug 2008 13:24:19 +0200
Subject: [Buildroot] ARM EABI toolchain - anyone build it successfully?
In-Reply-To: <48ABF926.4050402@wpkg.org>
References: <48AAE812.4020706@wpkg.org>
	<20080819154955.GA15608@mx.loc>	<48AAECB6.6020309@wpkg.org>
	<20080819162809.GA15851@mx.loc>	<48ABE3DE.80908@wpkg.org>
	<20080820094942.GA20189@mx.loc>	<48ABECD6.8000604@wpkg.org>
	<20080820101654.GA20285@mx.loc> <48ABF926.4050402@wpkg.org>
Message-ID: <48ABFEE3.6000909@wpkg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tomasz Chmielewski schrieb:

(...)

> Out of all shels, only hush and lush work:
> 
> # ./busybox
> (...)
> Currently defined functions:
>          ash, cat, hush, lash, mount, msh, sh, sleep, switch_root, 
> umount, whoami
> 
> 
> # ./busybox ash
> Illegal instruction
> # ./busybox hush
> /tmp # exit
> # ./busybox lash
> /tmp # exit
> # ./busybox msh
> # Illegal instruction
> # ./busybox sh
> Illegal instruction
> 
> 
> Hopefully hush is enough ;)

Unfortunately, it breaks, too:

# ./busybox hush
/tmp # BLAH=1
/tmp # if [ $BLAH == 1 ] ; then
 > ./busybox whoami
 > fi
Illegal instruction


-- 
Tomasz Chmielewski
http://wpkg.org
