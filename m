From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 17 Oct 2017 13:16:01 -0500
Subject: [Buildroot] [PATCH] uboot-tools: bugfix libfdt python build
In-Reply-To: <CAOMZO5BT1YLM2p3GVe7W4SwDYW18fGXCiMKd3D59hYJf9hE7wQ@mail.gmail.com>
References: <20171013023556.25825-1-matthew.weber@rockwellcollins.com>
 <20171013161128.37827061@windsurf.lan>
 <CANQCQpZhRskjjpSbOiUEEM0qEimpkC+R7NA1B1iV-G+HO1+=iQ@mail.gmail.com>
 <CANQCQpbf+LPbfEnw91CkD7H5kxRSywZGbPD9vcU074e3sA2puA@mail.gmail.com>
 <CAOMZO5BT1YLM2p3GVe7W4SwDYW18fGXCiMKd3D59hYJf9hE7wQ@mail.gmail.com>
Message-ID: <CANQCQpZFwWLqMZ1Y6mCWQieVFgka+uZs_vJeS6+BPOLUhyPF0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Oct 15, 2017 at 7:09 AM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Matthew,
>
> On Sat, Oct 14, 2017 at 6:44 PM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>
>> I dug further into the python/swig issue in uboot/uboot-tools and
>> their build of libfdt.  I ended up with the following conclusions.
>> 1) Need to bump both packages to 2017.9 which I noticed was already
>> underway (Thanks Fabio).  This removes part of this patch submission
>> that fixed the python interpreter (already upstream after 9/3)
>
> I sent a patch bumping u-boot-tools to 2011.09, but Peter and Arnout
> reported build issues with it, so that's why it has not been applied:
> http://patchwork.ozlabs.org/patch/812555/
>
> I haven't had a chance to look at this issue, but if you are
> interested, feel free to address the problem and submit the bump
> patch.
>

Looking at the current development on uboot upstream, the 2017.11
release will be the bump we should take.  With that they cleaned up
the tools having some default python/swig dependencies by having
libfdt enabled in uboot kconfig.  We'll still have to update the
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT option in the uboot package so that it
includes providing the PYTHON path variable to the build.  The
upstream changes also removed the need for this patchset against
uboot-tools fixing python and swig patch issues.

I'll send a proposed patchset for a 2017.11 bump later this month
after testing with a -rc

Matt
