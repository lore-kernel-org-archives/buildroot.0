From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2013 09:01:51 +0100
Subject: [Buildroot] [PATCH v8 RESEND 2/8] package: add toolchain
 dependency to every target package
In-Reply-To: <20131027185520.4ec5e1b0@skate>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-3-git-send-email-fabio.porcedda@gmail.com>
 <5268455D.10106@mind.be> <20131027185520.4ec5e1b0@skate>
Message-ID: <526E19EF.6060107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/10/13 18:55, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 23 Oct 2013 23:53:33 +0200, Arnout Vandecappelle wrote:
>
>>    What I would prefer is to move glibc, linux-headers and uclibc back
>> under the toolchain directory (why did they ever move out, Thomas?) and
>> to filter on $(pkgparentdir)
>
> Well, the idea is that gcc, uclibc, glibc, linux-headers and so on are
> now real, normal, packages. The only thing we keep in toolchain/ are
> the "entry" point of toolchain backends: toolchain-buildroot and
> toolchain-external.
>
> Moreover, it would be strange to have glibc, uclibc and linux-headers
> in toolchain/, but not gcc and binutils, for example. I do understand
> that these two packages are host packages, so they don't get the
> automatic dependency on the toolchain added, but that's an internal
> detail. From an external point of view, all those components are part
> of the toolchain, so it would be weird to have some of them in
> toolchain/, and some of them in package/.

  So what's your conclusion now? Move all toolchain-related packages back 
to the toolchain directory, or find another solution for circumventing 
the toolchain circular dependency?


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
