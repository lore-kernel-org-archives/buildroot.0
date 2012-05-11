From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 May 2012 00:52:14 +0200
Subject: [Buildroot] [PATCH 3/5] Added the libpth package.
In-Reply-To: <bd5a8085a62f24270632bd39c1a861dc@zacarias.com.ar>
References: <1336598986-9518-1-git-send-email-stijn.souffriau@essensium.com>
 <1336598986-9518-3-git-send-email-stijn.souffriau@essensium.com>
 <bd5a8085a62f24270632bd39c1a861dc@zacarias.com.ar>
Message-ID: <4FAD981E.70805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/10/12 12:43, Gustavo Zacarias wrote:
>> +++ b/package/libpth/Config.in
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_LIBPTH
>> +    bool "libpth"
>> +    help
>> +      Pth is a very portable POSIX/ANSI-C based library for Unix
>> +      platforms which provides non-preemptive priority-based scheduling
>> +      for multiple threads of execution (aka ``multithreading'')
>> +      inside event-driven applications.
>> +
>> + http://www.gnu.org/software/pth/

  Since the upstream package is called pth, it makes sense to give the buildroot
package the same name, rather than libpth.

>
> depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc || BR2_TOOLCHAIN_CTNG_eglibc
> pth doesn't work with uClibc...

  Why do you say that?  I've just tried it with a default uClibc-0.9.33.1 config
on i486 and the pth tests run fine.

  It probably won't work on NOMMU, however: I see some fork calls in there that
are not configured out.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
