From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Sep 2013 09:02:58 +0200
Subject: [Buildroot] [PATCHv2 2/4] kmod: allow to build a host variant
In-Reply-To: <87zjru7sgm.fsf@dell.be.48ers.dk>
References: <1377624514-10510-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1377624514-10510-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <87fvtn7xgj.fsf@dell.be.48ers.dk> <20130902234844.5e078d47@skate>
 <87zjru7sgm.fsf@dell.be.48ers.dk>
Message-ID: <20130903090258.6ee33baf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 03 Sep 2013 00:46:01 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  >> We also need to set HOST_KMOD_AUTORECONF = YES because of the
>  >> configure.ac patch (arguably we should default HOST_<pkg>_AUTORECONF =
>  >> <pkg>_AUTORECONF).
> 
>  Thomas> Ah, yes, right. I didn't see the problem since the configure.ac patch
>  Thomas> is only to support gcc < 4.6.x on the host, which wasn't my case. But
>  Thomas> certainly useful in general indeed.
> 
> Not only that, but if you don't have (the right version of) autotools on
> your build host it also fails.

Ah, yes, right: configure.ac is newer than configure, so it tries to
automatically regenerate the configure script from configure.ac. Makes
sense, thanks for fixing it!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
