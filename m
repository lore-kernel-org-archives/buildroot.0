From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 15:01:38 +0200
Subject: [Buildroot] [PATCH] tinyalsa: new package
In-Reply-To: <471202899.FpAt3MTFiF@hyperion>
References: <1412531488-8849-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20141006211545.025b58c5@free-electrons.com> <471202899.FpAt3MTFiF@hyperion>
Message-ID: <CAGduivx=CUaCb=afZEyGzhobpYmah+tOotiwedWEK5Dn_rT-JQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maarten, all

On Sat, Oct 18, 2014 at 2:42 AM, Maarten ter Huurne
<maarten@treewalker.org> wrote:
> Hi Maxime and Thomas,
>
>> +++ b/package/tinyalsa/tinyalsa.mk
>> [snip]
>> +       $(INSTALL) -D -m 0644 $(@D)/include/sound/asound.h \
>> +                       $(STAGING_DIR)/usr/include/sound/asound.h
>
> This will overwrite the pre-existing (from libc or kernel headers) version
> of <sound/asound.h> with the Android-style stripped version from tinyalsa.
> I think it would be better to keep the pre-existing version of this header,
> do you agree?
IMHO, it's the benefit of using tinyalsa, is not in the tools it
provides, but mainly because of these stripped library and headers
that you want to use in your applications.
Otherwise, you don't really need the tinyalsa package at all.
>
> Bye,
>                 Maarten
>
