From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 07 Aug 2018 17:12:52 +0300
Subject: [Buildroot] [PATCH] package/proftpd: add
 BR2_PACKAGE_PROFTPD_MOD_SFTP
In-Reply-To: <CANQCQpbT9m=mvz7pQjuvMrR3dJrzdf+3PJKYhJX6-rRxOYmmJw@mail.gmail.com>
References: <1533648866-61581-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87r2jab83j.fsf@tkos.co.il>
 <CANQCQpbT9m=mvz7pQjuvMrR3dJrzdf+3PJKYhJX6-rRxOYmmJw@mail.gmail.com>
Message-ID: <87o9eeb6zf.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Matthew Weber writes:
> On Tue, Aug 7, 2018 at 8:48 AM Baruch Siach <baruch@tkos.co.il> wrote:
>> Matt Weber writes:
>> > +ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SFTP),y)
>> > +PROFTPD_CONF_OPTS += --enable-openssl
>>
>> Don't you need openssl/libressl as build time dependency?
>
> Yeah, I'll add a check for BR2_PACKAGE_OPENSSL.   By chance, do you
> know if there is a risk of library compatibility between libopenssl
> and libressl?

There are some minor API differences between openssl and libressl. You
should probably build test against both of them.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
