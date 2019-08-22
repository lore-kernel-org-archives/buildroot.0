From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 22 Aug 2019 10:38:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-08-21
In-Reply-To: <20190822061626.62EE3875C7@whitealder.osuosl.org>
References: <20190822061626.62EE3875C7@whitealder.osuosl.org>
Message-ID: <0e6caa95-9ae8-544e-9d1d-c5b2f41cdaa3@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22.08.19 08:16, Thomas Petazzoni wrote:
>    aarch64    |         host-go-1.12.9         | NOK | http://autobuild.buildroot.net/results/8e307b75079eb1f041c9a009b2c3a02bea9acb60 |
>    mips64el   |         host-go-1.12.9         | NOK | http://autobuild.buildroot.net/results/04de34b1f9fa9e68b3c13354133e542da7dcdce7 |
Hi,
My VPS has a (seemingly) new limit on processes spawned, as it is shared 
with other VPS on a system. I already tried to cut existing processes 
down in favour of the autobuilder, but it doesn't work for host-go.
When it says in the log:
> runtime: failed to create new OS thread (have 7 already; errno=11)
> runtime: may need to increase max user processes (ulimit -u)
> fatal error: newosproc
It looks like it was about to spawn its 8th thread, and I am pretty sure 
that it could have spawned 50 more threads in that very moment, so the 
number 7 here is confusing.

Anyway, is there a way to blacklist host-go on my instance?
Or should I retire that instance? Can we keep the credentials active in 
that case, so I instantly fire up a new autobuilder as soon as I have a 
new server without that problem to run it on?
