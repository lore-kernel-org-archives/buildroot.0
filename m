From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Nov 2015 16:41:07 +0100
Subject: [Buildroot] Overriding Buildroot packages
In-Reply-To: <CAPER3A0P1Qyd_=ktyHt=udawndUfHue8SE_zDQxMHjz+r+pPtg@mail.gmail.com>
References: <CAPER3A0P1Qyd_=ktyHt=udawndUfHue8SE_zDQxMHjz+r+pPtg@mail.gmail.com>
Message-ID: <20151124164107.3570084a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Nov 2015 14:43:21 +0100, Hajime Branko Yamasaki Vukelic
wrote:

> I've set up my build such that all modification are done in
> BR2_EXTERNAL directory, and I have a submodule that points to
> unmodified upstream buildroot sources.
> 
> I've been trying to find a way to override a package that is normally
> provided by Buildroot. By 'override' I mean completely swap it with
> another package definition, possibly with different patches, etc.
> 
> Right now I've created a package that has a completely different name
> (e.g., for package 'foo', I have 'foo-custom'), but this breaks
> dependencies for packages that would otherwise depend on the original.
> 
> I've dug into pkg-generic.mk and I see that it may not really be
> possible, but I wanted to confirm. Can someone tell me if I'm missing
> something or this really isn't possible without modifying the
> buildroot version of the package?

This is really not possible with the current Buildroot, and would be
quite complicated to implement in a generic way.

If all you need is to apply a set of additional patches, then you can
do so without modifying the Buildroot package itself by using the
BR2_GLOBAL_PATCH_DIR mechanism.

However, if you indeed need a completely different version of the
package, we don't have a really good way of handling that.

Are you able to give more details about which specific package you need
to override and why? It would be useful for us to understand such use
cases, and see if there is a different solution/option, or if the use
case is really too specific.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
