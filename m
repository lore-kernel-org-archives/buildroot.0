From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 25 Apr 2018 08:12:55 -0500
Subject: [Buildroot] [PATCH 1/4] package/Makefile.in: Do not use
 CPPFLAGS for hardening options
In-Reply-To: <d7ea7773c97c50f67188c891b06a057576de7bee.camel@spectralink.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
 <CANQCQpbaywbogjHpXaiQkBsS1Sas2R7tJiP2yW8mfxHrqq2_oQ@mail.gmail.com>
 <d7ea7773c97c50f67188c891b06a057576de7bee.camel@spectralink.com>
Message-ID: <CANQCQpb6MvkmiSidYuTsPyCd9XV1G_wfmzXYTmxjOwS29fBFDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On Wed, Apr 25, 2018 at 8:08 AM, S?rensen, Stefan
<Stefan.Sorensen@spectralink.com> wrote:
> On Wed, 2018-04-25 at 07:50 -0500, Matthew Weber wrote:
>
>> Thanks for sending this series.  When we added the initial support we
>> debated on doing a few things differently at some point with how this
>> is implemented.  First, Buildroot uses a toolchain wrapper where it
>> could inject these flags vs appending like the current design does.
>
> Personally I prefer that flags are appended - when injecting them
> through the wrapper, they are invisible in the build logs.
>

Agree.  Also the parsing problem was fairly complex for
reordering+add/subtracting conflicting flags.  You may have solved
that though with the spec.

>> Lastly there was discussion at the late developer days on integrating
>> the checksec scripting so there was a way to do some validation of
>> settings taking affect as part of new Buildroot test cases.
>
> I am working on integrating support for the annobin gcc plugin and
> adding a check step for hardening. I hope to have a RFC patch ready
> next week.
>

I'm not familiar with that plugin, I'd be curious if you're approach
would allow us to define a few test scenarios to add to the Buildroot
test suite.

Would the plugin require a internal toolchain build or just specific
external prebuilt requirements?

Matt
