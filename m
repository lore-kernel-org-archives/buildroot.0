From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 3 Mar 2021 16:00:45 +0100
Subject: [Buildroot] [PATCH] utils/size-stats-compare: add package name
 in detail output
In-Reply-To: <20210302211453.GJ2275@scaer>
References: <20210216115609.24656-1-patrickdepinguin@gmail.com>
 <20210302211453.GJ2275@scaer>
Message-ID: <CAAXf6LWv1pMABOUXSy-GaZzv3dS8GcF+F71J2yX2ZNDKYhUjBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar, 2 mar 2021 a las 22:14, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
[..]
> >        66752   added usr/sbin/ebtables-legacy (ebtables)
> >        66752   added usr/sbin/ebtablesu (ebtables)
> >       200840   added usr/lib/libebtc.so.0.0.0 (ebtables)
>
> I think it would make more sense to have the package name before the
> file name, so that it is easier to filter. Indeed, the package name will
> never have spaces, while the filenames may:
>
>     -66452 ebtables removed lib/ebtables/libebtable_nat.so
>      66752 ebtables added   usr/sbin/ebtablesd
>
> Yes, this means that parsers of this will have to be adapted. But even
> with the package name at the end, they would have to be adapted.
>
> Unless you have a strong argument to keep it at the end?

No I have no strong argument for that layout.
In fact, what you propose makes more sense because the package name
will always be in the third column, while with my approach it would
swap to the fourth column in the detailed mode.

I will send a v2.

Thanks!
Thomas
