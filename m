From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Wed, 12 Mar 2014 03:14:53 -0400
Subject: [Buildroot] [PATCH v5 1/6] libdrm: Remove xorg dependency for
 intel driver
In-Reply-To: <lo95vax104.ln2@ID-313208.user.individual.net>
References: <BLU0-SMTP20422ECD84A18D82671FAE4D9770@phx.gbl>
 <531F851F.40002@savoirfairelinux.com>
 <3p65vaxf8m.ln2@ID-313208.user.individual.net>
 <lo95vax104.ln2@ID-313208.user.individual.net>
Message-ID: <5320096D.1020900@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi bernd,

On 03/12/2014 02:00 AM, Bernd Kuhls wrote:
> Bernd Kuhls <berndkuhls@hotmail.com> wrote in
> news:3p65vaxf8m.ln2 at ID-313208.user.individual.net: 
>
>> xlib_pciaccess itself does not depend on xorg stuff, I was able to
>> compile the libdrm intel driver with patch v5 without activating xorg7.
As far as i understand, the package XORG7 is a kind of a container which
doesn't compile anything, it only adds global toolchain dependencies for
all the xorg stuff.
Did you try to build the xlib_libpciaccess with a toolchain without this
options ?

> PS: Should we also move libpciaccess out of the xorg section?
I dont think so, even if the libpciaccess is a generic PCI access
library, it come as a part of the Xorg project and perhaps there is
other xlib that doesn't require the toolchain options above so should we
move them too ?
An other option could be to don't set dependencies on the XORG7 package
and move the dependencies inside each sub-packages.
