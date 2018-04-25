From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 25 Apr 2018 07:50:37 -0500
Subject: [Buildroot] [PATCH 1/4] package/Makefile.in: Do not use
 CPPFLAGS for hardening options
In-Reply-To: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
Message-ID: <CANQCQpbaywbogjHpXaiQkBsS1Sas2R7tJiP2yW8mfxHrqq2_oQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On Wed, Apr 25, 2018 at 1:45 AM, Stefan S?rensen
<stefan.sorensen@spectralink.com> wrote:
> The hardening options are compiler flags, not pure pre-processor flags, so
> put them in CFLAGS, not CPPFLAGS.
>
> This fixes build errors where -D_FORTIFY_SOURCE=2 whas put in CPPFLAGS and
> then applied to configure tests which could fail since the required -O2 is
> only in CFLAGS.
>

Thanks for sending this series.  When we added the initial support we
debated on doing a few things differently at some point with how this
is implemented.  First, Buildroot uses a toolchain wrapper where it
could inject these flags vs appending like the current design does.
This would allow all the packages with flag ordering issues and no
formal releases, to not carry a patch in buildroot for the long term.
The second was to add support for the autobuilders to start enabling a
safe configuration of these options on random builds to build up the
maturity of the packages. Lastly there was discussion at the late
developer days on integrating the checksec scripting so there was a
way to do some validation of settings taking affect as part of new
Buildroot test cases.  All of these are covered in more detail in the
referenced slides link below.

Refs (patchwork links and design discussion):
https://docs.google.com/presentation/d/1IyrflpslZ6Gnsl-deR5G3sODfuICe-UkBeD44Edudhk/edit?usp=sharing

For this series, I'll work on some test builds (today/tomorrow) and
get you some feedback.

Matt
