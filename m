From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Apr 2010 09:14:52 +0200
Subject: [Buildroot] [PATCH 07/19] freetype: disable autoreconf
In-Reply-To: <4BD9EA14.20403@gmail.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
	<8f7798bec30f2e0fbc7896018a70d8de542cd4f9.1272490771.git.thomas.petazzoni@free-electrons.com>
	<4BD9EA14.20403@gmail.com>
Message-ID: <20100430091452.3ec5ff5b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Apr 2010 23:20:36 +0300
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> > FREETYPE_LIBTOOL_PATCH = NO +FREETYPE_AUTORECONF = NO
> 
> It is disabled by default... Do we need to explicitly specify it?

In fact, in this patch set, I had a patch that made autoreconf enabled
by default. This is necessary for external toolchains to work properly
(otherwise libtool does stupid things and links against host
libraries). But I finally decided not to send such a change now, as I
wanted to do some more testing around it.

So, you're right, this patch is not strictly needed today.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
