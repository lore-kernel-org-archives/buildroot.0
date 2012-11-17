From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 17 Nov 2012 17:21:37 -0300
Subject: [Buildroot] [PATCH] host-lua: fix bug #5354
In-Reply-To: <871ufst34m.fsf@dell.be.48ers.dk>
References: <1353146744-13529-1-git-send-email-francois.perrad@gadz.org>
 <87boewt3hv.fsf@dell.be.48ers.dk> <871ufst34m.fsf@dell.be.48ers.dk>
Message-ID: <50A7F1D1.9060405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/17/2012 04:56 PM, Peter Korsgaard wrote:

> Ahh, I see it now - It's because we're passing -nostdlib -lgcc when
> creating the shared library. Why are we doing that in the first place?
> 
> Gustavo, it seems to date back to 46913a2d4. Do you have any idea why it
> was done like that?

https://bugs.busybox.net/show_bug.cgi?id=803 has rvpaasen's work, i just
reworked it IIRC.
OpenWRT doesn't try to link to libgcc or ditch the standard startup and
libraries, it's worth a try to kill that bit.
Regards.
