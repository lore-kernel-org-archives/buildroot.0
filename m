From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 15:23:20 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: bump to version 20.0
In-Reply-To: <CAJtjsKYbRp-NcBxLfc-Xner7TUQuA8i3EjuR0QXgq908+Nwt6w@mail.gmail.com>
References: <20171130154202.437-1-johan.oudinet@gmail.com>
 <20171203105905.3bdd1dc9@windsurf.lan>
 <CAJtjsKYbRp-NcBxLfc-Xner7TUQuA8i3EjuR0QXgq908+Nwt6w@mail.gmail.com>
Message-ID: <20171206152320.1cee91c8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Dec 2017 17:32:31 +0100, Johan Oudinet wrote:

> When trying to reproduce this build failure on my machine, I
> discovered an unrelated error in flann package:
> ERROR: unsafe header/library path used in cross-compilation
> '/usr/include/hdf5/serial'
> 
> I skipped this error by adding this to FLANN_CONF_OPTS:
> -DCMAKE_DISABLE_FIND_PACKAGE_HDF5=TRUE
> 
> As far as I understand it, this HDF5 dependency from flann is only
> here for testing purpose and can be disabled in buildroot build.
> Should I send a patch?

Yes, please :)

> Unfortunately, I failed to reproduce the build failure on erlang but
> when looking at the log, it indeed failed to find libz even though the
> configure above seems to find it:
> checking for zlib 1.2.5 or higher... yes
> checking for zlib inflateGetDictionary presence... checking for
> library containing inflateGetDictionary... -lz

Perhaps it's testing with the 64-bit version of the library, but then
using the 32-bit version or the opposite. Can you build with V=1 (or
whatever is needed in Erlang to get verbose details), and see what is
the exact command that fails to link with zlib ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
