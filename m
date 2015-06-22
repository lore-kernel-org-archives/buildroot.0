From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Jun 2015 00:12:19 +0200
Subject: [Buildroot] [PATCH] python: bump to 2.7.10
In-Reply-To: <5581EF0A.8030601@mind.be>
References: <1434490571-16422-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <5581EF0A.8030601@mind.be>
Message-ID: <20150622221219.GD7547@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-06-18 00:04 +0200, Arnout Vandecappelle spake thusly:
> On 06/16/15 23:36, Thomas Petazzoni wrote:
> > diff --git a/package/python/python.hash b/package/python/python.hash
> > index f741e85..6258ec2 100644
> > --- a/package/python/python.hash
> > +++ b/package/python/python.hash
> > @@ -1,2 +1,4 @@
> > -# Locally calculated after checking pgp signature
> > -sha256	90d27e14ea7e03570026850e2e50ba71ad20b7eb31035aada1cf3def8f8d4916	Python-2.7.9.tar.xz
> > +# From https://www.python.org/downloads/release/python-2710/
> > +md5	c685ef0b8e9f27b5e3db5db12b268ac6	Python-2.7.10.tar.xz
> > +# Locally calculated
> > +sha256	1cd3730781b91caf0fa1c4d472dc29274186480161a150294c42ce9b5c5effc0	Python-2.7.9.tar.xz
>  It's a pity that it's not possible to check against such mistakes in the 
> check-hash script.

Indeed, but I really can't see an obvious way to do it.

All I can think of is, if a .hash file contains a hash for a version we
do not have, then we should fail.

Hoever, that definitely very difficult to check, as for soem packages,
we have multiple versions, and even then, what if the archive name is
different? and all weird ocrner cases?

In the end, I think we'll have to live with that, and be very careful
when reviewing patches that touch the .hash files.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
