From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 3 Jan 2020 13:33:28 +0100
Subject: [Buildroot] [POC] buildroot packages site
In-Reply-To: <20200103132645.6be5a250@windsurf>
References: <CAEyMn7brT6fMrUmb7L61ofOx7NuEKj2OqZrL9X00gp4rYZp1RQ@mail.gmail.com>
 <20200103132645.6be5a250@windsurf>
Message-ID: <CAEyMn7YbbC+Nb0PbvFsS=BMh7aEi_nLZaOSS4URYzqfrzwUoYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Fr., 3. Jan. 2020 um 13:26 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> On Fri, 3 Jan 2020 11:48:53 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > I invested some spare time to create a buildroot packages/stats site.
> > I used python-flask for processing the json output of the pkg-stats
> > script. To have more information in the output file I did some
> > modifications on the pkg-stats script as well.
> >
> > A running installation as fcgi is available here:
> > http://packages.buildroot.thiery.it
>
> Wow, that's really nice. We definitely want to deploy this as a
> replacement to http://autobuild.buildroot.org/stats/. Perhaps we should
> even promote this to http://stats.buildroot.org/ or something like that.

This sounds good  :-)

> One question: how did you collect the stats history at
> http://packages.buildroot.thiery.it/packages/stats?commit=198bdaadd03f75fe959c21089c354d36c90069bc ?

Fist I have a cron job that does updates the latest.json in a fixed
interval (e.g. every hour). In addition I use that output and strip
the packages stuff from the json with jq and only store the stats part
of the output for every day.
For having the stats back in the past I have a script that does a
checkout for every day in the past and generates this stats output.

> Thanks for this development, looks very promising!
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--
Heiko
