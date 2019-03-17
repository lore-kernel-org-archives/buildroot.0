From: =?UTF-8?Q?Adrien_Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Sun, 17 Mar 2019 20:56:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/bird: add a unprivileged user
In-Reply-To: <20190317174946.28ee07a5@windsurf>
References: <20190205105630.17008-1-adrien@gallouet.fr>
 <20190317174946.28ee07a5@windsurf>
Message-ID: <CAFtSRGCunAxWP2VizuD_yY8zzqnOqksuzKz-F=PiFHv+JdOb7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 17, 2019 at 5:49 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Adrien,
>
> On Tue,  5 Feb 2019 10:56:31 +0000
> Adrien Gallou?t <adrien@gallouet.fr> wrote:
>
> > This commit add a specific unprivileged user for BIRD
> > to avoid full root privileges while running.
> >
> > Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
>
> Could you give a few more details on how/where this new user gets
> used ? Your patch only creates it, but it doesn't tweak any init script
> or configuration file that would tell the daemon to be started using
> this unprivileged user.
>
> Could you provide a bit more details ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Hi Thomas,

I use BIRD with s6 on production and I didn't take the time
to write a correct start-stop-daemon script for it yet. In all cases,
BIRD only needs root privileges at startup and he can switch
to a less privileged one when started with -u USER -g GROUP.

If your prefer to wait, I'll resubmit a patch with the start-stop-daemon
script later.

Best regards.
