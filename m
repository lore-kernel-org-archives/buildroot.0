From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Wed, 25 Apr 2018 13:25:17 +0000
Subject: [Buildroot] [PATCH 1/4] package/Makefile.in: Do not use
 CPPFLAGS for hardening options
In-Reply-To: <CANQCQpb6MvkmiSidYuTsPyCd9XV1G_wfmzXYTmxjOwS29fBFDg@mail.gmail.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
 <CANQCQpbaywbogjHpXaiQkBsS1Sas2R7tJiP2yW8mfxHrqq2_oQ@mail.gmail.com>
 <d7ea7773c97c50f67188c891b06a057576de7bee.camel@spectralink.com>
 <CANQCQpb6MvkmiSidYuTsPyCd9XV1G_wfmzXYTmxjOwS29fBFDg@mail.gmail.com>
Message-ID: <8158bad217afaf84aa37154a77f0d483a954daef.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2018-04-25 at 08:12 -0500, Matthew Weber wrote:
> 
> I'm not familiar with that plugin, I'd be curious if you're approach
> would allow us to define a few test scenarios to add to the Buildroot
> test suite.

Annobin also records some other hardening flags and the optimization
level used in the build. This has so far revealed a long list of
packages where the Buildroot flags are not propagated to the build.
> 
> Would the plugin require a internal toolchain build or just specific
> external prebuilt requirements?

I just requires a gcc built with plugin support - I have testet with
both internal and external.

Reading the generated data however requires at lest binutils 2.30 I
believe.

Stefan
