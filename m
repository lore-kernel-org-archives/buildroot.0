From: Sven Neumann <s.neumann@phase-zero.de>
Date: Wed, 18 Mar 2009 18:24:45 +0100
Subject: [Buildroot] On the usefulness of .la files and .pc files
In-Reply-To: <20090318174450.2641b85d@surf>
References: <20090318174450.2641b85d@surf>
Message-ID: <1237397085.6302.16.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2009-03-18 at 17:44 +0100, Thomas Petazzoni wrote:

> When compiling libraries using libtool, a .la file gets installed
> in /usr/lib. It defines several informations such as :
> 
>  * The names of the library ;
>  * The dependencies of the library ;
>  * The directory where the library is installed ;
>  * A few other informations.

This tells libtool how to link a particular library. This is mainly
useful on platforms that need libraries to be explicitly linked. On
Linux this is actually not needed and you may safely remove those files.

> Many libraries also install a .pc file in /usr/lib/pkgconfig/. It also
> describe the dependencies, the library name, the flags to compile new
> applications/libraries on top of the library, etc.

This gives hints on to compile stuff against the library. It is much
more useful than the .la files as it allows to easily check for the
presence of a library, it's version, dependencies and what compiler
flags are needed.


Sven
