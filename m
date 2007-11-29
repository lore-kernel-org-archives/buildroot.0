From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 29 Nov 2007 11:51:13 -0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/asterisk
In-Reply-To: <20071129130145.210C130048@busybox.net>
References: <20071129130145.210C130048@busybox.net>
Message-ID: <d6cda7730711290551m497fb4fah54dbb7e6c67d5218@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all, Ulf,

    Doesn't changing the selects to depends on packages (such as
asterix, ipsec, etc) affect usability quite negatively?
    If I want to have asterisk, I go for asterisk, just to find out I
have to enable packages in other places. If they are not optional,
what is the point in making the user manually go thru menus looking
for packages to select? It's not like I will give up on asterisk
because you are making it harder to enable, right?

    So, why the changes?

Regards,
    Thiago A. Correa

On Nov 29, 2007 11:01 AM,  <ulf@uclibc.org> wrote:
> Author: ulf
> Date: 2007-11-29 05:01:45 -0800 (Thu, 29 Nov 2007)
> New Revision: 20582
>
> Log:
> Make asterisk depend on packets, instead of selecting them
>
> Modified:
>    trunk/buildroot/package/asterisk/Config.in
>
>
> Changeset:
> Modified: trunk/buildroot/package/asterisk/Config.in
> ===================================================================
> --- trunk/buildroot/package/asterisk/Config.in  2007-11-29 13:01:23 UTC (rev 20581)
> +++ trunk/buildroot/package/asterisk/Config.in  2007-11-29 13:01:45 UTC (rev 20582)
> @@ -3,8 +3,11 @@
>         default n
>         select BR2_PACKAGE_NCURSES
>         select BR2_PACKAGE_ZLIB
> -       select BR2_PACKAGE_OPENSSL
> -       select BR2_PACKAGE_MPG123
> +       depends BR2_PACKAGE_OPENSSL
> +       depends BR2_PACKAGE_MPG123
>         help
>                 Asterisk - the Open Source PBX
>
> +comment "asterisk      - disabled (required openssl and mpg123)"
> +       depends !BR2_PACKAGE_OPENSSL || ! BR2_PACKAGE_MPG123
> +
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
