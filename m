From: Matthew Weber <Matthew.Weber@collins.com>
Date: Thu, 29 Nov 2018 16:19:02 -0600
Subject: [Buildroot] [PATCH 2/2] package/libdrm: correct cunit test
 dependency
In-Reply-To: <20181129225456.21d37e68@windsurf>
References: <1541098696-25824-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1541098696-25824-2-git-send-email-matthew.weber@rockwellcollins.com>
 <20181129225456.21d37e68@windsurf>
Message-ID: <CANQCQpb8-qrkXvbDw59+PpPu_ANfTBkR5tPeDqLjqHkVOcYTtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Thu, Nov 29, 2018 at 3:55 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Thu,  1 Nov 2018 13:58:16 -0500, Matt Weber wrote:
> > Previously the option to install tests would result in the test
> > cases that don't have a cunit dependency, to build and be installed.
> >
> > This patch adds the cunit dependency so all test cases are built and
> > installed to target when that is selected via kconfig.
>
> Looking at the libdrm build system, only the tests specific to  the
> amdgpu backend/driver need cunit. So when you say "By default most of
> the test cases will automatically be disabled if cunit is not present"
> doesn't seem really accurate. So I've changed this patch to make cunit
> an optional dependency: if it's there, we use it, otherwise, fine, we
> have some tests, but not the amdgpu tests.
>
> Did I miss something?

No, that should be ok.
