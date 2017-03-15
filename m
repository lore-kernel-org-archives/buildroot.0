From: daggs <daggs@gmx.com>
Date: Wed, 15 Mar 2017 10:52:40 +0100
Subject: [Buildroot] [PATCH 1/2] odroid-mali: fix broken headers.
In-Reply-To: <20170315091241.40a1a396@free-electrons.com>
References: <20170313090834.13715-1-daggs@gmx.com>
 <20170313133345.36d712f4@free-electrons.com>
 <trinity-929fc1a7-02df-4b8f-b623-1a623d2a9f58-1489414620167@3capp-mailcom-bs04>
 <20170314225427.390c43ce@free-electrons.com>
 <trinity-fe2675f8-6575-4221-b2c0-58c922f95d24-1489559834487@3capp-mailcom-bs10>,
 <20170315091241.40a1a396@free-electrons.com>
Message-ID: <trinity-01731c2c-041f-4f4a-9d1e-ab9463ddbd61-1489571560099@3capp-mailcom-bs08>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

>
> Hello,
> 
> On Wed, 15 Mar 2017 07:37:14 +0100, daggs wrote:
> 
> > not sure I follow, I was able to compile libepoxy with odroid-mali without any problem, what issue have you encountered?
> 
> Exactly the issue you mentioned in your e-mail: "the above will fail
> libepoxy on Xlib.h no such file or directory found".
> 
> You solved it by enabling X11, but this is wrong. When you're doing
> OpenGL ES + EGL, you don't necessarily need X11, so it shouldn't be
> necessary to enable X11.
> 
> Best regards,
> 
> Thomas

I think I understand, if no xlib was selected, the pc files should MESA_EGL_NO_X11_HEADERS should be defined, correct?

Thanks,

Dagg.
