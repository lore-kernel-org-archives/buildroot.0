From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 09:52:30 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-10-14
In-Reply-To: <dccc87a9-6b91-7065-163c-9d63a0012dea@mind.be>
References: <20191015061618.6B7AD86FFF@whitealder.osuosl.org>
 <dccc87a9-6b91-7065-163c-9d63a0012dea@mind.be>
Message-ID: <20191015095230.29f955c6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 09:49:08 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 15/10/2019 08:16, Thomas Petazzoni wrote:
> >   riscv64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/e0dffee9cda981d40fc6225956a9f64f523d7fab | ORPH
> >  aarch64_be  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/fe157aa72cb12f5ad02d2760cc2ea48f72830849 | ORPH
> >   mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/00b6f58a46d289fe2d660b4c30234cf93a645c5e | ORPH
> >   aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/51be63089209d38c2cf29b0e0b08f73a0e15c467 | ORPH
> >   aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/c4ad0698db5688d1c40bb69c4b647a4671864589 | ORPH
> >   mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/1e89d26d3c3fd0ebcec8c69da72e0c41b65ca535 | ORPH  
> 
>  Does this look similar to the gperf-bump issue in libcap? I couldn't find
> autobuild failures due to it so I couldn't check easily.
> 
> src/colors.gperf:105:1: error: conflicting types for 'svgtiny_color_lookup'
>  lime,  svgtiny_RGB(  0, 255,   0)
>  ^~~~~~~~~~~~~~~~~~~~
> In file included from src/colors.gperf:18:0:
> /home/buildroot/autobuild/instance-1/output-1/build/libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06/src/svgtiny_internal.h:92:3:
> note: previous declaration of 'svgtiny_color_lookup' was here
>    svgtiny_color_lookup(register const char *str,
>    ^~~~~~~~~~~~~~~~~~~~
> 
>  The 1.7.0 release probably fixes it because the gperf-generated code is now
> included.

Fabrice already sent a patch fixing this, which I applied earlier today.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
