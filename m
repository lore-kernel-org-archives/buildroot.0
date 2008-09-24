From: Christopher Taylor <chtaylo3@gmail.com>
Date: Wed, 24 Sep 2008 10:34:05 -0400
Subject: [Buildroot] Buildroot with a custom kernel
In-Reply-To: <ea7358da0809240525x54000084sa81fff0e4ca16b8c@mail.gmail.com>
References: <ea7358da0809230856u39726ed6k90c06c8cdbb8a2b@mail.gmail.com>
	<2590773a0809231029o75f55b61u58eb59f18d4421fd@mail.gmail.com>
	<1B0F60C9E236904CB364F9EF52E0AFD9026139CB@sma10.technidata-ag.com>
	<ea7358da0809240525x54000084sa81fff0e4ca16b8c@mail.gmail.com>
Message-ID: <2590773a0809240734p9b6e49bt2f4ef941b6882f24@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, I got BR to build a bastardized kernel 2.6.20/2.6.21 + other misc
patches.  It wasn't easy, so I understand your frustration.  Honestly,
the easiest way about it is exactly what you were told earlier: get a
newer kernel.

Baring that, another option it to do a diff of the kernel version you
do have against the vanilla kernel for that version, then try to apply
that to a newer kernel.  You'll need to know a bit about board support
packages.

I seem to remember having trouble using BR's "other krenel" options
and that why I went with a quick and ugly hack by just taring up my
own kernel, renaming it to one of the kernel's BR supports and copying
it into the dl dir ... then config BR to compile the kernel that
matches my kernel version.....  it's quick and ugly ... but it works
for me.

Which approach did ya'll try?

-Chris

On Wed, Sep 24, 2008 at 8:25 AM, Alex Rades <alerades@gmail.com> wrote:
> On Tue, Sep 23, 2008 at 7:57 PM, Bussmann, Paul
> <Paul.Bussmann@technidata.com> wrote:
>>> 2) tarball up your custom kernel and place it in the dl dir.  Make
>>> sure you name is according to what you have in your buildroot config
>>> for the kernel version.  BR will then assume you've already dl'ed the
>>> kernel and use your version.
>>
>> I already tried this with 2.6.17 on ARM. Resulting in everything _looked_
>> fine at first but my board instantly rebooted when I tried to use TCP stuff.
>> It is indeed related to BR's toolchain, because if I use the manufacture's
>> (Ka-Ro) toolchain to compile the kernel, it works.
>> So I asked on this mailing list about getting a 2.6.17-supporting Buildroot
>> environment (2008-08-25) with the following answer (2008-08-26):
>>
>>> 2.6.17 was released around Jun 18  2006. I'd ask those people for a
>>> vaguely recent kernel.
>>
>> So I'd be very interested if you have similar success.
>
> I've been the whole day fiddling with makefiles but i can't get it
> working.. too intricate.
>
