From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 27 Oct 2014 16:21:34 +0100
Subject: [Buildroot] [PATCH 2/2] apply-patches.sh: don't print anything
 when "make -s" is used
In-Reply-To: <87ioj96njl.fsf@dell.be.48ers.dk>
References: <1413994811-19452-1-git-send-email-fabio.porcedda@gmail.com>
 <1413994811-19452-3-git-send-email-fabio.porcedda@gmail.com>
 <87ioj96njl.fsf@dell.be.48ers.dk>
Message-ID: <CAHkwnC8VOr8HVSCEo0W_TiXOJ6V-gUW4BatqQVZazWAWK0ATYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 25, 2014 at 1:44 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
>
>  > The make "-s" option is used to enable the "Silent operation" so if that
>  > option is used don't print anything as far as there isn't any error.
>
>  > Add the "-s" option to "apply-patches.sh" to enable silent operation.
>
>  > Also add the "BR_SILENT" variable the contain "YES" when "make -s" is
>  > used so others parts can use it to silence the build as well.
>
> Your patch actually sets it to 'y', not "YES". We also already have the
> QUIET variable basically doing the same stuff, so I've changed it to use
> that instead.

Thanks for the correction, i didn't know that the "QUIET" variable was
doing the same as BR_SILENT.

> I see that you filter out --%, which we currently aren't doing
> for QUIET. Should we?

We should because otherwise even a "make --warn-undefined-variables"
is detected as a silent build.

I've sent a patch to fix that:
http://patchwork.ozlabs.org/patch/403632/

Thanks & BR
-- 
Fabio Porcedda
