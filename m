From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 17 Feb 2015 17:02:55 -0600
Subject: [Buildroot] How to avoid rebuilding host-cmake
In-Reply-To: <BC1FDBEC-8B34-41CB-8335-9FC413467FAC@utexas.edu>
References: <BC1FDBEC-8B34-41CB-8335-9FC413467FAC@utexas.edu>
Message-ID: <CAMQcK5+EMynEMspbf6N8VAbHeJksnZg4fP5NSqRDz2smdTK4yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,

On Tue, Feb 17, 2015 at 4:38 PM, David Kessler <djkessler@utexas.edu> wrote:
>
> I am trying to reduce the amount of time it takes to rebuild the
> linux kernel and its dependencies.  I am already using the external
> toolchain option (toolchain was originally built using buildroot, but
> in an external directory) so I?m not rebuilding the toolchain
> unnecessarily. However, for some reason after doing ?make clean?,
> host-cmake has to be rebuilt. For my configuration host-cmake is
> the most time consuming part of the build.

A 'make clean' in the concept of Buildroot delete all build products
(including build directories, host, staging and target trees, the
images and the toolchain). Therefore, an understanding of when a full
rebuild is necessary. Please see the following section in the manual:

http://nightly.buildroot.org/manual.html#full-rebuild

A per package rebuild functionality is availalbe and is described here:

http://nightly.buildroot.org/manual.html#rebuild-pkg

Is it fair to assume that you are trying to do kernel development?

If so, then you should have a look at utilizing the
<pkg>_OVERRIDE_SRCDIR functionality that Buildroot has which allows
you to development of a package outside of Buildroot. For more
detailed information on how to use this feature see Section 8.11.6 in
the manual:

http://nightly.buildroot.org/manual.html#_advanced_usage

Lastly, you should take a look at utilizing ccache to speed up your
builds, see Section 8.11.3 in the manual:

http://nightly.buildroot.org/manual.html#_advanced_usage

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
