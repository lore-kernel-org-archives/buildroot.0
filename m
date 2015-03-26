From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 26 Mar 2015 13:52:45 -0500
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain
	w/threads
In-Reply-To: <CAMQcK5KRF47ZyTyzfj1e+xcDO0V_J8oUUXEgUiqF3zR6VYv7Qw@mail.gmail.com>
References: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
 <CAMQcK5KRF47ZyTyzfj1e+xcDO0V_J8oUUXEgUiqF3zR6VYv7Qw@mail.gmail.com>
Message-ID: <CANQCQpaJObqR6poUyh5FMm58vPFGyruJm=JBWBbQtPgsP8pf1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan,

On Thu, Mar 26, 2015 at 1:16 PM, Ryan Barnett
<ryan.barnett@rockwellcollins.com> wrote:
> Matt,
>
> On Thu, Mar 26, 2015 at 10:54 AM, Matt Weber
> <matthew.weber@rockwellcollins.com> wrote:
>
> Why does jamvm need threads? I don't see any issues with toolchains on
> the autobuilders needing threads to build this package.
>
> http://autobuild.buildroot.org/?reason=jamvm-2.0.0
>
> Could you please elaborate more why jamvm needs a toolchain with
> threads and how you discovered this?

While running an autobuilder internally.  It's a arm uclibc build
failure looking for pthreads.

Here's some of the build end
http://climbi.com/b/3851/0

The config...
http://climbi.com/b/3852/0

>
>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>> ---
>>  package/jamvm/Config.in | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
>> index f480995..1e33f42 100644
>> --- a/package/jamvm/Config.in
>> +++ b/package/jamvm/Config.in
>> @@ -5,13 +5,15 @@ config BR2_PACKAGE_JAMVM
>>                 || BR2_mips || BR2_mipsel || BR2_powerpc
>>         select BR2_PACKAGE_ZLIB
>>         select BR2_PACKAGE_CLASSPATH
>> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>>         help
>>           JamVM is a new Java Virtual Machine which conforms to the
>>           JVM specification version 2 (blue book).
>>
>>           http://jamvm.sf.net
>>
>> -comment "jamvm needs a toolchain w/ IPv6"
>> +comment "jamvm needs a toolchain w/ IPv6 and threads"
>>         depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
>>                 || BR2_mips || BR2_mipsel || BR2_powerpc
>>         depends on !BR2_INET_IPV6
>> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> Thanks,
> -Ryan
>
> --
> Ryan Barnett / Sr Software Engineer
> Airborne Information Systems / Security Systems and Software
> MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
> ryan.barnett at rockwellcollins.com
> www.rockwellcollins.com



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
