From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 4 Oct 2013 09:09:21 -0500
Subject: [Buildroot] [PATCH 1/5] python-pyasn: new package
In-Reply-To: <CANxTyt7aMX3wGmi+SoNKbVwyNpsGUvtd5M9K-JN0obgK1GAUQA@mail.gmail.com>
References: <1380849129-18517-1-git-send-email-rjbarnet@rockwellcollins.com>	<1380849129-18517-2-git-send-email-rjbarnet@rockwellcollins.com>
 <CANxTyt7aMX3wGmi+SoNKbVwyNpsGUvtd5M9K-JN0obgK1GAUQA@mail.gmail.com>
Message-ID: <OF4BAC5C25.D85D1618-ON86257BFA.004B3B7B-86257BFA.004DC2F0@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi,

Danomi Manchego <danomimanchego123@gmail.com> wrote on 
10/03/2013 09:27:56 PM:

> Ryan,
> 
> On Thu, Oct 3, 2013 at 9:12 PM, Ryan Barnett
> <rjbarnet@rockwellcollins.com> wrote:
> > +               CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" 
\
> > +               CXX="$(TARGET_CXX)" \
> > +               CXXFLAGS="$(TARGET_CXXFLAGS) 
-I$(STAGING_DIR)/usr/include" \
> > +               LDSHARED="$(TARGET_CC) -shared" \
> > +               LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/lib -L$
> (STAGING_DIR)/usr/lib" \
> > +       $(HOST_DIR)/usr/bin/python setup.py build_ext \
> > +       --include-dirs=$(STAGING_DIR)/usr/include/python$
> (PYTHON_VERSION_MAJOR) \
> > +       )
> 
> I'm curious as to why the mix of -I and --include-dirs.  I.e., why not
> three -I's, or one --include-dirs=path1:path2:path3?  Is there a
> difference?

The --include-dirs part is left over from copy and paste from 
python-serial.mk
which I used for my base. I like using --include-dirs to point all my 
include
paths so I will move the include path from CFLAGS= down to --include-dirs=
 
> I'm also wondering if all of these packages should have
> CROSS_COMPILING=yes ... several of the python patches go through pains
> to introduce CROSS_COMPILING, presumably there is a reason why.

I thought introducing CROSS_COMPILING in the python patches is meant for 
cross compiling python itself since it is modifying the setup.py in python 

itself.

These are the first python packages that I'm trying to get to cross 
compile.
I've tried using the CROSS_COMPILING flag and it doesn't appear to do
anything so I'm not exactly sure how setting that in the environment will
help in these packages?

If you or somebody else has more familiarity with python cross compiling
modules can explain how this will help, I'm open to changing how these
packages are built.

Finally, I've tried the suggestions that Arnout that gave for the 
python-ipy but those suggestions didn't work.

> No objections, just wondering ...
> 
> Danomi -

Thanks,
-Ryan
