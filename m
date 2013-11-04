From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 4 Nov 2013 20:50:57 +0100
Subject: [Buildroot] Speeding up builds
In-Reply-To: <CAE9DZUTgeeZTveEYUdHrDwpEP_iqqcd=JrPp6qWaVP_Huti3_w@mail.gmail.com>
References: <CAE9DZUT-G8g5cwWamULZ2ppUSOHjNf1O35diTno-uZj1_tCggA@mail.gmail.com>
 <5d58cf72-cd29-4f75-b348-4b59b4941a2f@email.android.com>
 <CAE9DZUTgeeZTveEYUdHrDwpEP_iqqcd=JrPp6qWaVP_Huti3_w@mail.gmail.com>
Message-ID: <CAAXf6LW1TJ5oXRYBMBMC3O91653rmuP87wUbVike=9nGZANtsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dallas,

On Mon, Nov 4, 2013 at 8:41 PM, Dallas Clement
<dallas.a.clement@gmail.com> wrote:
> Hi Thomas,
>
> It's BR2_JLEVEL=0, and I have confirmed that when make is invoked it is -j
> 16  (8 cores X 2) on my build system.
>
> I have tried ccache, ran into problems, and ended up aborting.  I may pick
> up that effort again.
>
> My focus right now is reducing the build time for a fresh clean build with
> no caching or exisiting object files.
>
> That's a bummer about the configure steps being serialized.  I have observed
> this as well.

Are you using an external toolchain, or are you rebuilding that one
from scratch as well?
One common optimization is building the toolchain only once, tarring
the result, and using that as external toolchain for the real build.

Best regards,
Thomas
