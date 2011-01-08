From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 9 Jan 2011 00:44:19 +0100
Subject: [Buildroot] [PATCH 1/4] Add CMAKETARGETS infrastructure for
	CMake packages
In-Reply-To: <20110107181705.20654fb0@surf>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
	<20110107181705.20654fb0@surf>
Message-ID: <AANLkTikjXhXn8SXi1wwjWDXzqQKYZD2er_+JpTs2AYXZ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2011/1/7 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hello Bjorn,
>
> On Sun, 12 Dec 2010 20:29:12 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> +# CMake doesn't support having the --sysroot option directly in the
>> +# compiler path, so move this option to the CFLAGS/CXXFLAGS variables.
>> +CMAKE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
>> +CMAKE_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX))
>> +CMAKE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
>> +CMAKE_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX)) $(TARGET_CXXFLAGS)
>
> Those definitions should be *outside* the CMAKETARGETS_INNER macro,
> because:
>
> ?1/ They might be useful even if no package makes use of the
> ? ?CMAKETARGETS infrastructure
>
> ?2/ They are not package specific, so they have no reason to be inside
> ? ?the macro.

You are right. I will fix it in the next version of the patch series.

Best regards,
Bj?rn Forsman
