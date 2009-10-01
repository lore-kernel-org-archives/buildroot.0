From: Will Newton <will.newton@gmail.com>
Date: Thu, 1 Oct 2009 12:22:40 +0100
Subject: [Buildroot] how to clean up everything but the toolchain
In-Reply-To: <1254384273.5284.5.camel@sven>
References: <1254384273.5284.5.camel@sven>
Message-ID: <87a5b0800910010422s36a75d2frf5d2e62ee397e3af@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 1, 2009 at 9:04 AM, Sven Neumann <s.neumann@raumfeld.com> wrote:
> Hi,
>
> we are using buildroot to build a number of projects for the same
> platform. Currently we do this simply by changing the .config file. In
> order for the build to work after changing the .config file, we remove
> the project_build_arm, build_arm and toolchain_build_arm directories. So
> basically we are doing a full rebuild, including the toolchain. We could
> save a lot of CPU cycles if we could reuse the toolchain build. However
> I found that if I remove the build_arm directory, but not the
> toolchain_build_arm directory, things will break. So I wonder if there
> is an easy solution to this. Perhaps a make target that we didn't
> discover yet?

I have found it sufficient to remove build_arm and project_build_arm.
Some stuff in the toolchain still gets rebuilt but not as much as a
full rebuild.
