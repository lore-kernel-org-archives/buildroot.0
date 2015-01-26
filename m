From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Jan 2015 19:26:21 +0100
Subject: [Buildroot] [PATCH 05/14 v6] package/mesa3d-headers: new package
In-Reply-To: <1491783.fYcJCMXy9W@aquila>
References: <cover.1422055104.git.yann.morin.1998@free.fr>
 <a7d0443926fdc7741ab70b454d6c893f7c7a0b5f.1422055104.git.yann.morin.1998@free.fr>
 <1491783.fYcJCMXy9W@aquila>
Message-ID: <20150126182621.GB4228@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2015-01-26 09:54 +0100, J?r?me Pouiller spake thusly:
> On Saturday 24 January 2015 00:24:34 Yann E. MORIN wrote:
> > Some headers required to build GL/EGL/GLES/... stuff are not provided by
> > Khronos, so we must find an alternate source for those headers.
> > Currently, we're missing:
> >   - gl.h for full GL (gl.h for GLES is available from Khronos)
> >   - dri_interface.h to be able to build GL-enabled Xorg
> > 
> > mesa3d provides all of them, and they are generic enough that they can
> > be re-used even for other GL/EGL/GLES/... implementations.
> > 
> > Unfortunately, modifying mesa3d so that it only installs its headers is
> > no trivial task, and would render the mesa3d package really ugly and
> > unmaintainable in the long run.
> Did you try "make install-data" in mesa3d tree? It should install all 
> files but the libraries (in other terms, it install headers only).

I thought of doing just that, indeed.

But then, it is only possible to run 'make install-anything' if the
package had previously been configured and built, i.e. './configure' and
.make' were previously called.

But then, what flags are we supposed to pass ./configure ? We surely do
not want to enable everything, jsut what is needed to get the headers.

And then, we would have to carefuly call 'make' so that it does not
build everything, just the headers.

> > Instead, we introduce a stripped-down mesa3d-headers package, which sole
> > purpose is to install those missing headers.
> hmmm... since mesa3d-headers provide all headers, do we really need 
> khronos-registry-* packages? In add, all developers test their code 
> using mesa3d headers. So, I would prefer to use headers provided by 
> mesa3d than khronos.

Well, I'm not really against droippign the Khronos registries, since it
is not fun packaging those.

However, as I said above, we'd have to carefuly craft mesa3d-headers to
just configure and build the headers, and I'm afraid that's not so
easy...

But I can give it a shot to see how dirty/difficult it would be.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
