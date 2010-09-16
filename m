From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 16 Sep 2010 11:05:48 +0200
Subject: [Buildroot] [PATCH 2/5] Added the ability to patch ltmain.sh
 based on version
In-Reply-To: <1284592794-13254-2-git-send-email-Martin.Banky@gmail.com>
References: <1284592794-13254-1-git-send-email-Martin.Banky@gmail.com>
	<1284592794-13254-2-git-send-email-Martin.Banky@gmail.com>
Message-ID: <AANLkTinjL1a6dXK5u=z7Nj0rLA6ZobY_JbWQ4OfW3NRd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I understand this is an easy fix to handle the libtool linkage problem.
But instead of providing a different patch for each libtool version, wouldn't
it be better to directly patch the libtool package, and then activate
autoreconfiguration on packages which need a libtool script able to
cross compile ?

On Thu, Sep 16, 2010 at 1:19 AM, Martin Banky <martin.banky@gmail.com> wrote:
> There are two versions of ltmain.sh in use in the buildroot system, 1.5.x and
> 2.2.x. buildroot-libtool.patch would only patch 1.5.x, which meant that for
> 2.2.x, a separate patch for the affected package had to be maintained. Modified
> Makefile.autotools.in to check the version of ltmain.sh and apply the correct
> patch.
> ---
> ?package/Makefile.autotools.in ? ? ? ? ? ? ? ? ? ? ?| ? 27 ++++++--
> ?package/buildroot-libtool-v1.5.patch ? ? ? ? ? ? ? | ? 69 ++++++++++++++++++++
> ?package/buildroot-libtool-v2.2.patch ? ? ? ? ? ? ? | ? 53 +++++++++++++++
> ?package/buildroot-libtool.patch ? ? ? ? ? ? ? ? ? ?| ? 69 --------------------
> ?.../libdeamon-0.14-buildroot-libtool.patch ? ? ? ? | ? 53 ---------------
> ?.../libogg/libogg-1.2.0-buildroot-libtool.patch ? ?| ? 53 ---------------
> ?.../libvorbis-1.3.1-buildroot-libtool.patch ? ? ? ?| ? 53 ---------------
> ?7 files changed, 143 insertions(+), 234 deletions(-)
> ?create mode 100644 package/buildroot-libtool-v1.5.patch
> ?create mode 100644 package/buildroot-libtool-v2.2.patch
> ?delete mode 100644 package/buildroot-libtool.patch
> ?delete mode 100644 package/libdaemon/libdeamon-0.14-buildroot-libtool.patch
> ?delete mode 100644 package/multimedia/libogg/libogg-1.2.0-buildroot-libtool.patch
> ?delete mode 100644 package/multimedia/libvorbis/libvorbis-1.3.1-buildroot-libtool.patch
>
