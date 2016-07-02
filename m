From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 2 Jul 2016 10:36:15 +0200
Subject: [Buildroot] [PATCH v2 10/15] toolchain/toolchain-external:
 enable fortran check when it is selected
In-Reply-To: <20160701232044.19aa733c@free-electrons.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-11-s.martin49@gmail.com>
 <20160701232044.19aa733c@free-electrons.com>
Message-ID: <CAHXCMMJk-RyhVx=8sJOac-G2Y658UFKBFrqjT_JVNpCE-J=uTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 1, 2016 at 11:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri,  1 Jul 2016 18:29:15 +0200, Samuel Martin wrote:
>
>>  ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
>> @@ -529,6 +530,10 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
>>       if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
>>               $(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
>>       fi ; \
>> +     if test "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
>> +             $(call check_fortran,\
>> +                     "$(TOOLCHAIN_EXTERNAL_FC) $(TOOLCHAIN_EXTERNAL_CFLAGS)") ; \
>
> Why are you passing TOOLCHAIN_EXTERNAL_CFLAGS for the fortran compiler
> check, while we are not using them for the C++ compiler check ?

Well, no real reason to do this indeed... only gfortran is supposed to
support gcc option, so it should be harmless.
Anyway, I drop them.

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Samuel
