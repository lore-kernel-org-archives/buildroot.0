From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:38:51 +0200
Subject: [Buildroot] [PATCH v2] pulseview: new package
In-Reply-To: <CAMpxmJVGxtExSQmdjqYvbXuw2hDvObnyfaN27RG+dn88ipu=jw@mail.gmail.com>
References: <1426759708-4920-1-git-send-email-bgolaszewski@baylibre.com>
 <20150406234303.010225ea@free-electrons.com>
 <CAMpxmJXWnzUwgM7EQ3De4OCAprJ1oFVecYMD8j+xa7dU8co1qA@mail.gmail.com>
 <20150408162905.4cfbc0a3@free-electrons.com>
 <CAMpxmJUeJms2BVLVrhsgm7d1MegO-hV1XUEPwUgiCc7Z81Mfgg@mail.gmail.com>
 <20150408211220.3e34e66a@free-electrons.com>
 <CAMpxmJVGxtExSQmdjqYvbXuw2hDvObnyfaN27RG+dn88ipu=jw@mail.gmail.com>
Message-ID: <20150408223851.3abe5405@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Apr 2015 22:29:06 +0200, Bartosz Golaszewski wrote:
> 2015-04-08 21:12 GMT+02:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
> > I've reproduced the problem in the autobuilder directly, and the
> > problem is fairly clear:
> 
> Thanks for the investigation!

No problem, you're welcome. Without having access to the autobuilders,
it might be hard to reproduce some of the issues, so I'm definitely
happy to reproduce them and provide more details as needed.

> > So, generating the C++ bindings requires Doxygen. And Doxygen is not
> > part of the mandatory Buildroot dependencies, and not packaged in
> > Buildroot as a host package.
> 
> Can we add an error message similar to those emitted when e.g. git or
> svn is missing. but for doxygen (only when libsigrokcxx is selected)?

Yes, we can, but it's a bit annoying. It means that building
libsigrokcxx + pulseview will most likely not be tested much by the
autobuilders.

> > So, in the mean time, I've marked libsigrokcxx as broken, as well as
> > pulseview. I believe the best solution is probably to create a
> > host-doxygen package (or convince the libsigrok developers to not use
> > something such as doxygen to generate C++ bindings). Can you look into
> > this?
> 
> C++ bindings are generated using xml files created by doxygen. I will
> take a look tomorrow, but it may be impossible to drop using doxygen
> without having to do a major overhaul of libsigrokcxx. I think that
> host-doxygen is a more feasible solution unless we can demand user to
> install doxygeb on the host machine.

Can you have a quick look at how annoying (or not) it would be to create
a host-doxygen package? This would be the nicest solution, of course
assuming it doesn't require millions of dependencies that would also
have to be packaged in Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
