From: William Wagner <will_wagner@carallon.com>
Date: Fri, 08 Jan 2010 16:24:46 +0000
Subject: [Buildroot] Using buildroot for multiple projects
Message-ID: <4B475C4E.4010201@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a question about using buildroot for multiple projects.

Currently you can specify different output folders with O= and swap 
between configs either by copying the .config and calling make oldconfig 
or using make*_defconfig.

This appears to work fine, however the problem is that you can not do 
builds of two different projects at the same time. This is because of 
the config files in package/config and the top directory of buildroot.

Anyone know why it wouldn't be possible to make it an option as to where 
the config files got built to so that they could also be built out of tree?

Looking at the top level makefile it looks relatively straight forward, 
however there are a couple of bits I don't quite understand.

Why do we copy $(CONFIG)/buildroot-config to BR2_DEPENDS_DIR? It appears 
to be for the headers in$(CONFIG)/buildroot-config/br2 which I assume 
are build by conf? Why does the $(CONFIG)/buildroot-config exist where 
it is - why not just generate it into BR2_DEPENDS_DIR then there is no 
need to copy it?

Who uses .auto.deps? I can't find anyone, yet we seem to patch config 
for buildroot so it is created.

Thanks,

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
