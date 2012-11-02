From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 02 Nov 2012 23:21:58 +0100
Subject: [Buildroot] BR2_PREFER_STATIC_LIB and LDFLAGS+= -static
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6287244@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C6287244@ex-mb1.corp.adtran.com>
Message-ID: <50944786.4040407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/12 18:06, ANDY KENNEDY wrote:
> All,
>
> Near line 302 in package/Makefile.in was added TARGET_LDFLAGS += -static
> to satisfy a request I made a while back.  This really needs to be
> --static so that it filters down through autoconf the correct way.  If
> -static is passed in LDFLAGS, autoconf regularly mishandles this by
> setting a variable then never reconfiguring the package's make system
> to build static.  However, the --static to ld is the same as -static,
> but autoconf does not compare for --static, thus, packages get built as
> desired.

  I don't really understand how it can go wrong...  Can you give an example
of a package with a configure script that handles it the wrong way?

>
> Can someone change this in package/Makefile.in or should I submit a
> dinky patch for this?

  Yes, please submit a patch.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
