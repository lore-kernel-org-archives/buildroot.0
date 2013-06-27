From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Thu, 27 Jun 2013 17:07:48 -0300
Subject: [Buildroot] [PATCH] jimtcl: new package
In-Reply-To: <51CC9A4A.9040206@zacarias.com.ar>
References: <1372252177-3592-1-git-send-email-elezegarcia@gmail.com>
 <51CC9A4A.9040206@zacarias.com.ar>
Message-ID: <CALF0-+W+KELx_qdMyVEZgddP7B90jzfd_SiV75yFGzQr59-v4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 27, 2013 at 5:02 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
>
> Why not use the debian mirror as i did?

I thought using the jimtcl source of the sources was nicer...

> It's usually nicer to do http since some paranoid firewalling in some
> companies block git access.
>

... but that's a good reason to not do it. I guess it's pretty much the
same in terms of getting the latest stuff, since jimtcl is not going
fast enough to care -0.73 is already 18-months old.

>> +ifneq ($(BR2_PACKAGE_TCL),y)
>> +define JIMTCL_LINK_TCLSH
>> +     ln -sf jimsh $(TARGET_DIR)/usr/bin/tclsh
>> +endef
>> +endif
>
> Positive logic preferred...
> ifeq ($(BR2_PACKAGE_TCL),)
> ...
> (my fault from my old submission though).
>

Sure.

> Care to resend a V2?

Of course.

-- 
    Ezequiel
