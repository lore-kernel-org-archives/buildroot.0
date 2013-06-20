From: Assaf Inbal <shmuelzon@gmail.com>
Date: Thu, 20 Jun 2013 10:05:11 +0300
Subject: [Buildroot] [PATCH 09/12] luaposix: New package
In-Reply-To: <20130620081006.5adbce32@skate>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-9-git-send-email-shmuelzon@gmail.com>
 <877ghppyyf.fsf@dell.be.48ers.dk>
 <CADwac6CSHFb=EGawg0x-QPhWpPoeZXtmzN9XtX-u23zittoCqQ@mail.gmail.com>
 <20130620081006.5adbce32@skate>
Message-ID: <CADwac6AgCoqwwLZcJys51THfEmKunzY=QyNDwoBeS1H4ws=5CQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Can you check if the host lua in $(HOST_DIR)/usr/bin/ has the correct
> RPATH, by doing:
>
> readelf -d $(HOST_DIR)/usr/bin/lua | grep RPATH
>

Hey Thomas,

I would be happy if there was a better way to handle this...

I ran the command, but got no results, RPATH doesn't exist in the Lua
binary.
See below the output (without grep):
$ readelf -d output/host/usr/bin/lua

Dynamic section at offset 0x2f14 contains 21 entries:
  Tag        Type                         Name/Value
 0x00000003 (PLTGOT)                     0x804bff4
 0x00000002 (PLTRELSZ)                   352 (bytes)
 0x00000017 (JMPREL)                     0x80488ac
 0x00000014 (PLTREL)                     REL
 0x00000011 (REL)                        0x804888c
 0x00000012 (RELSZ)                      32 (bytes)
 0x00000013 (RELENT)                     8 (bytes)
 0x00000015 (DEBUG)                      0x0
 0x00000006 (SYMTAB)                     0x80481ac
 0x0000000b (SYMENT)                     16 (bytes)
 0x00000005 (STRTAB)                     0x804851c
 0x0000000a (STRSZ)                      658 (bytes)
 0x6ffffef5 (GNU_HASH)                   0x80487b0
 0x00000001 (NEEDED)                     Shared library: [liblua.so.5.1.5]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x0000000c (INIT)                       0x8048a0c
 0x0000000d (FINI)                       0x804a16c
 0x6ffffff0 (VERSYM)                     0x80487ec
 0x6ffffffe (VERNEED)                    0x804885c
 0x6fffffff (VERNEEDNUM)                 1
 0x00000000 (NULL)                       0x0

Good day,
Assaf
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130620/ef29769c/attachment.html>
