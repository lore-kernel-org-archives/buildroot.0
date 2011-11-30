From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Wed, 30 Nov 2011 13:31:45 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <000f01ccaf8b$7279ed90$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98><201111281139.37028.minimod@morethan.org><002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98><201111281324.38619.minimod@morethan.org><003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98><003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98><003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98><20111129083710.1a83fad6@skate><001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98><20111129153619.4f080721@skate><001301ccaea5$37ec1f40$0400a8c0@dspcgrnzks9p98><001401ccaedf$e5751f60$0400a8c0@dspcgrnzks9p98><001501ccaee8$34c408d0$0400a8c0@dspcgrnzks9p98><000b01ccaf79$085d0800$0400a8c0@dspcgrnzks9p98><20111130170450.2f33e6c2@skate><000c01ccaf7c$01f3c460$0400a8c0@dspcgrnzks9p98><20111130173327.069f46fb@skate><000d01ccaf7e$78243280$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LV8ArEeuQ=w3r7745AK00t2XqtSoLqv+tBc9rnpjS8sCQ@mail.gmail.com>
 <000f01ccaf8b$7279ed90$0400a8c0@dspcgrnzks9p98>
Message-ID: <001001ccaf96$b2ed40b0$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> $(eval $(call GENTARGETS))

This needed to be changed to $(eval $(call GENTARGETS,package,ethercat))

and then it built the modules!  Now there is /lib/modules/2.6.33/ethercat
with the correct kernel modules.

However, there is no longer

/etc/init.d/ethercat

executable file.  So in changing the EtherCAT.mk file now the "application"
part isn't getting built.  Do I need to put back this line:

$(eval $(call AUTOTARGETS,package,ethercat))

If not, what should I do?  It seems I can make application OR kernel module,
just not both.


Thanks again.
