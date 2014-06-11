From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jun 2014 21:03:22 -0500
Subject: [Buildroot] [PATCH 2/3] tclap: new package
In-Reply-To: <20140610221111.5181dcb3@free-electrons.com>
References: <1402412526-24844-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1402412526-24844-3-git-send-email-matthew.weber@rockwellcollins.com>
 <20140610221111.5181dcb3@free-electrons.com>
Message-ID: <CANQCQpYOrNEFP=TpzjJk8AcHS1B3+ek+fgEKJtYiE93Fq=1EZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Jun 10, 2014 at 3:11 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matt Weber,
>
> On Tue, 10 Jun 2014 08:02:05 -0700, Matt Weber wrote:
>
>> diff --git a/package/tclap/Config.in b/package/tclap/Config.in
>> new file mode 100644
>> index 0000000..e50704b
>> --- /dev/null
>> +++ b/package/tclap/Config.in
>> @@ -0,0 +1,12 @@
>> +config BR2_PACKAGE_TCLAP
>> +     bool "tclap"
>
> This package needs C++ support, so the appropriate 'depends on' +
> comment is needed.
>
>> +     help
>> +       This is a small, flexible library that provides a simple interface for
>> +       defining and accessing command line arguments. It was intially inspired
>
> intially -> initially.
Agree.

>
>> +       by the user friendly CLAP libary. The difference is that this library is
>> +       templatized, so the argument class is type independent. Type independence
>> +       avoids identical-except-for-type objects, such as IntArg, FloatArg, and
>> +       StringArg. While the library is not strictly compliant with the GNU or
>> +       POSIX standards, it is close.
>
> Please check lines do not exceed 72 chars.
Agree.

>
>> +       http://tclap.sourceforge.net/
>> diff --git a/package/tclap/tclap.mk b/package/tclap/tclap.mk
>> new file mode 100644
>> index 0000000..268b90b
>> --- /dev/null
>> +++ b/package/tclap/tclap.mk
>> @@ -0,0 +1,16 @@
>> +################################################################################
>> +#
>> +# tclap
>> +#
>> +################################################################################
>> +
>> +TCLAP_VERSION = 1.2.1
>> +TCLAP_SITE = http://downloads.sourceforge.net/project/tclap
>> +TCLAP_SOURCE = tclap-$(TCLAP_VERSION).tar.gz
>
> Not needed, that's the default.
Sure.

>
>> +TCLAP_LICENSE = MIT
>> +TCLAP_LICENSE_FILES = COPYING
>> +
>> +TCLAP_INSTALL_STAGING = YES
>> +TCLAP_INSTALL_TARGET = NO
>
> A short comment that explains why INSTALL_TARGET = NO is useful. Just
> say it's a pure C++ template library, only made of headers.
Sure.

<snip>


-- 
Matthew L Weber / Sr Software Engineer / Platform Software
matthew.weber at rockwellcollins.com
www.rockwellcollins.com
