From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 3 Oct 2013 17:39:41 -0500
Subject: [Buildroot] [PATCH 1/5] python-pyasn: new package
In-Reply-To: <20131003231755.72ecace9@skate>
References: <1380830465-16083-1-git-send-email-rjbarnet@rockwellcollins.com>	<1380830465-16083-2-git-send-email-rjbarnet@rockwellcollins.com>
 <20131003231755.72ecace9@skate>
Message-ID: <OF6A6DE032.B7F52EBF-ON86257BF9.007A1734-86257BF9.007C7C37@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on
10/03/2013 04:17:55 PM:

> Dear Ryan Barnett,
> 
> On Thu, 3 Oct 2013 15:01:01 -0500, Ryan Barnett wrote:
> 
> > +      CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
> > +      CXX="$(TARGET_CXX)" \
> > +      CXXFLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include" \
> > +      LDSHARED="$(TARGET_CC) -shared" \
> > +      LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/lib -L$
> (STAGING_DIR)/usr/lib" \
> 
> These additional -I and -L are rather weird because they simply pass
> what are already the default search paths for headers and libraries.

The additional -I and -L are needed to ensure that the $(STAGING_DIR)
header and library files are pulled. Otherwise the distutils package 
before the ones that the distutils package will find the 
headers/libraries that are located at $(HOST_DIR)/usr.

I've added this comment to both pyasn and pycrypto. I'm not a fan
of it but I don't really want to rewrite the setup.py in order to 
support cross compiling.

> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
