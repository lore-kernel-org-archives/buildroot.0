From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 6 Dec 2012 06:28:15 -0500
Subject: [Buildroot] [PATCH] pkg-download.mk: Fix shallow clone
In-Reply-To: <50C07A7A.2070204@relinux.de>
References: <1354445767-15308-1-git-send-email-sho@relinux.de>
 <8738zo7835.fsf@dell.be.48ers.dk>
 <CANxTyt74ytgBNHb8koKuVTjei5sQP2FpUrwawMuG17=fAK3bXw@mail.gmail.com>
 <50C0432E.2080005@mind.be> <50C07A7A.2070204@relinux.de>
Message-ID: <CANxTyt6m=0FqHKwcDsk-oxyHPRcuxQOXPOj2raQUKvpGBtTKSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout - thanks for the feedback.
Stephan - thanks for looking into the the --exit-status on older gits.

Since the --exit-status isn't universally available, maybe the simplest
thing to do is to add quotes, and drop the "cut" and "grep":

 ((test "`git ls-remote $($(PKG)_SITE) $($(PKG)_DL_VERSION)`" && \

Assume no objections or better ideas come in, I'll send in a patch tonight.

Thanks,
Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121206/651c3a47/attachment.html>
