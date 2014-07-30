From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 Jul 2014 14:51:49 -0400
Subject: [Buildroot] lua interpreter choice?
In-Reply-To: <CAB0FRst5RNAYTMa_jVxGoRYS-GjO3jdc05CNkuK9kAdLXgKM2Q@mail.gmail.com>
References: <CANxTyt6-4j70z297t4VsaqKGosnTdWarc5fBVa3vVORmXnWMFQ@mail.gmail.com>
 <CAB0FRst5RNAYTMa_jVxGoRYS-GjO3jdc05CNkuK9kAdLXgKM2Q@mail.gmail.com>
Message-ID: <CANxTyt6mPjEmSdOtNAxqQ=eyfC74qBiFNmFmyhju0aUtqsrHNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 30, 2014 at 2:47 PM, Fran?ois Perrad
<francois.perrad@gadz.org> wrote:
> 2014-07-30 18:59 GMT+02:00 Danomi Manchego <danomimanchego123@gmail.com>:
>> All,
>>
>> With older buildroot releases, I was able to have lua and luajit side
>> by side.  After upgrading, I can *still* select both in the
>> menuconfig, but compiling give me:
>>
>> 'package/luajit/luajit.mk:75: *** Configuration error: both "luajit"
>> and "lua" are selected as providers for virtual package
>> "luainterpreter". Only one provider can be selected at a time. Please
>> fix your configuration.  Stop.'
>>
>
> this change in the virtual-package behavior was introduced by
> http://git.buildroot.net/buildroot/commit/?id=91169d3346e543be18139e18bdcc52a2345e0d16
> (infra/pkg-virtual: validate only one provider provides an implementation)
>
> Fran?ois

Fran?ois,

But the menuconfig still lets you select both packages, instead of
providing a choice of one or the other (like "jpeg support").  Is this
not undesirable?

Danomi -


>> I'm okay (I think) with disabling lua, as I don't *think* I need the
>> lighttpd "Lua support" option, which was forcing lua to be on.  If the
>> build will not allow both to be on then I'm wondering if, just as
>> libjpeg and jpeg-turbo are values for the "jpeg support" choice, if
>> the lua/luajit selection should be a choice rather than two separately
>> selectable packages?
>>
>> Danomi -
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
