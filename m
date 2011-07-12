From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Tue, 12 Jul 2011 11:55:12 +0100
Subject: [Buildroot] Installation of package files in staging and target
In-Reply-To: <20110712000117.3af73a1a@skate>
References: <20110712000117.3af73a1a@skate>
Message-ID: <1310468114.2189.8.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, all,

On Tue, 2011-07-12 at 00:01 +0200, Thomas Petazzoni wrote:
> Typically, a "program" package will install its program(s) only in the
> target directory, while a "library" package will install its library
> and headers in the staging directory and in the target directory (the
> headers, static libraries and other useless files are removed using
> global mechanisms before creating the target filesystem image).
> 
<snip>
> This would make the target directory be a cleaned up and stripped
> *subset* of the staging directory. We would therefore have in the
> staging directory the libraries *and* binaries with debugging symbols
> for all packages.
> 
> What do you think about this ?

I'm a little behind in tracking the changes with toolchain movements
from a few months back but I was of the understanding that the current
install scheme still allows the staging directory to be treated as a
kind of mini SDK and so if I build a system using Buildroot I can tar up
the staging dir and give it to application developers as an interface.
Is this still the case?  If so, wouldn't putting executable programs
into the staging dir be a bad thing?
