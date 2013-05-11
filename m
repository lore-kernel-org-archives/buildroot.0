From: Anders Darander <anders.darander@gmail.com>
Date: Sat, 11 May 2013 14:25:26 +0200
Subject: [Buildroot] [PATCH 3/5] am33x-cm3: add FW for suspend/resume
In-Reply-To: <518DE6DE.2070101@mind.be>
References: <CAE4k239uzqJGVwGSsP7AtrQrbcKqNbe3f1P5ix33U8rpge96EA@mail.gmail.com>
 <518DE6DE.2070101@mind.be>
Message-ID: <CAE4k239iOG9ywuyHt+-eKzVZOnuDQ1y+E5h0PQh+YVC6jL2Rnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11 May 2013 08:36, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 11/05/13 06:38, Anders Darander wrote:
>
>> (Resend a as I first sent from an unsubcribed email).
>>
>> Arnout Vandecappelle <arnout at mind.be <mailto:arnout@mind.be>> wrote:
>>
>>  >On 09/05/13 22:31, Anders Darander wrote:
>>  >> From: Anders Darander <anders@chargestorm.se
>>
>
>   >> +AM33X_CM3_LICENSE_FILES = License.txt
>>  >> +
>>  >> +define AM33X_CM3_BUILD_CMDS
>>  >> + $(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)**" -C
>> $(@D)
>>  >all
>>  >
>>  >Does it work with $(TARGET_CONFIGURE_OPTS) instead of CC=? If not, then
>>  >
>>  >please also pass the CFLAGS and LDFLAGS - they may be important.
>>  >
>>  >However, now I think about it - this is abusing the cross-compiler for
>>  >the Cortex-A8 to generate code for the Cortex-M3, correct? In that
>>  >case,
>>  >passing CFLAGS and LDFLAGS is probably not a good idea. But it would
>>  >also
>>  >be good to add a note about what is happening here.
>>
>> I'll add a comment on this. Once again, the technique is taken from the
>> TI's BSP.
>>
>
>  I get a lot of
>
> warning: switch -mcpu=cortex-m3 conflicts with -march=armv7-a switch
> [enabled by default]
>
> but I guess these are harmless.
>
> (the -march=armv7-a is added by the toolchain wrapper).
>

Using what toolchain? I'm not seeing these warning (and neither am I seeing
any -march=armv7-a) in my test builds. I'm using the buildroot toolchain
generated with this patch series applied to the 2013.05-rc1 tag.



>  But I'm not 100% sure if a custom toolchain will actually build for the
> correct architecture. Could you try if the result of something built with
> the buildroot toolchain works correctly? If you want, I can send you the
> .bin file so you don't have to wait an hour for the whole toolchain to
> compile. Or, if you have actually tested it with a buildroot toolchain,
> could you try if it also works with an external Sourcery and/or Linaro
> toolchain?
>
>

>  >  init scripts are installed by a separate variable,
>>  >AM33X_CM3_INSTALL_INIT_SYSV. And of course, the same remark about the
>>  >-D
>>  >option applies.
>>
>> Thanks, I'm fox that too.
>>
>> Does that make it install when using busybox init also?
>>
>
>  Yes it does.
>
>  Only when systemd is selected, it doesn't install anything. So ideally
> you should also add a systemd unit file.
>

As I'm not building systemd in any buildroot / beaglebone project, I think
I'll wait with adding the systemd unit file until I can test it more. Or if
someone beats me to it.

Version 2 of the patch series on it's way...

Cheers,
Anders
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130511/95081d5a/attachment.html>
