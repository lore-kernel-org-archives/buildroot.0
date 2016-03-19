From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Mar 2016 00:48:52 +0100
Subject: [Buildroot] [PATCH 14/16 v5] core/legal-info: allow ignoring
 packages from the legal-info
In-Reply-To: <20160319162911.611fa561@free-electrons.com>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <96aee606d5d79d7867fc7d60c5343e0b827ff795.1457718289.git.yann.morin.1998@free.fr>
 <20160319162911.611fa561@free-electrons.com>
Message-ID: <20160319234852.GL3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-03-19 16:29 +0100, Thomas Petazzoni spake thusly:
> On Fri, 11 Mar 2016 18:49:27 +0100, Yann E. MORIN wrote:
> > It might be necessary to not even mention a package in the output of
> > legal-info:
> > 
> >   - virtual packages have virtually nothing to save in the legal-info
> >     output;
> > 
> >   - for Buildroot itself, host-gcc-initial and host-gcc-final are
> >     not real packages, they are just two different steps of the same
> >     package, gcc;
> > 
> >   - for proprietary packages, it might not even be legal to even
> >     mention them, being under NDA or some other such restrictive
> >     conditions.
> 
> What is the difference with <pkg>_REDISTRIBUTE = NO ? I know
> REDISTRIBUTE = NO packages are mentioned in legal-info, but their
> source code is not copied to the legal-info stuff.

"FOO_LEGAL_IGNORE = YES" mnens that the package will not even be listed
in the manifest.

Sometimes, there are (proprietary) packages that are under NDA, and even
the mere hint at the use of that package is forbidden. So we need to be
able to represent that situation.

> But does it make sense to have two separate things? Why do REDISTRIBUTE
> = NO packages get mentioned in the legal-info if their source code is
> anyway not saved.

Because the license may require it? For example, the boot codes for the
RPi are BSD-licensed, so we have to provide the license file, so
rpi-firmware has to be in the manifest. But we do not have the source
for those blobs...

[--SNIP--]
Typoes fixed, thanks.

> > patches and license files are not saved into legal-info/ .
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> > Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> > 
> > ---
> > Changes v1 -> v2:
> >   - introduce a new variable, instead of making _REDISTRIBUTE a
> >     tri-state  (Thomas, Peter, Luca)
> 
> Ah, we discussed using REDISTRIBUTE, I remember. But do we need a
> tri-state ? Do we really have REDISTRIBUTE = NO packages that we want
> to see mentioned in the legal-info output ?

Yes, see above.

> > +* +LIBFOO_LEGAL_IGNORE+ can be set to +YES+ or +NO+ (the default) to indicate
> 
> To me, the naming of the variable looks like inverted logic. What about:
> 
> LIBFOO_SAVE_LEGAL_INFO = YES (default) / NO
> 
> but obviously, <pkg>_SAVE_LEGAL_INFO is a bit confusing with
> <pkg>_REDISTRIBUTE.

Yes, I am not completely sold on the _LEGAL_IGNORE name, but your
proposal is not better IMHO...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
