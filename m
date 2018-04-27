From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 27 Apr 2018 08:09:12 -0500
Subject: [Buildroot] [PATCH 1/4] package/Makefile.in: Do not use
 CPPFLAGS for hardening options
In-Reply-To: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
Message-ID: <CANQCQpbH7q=do2DiA+1VFoozWhXJ67ZsYwtjQhNGsULWEqt=Wg@mail.gmail.com>
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

Confirmed that the current upstream has a bug where you can't get full
RELRO.  This patchset fixes that.

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
