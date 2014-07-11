From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 10 Jul 2014 17:11:19 -0700
Subject: [Buildroot] i.MX 3.10.17 updates
In-Reply-To: <20140710200111.GG28300@free.fr>
References: <53BEDF43.9020401@boundarydevices.com>
 <726E1478A66AD646A8419562133B4C3D0EB71DFB@mxadeneo.adeneo-embedded.us>
 <CADCpmyOhiNWv31pdUi5=Q3n-vD9jiFO_8d3v61ZqAa6yaxLy9A@mail.gmail.com>
 <53BEEF7D.4020208@boundarydevices.com>
 <20140710200111.GG28300@free.fr>
Message-ID: <CADCpmyMRiYGQesj9jsafvfLgV3o3cBJG6QGx3N8KKW2ix7PZDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On Thu, Jul 10, 2014 at 1:01 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Eric, All,
>
> On 2014-07-10 12:54 -0700, Eric Nelson spake thusly:
> > On 07/10/2014 12:01 PM, Gary Bisson wrote:
> > > Resend my e-mail with the correct e-mail address so the mailing-list
> can
> > > see it:
> > >
> > > On Thu, Jul 10, 2014 at 11:53 AM, BISSON Gary
> > > <gbisson at adeneo-embedded.us <mailto:gbisson@adeneo-embedded.us>>
> wrote:
> > >
> > >     Hi Eric,
> > >
> > >     Please find attached both my buildroot and my kernel config.
> > >     I was using a code sourcery 2013.05 toolchain for my testing.
> > >     Regarding GStreamer, might just be a missing plugin not necessarily
> > >     related to the fsl one. Hope my config will help.
> > >
> >
> > This is the config I started with, so I suspect that you'll also have
> > difficulties playing video.
> >
>

I confirm that your stream wasn't playing because of some gstreamer missing
plugins. Please find attached a new configuration that enables matroska
plugin (webm format) and autodetect (for playbin) among others.
The test has been run on a Sabrelite connected to a 1080p hdmi display:
# gplay tears_of_steel_1080p.webm
# gplay trailer_1080p_h264_mp3.avi

Regards,
Gary

 > Hadrien and Yann, have you been able to validate video encode/decode?
>
> No, I have no i.MX6 target, so I can't run-test. All I can do is
> test-build the series. I sent Hadrien an updated (aka fixed) defconfig
> for the wandboard, so he can test on the one he has.
>
> Last Hadrien reported, he had trouble running the samples on his
> wandboard, which is a revision A0.
>
> We suspect there are hardware issues on the A0, so Hadrien was to test
> on another i.MX6 board.
>
> Hadrien, did you have time to conclude your testing?
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>       |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140710/155d5130/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mx6_br_defconfig
Type: application/octet-stream
Size: 52934 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140710/155d5130/attachment.obj>
