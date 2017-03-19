From: daggs <daggs@gmx.com>
Date: Sun, 19 Mar 2017 09:10:05 +0100
Subject: [Buildroot] [PATCH 1/2] odroid-mali: fix broken headers.
In-Reply-To: <20170315110141.332ee46b@free-electrons.com>
References: <20170313090834.13715-1-daggs@gmx.com>
 <20170313133345.36d712f4@free-electrons.com>
 <trinity-929fc1a7-02df-4b8f-b623-1a623d2a9f58-1489414620167@3capp-mailcom-bs04>
 <20170314225427.390c43ce@free-electrons.com>
 <trinity-fe2675f8-6575-4221-b2c0-58c922f95d24-1489559834487@3capp-mailcom-bs10>
 <20170315091241.40a1a396@free-electrons.com>
 <trinity-01731c2c-041f-4f4a-9d1e-ab9463ddbd61-1489571560099@3capp-mailcom-bs08>,
 <20170315110141.332ee46b@free-electrons.com>
Message-ID: <trinity-31a9d6e0-5836-4ca5-b1c7-2ba16255609d-1489911005153@3capp-mailcom-bs11>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Hello,
> 
> On Wed, 15 Mar 2017 10:52:40 +0100, daggs wrote:
> 
> > I think I understand, if no xlib was selected, the pc files should MESA_EGL_NO_X11_HEADERS should be defined, correct?
> 
> Yes, that's one way to fix it, but:
> 
>  * It is strange for odroid-mali headers to look at a MESA_xyz
>    definition. It smells like mesa headers were copy/pasted into
>    odroid-mali.
> 
>  * This will only work for packages that look at the .pc files.
>    Hopefully, this should be the majority, and we can fix the few
>    packages that don't use .pc files to find the OpenGLES/EGL libraries.
> 
> Thomas

a question, does the latest gl related patch to libepoxy is relevant for this issue? if so, can you comment on how?

Thanks,

Dagg.
