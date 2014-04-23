From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 Apr 2014 10:49:06 -0300
Subject: [Buildroot] [PATCH] acpid: bump to version 2.0.22
In-Reply-To: <20140423154107.533098a6@skate>
References: <1398201933-6022-1-git-send-email-gustavo@zacarias.com.ar>
 <20140423154107.533098a6@skate>
Message-ID: <5357C4D2.40108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/2014 10:41 AM, Thomas Petazzoni wrote:

> Looks like some kernel headers issue is affecting the acpid build:
> http://autobuild.buildroot.org/results/6d4/6d471942788fa05f324649ab15e6ca382e46df9c/build-end.log.

The usual problem of external uClibc toolchains (you could call it lack
of uClibc releases as well).
We can exclude the package from being available with external uClibc
toolchains or hack a fix like in
55ad3cfd3f9809f4a1f0210fe7c7110d147c54f6
Personally i'd just exclude, we are talking an x86-only package which
tends to be desktopish.
Regards.
