From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jan 2021 18:21:56 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/trace-cmd: bump to version
 2.9.1
In-Reply-To: <CADYdroNCoM6CqOd+bEwLyFbZrmxzUS+r_B+pHkvQDiOYcdtTvw@mail.gmail.com>
References: <20201203104841.152299-1-nolange79@gmail.com>
 <20210103110920.GM2997@scaer>
 <CADYdroNCoM6CqOd+bEwLyFbZrmxzUS+r_B+pHkvQDiOYcdtTvw@mail.gmail.com>
Message-ID: <20210104172156.GA1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2021-01-04 14:19 +0100, Norbert Lange spake thusly:
> Yann E. MORIN < [1]yann.morin.1998@free.fr> schrieb am So., 3. J?n. 2021, 12:09:
>     - keep using a git clone
> Why is a git checkout necessary/preferable ?

s,necessary/,,

1. It was already a git clone previously

2. git clones are cached locally (so re=usable between builds if pne had
   exported BR2_DL_DIR ), and git clones are named after the package in
   Buildroot, not after the upstream repo (but in this case, the basename
   did not change)

3. That tree is not very big (8.18MiB fetched, for a tarball that is
   4.1MiB)

4. Except for the first build, fetching new objects is going to be fast
   when people update (probably faster than fetching the full archive).

I also have a tendency to prefer git clones, as the archivers on remote
sites have been known to change from time to time. For example, github
has changed the way they create their archives at least twice in the
past few years, which had an impact on our hashes...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
