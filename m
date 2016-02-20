From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 18:37:31 +0100
Subject: [Buildroot] [PATCH v2 05/18] erlang-rebar: bump to version 2.6.1
In-Reply-To: <56B67620.1040700@gmail.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-6-git-send-email-fhunleth@troodon-software.com>
 <56B67620.1040700@gmail.com>
Message-ID: <20160220183731.57f5122f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Frank,

On Sat, 6 Feb 2016 23:39:28 +0100, Romain Naour wrote:

> > -ERLANG_REBAR_VERSION = 2.5.1
> > +ERLANG_REBAR_VERSION = 2.6.1
> >  
> >  # Upstream publishes a release, but we can not use it as it is a release of
> >  # a generated rebar script, when we want the sources. So we have to use the
> > 
> 
> There is an error with the variable used for licensing:
> s/ERLANG_LICENSE/ERLANG_REBAR_LICENSE/
> 
> Otherwise the license file and license type are not defined and produce a
> warning with legal-info:
> 
> # WARNING: erlang-rebar: cannot save license (HOST_ERLANG_REBAR_LICENSE_FILES
> not defined)
> 
> Also it override the one defined in erlang package :-/

I've fixed this in the master branch, since this is really a bug. See
commit
https://git.busybox.net/buildroot/commit/?id=498055a8c2e66a8a36b6205555b1c7e806b4d31f.

However, I am not sure about the license information of erlang-rebar.
We currently have:

# Although the file LICENSE state Apache-2.0, a lot (if not all) the files
# in src/ bear the MIT licence.
ERLANG_LICENSE = Apache-2.0, MIT
ERLANG_LICENSE_FILES = LICENSE

But the LICENSE file is really only the text of Apache-2.0. It is not
because many of the source files carry the MIT license that the whole
is not licensed under Apache-2.0. The MIT license is a permissive
license, so MIT code can be included into a project that is
redistributed only under the Apache 2.0 license.

(I've added Yann and Luca in Cc to get their opinion on the matter.)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
