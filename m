From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 1 Apr 2016 11:14:53 +0200
Subject: [Buildroot] [PATCH 3/3] dropbear: use libtomath & libtomcrypt
In-Reply-To: <20160401084209.GB2406@tarshish>
References: <1459498030-19700-1-git-send-email-francois.perrad@gadz.org>
 <1459498030-19700-3-git-send-email-francois.perrad@gadz.org>
 <20160401084209.GB2406@tarshish>
Message-ID: <CAB0FRssTFMSXVvEoj+i6CnqUDp_tBN7RrE3KgsNcXB-8K+OkaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-04-01 10:42 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:
> Hi Francois,
>
> On Fri, Apr 01, 2016 at 10:07:10AM +0200, Francois Perrad wrote:
>> +ifeq ($(BR2_PACKAGE_LIBTOMMATH)$(BR2_PACKAGE_LIBTOMCRYPT),yy)
>> +DROPBEAR_DEPENDENCIES += libtommath libtomcrypt
>
> Does dropbear code use libtommath directly? If not, listing only libtomcrypt
> should be enough. The check for BR2_PACKAGE_LIBTOMMATH can also be dropped in
> this case.
>

The configure script of dropbear checks the presence of both libraries
: libtommath and libtomcrypt.
See https://github.com/mkj/dropbear/blob/master/configure.ac#L391

Fran?ois

>> +DROPBEAR_CONF_OPTS += --disable-bundled-libtom
>> +else
>> +DROPBEAR_CONF_OPTS += --enable-bundled-libtom
>> +endif
>> +
>>  ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
>>  # Build dbclient, and create a convenience symlink named ssh
>>  DROPBEAR_PROGRAMS += dbclient
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
