From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 8 Feb 2015 11:51:46 +0100
Subject: [Buildroot] [PATCH 1/2] automake: complete the removal of the
	target package
In-Reply-To: <87h9v3g9yn.fsf@dell.be.48ers.dk>
References: <1422809500-23948-1-git-send-email-fabio.porcedda@gmail.com>
 <87y4ofgbp9.fsf@dell.be.48ers.dk> <87h9v3g9yn.fsf@dell.be.48ers.dk>
Message-ID: <CAHkwnC-B85TNUgbe9ktH2=ytzqCtXLLgJVjP5X0NnjshE6+gnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 3, 2015 at 12:38 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>
>>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
>  >> The variable ACLOCAL_DIR points to the staging area but is not useful
>  >> anymore because the target package was removed.  Fix ACLOCAL_DIR by
>  >> pointing to $(HOST_DIR)/usr/share/aclocal and remove ACLOCAL_HOST_DIR
>  >> because ACLOCAL_DIR has the same value so it's not useful anymore.
>
>  >> Also remove the reference to ACLOCAL_HOST_DIR from the host-autoconf
>  >> package.
>
>  >> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>
>  > Committed, thanks.
>
> Actually, this doesn't work as we still need to look for .m4 files
> installed by other target packages.
>
> E.G.
> http://autobuild.buildroot.net/results/b20/b20e3efcb0be3032781d7b2f0ef4c351834da0ce/
>
> target-alsa-utils cannot find alsa.m4 installed by target-alsa-lib.
>
> So I've reverted it again.

Sorry, I didn't know that this variable is still useful.
I will try to test it more the next time.

Thanks
-- 
Fabio Porcedda
