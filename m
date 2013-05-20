From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 20 May 2013 15:52:14 +0100
Subject: [Buildroot] [PATCH] ed: Convert to generic package
	infrastructure
In-Reply-To: <20130520164905.1b5c9ac5@skate>
References: <1369056118-32503-1-git-send-email-markos.chandras@gmail.com>
 <20130520164905.1b5c9ac5@skate>
Message-ID: <CAG2jQ8gTjrdLOAmgkGifTG_fbUSubUybOJyrDHHVKq-rr0SJSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 20 May 2013 15:49, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Mon, 20 May 2013 14:21:58 +0100, Markos Chandras wrote:
>
>> -$(eval $(autotools-package))
>> +define ED_CONFIGURE_CMDS
>> +     ( cd $(@D); \
>
> Nitpick: we typically don't put a space here.

Do you mean after '(' or before '\' ?

>
>> +             ./configure \
>> +             --prefix=/usr \
>> +             CPPFLAGS="$(TARGET_CPPFLAGS)" \
>> +             CFLAGS="$(TARGET_CFLAGS)" \
>> +             LDFLAGS="$(TARGET_LDFLAGS)" \
>> +             CC="$(TARGET_CC)" \
>
> Maybe you could use $(TARGET_CONFIGURE_OPTS) here instead?
>
> Thanks!
>

Yeah sure I will do that.

--
Regards,
Markos Chandras
