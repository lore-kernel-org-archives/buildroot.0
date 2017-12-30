From: Mario Lang <mlang@blind.guru>
Date: Sat, 30 Dec 2017 15:32:12 +0100
Subject: [Buildroot] [PATCH 2/3] package/brltty: use gcc instead of ld
 to link shared objects
In-Reply-To: <20171230130711.GB2921@scaer> (Yann E. MORIN's message of "Sat,
 30 Dec 2017 14:07:11 +0100")
References: <20171230104804.16489-1-mlang@blind.guru>
 <20171230104804.16489-2-mlang@blind.guru>
 <20171230130711.GB2921@scaer>
Message-ID: <87o9mg1e37.fsf@home.blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Mario, All,
>
> On 2017-12-30 11:48 +0100, Mario Lang spake thusly:
>> Fixes:
>>   http://autobuild.buildroot.net/results/2419741c43dea0f91859c19167c8d65cb54e1470
>>   http://autobuild.buildroot.net/results/4b83e53c718520661dc99cde2121f69ce3fd08d7
>> Signed-off-by: Mario Lang <mlang@blind.guru>
>> ---
>>  .../0003-Remove-MKOBJ-in-favour-of-MKMOD.patch     | 63 ++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>  create mode 100644 package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch
>> 
>> diff --git a/package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch b/package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch
>> new file mode 100644
>> index 0000000000..d836652850
>> --- /dev/null
>> +++ b/package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch
>> @@ -0,0 +1,63 @@
>> +From b3b0e47015e9162f519730789976157c7cc38178 Mon Sep 17 00:00:00 2001
>> +From: Mario Lang <mlang@delysid.org>
>> +Date: Fri, 29 Dec 2017 14:52:37 +0100
>> +Subject: [PATCH] Remove MKOBJ in favour of MKMOD. (ml)
>> +
>> +Calling ld directly can lead to problems when cross-compiling.
>
> Since this is a backport of an upstream commit, we like to have a
> pointer to the upstream commit:
>
>     https://github.com/brltty/brltty/commit/4c8aba42e246b96d10ffcbd57653682375499e46

OK, sorry.  Was not aware of that.  Can you add this to the commit log,
or should I resend the patch?

> Also, since you are patching configure.ac, you must autoreconf:
>
>     BRLTTY_AUTORECONF = YES
>
> However, as a backport for Buildroot, I would just keep the diff about
> Drivers/Braille/EuroBraille/Makefile.in and drop the rest of the diff,
> which would no longer require running autoreconf.

We already do the equivalent of autoreconf.  BRLTTY_AUTORECONF = YES
does not work with BRLTTY, as BRLTTY is a autoconf-only package.  Please
see the comment added by Thomas in brltty.mk:

# Autoreconf is needed because we're patching configure.ac in
# 0002-Check-for-ioperm-to-make-sure-the-platform-supports-.patch. However,
# a plain autoreconf doesn't work, because this package is only
# autoconf-based.

-- 
CYa,
  ?????
