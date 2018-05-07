From: M ZV <giometriq@gmail.com>
Date: Mon, 7 May 2018 19:30:32 +0430
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <CAOJ2eMeJQhQUrZoqXnXy_NwwUo6O5c6nzdmJttC+T4wE_NSE=Q@mail.gmail.com>
References: <20180502090508.12893-1-chemobejk@gmail.com>
 <20180503215631.6f62e406@windsurf> <20180503200415.GC2453@scaer>
 <CAOJ2eMeJQhQUrZoqXnXy_NwwUo6O5c6nzdmJttC+T4wE_NSE=Q@mail.gmail.com>
Message-ID: <CAF7Xa=2FFzbnC8O7JRWCQrQN3ZA3ffNR=3v8c=nXFe+4Uzmc+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hello,


>
> On Thu, May 3, 2018 at 11:04 PM Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
>
>> ditch our own bundled version, and switch to making our whois package a
>> hot pacakge, and use that as the provider for mkpasswd.
>>
>> Stefan, would you want to do that? ;-)
>>
>
> I'll give it a go, but can only work on this in a few weeks when I get
> some free cycles...
>
> Regards, Stefan
>
>
We're using mkpasswd specifically for a single task (skeleton-init-common
root password generation). I'm already tackling building this on Alpine
(musl environment) and facing
multiple issues: had to use -lintl for linking (that libintl musl/glibc can
of worms) and of course, it only makes md5 hashes since all SHA
functionalities are disabled on non-glibc systems via its header.

Can we just use a couple of python code using crypt.crypt(...), since
python is already a requirement. One less package to maintain is a good
news (buildroots already brimming with a mind boggling number of packages).

By the way, my first post here, I hope I'm not coming off as a nagging
pedestrian just adding noise. I highly appreciate the effort you guys are
putting into this.
Thank you.

(My apologies for double posting - it seems, at first, I didn't reply to
all)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180507/f55c7698/attachment.html>
