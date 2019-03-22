From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Mar 2019 08:48:28 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-20
In-Reply-To: <20190322045946.hpus3subzuiobdhd@vkochan-ThinkPad-T470p>
References: <20190321070043.3390386D73@whitealder.osuosl.org>
 <20190322045946.hpus3subzuiobdhd@vkochan-ThinkPad-T470p>
Message-ID: <20190322084828.20ae4592@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Fri, 22 Mar 2019 06:59:46 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:


> > Detail of failures
> > ------------------
> > 
> >         bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/97de444eae5e8baf191b05e31f07ca00558bfda8 |       
> This made me crazy until I realized that Blackfin adds "_" to all
> symbols. So, it really can be fixed (I checked) if to prepend symbols in
> libattr/libattr.lds with "_" (at least for each libattr_* symbol).

Don't bother fixing bfin issues, we dropped support for this
architecture. We should probably drop the autobuilder config fragment
in 2018.02.x as well. Or simply wait until 2018.02.x goes end-of-life
(which should happen very soon now), and stop testing 2018.02.x in the
autobuilders.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
