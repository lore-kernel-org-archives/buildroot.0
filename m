From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jun 2010 21:18:39 +0200
Subject: [Buildroot] [git commit master] Revert "Add -rpath option for
 host package compilation"
In-Reply-To: <87pr0ar3np.fsf@macbook.be.48ers.dk>
References: <20100530084318.C8A0EC03A6@busybox.osuosl.org>
	<20100601195204.6353fe94@surf> <87pr0ar3np.fsf@macbook.be.48ers.dk>
Message-ID: <20100601211839.4b8e06b2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 01 Jun 2010 20:47:22 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> find $(HOST_DIR)/bin $(HOST_DIR)/usr/bin
>  Thomas> $(HOST_DIR)/usr/sbin $(HOST_DIR)/sbin -type f -perm +111
>  Thomas> -exec $(HOST_DIR)/usr/bin/patchelf --set-rpath
>  Thomas> $(HOST_DIR)/usr/lib {} \; >/dev/null 2>&1 || true
> 
>  Thomas> Would this sort of solution be acceptable ?
> 
> I wouldn't exactly call it pretty, but if we don't have any other
> options ..

I don't find this pretty either, but what other options do you see ?
I'm ready to try other approaches.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
