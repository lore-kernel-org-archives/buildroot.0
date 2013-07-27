From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sat, 27 Jul 2013 10:00:59 +0200
Subject: [Buildroot] Strange error when set root password in buildroot
In-Reply-To: <20130727054252.GA4893@zuhnb712.ap.bm.net>
References: <20130725024203.GC391@zuhnb712.ap.bm.net>
 <CAAXf6LU==DtcLaPEiXopt6+32KH=0c4Ws7S7hjw=A183aNjP3w@mail.gmail.com>
 <20130726093118.GA16261@zuhnb712.ap.bm.net>
 <CAAXf6LXcgSMJ1v6nzVMOG=DfkWmJz8SaZm+Rzti4ENBXABKoqw@mail.gmail.com>
 <20130727054252.GA4893@zuhnb712.ap.bm.net>
Message-ID: <CAAXf6LX1Yy4Nazpde1n1b31aYEkm53-fv8MQ=PFEPP8Nd646Dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> >
>> > sorry, now I understand what you mean.  My linux is slackware linux, the
>> > mkpasswd located in /usr/bin/mkpasswd, which even don't support -V or
>> > --version to check its version number. And, yes, you are right, my
>> > 'mkpasswd' does not recognize '-m' option.
>>
>> I'm not sure. Either we have to change buildroot to detect whether -m
>> is available before using it (if not, it will probably default to
>> md5). Or we need to find another solution.
>>
>> Just a wild guess, can you check if there are other mkpasswd's available?
>> ls -l /bin/mkpasswd /usr/bin/mkpasswd /sbin/mkpasswd /usr/sbin/mkpasswd
>>
>> A workaround for you is to change buildroot to remove the -m thing,
>> but it's better if we fix it completely, I think.
>>
>> Thanks,
>> Thomas
>
> There is no other mkpasswd on my slackware box. The only one comes from
> the expect package. Would you please where to change the '-m' in
> buildroot and how?  Thanks.

In system/system.mk, if you change line

TARGET_GENERIC_ROOT_PASSWD_HASH = $(shell mkpasswd -m
"$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")

in

TARGET_GENERIC_ROOT_PASSWD_HASH = $(shell mkpasswd
"$(TARGET_GENERIC_ROOT_PASSWD)")

I guess it will work for you. But this is not an acceptable final solution.

Input from others would be great here.

Best regards,
Thomas
