From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 01:12:30 +0200
Subject: [Buildroot] Qt tribulations take 2
In-Reply-To: <CALo-6+hSrFrqua1s48qzYn9J8qF0F6=zCpgfbguO2hf3VmqeOQ@mail.gmail.com>
References: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
 <20120713165557.1b39651c@skate>
 <CALo-6+gv+zb1peT7ngOGLL7VnS6xpCUOZRn_J6CD86Kmn7vX=A@mail.gmail.com>
 <20120714182555.4b7b267d@jl-desk-LL>
 <CALo-6+hSrFrqua1s48qzYn9J8qF0F6=zCpgfbguO2hf3VmqeOQ@mail.gmail.com>
Message-ID: <5001FCDE.7000700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/15/12 00:00, Charles Krinke wrote:
> I can compile successfully Qt with the buildroot generated toolchain
> now. However, that gets me to the next step. When I try to go back to
> using TI's external toolchain, I get this error with libtool. I get no
> corresponding libtool error with the buildroot compiled toolchain.
> Would you be willing to comment on what might be going on here?

  When you "go back to using TI's external toolchain", that should include
the following steps:

- set BR2_TOOLCHAIN_EXTERNAL_CUSTOM and set BR2_TOOLCHAIN_EXTERNAL_PATH to
the location of the TI toolchain;

- set the other toolchain options to whatever is provided by the TI toolchain
(probably glibc and C++)

- run make clean

- run make.


  By the way, when you post some error output, it's better if you can also
include the call from buildroot to the package's build system so we can
spot discrepancies there.  And also include the final lines about which
package failed...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
