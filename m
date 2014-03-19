From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 19 Mar 2014 11:04:15 +0100
Subject: [Buildroot] autoreconf: Command not found
In-Reply-To: <CAKAx1chQXSeM3q+B-T9BCPakjoUrzrjMj8vQ6OwHn6OaaG6RPw@mail.gmail.com>
References: <CADYw_JJ+tid_YUNwBquEjnBiin+4uNN6bMSd9AEV++zf-5Xwdw@mail.gmail.com>
 <CAKAx1chQXSeM3q+B-T9BCPakjoUrzrjMj8vQ6OwHn6OaaG6RPw@mail.gmail.com>
Message-ID: <CAKAx1ciu8+7EYbov5ox0SvVgp9ysx8CVNT4UZLAbyiWBfsQdkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again,

On Wed, Mar 19, 2014 at 10:58 AM, Lionel Orry <lionel.orry@gmail.com> wrote:
> Hi,
>
> On Wed, Mar 19, 2014 at 8:06 AM, Stanislav Vlasic <svlasic@gmail.com> wrote:
>> Hi,
>>
>> sorry if I'm duplicating question but I'm facing problem building 3rd party
>> package on 2014.02 buildroot (package: xbmc, but doesn't really matter).
>>
>> Question, how to solve error: autoreconf: Command not found
>
> I would tend to say, line 141
> (https://github.com/Stane1983/buildroot-M3-MX/blob/2014.02-Amlogic/package/thirdparty/xbmc/xbmc.mk#L141),
> use
>
>    cd $(XBMC_DIR) && $(TARGET_CONFIGURE_OPT) ./bootstrap

Oops I made a typo : I meant

   cd $(XBMC_DIR) && $(TARGET_CONFIGURE_OPTS) ./bootstrap

>
> The most preferred way would be to use
>
> XMBC_AUTORECONF = YES
>
> but xmbc provides a customized bootstrap process which does not only
> rely on autoreconf, so try the first suggestion above.
>
>>
>> I found autoreconf binary in out/host, but...
>>
>> My current makefile:
>> https://github.com/Stane1983/buildroot-M3-MX/blob/2014.02-Amlogic/package/thirdparty/xbmc/xbmc.mk
>>
>> Regards,
>> Stanislav Vlasic
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Regards,
> Lionel
