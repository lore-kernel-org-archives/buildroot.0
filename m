From: Dave Bender <codehero@gmail.com>
Date: Wed, 28 Jan 2015 16:47:11 -0500
Subject: [Buildroot] [PATCHv3] package/openldap: new package
In-Reply-To: <87k306vavd.fsf@dell.be.48ers.dk>
References: <1422224360-13009-1-git-send-email-yann.morin.1998@free.fr>
 <87k306vavd.fsf@dell.be.48ers.dk>
Message-ID: <CAETHaKrQmncsXykacjFQeZYr1qsP5wvRQutYasTHocy-9Mo+yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> It would be simpler to just remove the 'STRIP = -s' from build/top.mk so
> the strip stuff wasn't used, but ok - This patch could conceptually get
> upstreamed.
>
> Has it been sent upstream?
>

I have not sent it yet but I will take care of that.

>
>> +++ b/package/openldap/Config.in
>  > @@ -0,0 +1,9 @@
>  > +config BR2_PACKAGE_OPENLDAP
>  > +    bool "openldap"
>  > +    help
>  > +      OpenLDAP Software is an open source implementation of
>  > +      the Lightweight Directory Access Protocol.
>  > +
>  > +      This only installs client-side support.
>  > +
>
> It needs wchar:
>
> utf-8-conv.c: In function 'ldap_x_utf8_to_mb':
> utf-8-conv.c:349:14: error: 'wctomb' undeclared (first use in this function)
>
> Committed with that fixed, thanks.
>
> --
> Bye, Peter Korsgaard
