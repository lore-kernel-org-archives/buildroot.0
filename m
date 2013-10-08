From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Oct 2013 00:23:31 +0200
Subject: [Buildroot] using a local package file : why copy it to the dl
 directory ?
In-Reply-To: <22B9374628844ED0809C78AC328E71C5@JohanW7>
References: <22B9374628844ED0809C78AC328E71C5@JohanW7>
Message-ID: <20131009002331.5e89e31a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed, 9 Oct 2013 00:19:12 +0200, Sagaert Johan wrote:

> I noticed when using SITE_METHOD = file, the package is copied to the download directory.
> Is this needed, since the package is already on our local filesystem ?

Yes it is needed, because:

 (1) Buildroot do not want to make changes outside of its output
     directory. We clearly do not want Buildroot to mess up with your
     source directory, and create its stamp files, and the result of
     the compilation there.

 (2) Buildroot does not use out of tree build for packages. If it was
     using out of tree build, then we could avoid that copy by using
     your local directory as the source tree, and the
     output/build/<pkgname>-<pkgversion> directory as the build tree. A
     while ago, I started working on out-of-tree build for packages,
     precisely to improve this situation. See
     http://lists.busybox.net/pipermail/buildroot/2013-April/070573.html.
     It is certainly not impossible to do, but quite a huge patch set,
     with a lot of implications. Basically, my stuff was working in the
     general case, but there were some issues here and there that
     remained to be sorted out.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
