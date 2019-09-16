From: Atharva Lele <itsatharva@gmail.com>
Date: Mon, 16 Sep 2019 17:22:10 +0530
Subject: [Buildroot] Reproducible autobuild result issue
In-Reply-To: <20190915212200.43d16b0b@windsurf.home>
References: <20190915212200.43d16b0b@windsurf.home>
Message-ID: <CABM+sgrPwoZPMUhuZFu_HGvLR8FiyXVDbhZfbP_iDo2W8tn+hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Romain, all,

Thanks for pointing this out to me. I see that Romain has diffoscope
installed. So cmp should never have been executed. I'll investigate.

I'll send a patch to change the name of the output file in case cmp is
executed instead of diffoscope.

Romain:
Which distro are you using? It'll help me investigate the issue further.


On Mon, Sep 16, 2019 at 12:52 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Atharva,
>
> I have not followed closely all your latest patches on reproducible
> testing with the autobuilders, but at least in the current setup, there
> is a bug:
>
>   http://autobuild.buildroot.net/results/7b4/7b40753dc8623310e05ecfc92de5582eb767beea//diffoscope-results.json
>
> contains the output of "cmp". I guess it occurred on a machine that
> does not have diffoscope installed. But in any case, it is very wrong
> to have the result of "cmp" in a file named diffoscope-results.json,
> no ?
>
> Romain: this happened on your machine. Which version of the
> autobuild-run script are you using a the moment ?
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
