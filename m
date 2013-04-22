From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 23:26:30 +0200
Subject: [Buildroot] ccache problem when compiling with different
 toolchains in different projects
In-Reply-To: <CANxTyt7JzGaq0pirMDDUrEn_XTUxK-4CbaPP00Rn0O709eL50w@mail.gmail.com>
References: <CANxTyt7OWfG1U7yoTtRomKm2ECpC_cnxrGFbD8KVXFty==j7ig@mail.gmail.com>
 <CADzL+YjA_Zx0BCmWESKYnna=dGyf=3BY9pd00m-BhAbw-HG9TQ@mail.gmail.com>
 <5171AF1B.4010806@mind.be>
 <CANxTyt7N+cKyvksZLSgUADMmgmhdfLBqYd=oRSxCVpKaWYEH1w@mail.gmail.com>
 <5171D63D.7050705@mind.be>
 <CANxTyt7EftWCmO25-reSsJJybTkzbB3srsrmZSwjKpadfQNt3w@mail.gmail.com>
 <5174D1DE.6000902@mind.be>
 <CANxTyt7JzGaq0pirMDDUrEn_XTUxK-4CbaPP00Rn0O709eL50w@mail.gmail.com>
Message-ID: <5175AB06.8090101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/13 14:32, Danomi Manchego wrote:
> On Mon, Apr 22, 2013 at 1:59 AM, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
[snip]
>       Actually, after thinking a bit harder about it: the following
>     should work:
>
>     sed -n '/^# Toolchain/,/^# System configuration/' $(BUILDROOT_CONFIG) \
>              | md5sum -
>
>       So there's no need to rename stuff or anything.
>
>
> That would also use the GDB and ECLIPSE lines too.  But then, if it
> accounts for everything outside of the "%compiler% -v" info (wrappers,
> C-library), then it's worth it.
>
> I suppose that we could drop the these lines with an inverse grep:
>
> sed -n '/^# Toolchain/,/^# System configuration/p' .config | \
>      grep -v -e '^#' -e GDG -e ECLIPSE | \
>      md5sum
>
> Too much?

  Too much, yes :-) But perhaps we could change the order of the 
toolchain options.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
