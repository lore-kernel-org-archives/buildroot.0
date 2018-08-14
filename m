From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 00:05:47 +0200
Subject: [Buildroot] pkg-golang: host package not supported
In-Reply-To: <CABa6e=q8EfZv0C+E6B_AxwNDw65+u6-VfWDh0ck6eBHv+_nTug@mail.gmail.com>
References: <CADHdJwDuaeDU_G0ePRPRrWw+3Vo4W0mSx45OuEDnqrgnsKgZQA@mail.gmail.com>
 <20180810140056.5cf7d9ed@windsurf>
 <CABa6e=q8EfZv0C+E6B_AxwNDw65+u6-VfWDh0ck6eBHv+_nTug@mail.gmail.com>
Message-ID: <CADHdJwA2GpxG9mCJ9xV0_VxS9bPUax3Uvq-bJ07TTXy5XikuxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 12, 2018 at 12:23 AM, Cam Hutchison <camh@xdna.net> wrote:
> On 10 August 2018 at 22:00, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>> Hello Mirza,
>>
>> On Fri, 10 Aug 2018 13:34:06 +0200, Mirza Krak wrote:
>>
>>> - Any hints on to add host-golang-package support?
>>
>> The first question is whether the existing host-go package installs a
>> Go compiler that can do native compilation in addition to
>> cross-compilation.
>
> Yes, the existing host-go package will do native compilation. It is
> just a matter of calling the compiler without the extra environment
> variables set in HOST_GO_TARGET_ENV, specifically GOARCH, GOTOOLDIR,
> CC and CXX. I'm not sure about GOROOT - the docs talk about that var
> when un-archiving a binary installation of the toolchain anywhere but
> /usr/local. I suspect a built-from-source toolchain will have the
> correct GOROOT compiled in.

Indeed it was mostly stripping away the target stuff and it worked out
just fine.

I did have one problem with $(2)_SRC_SUBDIR, it turns out to be empty
when building host target. Workaround was to explicitly set this in
the .mk file with the HOST_ prefix. Any hints on why? Need some ifeq
($(4),target) ... else ... endif  magic? :)

The changes I made to the pkg-golang.mk file can be seen here [1].

I have some more work to do and some testing but will eventually send
some patch-sets. It is the Mender package that I am working on and
additional tooling around that, but you could have figured that out as
well :).

[1].https://github.com/mirzak/buildroot/commit/3ae6960692fe225a2a1233d489746929666a1ecd

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
