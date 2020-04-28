From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue, 28 Apr 2020 14:22:16 -0500
Subject: [Buildroot] [PATCH] package/cifs-utils: bump to version 6.10
In-Reply-To: <20200428171720.GF11346@scaer>
References: <20200428141505.23883-1-ryanbarnett3@gmail.com>
 <20200428171720.GF11346@scaer>
Message-ID: <CALq67GA-UbLfvxvz6=WybDQCAM0zQ2djUeRVxC4+f0SgqAkg+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Apr 28, 2020 at 12:17 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Ryan, All,
>
> On 2020-04-28 09:15 -0500, Ryan Barnett spake thusly:

[...]

> > +# uses C99 code in smbinfo.c but forgets to pass -std=c99 and c11 with mtab.c
> > +CIFS_UTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99 -std=gnu11"
>
> Doesn't the last -std value win over the previous ones? In that case,
> gnu11 would win.
>
> Care to check that, please?

Yes - that works. Kind of got excited with fixing issues as they came
up and just kept appending :)

v2 incoming

Thanks,
-Ryan
