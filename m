From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Feb 2015 14:29:38 +0100
Subject: [Buildroot] getting X running
In-Reply-To: <C860A811EEF34E4793E67D45FD390387@JohanW7>
References: <C860A811EEF34E4793E67D45FD390387@JohanW7>
Message-ID: <20150210142938.3d715c88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Tue, 10 Feb 2015 11:43:21 +0100, Sagaert Johan wrote:

> Not sure if X11 can run with uclibc, I enabled everything but when I try te run X and inspect the log.
> I found : [2048840.110] (EE) systemd-logind: failed to get session: The name org.freedesktop.login1 was not provided by any .service
> files
> 
> If systemd is required, then I am at a dead end with uclibc, since systemd requires (e)glibc.

I don't think systemd is required to run the X server. However, maybe
some more --disable-<something> options are needed when building the X
server, I don't know.

But anyway, if you are using the X.org (which is a big thing), then
moving from uClibc to eglibc should not be a problem, as the size
difference between uClibc and eglibc is insignificant compared to the
size of the X.org stack (and Webkit, that you mention below).

> So if was wondering if I have to stop trying X running with uclibc, or if this indeed could work.
> My final target is running a webkit based app. showing some html5 pages.

What about giving up on X.org and instead use a Qt/Webkit application,
using the framebuffer Qt implementation?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
