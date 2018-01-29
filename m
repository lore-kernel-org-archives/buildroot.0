From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 29 Jan 2018 09:36:12 -0200 (BRST)
Subject: [Buildroot] [PATCH] eudev: generate /etc/udev/hwdb.bin at
 system startup
In-Reply-To: <1839955484.109240.1517222243617.JavaMail.zimbra@datacom.ind.br>
References: <20180129041931.28192-1-casantos@datacom.ind.br>
 <20180129053603.pqmufwqeo3cv5p6q@sapphire.tkos.co.il>
 <1839955484.109240.1517222243617.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1879296971.142420.1517225772145.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: "Baruch Siach" <baruch@tkos.co.il>
> Cc: "Bernd Kuhls" <bernd.kuhls@t-online.de>, "Eric Le Bihan" <eric.le.bihan.dev@free.fr>, "buildroot"
> <buildroot@buildroot.org>
> Sent: Monday, January 29, 2018 8:37:23 AM
> Subject: Re: [Buildroot] [PATCH] eudev: generate /etc/udev/hwdb.bin at system startup

---8<---
>> 
>> Wouldn't that break read-only /etc?
> 
> The script may require some customization, as already explained in its
> opening comments, which is beyond the scope of this change.
> 
> Notice that a read-only /etc does not break the init script. It breaks
> the "udevadm hwdb --update" command, as well as any command that assume
> a rw filesystem (and there is a lot of them).

Addendum: the solution would be overriding the udevhwdbbin variable
in the configuration script, pointing to some read-write path (e.g.
/run/udev/data/, which is under a tmpfs by default).

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
