From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 18:34:14 +0200
Subject: [Buildroot] [PATCH 3 of 4 RFC] manual: add section about
 depending on toolchain options
In-Reply-To: <CAAXf6LXD_7jt42XAG_XgKWKi_+te40hgYNd4mTLbmCDMxfG0QA@mail.gmail.com>
References: <patchbomb.1379494893@argentina>
 <89b40887c8268e316399.1379494896@argentina>
 <CAAXf6LXD_7jt42XAG_XgKWKi_+te40hgYNd4mTLbmCDMxfG0QA@mail.gmail.com>
Message-ID: <20130918183414.45e6a247@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 18 Sep 2013 13:15:41 +0200, Thomas De Schampheleire wrote:

> In the original thread, there were a few outstanding questions:
> - capitalization
>   In this series I have opted for the mixed capitalization (one of the
> options mentioned by ThomasP): mostly lowercase except for acronyms
> like RPC, IPv6, C++.
> 
> - which features to mention in comments
>   After thinking about it, it makes sense to me to mention C++,
> thread, wchar, RPC, dynamic library, and IPv6 in comments, and not to
> mention MMU and target architecture. My reasoning is that the last two
> are not freely choosable for a given project, while the other options
> can pretty easily be turned on when desired.
> 
> I'm open to discussing this, if you do not agree.

I agree with both. I believe the documentation should explicitly state
that a BR2_USE_MMU dependency or an architecture dependency should not
be mentioned in a comment (with the reason that you explain).

However, for the reason that you explain, showing a comment when the
problem is a lack of dynamic library is not completely good. On some
noMMU architectures, there no support for dynamic libraries at all, so
the user cannot "enable" that at all. But well, despite this, I believe
it's better to show a comment when a package is not available due to
the lack of shared libraries.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
