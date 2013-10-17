From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Oct 2013 18:12:37 +0200
Subject: [Buildroot] [PATCHv2] toolchain-external: add a specific check
 to avoid Angstrom toolchains
In-Reply-To: <1381652900-12516-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381652900-12516-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52600C75.5030503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/10/13 10:28, Thomas Petazzoni wrote:
> The Angstrom toolchains available at
> http://www.angstrom-distribution.org/toolchains/  are not usable as
> external toolchains in Buildroot, because they are not pure toolchains
> with just the C library, but instead complete SDKs with many
> cross-compiled libraries (Gtk, Qt, glib, neon, sqlite, X.org, and many
> more, approximately 200 MB of libraries).
>
> Buildroot cannot use such toolchains, and while this is documented in
> our manual, some users still try to do this. Today, one such user came
> on the IRC channel, reporting a build problem, which we started
> investigating, only to realize after a long time that he was using an
> Angstrom toolchain.

  Just for my info, how is it possible that we cannot use such an 
Angstrom toolchain as an external toolchain, but it is possible to use a 
buildroot-generated one? We can also generate a host dir with loads of 
libs, and these are perfectly usable as external toolchain, right?

  Regards,
  Arnout

>
> To avoid this problem in the future, we explicitly check if the
> toolchain is from Angstrom by looking at the vendor part of the tuple
> exposed by the toolchain: as soon as it is
> <something>-angstrom-<something-else>, we reject the toolchain with an
> explanation.
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
