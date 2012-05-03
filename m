From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 03 May 2012 14:06:04 +0200
Subject: [Buildroot] Console login root needing a password
In-Reply-To: <CAG6aBkWE0X1fm9LatHE9V+c_kvqvpkYkxZzE+xzEiVcgX6LGwA@mail.gmail.com>
References: <CAG6aBkVA-XPByuGaxUdKQAfGrMq_X_DhVdWOfA2Zh+mUt2jq-w@mail.gmail.com>
 <4FA2298E.5000807@visionsystems.de>
 <CAG6aBkWE0X1fm9LatHE9V+c_kvqvpkYkxZzE+xzEiVcgX6LGwA@mail.gmail.com>
Message-ID: <4FA274AC.4030208@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nige,

thy this and let me know if it works:

ttyO2::respawn:-/bin/sh

Yegor

Am 03.05.2012 11:30, schrieb Nigel Sollars:
> Hello Yegor,
>
> The only ttyO2 i have is in inittab and it looks like this:
>
> ttyO2::respawn:/sbin/getty -L ttyO2 115200 vt100
>
> This works fine ( I am able to log in ) on a previous build I did without a toolchain.
>
> Here is the link that i referred to ( from google )
>
> http://lists.busybox.net/pipermail/buildroot/2010-May/034546.html
>
> Hope this helps
> Nige
>
> On Thu, May 3, 2012 at 2:45 AM, Yegor Yefremov <yegor_sub1 at visionsystems.de <mailto:yegor_sub1@visionsystems.de>> wrote:
>
>     Am 03.05.2012 01:38, schrieb Nigel Sollars:
>     > Hello,
>     >
>     > Ive built buildroot with a toolchain successfully,  however trying to login over the console requires a password.  The passwd/shadow is the default.
>     >
>     > Looking around google apparently this has to do with wchar is this true?,  if so is there a fix since this is required for gdb on the target.
>
>     Have you tried something like this?
>
>     ttyS0::respawn:-/bin/sh
>
>     Yegor
>
>
>
>
> -- 
> ?Science is a differential equation. Religion is a boundary condition.?
>                                                                                                              Alan Turing
>
