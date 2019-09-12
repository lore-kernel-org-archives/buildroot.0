From: Alexander Dahl <post@lespocky.de>
Date: Thu, 12 Sep 2019 09:45:28 +0200
Subject: [Buildroot] [PATCH] package: qemu: Make dependency to nettle
 explicit
In-Reply-To: <20190912083338.1e2fdfd3@windsurf>
References: <20190911084039.16983-1-post@lespocky.de>
 <20190912083338.1e2fdfd3@windsurf>
Message-ID: <20190912074527.y3zlqlsefj5myvdf@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, Sep 12, 2019 at 08:33:38AM +0200, Thomas Petazzoni wrote:
> On Wed, 11 Sep 2019 10:40:39 +0200
> Alexander Dahl <post@lespocky.de> wrote:
> 
> > For the fli4l router distribution we had problems building 'qemu', some
> > builds failed complaining when checking dynamic linking of the package:
> > 
> > >>> qemu 2.12.1 Error: Library libnettle.so.6 referenced by usr/libexec/qemu-bridge-helper belongs to package nettle which is not a dependency of qemu  
> > 
> > https://web.nettworks.org/ci/job/fli4l/job/buildroot/job/4.0/job/trunk-x86_64/495/console
> > 
> > Making the dependency explicit, by calling ./configure with
> > --enable-nettle or --disable-nettle depending on the activation status
> > of package nettle, solves the issue.
> > 
> > For fli4l the fix is still based on buildroot 2018.02.x, but the problem
> > is the same in recent version of buildroot, and the fix works for master
> > as well.
> > 
> > Cc: Florian Wolters <florian@florian-wolters.de>
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> 
> Thanks for the patch, which looks good. I have one question though:
> what prints the message "Error: Library libnettle.so.6 referenced by
> usr/libexec/qemu-bridge-helper belongs to package nettle which is not a
> dependency of qemu". It seems like a check from Buildroot, but I can't
> find it in our tree, and I don't remember we had such a check. Maybe
> it's just because it's early and my eyes are not well opened and I'm
> missing something obvious.

I'm afraid this is a change in the fli4l project on top of buildroot,
which is not upstream. 

I'm not familiar with all the changes and extensions Christoph made,
but the message comes from the file 'package/pkg-utils.mk' which is
part of the modified buildroot embedded in fli4l (currently 2018.2.x).
Maybe he wants to explain more? I set him in Cc.

Our repo browser is currently offline, so I can not point you to the
source. Sorry. You may checkout that stuff directly from Subversion if
you want to have a look, but as I said, it's modified:

https://repo.nettworks.org/svn/fli4l/branches/4.0/trunk/src/packages/src/src/fbr/buildroot/

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190912/52c18db5/attachment.asc>
