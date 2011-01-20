From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 20 Jan 2011 17:34:42 +0100
Subject: [Buildroot] [PATCH 06/10] libcuefile: new package
In-Reply-To: <4D3830B0.2020708@zacarias.com.ar>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-7-git-send-email-gustavo@zacarias.com.ar>
	<87pqrrbv5b.fsf@macbook.be.48ers.dk>
	<4D3830B0.2020708@zacarias.com.ar>
Message-ID: <AANLkTimjqhVvx=tKdRgrARmj+3RUm8bzqzHR_fbw6b_5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20 January 2011 13:55, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> On 01/20/11 09:46, Peter Korsgaard wrote:
>
>> Cmake also seems to have problems with ccache:
>>
>> CMake Error: your C compiler: "/home/peko/source/buildroot/output2/host/usr/bin/ccache /home/peko/source/buildroot/output2/host/usr/bin/powerpc-unknown-linux-uclibc-gcc" was not found. ? Please set CMAKE_C_COMPILER to a valid compiler path or name.
>> -- Configuring incomplete, errors occurred!
>> make[1]: ***
>> [/home/peko/source/buildroot/output2/build/libcuefile-r453/.stamp_configured]
>> Error 1
>>
>> I don't know anything about cmake. Do you have any idea how to fix this?
>> Disable ccache for this build for now?
>
> *SIGH*
> That's the reason i wrote "oh no, cmake" on IRC.
> Does cdrkit fail too with ccache? (the other cmake package)
> If there's an easy way to skip ccache for this package only i'm all for
> it until we get cmake infra sorted out.

Yes, cdrkit also fail with ccache enabled. It is an issue with CMake
itself so any CMake based package would fail in the same way. I have
seen this issue too when working with the CMake infrastructure.

I've read that the easiest way to get CMake to work with ccache is by
symlinking gcc to ccache. Could we do this?

Best regards,
Bj?rn Forsman
