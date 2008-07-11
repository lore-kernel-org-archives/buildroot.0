From: Joseph G. Boike <joe.boike@acsatlanta.com>
Date: Fri, 11 Jul 2008 14:53:47 -0500
Subject: [Buildroot] build failure mbstate_t not declared
In-Reply-To: <4876E7D0.3010305@atmel.com>
References: <487659AF.8090904@acsatlanta.com> <48768093.8000201@atmel.com>
	<4876DA46.6040601@acsatlanta.com> <4876E7D0.3010305@atmel.com>
Message-ID: <4877BA4B.9020707@acsatlanta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Joseph G. Boike skrev:
> | Ulf Samuelsson wrote:
> | Joseph G. Boike skrev:
> | | Hi,
> | | I checked out the latest buildroot and tried to build it but keep
> | | getting errors regarding mbstate_t not being declared.
> | | Here's a section of the output (there are many more lines with the 
> same
> | | error, but I wanted to keep the post short.)
> | | Any suggestions?
> |
> | Try building an existing board which is known to work.
> |
> | $ make at91sam9260dfc_defconfig
> | $ make
> |
> | BR
> | Ulf Samuelsson.
> |
> | Did make at91sam9260dfc_defconfig w/ the default setting everywhere
> | except I chose 2.6.26 kernel and I still see the same results.
>
> google -> mbstate_t is defined in wchar.h which gets included
> if you enable WCHAR.
> You are sure you did not disable this in buildroot?
>
> BR
> Ulf Samuelsson
>
>
> | Regards,
> | Joe
>
> | _______________________________________________
> | buildroot mailing list
> | buildroot at uclibc.org
> | http://busybox.net/mailman/listinfo/buildroot
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.4-svn0 (GNU/Linux)
> Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org
>
> iD8DBQFIdufQAyRRH5cXxqwRAiBFAJ9ZSQTw29WCBi2KM924Rhgrim/z/wCggG7r
> gA9MQ4KOcQ+xBN543QlrpK4=
> =yre7
> -----END PGP SIGNATURE-----
Ok, I deleted everything under toolchain_build_arm and tried to make the 
at91sam9260dfc_defconfig again with 2.6.26 kernel.
I got an immediate failure that ftp://...2.6.26.tar.bz2 not found.  (See 
snippet below)
So I selected latest stable kernel (2.6.25.10) and ran make again.
This time had success!
So moral is "make distclean" doesn't effect the toolchain and they need 
to be removed manually.
Thanks,
Joe


wget --passive-ftp -nd  -P /usr/local/install/downloads 
http://ftp.kernel.org/pub/linux/kernel/v2.6//linux-2.6.26.tar.bz2
--15:49:12--  
http://ftp.kernel.org/pub/linux/kernel/v2.6//linux-2.6.26.tar.bz2
           => `/usr/local/install/downloads/linux-2.6.26.tar.bz2'
Resolving ftp.kernel.org... 204.152.191.37, 204.152.191.5
Connecting to ftp.kernel.org|204.152.191.37|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
15:49:12 ERROR 404: Not Found.
