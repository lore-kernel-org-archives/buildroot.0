From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 19 Aug 2013 16:41:40 +0200
Subject: [Buildroot] Removing/solving gettext dependencies in libuio
In-Reply-To: <52093951.7060608@mind.be>
References: <CAAXf6LWskVXQjvLYeEBx_JJxuTujMZEq2JzqLMftXXUSaPTQHg@mail.gmail.com>
 <52093951.7060608@mind.be>
Message-ID: <CAAXf6LVtBaOvHGUFGmxShx1DB15R5RZ+c67Smbrq3jnmunPt9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Aug 12, 2013 at 9:36 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 30/07/13 14:28, Thomas De Schampheleire wrote:
>>
>> Hi,
>>
>> I'm adding the library libuio to buildroot
>> (https://github.com/Linutronix/libuio/).
>> This library expects gettext to be present, but I want to avoid adding
>> this dependency to buildroot because it really isn't needed.
>>
>> What is the best way to solve this?
>
>
>  Isn't docs/manual/adding-packages-gettext.txt sufficient?
>

I think not. That document (which I already read, but should've
mentioned) describes two scenarios:
1. the package needs gettext unconditionally
2. the package needs gettext when locale support is enabled

In the case of libuio, I'm strictly speaking in case 1 (unconditional
need for gettext). However, I'm contesting the unconditional need. In
reality, there is little use for that, since the only tool using it is
lsuio, a helper tool, for which no translations are currently
provided. The actual libuio library does not output strings through
gettext.

To remove the dependency on gettext completely, I can either remove
the referring lines in the package (see original mail [1]) or modify
the package's configure script to add a switch like --disable-nls or
similar.

Thanks,
Thomas

[1] http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/63538
