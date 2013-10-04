From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 3 Oct 2013 22:27:56 -0400
Subject: [Buildroot] [PATCH 1/5] python-pyasn: new package
In-Reply-To: <1380849129-18517-2-git-send-email-rjbarnet@rockwellcollins.com>
References: <1380849129-18517-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1380849129-18517-2-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <CANxTyt7aMX3wGmi+SoNKbVwyNpsGUvtd5M9K-JN0obgK1GAUQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan,

On Thu, Oct 3, 2013 at 9:12 PM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
> +               CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
> +               CXX="$(TARGET_CXX)" \
> +               CXXFLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include" \
> +               LDSHARED="$(TARGET_CC) -shared" \
> +               LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
> +       $(HOST_DIR)/usr/bin/python setup.py build_ext \
> +       --include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
> +       )

I'm curious as to why the mix of -I and --include-dirs.  I.e., why not
three -I's, or one --include-dirs=path1:path2:path3?  Is there a
difference?

I'm also wondering if all of these packages should have
CROSS_COMPILING=yes ... several of the python patches go through pains
to introduce CROSS_COMPILING, presumably there is a reason why.

No objections, just wondering ...

Danomi -
