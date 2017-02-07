From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Feb 2017 10:58:50 +0100
Subject: [Buildroot] [PATCH 5/9] check-package: check *.patch files
In-Reply-To: <CAAXf6LUx4hv+PNKyfpOaqcptyKkfpEjKVEtipE4gSJLQYojLRw@mail.gmail.com>
References: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
 <20161231032110.11573-6-ricardo.martincoski@gmail.com>
 <CAAXf6LUx4hv+PNKyfpOaqcptyKkfpEjKVEtipE4gSJLQYojLRw@mail.gmail.com>
Message-ID: <20170207105850.57f5df89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Jan 2017 22:21:31 +0100, Thomas De Schampheleire wrote:

> > +NUMBERED_PATCH = re.compile("Subject:\s*\[PATCH\s*\d+/\d+\]")  
> 
> Is this really a requirement? This numbering in the patch header is
> unrelated to the number used in the filename. One can expect many
> 'PATCH 1/1' in the same package directory. I would leave out this
> test.

We normally require patches in package/<foo>/ to be generated with "git
format-patch -N", so that their prefix is [PATCH] and not [PATCH x/y].

However, we do not require all patches to be Git formatted. It's kind
of required when the upstream project uses Git as its version control
system. But when the upstream project uses some other version control
system, other patch formats are excepted, like hand-generated patches
with "diff", or patches generated with "quilt". Not everyone wants to
find with Mercurial to find out to generate a patch with this damn
thing :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
