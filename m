From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2012 10:46:49 +0200
Subject: [Buildroot] external toolchains and sysroot
In-Reply-To: <20121023092820.638aedd0@skate>
References: <508118F0.3030202@6wind.com>
 <20121019093805.GA2382@mail.sceen.net> <50812162.7090809@6wind.com>
 <20121019095730.GA6397@mail.sceen.net> <20121019100213.GA7355@mail.sceen.net>
 <50813429.3010107@6wind.com> <20121021114154.3d23d89b@skate>
 <50863D0A.40809@6wind.com> <20121023092820.638aedd0@skate>
Message-ID: <50865979.20604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/10/12 09:28, Thomas Petazzoni wrote:
> Unless proven otherwise, I believe that the stability we have achieved
> in external toolchain support using this solution is well worth the ~60
> MB copy at the beginning of a build. It takes less than 5 seconds, with
> is in the statistical noise even compared to a simple Busybox-only
> build.

  FWIW, I agree.  The copying of the sysroot is a bit tricky, but at least
after the copy is done, things are nice and consistent.  Also, some trickery
is required anyway to make sure the right things are copied into the target
directory.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
