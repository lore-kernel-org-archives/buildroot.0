From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 22:05:12 +0200
Subject: [Buildroot] [PATCH v2] package/sunxi-mali: fix conflicting data
 types between GLES2/gl2.h and GLES/gl.h
In-Reply-To: <20170605154518.20805-1-romain.naour@gmail.com>
References: <20170605154518.20805-1-romain.naour@gmail.com>
Message-ID: <20170608220512.39795faa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 17:45:18 +0200, Romain Naour wrote:
> When OpenGL ES 1.1 and OpenGL ES 2.0 are used at the same time, the
> build fail since GLintptr and GLsizeiptr data type are not the same in
> GLES2/gl2.h and GLES/gl.h.
> 
> Also sync the data type of GLbyte, GLubyte, GLfloat, GLclampf and
> GLfixed.
> 
> Fixes:
> http://autobuild.buildroot.net/results/258/25898b45cefde9661d8ac87dd84bc883bb5283d1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Spenser Gilliland <spenser@gillilanding.com>
> ---
> v2: fix a typo in title
>     Also change all remaining data type (Thomas)
> ---
>  ...ting-data-types-between-GLES2-gl2.h-and-G.patch | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/sunxi-mali/0003-fix-conflicting-data-types-between-GLES2-gl2.h-and-G.patch

Applied to master, thanks. Please submit upstream, it's easy, just open
a pull request on the github project.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
