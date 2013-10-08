From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 09:11:39 +0200
Subject: [Buildroot] [PATCH 1/1] ccache: expose control interface via
 'make ccache-options'
In-Reply-To: <CAEvN+1iBLh_Kr25EQTJPXn2-hh2KdeGQ1nhagT3haHMB=Jx1-A@mail.gmail.com>
References: <1339991408-25620-1-git-send-email-tjlee@ambarella.com>
 <CAEvN+1jCAvFYsOkbv4Rf4g7YqZJe4Ty9cwpFMiAUTTAvh7mvQg@mail.gmail.com>
 <CAEvN+1iBLh_Kr25EQTJPXn2-hh2KdeGQ1nhagT3haHMB=Jx1-A@mail.gmail.com>
Message-ID: <20131008091139.657596a9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tzu-Jung Lee,

On Mon, 7 Oct 2013 15:09:34 -0700, Tzu-Jung Lee wrote:
> # Response to patchwork cleanup of week #1
> 
> This patch provides an easy way to operate on buildroot ccache such as
> changing the cache limit or showing statistics.
> 
> Without it, users would have to explicitly specify both the environment variable
> and the path of patched ccache, for example:
> 
>   BUILDROOT_CACHE_DIR=~/.buildroot-ccache/ $PWD/host/usr/bin/ccache -s

Well, in the case of just passing "-s", we already have the
ccache-stats target.

But I agree that for all other options, adding another
ccache-<something> target would be impractical, so probably your
proposal of CCACHE_OPTIONS makes sense.

Can you respin your patch on top of the latest master, and add an
update to the manual (we already have a section about ccache support,
see http://buildroot.org/downloads/manual/manual.html#ccache).

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
