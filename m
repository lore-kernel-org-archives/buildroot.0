From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 5 Dec 2012 10:38:59 +0100
Subject: [Buildroot] [PATCH 2/2] netatalk: Make BerkeleyDB optional for
	Netatalk
In-Reply-To: <87k3swc1if.fsf@dell.be.48ers.dk>
References: <1352410452-10680-1-git-send-email-maxime.hadjinlian@gmail.com>
 <87k3swc1if.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivwRviPJr6p6ypTZn4U-nDX4HQxXOPYE2s7=zzPZPYozjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 5, 2012 at 10:05 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:
>
>  Maxime> As the documentation of netatalk states :
>  Maxime> "dbd is the default backend since version 2.1"
>  Maxime> So cdb (which is the CNID provided by BerkeleyDB) should not be the default.
>
>  Maxime> Also, this patches fixes a trouble when compiling with
>  Maxime> berkeleydb in 64bits where netatalk would look the berkeleylib
>  Maxime> in [...]/lib64 instead of [...]/lib
>
> Thanks, but:
>
> - It doesn't apply because of host-pkg-config -> host-pkgconf.
> - It doesn't work:
>
> checking for Berkeley DB headers in /usr/include/db48... no
> checking for Berkeley DB headers in /usr/include/db4.7... no
> checking for Berkeley DB headers in /usr/include/db47... no
> checking for Berkeley DB headers in /usr/include/db4.6... no
> checking for Berkeley DB headers in /usr/include/db46... no
> checking for Berkeley DB headers in /usr/include/db4... no
> configure: error: Berkeley DB library required but not found!
> make[1]: *** [/home/peko/source/buildroot/testnetatalk/build/netatalk-3.0/.stamp_configured] Error 1
>
> With an empty default BR config (only netatalk enabled).
I'll look into it, it should not error because of this since BerkeleDB
is not longer needed for building netatalk...
Thanks for your feedback.
>
> --
> Bye, Peter Korsgaard
