From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Sep 2012 22:20:15 +0200
Subject: [Buildroot] [PATCH 01/13] perl: new package v6
In-Reply-To: <CAB0FRsu9fyH_9+QtLgbXrTMA=zqmR1io5vCO6cEYFQfwgtNcxw@mail.gmail.com>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <20120920215636.6d86b7b5@skate>
 <CAB0FRsu9fyH_9+QtLgbXrTMA=zqmR1io5vCO6cEYFQfwgtNcxw@mail.gmail.com>
Message-ID: <5060C07F.70702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/12 23:29, Fran?ois Perrad wrote:
>> >  That said, even so it is certainly possible to create a host-qemu
>> >  package, I am a bit annoyed to see the build process of a package
>> >  requiring qemu. Is there really no other way? I guess it uses qemu to
>> >  run a bunch of tests on the target system. Is there no way to provide
>> >  pre-defined values for those tests, on a per-architecture basis, rather
>> >  than running those test applications in Qemu?
>> >
> Qemu is not used for test, but for the configure and build step.
> Perl is 'bootstrapped' by miniperl (a perl without any extension module),
> during the build process, miniperl is running via qemu (user mode).
>
> Perl doesn't use the "standard" autotools, Perl has a limited support
> for cross-compiling
> where the target executables are running on a real target through a
> ssh connection.
> The use of qemu (user mode) removes the need of a real target and the
> ssh connection.

  Probably a stupid question, but is it possible to build a host-miniperl
and use that for the perl build?  If necessary, we could patch the
host-miniperl a bit to point into the sysroot'ed perl directories, like
is done with host-pkg-config.  Or is the issue that the perl build generates
files with native endianness and struct layout?  That would be more or less
impossible to work around without qemu...


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
