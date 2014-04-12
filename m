From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 18:06:35 +0200
Subject: [Buildroot] [PATCH] exim: use a more standard build-time
 configuration
In-Reply-To: <1396816157-1828-1-git-send-email-luca@lucaceresoli.net>
References: <1396816157-1828-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20140412180635.29eae3bb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sun,  6 Apr 2014 22:29:17 +0200, Luca Ceresoli wrote:
> Buildroot currently ships a very minimal build configuration file for exim,
> which disables most optional features. This is not coherent with the runtime
> configuration file, taken verbatim from the exim distribution, which enables
> some of these features.
> 
> The visible symptom is an error during boot that prevents exim from starting:
> 
>   Exim configuration error in line 541 of /etc/exim/configure:
>     router dnslookup: cannot find router driver "dnslookup"
> 
> In order to fix this problem, we change the way exim is configured at build
> time. Instead of blindly copying a minimal Buildroot-provided configuration
> file, we now copy the exim-provided one and then tweak it to change the needed
> options. This actually makes the configuration closer to standard exim.
> As the amount of tweaking is remarkable, we also define a few macros to make
> it easier and more readable.
> 
> This new approach was suggested by Bernd Kuhls.
> 
> Reported-By: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
