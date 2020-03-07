From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 7 Mar 2020 22:00:19 +0100
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: add tilde '~'
 expansion for pathes
In-Reply-To: <20200307155654.12e93ddb@windsurf.home>
References: <20200307103704.20524-1-heiko.thiery@gmail.com>
 <20200307155654.12e93ddb@windsurf.home>
Message-ID: <CAEyMn7YfytoHS+CuGxwBME0zRDPM3nOq83DCBpiebC6Sigwc0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sa., 7. M?rz 2020 um 15:56 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Sat,  7 Mar 2020 11:37:05 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > The script arguments 'nvd-path', 'json' and 'html' currently does not
> > allow to have '~' in path for user home directory. With this patch
> > this '~' is expanded to the real user home directory.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> Isn't ~ supposed to be expanded by your shell before calling pkg-stats
> ? Here, pkg-stats --html ~/toto.html works perfectly fine without your
> patch.
>
Indeed I didn't thought about that and you're right the shell should
expand that. But I saw that it was not.

I rechecked that and found out that there is a difference between
setting the argument of the option with or without a '='.

Without '=' the '~' is expanded by the shell (pkg-stats --html ~/out.html).
Wit '=' the '~' is not expanded by the shell (pkg-stats --html=~/out.html).


> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Heiko
