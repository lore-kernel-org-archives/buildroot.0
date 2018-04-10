From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 10 Apr 2018 16:54:09 +0100
Subject: [Buildroot] [PATCH v2/next 3/4] webkitgtk: update to version
 2.20.0
In-Reply-To: <20180410095327.59c0e9d8@windsurf>
References: <20180323185942.60252-1-aperez@igalia.com>
 <20180323185942.60252-4-aperez@igalia.com>	<87po3t21cy.fsf@dell.be.48ers.dk>
 <20180410095327.59c0e9d8@windsurf>
Message-ID: <20180410165409.GD19381@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Tue, 10 Apr 2018 09:53:27 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello Adrian,
> 
> On Sat, 24 Mar 2018 11:51:09 +0100, Peter Korsgaard wrote:
> 
> >  >  ...ld-failure-when-ENABLE_VIDEO-ENABLE_WEB_A.patch | 32 ++++++++++++++++++++++
> >  >  package/webkitgtk/Config.in                        |  3 ++
> >  >  package/webkitgtk/webkitgtk.hash                   |  8 +++---
> >  >  package/webkitgtk/webkitgtk.mk                     |  4 +--  
> > 
> > Your introductory mail talked about 3 additional patches needed for
> > aarch64 support, but I don't see them here?
> 
> Could you give some feedback on this question, so that we can move
> forward with applying the webkitgtk bump ?

The change for AArch64 is just listing BR2_aarch64 in WEBKITGTK_ARCH_SUPPORTS,
the addition is in the first patch.

Anyway, I was waiting a bit until the 2.20.1 release, which just happened:

  https://webkitgtk.org/2018/04/10/webkitgtk2.20.1-released.html

Updating to 2.20.1 directly is IMHO better because it includes the fix for
building with multimedia disabled, and a fix to improve memory consumption
on devices with smaller amounts of memory ? which is particularly welcome
for embedded :-)

I'm making a test build with 2.20.1 as I wrote this mail, if all goes well
the new patch set will supersede this one.

Cheers,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180410/40a17eb8/attachment.asc>
