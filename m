From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Jan 2019 10:27:35 +0100
Subject: [Buildroot] Xtensa toolchain issue ?
In-Reply-To: <CAMo8BfJR7vgLDONmKDX3S8RLyJBMYmXEKjjEr3JK5JOTHrd5hg@mail.gmail.com>
References: <20190102112130.0b8d32f8@windsurf>
 <CAMo8BfJR7vgLDONmKDX3S8RLyJBMYmXEKjjEr3JK5JOTHrd5hg@mail.gmail.com>
Message-ID: <20190104102735.52e7e733@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Max,

As usual, thanks a lot for your feedback, very useful.

On Thu, 3 Jan 2019 14:17:51 -0800, Max Filippov wrote:

> My understanding is that this is not something that could be fixed
> in a generic way, but requires support from the compiler backend.
> Specifically it needs a way to tail-call a variadic function from a
> thunk,

This is intricate compiler stuff. If you have a bit of time to give a
few more details about this, I'd be interested. Of course, that's just
to satisfy my endless curiosity, so if you don't have time/interest,
you can skip this request :-)

> something that is not trivial to do on xtensa architecture.
> The corresponding test in the gcc test suite
> (gcc/testsuite/g++.old-deja/g++.jason/thunk3.C)
> has been disabled since 2002.
> 
> The test in the bug that you've referenced still fails on xtensa with
> gcc 8 and gcc 9.
> 
> I'll try to implement required support in the xtensa backend for the
> above to work.

Since the issue also happens on OpenRISC, perhaps we need to have some
BR2_TOOLCHAIN_SUPPORTS_XYZ boolean that says whether the gcc version
supports this specific stuff. However, since I don't clearly understand
what the issue is, I wouldn't be able to find a good name for that
BR2_TOOLCHAIN_SUPPORTS_XYZ option.

BR2_TOOLCHAIN_SUPPORTS_TAIL_CALL_VARIADIC_FUNC_FROM_THUNK ? :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
