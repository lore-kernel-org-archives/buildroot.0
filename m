From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 20 Feb 2014 15:28:35 +0100
Subject: [Buildroot] Parallel make messes up post-build in -next
In-Reply-To: <CAHkwnC-LRM1oVjxH1PNMHnB9x-H6C7QsO458t01TBtiFr2moOg@mail.gmail.com>
References: <20140220095550.GA16493@pc-eric>
 <CAAXf6LXRsk=roB4ogDfjcHwPZKB2YCUraR34bV3qi72ewuvK1A@mail.gmail.com>
 <CAHkwnC-LRM1oVjxH1PNMHnB9x-H6C7QsO458t01TBtiFr2moOg@mail.gmail.com>
Message-ID: <CAAXf6LWybp29EWQM6AsTPJ0r=PS1AYfU6ZmkYm3jEutxoZ8LEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Thu, Feb 20, 2014 at 3:13 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
[..]
>
> Yes, it's a thing to fix for proper parallel bulding support, it's on
> my todo list.
>
> The targets target-finalize, target-purgelocales,
> target-generatelocales, toolchain-eclipse-register can be executed in
> parallel after building the generic targets?

Since you can select both purgelocales and generatelocales, I would
expect they need to be sequential: first purge then generate (as done
today).
I'd also expect that target-finalize should be finished before
starting the locale stuff, as the post-build script or overlay may add
additional locale stuff that needs to be purged.

Best regards,
Thomas
