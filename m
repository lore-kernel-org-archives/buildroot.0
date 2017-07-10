From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 10 Jul 2017 11:10:34 -0500
Subject: [Buildroot] RFC: ASLR
Message-ID: <CANQCQpb32H5XF+DtgYcuu=JFdgGCE3gEm+pHffWYk0yno6w0pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

I have a patchset we're starting to assemble for enabling hardening
across specific packages in Buildroot.  I hear you may have already
looked at this problem/feature?

What I'm seeing is that these changes are considered "optional" at a
package build level.  Plus I'm not advocating we carry specific
Buildroot patches for items where it doesn't make sense for the
package upstream to default to them.  Instead, could we add a
conditional in the .mk that adds the FLAGS update on specific packages
which have the ability to enable it? Sort of in a similar way to how
we enable libcurl and other dependencies automatically in other
packages if that package/option is enabled.  This would allow us to
grow support over time and not force all packages to build with the
option (plus keep it optional in general for those that want it
enabled).

Thoughts?

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com
