From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 17 Jun 2019 15:27:23 -0500
Subject: [Buildroot] [External] Re: [PATCH v2 1/1] package/hostapd: add
 debug information options
In-Reply-To: <20190617210223.77a97ee2@windsurf>
References: <20190617153533.26255-1-jared.bents@rockwellcollins.com>
 <20190617194121.64c14291@windsurf>
 <CAM=7fbd717PmwGE5Dh4Wi4AGhY14Pb7tabG7qrxCsgdCgDQ-LQ@mail.gmail.com>
 <20190617210223.77a97ee2@windsurf>
Message-ID: <CAM=7fbdLrLEWdC+hKVUywG273Z6CHkuT2irQ1f_7ogDj6aapfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 17, 2019 at 2:02 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 17 Jun 2019 12:56:08 -0500
> Jared Bents <jared.bents@collins.com> wrote:
>
> > > Could you explain what CONFIG_DEBUG_FILE is doing compared to
> > > CONFIG_DEBUG_SYSLOG, and why one is conditional and not the other ? Do
> > > we really want CONFIG_DEBUG_FILE unconditionally ?
> >
> > I based it off of wpa_supplicant's implementation for each.  In
> > wpa_supplicant, CONFIG_DEBUG_FILE is turned on unconditionally while
> > CONFIG_DEBUG_SYSLOG is optional.  CONFIG_DEBUG_FILE enables a runtime
> > option (-f) to specify a file to direct the hostapd output to instead
> > of stdout.  CONFIG_DEBUG_SYSLOG enables a runtime option (-s) to have
> > the output go to syslog instead of stdout.  These are purely optional
> > at runtime as if neither of the -f or -s command line arguments are
> > used, the output will go to stdout as before.
>
> What is the size impact of each option, compared to the overall
> installation size of hostapd ?

I haven't been able to determine a size impact.  When trying to see a
size difference, I am getting sizes for hostapd varying between 1.4M
and 1.6M without any real correlation with whether I have one of the
two options selected, both selected, or neither of them selected


>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://urldefense.proofpoint.com/v2/url?u=https-3A__bootlin.com&d=DwICAg&c=ilBQI1lupc9Y65XwNblLtw&r=04jwxyh4njdMBVpO4oXKRLEInKSiF8pfOjV75AsF1bU&m=PmA5YY-0KdN5c4F6VT2nEv0Iwi2cNaKyRwDGKIuEyFM&s=k9ILTT4pycZsRW8MEQf9QNxS0p855aHiN9tZ3rBWwBA&e=

Jared
