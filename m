From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Mar 2015 23:47:26 +0100
Subject: [Buildroot] [PATCH v5 2/3] python-cheetah: add host-package
 support
In-Reply-To: <54FF72A3.4040701@mind.be>
References: <1426011874-11011-1-git-send-email-gwenj@trabucayre.com>
 <1426011874-11011-2-git-send-email-gwenj@trabucayre.com>
 <54FF72A3.4040701@mind.be>
Message-ID: <20150310234726.1b583693@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 10 Mar 2015 23:39:31 +0100, Arnout Vandecappelle wrote:

>  This should probably carry a comment to remember what you explained in an
> earlier mail, e.g.:
> 
> # Runtime dependency on markdown is not expressed in Config.in for host package
> 
> and perhaps a fuller explanation in the commit log (explaining that setuptools
> will download it if it can't be found).

Agreed. All those "unusual" dependencies should have a comment in
the .mk file.

>  BTW, Thomas, when you committed python-cheetah you removed the runtime
> dependency on markdown because there are some examples you can run without
> markdown. Is that the way we work? The cheetah package itself declares a
> dependency on markdown because one of its classes (Filters.Markdown) uses it. Of
> course, as long as you don't use that particular filter, there won't be a
> problem. But it feels weird to me that we remove a dependency that is claimed by
> a package, unless there is a good reason for it (and I don't count saving 260K
> of .pyc files as a good enough reason).

"Way we work" is fairly loosely defined when it comes to interpreted
languages and more-or-less optional dependencies :-)

Should python-cheetah select all the possible dependencies it may use
for all its filters, or should it leave this responsibility to the
Buildroot user ? Not easy to decide.

Since the dependency was apparently not strictly needed, and there was
(as far as I remember) no comment justifying the dependency, it seemed
natural to me to remove this dependency. That being said, I wouldn't be
offended at all if we decide to re-introduce the dependency, provided a
comment indicating why we're adding this not-really mandatory
dependency.

Cheers,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
