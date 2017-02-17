From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 17 Feb 2017 08:12:02 +0100
Subject: [Buildroot] [PATCH 1/2] wavpack: needs wchar support
In-Reply-To: <f0dindxjng.ln2@ID-313208.user.individual.net>
References: <20170216204116.2212-1-joerg.krause@embedded.rocks>
 <20170216221907.57ac4b8d@free-electrons.com>
 <f0dindxjng.ln2@ID-313208.user.individual.net>
Message-ID: <1487315522.2111.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Hi Bernd,

On Fri, 2017-02-17 at 06:06 +0100, Bernd Kuhls wrote:
> Hi Thomas,
> 
> Am Thu, 16 Feb 2017 22:19:07 +0100 schrieb Thomas Petazzoni:
> 
> > None of the places that select wavpack need to be fixed for the
> > wchar
> > dependency?
> > 
> > package/gstreamer/gst-plugins-good/Config.in:???select
> > BR2_PACKAGE_WAVPACK
> 
> "depends on BR2_USE_WCHAR" needs to be backported, same was valid
> for BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC.
> 
> > package/gstreamer1/gst1-plugins-good/Config.in: select
> > BR2_PACKAGE_WAVPACK
> 
> "depends on BR2_USE_WCHAR" needs to be backported, same was valid
> for BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TAGLIB.
> 
> > package/mpd/Config.in:??select BR2_PACKAGE_WAVPACK
> 
> mpd itself depends on BR2_USE_WCHAR, no backport needed.
> 

Upstream committed a fix [1] (thanks to Thomas for reporting the issue)
which drops the dependency on wchar. Maybe we should apply this to
remove BR2_USE_WCHAR?

[1] https://github.com/dbry/WavPack/commit/876fc3f3907e871d0938ac6c8c52
52f5f31abd1f

J?rg
