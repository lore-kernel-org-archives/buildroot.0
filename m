From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 23:30:23 +0100
Subject: [Buildroot] [PATCH] qt: depends on BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <56CCDAF1.9070209@zacarias.com.ar>
References: <1456246089-19346-1-git-send-email-gustavo@zacarias.com.ar>
 <20160223222219.24b95205@free-electrons.com>
 <56CCDAF1.9070209@zacarias.com.ar>
Message-ID: <20160223233023.6b376939@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Feb 2016 19:19:29 -0300, Gustavo Zacarias wrote:

> It's possible, however how likely is it an arch that doesn't support 
> atomics (normally meaning very old) running a QT gui?

The specific config I tested had the GUI support disabled, i.e just
QtCore, not QtGui.

Though I agree with you that generally speaking, usage on SPARC is
unlikely. But by narrowing the dependency to just script and/or webkit,
we have to propagate it to a lot less packages, which actually means
that supporting this weird SPARC architecture creates less noise, which
is what we want.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
