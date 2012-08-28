From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Aug 2012 01:09:18 +0200
Subject: [Buildroot] [PATCH 02/36] package/sdl: add symlink to sdl-config
In-Reply-To: <20120813125710.13d0fc69@skate>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-2-git-send-email-yann.morin.1998@free.fr>
 <20120813125710.13d0fc69@skate>
Message-ID: <503D4F9E.6070803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/13/12 12:57, Thomas Petazzoni wrote:
> Le Mon, 13 Aug 2012 01:53:50 +0200,
> "Yann E. MORIN"<yann.morin.1998@free.fr>  a ?crit :
>
>> >  SDL installs a script-based sdl-config in the sysroot, but some
>> >  packages (eg. QEMU) needs it to be either:
>> >     - prefixed with the cross-prefix
>> >     - in the PATH
>> >
>> >  So, as sdl-config is a script, and although it is installed in
>> >  the sysroot, it can be run on the host.
> Well, that's typically not how we handle this problem. In general, we
> pass the complete location of the<foo>-config script to
> the ./configure script of the package that needs it. I would prefer if
> we could use this solution everywhere instead of having a different
> solution in different places for the same problem.

  Although I fully agree with using the same pattern everywhere, I think the
pattern is wrong here.  Having a xxx-config script is supposed to make it
easy to discover a package; if you have to point to it explicitly in the
package.mk using it, that kind of defeats the purpose.

  Of course, even so it is still shaky.  If the xxx-config has to be looked up
from the PATH, we risk picking up /usr/bin/xxx-config...  In an ideal world,
they'd all be using pkg-config...  But in an ideal work we probably wouldn't
even need buildroot :-)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
