From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 18:48:59 +0200
Subject: [Buildroot] git clone https://git.busybox.net/buildroot works
 unexpectedly slow
In-Reply-To: <4881796E12491D4BB15146FE0209CE6467FA4405@DE02WEMBXB.internal.synopsys.com>
References: <4881796E12491D4BB15146FE0209CE6467FA4405@DE02WEMBXB.internal.synopsys.com>
Message-ID: <6f6b1cf9-32ec-b403-6d0d-26bd5372aa4a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 12:26, Alexey Brodkin wrote:
> Hi,
> 
> Probably that's just me but could anyone please try if access to BR git repo via HTTPS
> really works OK?
> --------------------------------->8-------------------------------
> $ time git clone https://git.busybox.net/buildroot
> Cloning into 'buildroot'...
> Checking connectivity... done.
> Checking out files: 100% (9694/9694), done.
> 
> real    15m59.868s
> user    1m56.969s
> sys     5m16.609s
> 
> $ time git clone https://git.busybox.net/buildroot
> Cloning into 'buildroot'...
> error: Unable to find ba0bf240915229e94c0565b833be6ac273a4776d under https://git.busybox.net/buildroot
> Cannot obtain needed blob ba0bf240915229e94c0565b833be6ac273a4776d
> while processing commit 6bb75e43a42cddfa0a9e6e001d8d0224f124a64a.
> error: Fetch failed.
> 
> real    8m8.317s
> user    0m0.000s
> sys     0m5.391s
> --------------------------------->8-------------------------------
> 
> Note, via git it works as expected.

 So, the same problem as Romain and Yann detected for glibc? What's happening, a
global attack on git https?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
