From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Oct 2017 08:33:12 +0100
Subject: [Buildroot] [RFC 0/2] Add support for specifying a custom
 kernel directory
In-Reply-To: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
References: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
Message-ID: <20171029073312.GB2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Florian, All,

On 2017-10-28 19:06 -0700, Florian Fainelli spake thusly:
> This series allows specifying a custom kernel directory which could be an
> existing git tree. This is particularly useful when doing kernel development
> and having an existing git checkout where development is happening.

As I replied to the patch itself: this is already covered by the
opverride-srcdir mechanism, so I've marked this series as rejected in
our patchwork.

> Ideally, I would like to avoid doing the rsync operation involved with the "local" method
> and instead just have a symbolic link from /path/to/kernel -> output/build/linux.

The first rsync may take a few seconds, true, but subs=equent ones will
be much faster if all you do is change a few files, especially on a hot
directory, so there is not much gain to have with a local symlink.

OTOH, I am currently working on out-of-tree per-pacakge build, which
will (eventually) allow us to make use of the O= mechanism to build the
kernel out-of-tree, and get rid of the rsync altogether. Don't hold your
breath, though. ;-)

Regards,
Yann E. MORIN.

> Comments welcome!
> 
> Florian Fainelli (2):
>   pkg-generic: Don't check for trailing slashes for local method
>   linux: Add support for specifying a custom directory
> 
>  linux/Config.in                        | 10 ++++++++++
>  linux/linux.mk                         |  3 +++
>  package/linux-headers/linux-headers.mk |  5 +++++
>  package/pkg-generic.mk                 |  2 ++
>  4 files changed, 20 insertions(+)
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
