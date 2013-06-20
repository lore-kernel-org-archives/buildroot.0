From: Assaf Inbal <shmuelzon@gmail.com>
Date: Thu, 20 Jun 2013 10:39:43 +0300
Subject: [Buildroot] [PATCH 09/12] luaposix: New package
In-Reply-To: <CADwac6AgCoqwwLZcJys51THfEmKunzY=QyNDwoBeS1H4ws=5CQ@mail.gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-9-git-send-email-shmuelzon@gmail.com>
 <877ghppyyf.fsf@dell.be.48ers.dk>
 <CADwac6CSHFb=EGawg0x-QPhWpPoeZXtmzN9XtX-u23zittoCqQ@mail.gmail.com>
 <20130620081006.5adbce32@skate>
 <CADwac6AgCoqwwLZcJys51THfEmKunzY=QyNDwoBeS1H4ws=5CQ@mail.gmail.com>
Message-ID: <CADwac6BcbG6_K_zFbvh7UCB6gn=6dT_-FjqUL36nuMSqMQDy+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> I ran the command, but got no results, RPATH doesn't exist in the Lua
> binary.
>

OK, so I've done a bit more digging and saw that buildroot adds -rpath as a
part of the HOST_LDFLAGS, but the problem was that this variable wasn't
passed to Lua's make file.
So, I'm submitting now two patches. The first is for adding these flags to
the host compilation of Lua and the second the for adding Luaposix, without
the LD_LIBRARY_PATH hack.

Thanks for pointing me in the right direction.

Good day,
Assaf
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130620/61c85dea/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-lua-Added-missing-HOST_LDFLAGS.patch
Type: application/octet-stream
Size: 678 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130620/61c85dea/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-luaposix-New-package.patch
Type: application/octet-stream
Size: 3374 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130620/61c85dea/attachment-0003.obj>
