From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 11 Jul 2008 06:55:44 +0200
Subject: [Buildroot] build failure mbstate_t not declared
In-Reply-To: <4876DA46.6040601@acsatlanta.com>
References: <487659AF.8090904@acsatlanta.com> <48768093.8000201@atmel.com>
	<4876DA46.6040601@acsatlanta.com>
Message-ID: <4876E7D0.3010305@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Joseph G. Boike skrev:
| Ulf Samuelsson wrote:
| Joseph G. Boike skrev:
| | Hi,
| | I checked out the latest buildroot and tried to build it but keep
| | getting errors regarding mbstate_t not being declared.
| | Here's a section of the output (there are many more lines with the same
| | error, but I wanted to keep the post short.)
| | Any suggestions?
|
| Try building an existing board which is known to work.
|
| $ make at91sam9260dfc_defconfig
| $ make
|
| BR
| Ulf Samuelsson.
|
| Did make at91sam9260dfc_defconfig w/ the default setting everywhere
| except I chose 2.6.26 kernel and I still see the same results.

google -> mbstate_t is defined in wchar.h which gets included
if you enable WCHAR.
You are sure you did not disable this in buildroot?

BR
Ulf Samuelsson


| Regards,
| Joe

| _______________________________________________
| buildroot mailing list
| buildroot at uclibc.org
| http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIdufQAyRRH5cXxqwRAiBFAJ9ZSQTw29WCBi2KM924Rhgrim/z/wCggG7r
gA9MQ4KOcQ+xBN543QlrpK4=
=yre7
-----END PGP SIGNATURE-----
