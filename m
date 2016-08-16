From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2016 13:33:38 -0700
Subject: [Buildroot] [PATCH] skeleton: /etc/network/interface.d/* support
In-Reply-To: <CANQCQpaLNO75fjES2UoXkMf4VG4QZ91mB9HDDasabhQ7RgJOYg@mail.gmail.com>
References: <1471360870-53982-1-git-send-email-matthew.weber@rockwellcollins.com>
 <867AC111-F9FE-4F1D-9942-410B82365A8C@gmail.com>
 <CANQCQpaLNO75fjES2UoXkMf4VG4QZ91mB9HDDasabhQ7RgJOYg@mail.gmail.com>
Message-ID: <D88C6F90-1ED3-40EF-8D3A-C4CEB3382603@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 16, 2016, at 1:25 PM, Matthew Weber <matthew.weber@rockwellcollins.com> wrote:
> 
> Khem,
> 
> On Tue, Aug 16, 2016 at 11:34 AM, Khem Raj <raj.khem at gmail.com <mailto:raj.khem@gmail.com>> wrote:
> 
> > On Aug 16, 2016, at 8:21 AM, Matt Weber <matthew.weber at rockwellcollins.com <mailto:matthew.weber@rockwellcollins.com>> wrote:
> >
> > Signed-off-by: Matt Weber <matthew.weber at rockwellcollins.com <mailto:matthew.weber@rockwellcollins.com>>
> > ---
> > package/skeleton/skeleton.mk <http://skeleton.mk/>                    | 2 ++
> > system/device_table.txt                         | 1 +
> > system/skeleton/etc/network/interfaces.d/.empty | 0
> > 3 files changed, 3 insertions(+)
> > create mode 100644 system/skeleton/etc/network/interfaces.d/.empty
> >
> > diff --git a/package/skeleton/skeleton.mk <http://skeleton.mk/> b/package/skeleton/skeleton.mk <http://skeleton.mk/>
> > index 1000161..c9dce10 100644
> > --- a/package/skeleton/skeleton.mk <http://skeleton.mk/>
> > +++ b/package/skeleton/skeleton.mk <http://skeleton.mk/>
> > @@ -151,6 +151,8 @@ define SKELETON_SET_NETWORK_LOCALHOST
> >               echo ;                                               \
> >               echo "auto lo";                                      \
> >               echo "iface lo inet loopback";                       \
> > +             echo ;                                               \
> > +             echo "source interfaces.d/*";                        \
> 
> its portable to use . instead of source keyword
> 
> That doesn't seem to work in this case.  Is seems it's keying off the word source vs it being more shell like.
> 

Is it run in Make context and not shell context ?

> 
> >       ) > $(TARGET_DIR)/etc/network/interfaces
> > endef
> >
> > diff --git a/system/device_table.txt b/system/device_table.txt
> > index dc1af51..69b1d46 100644
> > --- a/system/device_table.txt
> > +++ b/system/device_table.txt
> > @@ -17,5 +17,6 @@
> > /etc/network/if-pre-up.d              d       755     0       0       -       -       -       -       -
> > /etc/network/if-down.d                        d       755     0       0       -       -       -       -       -
> > /etc/network/if-post-down.d           d       755     0       0       -       -       -       -       -
> > +/etc/network/interfaces.d            d       755     0       0       -       -       -       -       -
> > # uncomment this to allow starting x as non-root
> > #/usr/X11R6/bin/Xfbdev                        f       4755    0       0       -       -       -       -       -
> > diff --git a/system/skeleton/etc/network/interfaces.d/.empty b/system/skeleton/etc/network/interfaces.d/.empty
> > new file mode 100644
> > index 0000000..e69de29
> > --
> > 1.9.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net <mailto:buildroot@busybox.net>
> > http://lists.busybox.net/mailman/listinfo/buildroot <http://lists.busybox.net/mailman/listinfo/buildroot>
> 
> 
> 
> 
> --
> Matthew L Weber / Pr Software Engineer
> Airborne Information Systems / Security Systems and Software / Secure Platforms
> MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
> www.rockwellcollins.com <http://www.rockwellcollins.com/>
> 
> Note: Any Export License Required Information and License Restricted Third Party Intellectual Property (TPIP) content must be encrypted and sent to matthew.weber at corp.rockwellcollins.com <mailto:matthew.weber@corp.rockwellcollins.com>.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160816/48d309a5/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160816/48d309a5/attachment.asc>
