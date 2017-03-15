From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Mar 2017 09:12:41 +0100
Subject: [Buildroot] [PATCH 1/2] odroid-mali: fix broken headers.
In-Reply-To: <trinity-fe2675f8-6575-4221-b2c0-58c922f95d24-1489559834487@3capp-mailcom-bs10>
References: <20170313090834.13715-1-daggs@gmx.com>
 <20170313133345.36d712f4@free-electrons.com>
 <trinity-929fc1a7-02df-4b8f-b623-1a623d2a9f58-1489414620167@3capp-mailcom-bs04>
 <20170314225427.390c43ce@free-electrons.com>
 <trinity-fe2675f8-6575-4221-b2c0-58c922f95d24-1489559834487@3capp-mailcom-bs10>
Message-ID: <20170315091241.40a1a396@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Mar 2017 07:37:14 +0100, daggs wrote:

> not sure I follow, I was able to compile libepoxy with odroid-mali without any problem, what issue have you encountered?

Exactly the issue you mentioned in your e-mail: "the above will fail
libepoxy on Xlib.h no such file or directory found".

You solved it by enabling X11, but this is wrong. When you're doing
OpenGL ES + EGL, you don't necessarily need X11, so it shouldn't be
necessary to enable X11.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
