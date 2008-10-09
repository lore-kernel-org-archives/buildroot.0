From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 09 Oct 2008 10:16:29 +0200
Subject: [Buildroot] Both cramfs + jffs2 in buildroot?
In-Reply-To: <48ECAD04.6070209@timeterminal.se>
References: <48ECAD04.6070209@timeterminal.se>
Message-ID: <48EDBDDD.2030206@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel Nystr?m wrote:
> (Sorry if this has been a topic earlier, but it's really hard to search
> the mailing archive)
> 
> Is it possible in Buildroot to make both a read-only rootfs and a second
> writable filesystem?
> 
> A common setup is using cramfs for / and mounting a jffs2 on /mnt/flash,
> and then make a symlink of /etc to point at /mnt/flash/etc where all
> config files are writable.
> 
> Is this possible to achive with Buildroot?

Why not.

You'll need to look at the target/jffs2.mk and target/cramfs.mk. Maybe
buildroot code has to be modified to allow both fs being built at once.
Also kernel configuration must be fixed to support one more MTD
partition. Provide your own boot scripts and implement the logic of
mounting the jffs etc.

HTH,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
