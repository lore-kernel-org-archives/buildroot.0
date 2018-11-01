From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Nov 2018 23:08:48 +0100
Subject: [Buildroot] [PATCH] linux-firmware: bump version to latest
 d877533
In-Reply-To: <20181101230022.318b0cfd@windsurf>
References: <20181024103845.19057-1-m.niestroj@grinn-global.com>
 <20181101230022.318b0cfd@windsurf>
Message-ID: <20181101220848.GZ28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcin, Thomas, All,

On 2018-11-01 23:00 +0100, Thomas Petazzoni spake thusly:
> On Wed, 24 Oct 2018 12:38:45 +0200, Marcin Niestroj wrote:
> > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> > ---
> >  package/linux-firmware/linux-firmware.hash | 6 +++---
> >  package/linux-firmware/linux-firmware.mk   | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
> > index ca6ad8f59d..91645d6262 100644
> > --- a/package/linux-firmware/linux-firmware.hash
> > +++ b/package/linux-firmware/linux-firmware.hash
> > @@ -1,11 +1,11 @@
> >  # Locally calculated
> > -sha256 b279ca4d086887c2efab13e28a7ca36e409410d3df38a62d7c7b5799ee3de916 linux-firmware-44d4fca9922a252a0bd81f6307bcc072a78da54a.tar.gz
> > +sha256 48f02db163bd1320cafa0c878f0c38d2184afa726f02622309be69416e420032 linux-firmware-d87753369b82c5f362250c197d04a1e1ef5bf698.tar.gz
> 
> I don't get the same hash here:
> 
> ERROR: linux-firmware-d87753369b82c5f362250c197d04a1e1ef5bf698.tar.gz has wrong sha256 hash:
> ERROR: expected: 48f02db163bd1320cafa0c878f0c38d2184afa726f02622309be69416e420032
> ERROR: got     : 3c5ba0e3b282e44d5cef3d34a547caf3633c90b83807469357e92cca1fff8a38
> 
> And apparently Yann E. Morin also calculated the same hash as me after
> applying your version bump. Could you check what is happening ?

If using a recent distribution that has tar 1.30 (e.g. Fedroa 28+,
Arch, or other rolling-release distros), you may have fallen in the
download dependencies trap, where host-tar would not be built when doing
a 'make source' from a clean tree.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
