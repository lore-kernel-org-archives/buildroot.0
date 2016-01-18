From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 18 Jan 2016 21:53:47 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160117001117.569d43f2@free-electrons.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
Message-ID: <20160118215347.6447b77c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 17 Jan 2016 00:11:17 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> 
> >         i686 |         gst1-plugins-bad-1.6.2 | NOK | http://autobuild.buildroot.net/results/fab7afc3490d77a6b29760394337298f2fd55d51/
> >       x86_64 |         gst1-plugins-bad-1.6.2 | NOK | http://autobuild.buildroot.net/results/4da1b0454fe7bf028a62058d28dafda104fb75f4/
> 
> gstdvbsrc.c: In function 'gst_dvbsrc_code_rate_get_type':
> gstdvbsrc.c:273:6: error: 'FEC_2_5' undeclared (first use in this function)
> gstdvbsrc.c:273:6: note: each undeclared identifier is reported only once for each function it appears in
> gstdvbsrc.c: In function 'gst_dvbsrc_modulation_get_type':
> gstdvbsrc.c:303:6: error: 'QAM_4_NR' undeclared (first use in this function)
> gstdvbsrc.c:303:5: error: initializer element is not constant
> gstdvbsrc.c:303:5: error: (near initialization for 'modulation_types[13].value')
> 
> Not sure. Peter, Gustavo ?
> 
 
This two enums entered the linux kernel with commit '[media] add DTMB support for DVB API' [1], at least
since linux-3.10 (did no exact search)...., may be depend GST1_PLUGINS_BAD_PLUGIN_DVB on
TOOLCHAIN_HEADERS_AT_LEAST_3_10 ?

Regards,
Peter

[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/include/linux/dvb/frontend.h?id=224b6642f5e82a1b21f6b552c799fa02e527d542
