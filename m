From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 21:53:37 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] package/mediastreamer: portaudio needs speexdsp
In-Reply-To: <20200323180121.688647-1-fontaine.fabrice@gmail.com>
References: <20200323180121.688647-1-fontaine.fabrice@gmail.com>
Message-ID: <20200324215337.15eedb19@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 19:01:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 8f5562ed7c227f29dbfa6897f54dccda0dfbf656 wrongly removed speexdsp
> dependency from portaudio
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e6adf151141ae56f5194165fd5b74b52164bfb17
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - portaudio only needs speexdsp, not speex

Thanks, I've applied both. Could you report both bugs upstream? Indeed
these issues should not lead to compilation failure: it should be
handled in CMakeLists.txt, either by disabling the feature, or erroring
out at configure time.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
