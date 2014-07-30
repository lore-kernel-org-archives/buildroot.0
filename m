From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 Jul 2014 18:34:40 -0400
Subject: [Buildroot] lua interpreter choice?
In-Reply-To: <20140730234037.19f851da@free-electrons.com>
References: <CANxTyt6-4j70z297t4VsaqKGosnTdWarc5fBVa3vVORmXnWMFQ@mail.gmail.com>
 <CAB0FRst5RNAYTMa_jVxGoRYS-GjO3jdc05CNkuK9kAdLXgKM2Q@mail.gmail.com>
 <CANxTyt6mPjEmSdOtNAxqQ=eyfC74qBiFNmFmyhju0aUtqsrHNQ@mail.gmail.com>
 <20140730234037.19f851da@free-electrons.com>
Message-ID: <CANxTyt6GCC6K1NPyCGf9rHrO6T0o+y7K+PAioWKdRPZysDbhcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 30, 2014 at 5:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Danomi Manchego,
>
> On Wed, 30 Jul 2014 14:51:49 -0400, Danomi Manchego wrote:
>
>> > this change in the virtual-package behavior was introduced by
>> > http://git.buildroot.net/buildroot/commit/?id=91169d3346e543be18139e18bdcc52a2345e0d16
>> > (infra/pkg-virtual: validate only one provider provides an implementation)
>> >
>> > Fran?ois
>>
>> But the menuconfig still lets you select both packages, instead of
>> providing a choice of one or the other (like "jpeg support").  Is this
>> not undesirable?
>
> We discussed this before doing the commit pointed by Fran?ois.
> Unfortunately, there's no good solution to solve this problem at the
> kconfig level. The only solution would be to have each package being a
> provider of a certain virtual package, have the knowledge of *all*
> providers of that virtual packages to do a "depends
> on !BR2_PACKAGE_<foo>". While for lua vs. luajit this seems more or
> less reasonable, as we probably don't expect to have more providers
> than just lua and luajit, but in the general case, we have things like
> libgles or egl (for OpenGL support) which have multiple providers, and
> we don't want to have to edit all of them whenever we add a new
> provider.
>
> Not speaking about packages in BR2_EXTERNAL, which we cannot control.
>
> So our decision was to use a build-time check rather than a
> kconfig-time check.
>
> Hope this clarifies the situation,

Let me apologize in advance if I'm still missing something obvious but
- what distinguishes the lua/luajit case from the libjpeg/jpeg-turbo
case, or the systemd/eudev case?  Is the virtual-package
infrastructure + kconfig choice not suitable here?

Danomi -
