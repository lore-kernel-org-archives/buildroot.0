From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 29 Jul 2014 18:20:59 -0400
Subject: [Buildroot] [PATCH 1/1] flex: delete broken flex++ symlink from
	target
In-Reply-To: <20140729235736.1c91a388@free-electrons.com>
References: <1406597734-1902-1-git-send-email-danomimanchego123@gmail.com>
 <20140729235736.1c91a388@free-electrons.com>
Message-ID: <CANxTyt7d2DiggQEqP08T6co=mO_F1neS0Tb2qFpas+h1Fap6fA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 29, 2014 at 5:57 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Danomi Manchego,
>
> On Mon, 28 Jul 2014 21:35:34 -0400, Danomi Manchego wrote:
>> When flex is built for the target without installing the
>> flex binary, a flex++ symlink installed by flex's Makefile
>> points to the missing flex executable.  This mod adds
>> a post target install hook to remove the broken symlink.
>>
>> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>> ---
>>  package/flex/flex.mk |    6 ++++++
>>  1 file changed, 6 insertions(+)
>
> Thanks, applied. However, I'd really like if someone could take the
> time to do a proper patch upstream to add a new ./configure option to
> enable/disable the program compilation/installation. It would allow us
> to simplify the package a bit.
>
> Danomi, would you be willing to work on this? The upstream seems to be
> active, and there is a git repository at
> http://sourceforge.net/p/flex/flex/ci/master/tree/, so no need to work
> with horrible outdated version control systems.

Thomas,

Actually, I don't know *anything* about flex.  The only reason I ran
into this is that linux-pam now pulls in flex as a dependency, and the
flex++ came up as a difference in my before-2014.05/after-2014.05
upgrade comparison check.  But I am somewhat knowledgeable about
makefiles, so if this amounts to sending patches to some sourceforge
mailing list, then I can try.

We just want an option to officially not install the bin and the
flex++ symlink, and add in the "AR" definition?

What's was the reason for dropping the tool - is it too large, or is
the m4 dependency objectionable?

Additionally, I see that the last change to buildroot's flex package
was to revert the bump to 2.5.39, because it broke a couple packages -
back in April 2014.  If the mods got in, would we be able to upgrade?

Danomi -
