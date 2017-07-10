From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 23:27:35 +0200
Subject: [Buildroot] [PATCH 6/7] Makefile: add check that
 $(HOST_DIR)/usr is not a directory
In-Reply-To: <3a401955-07d9-054c-61a4-c91871ae1257@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
 <20170709232123.30120-7-arnout@mind.be>
 <20170710180240.43215e1a@windsurf.lan>
 <20170710161238.GA3014@scaer>
 <3a401955-07d9-054c-61a4-c91871ae1257@mind.be>
Message-ID: <20170710232735.0844286e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 21:51:50 +0200, Arnout Vandecappelle wrote:

>  Actually, I realize now: when people do a git pull, we expect them to do "make
> clean all" afterwards. And "make clean" will delete HOST_DIR - so no
> HOST_DIR/usr will exist anymore.
> 
>  So the original report from Thomas only happened because Thomas didn't do a
> "make clean" like he should have...

Not correct, each time my output directory and host directories were
empty. The only thing that was different is that the host directory is
not set to the default of $(BASE_DIR)/host, but to /opt/something, and
this /opt/something is created (empty) before I start the build.

So my build was perfectly clean, it is just that I created the host
directory prior to starting the build, which IMO isn't crazy,
especially when such host directory was customized in the Buildroot
configuration.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
