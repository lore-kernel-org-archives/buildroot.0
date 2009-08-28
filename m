From: Daniele Salvatore Albano <d.albano@gmail.com>
Date: Fri, 28 Aug 2009 20:05:09 +0200
Subject: [Buildroot] bash fails to compile with git tree
In-Reply-To: <159a01660908280221m79835c8dy88aba6ce39dc4bff@mail.gmail.com>
References: <159a01660908280221m79835c8dy88aba6ce39dc4bff@mail.gmail.com>
Message-ID: <159a01660908281105l2c9c3fb1r2768286576bc7f92@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doing some tests i seen that problems are related to missing

CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"

(or a part of it)

in the make command

I got differet errors, like errors about libintl missing or termcap.h
missing on various packages

Should this be added to the $(MAKE) / $(MAKE1) variable?

2009/8/28 Daniele Salvatore Albano <d.albano@gmail.com>:
> Hi,
>
> have someone tried to compile bash? Yesterday, trying to fix my
> buildroot to send patches i moved my tree and cloned the head to get a
> working one (i got some problems with git) but when i tried to compile
> my root system, without applying any patches i done (i was just
> waiting to get errors to apply patches), bash failed to compile with a
> strange reason: missing termcap.h
>
> Checking ncurses and bash make files seems all ok, and making a diff
> with my old tree showed no differences. Toolchain works perfectly
> because i can build mi initrd (i use two separate br trees) without
> any problem and that br2 is from git and is up to date too. I don't
> build bash on my initrd, only busybox with few stuff.
>
> I can't send my .config, i'm at work, when i'll get at home i'll send
> it, however someone got problems building bash?
>
> --
> Daniele Salvatore Albano
> Consulente Informatico
> http://www.phpsoft.it
> http://www.dacci.it
>
> Servizi:
> - Sviluppo in C# e PHP
> - Installazione e Amministrazione sistemi Ubuntu, CentOS e Fedora
>



-- 
Daniele Salvatore Albano
Consulente Informatico
http://www.phpsoft.it
http://www.dacci.it

Servizi:
- Sviluppo in C# e PHP
- Installazione e Amministrazione sistemi Ubuntu, CentOS e Fedora
