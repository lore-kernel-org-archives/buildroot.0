From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 May 2021 22:31:05 +0200
Subject: [Buildroot] [PATCH v1 3/3] package/genuinetools-img: new host
 and target package
In-Reply-To: <CA+h8R2oJ8b48NdAOMLtKhAyV-KUp4uvHuyZ1eF8jDX_rw=WNrw@mail.gmail.com>
References: <20210503023305.161122-1-christian@paral.in>
 <20210503023305.161122-3-christian@paral.in>
 <CA+h8R2oJ8b48NdAOMLtKhAyV-KUp4uvHuyZ1eF8jDX_rw=WNrw@mail.gmail.com>
Message-ID: <20210504203105.GR2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2021-05-02 19:45 -0700, Christian Stewart spake thusly:
> On Sun, May 2, 2021 at 7:33 PM Christian Stewart <christian@paral.in> wrote:
> >
> > Img is a standalone, daemon-less, unprivileged Dockerfile and OCI compatible
> > container image builder. It uses the moby-buildkit solver internally. The
> > commands/UX mirror the Docker CLI for workflow compatibility.
> >
> > Using the genuinetools- prefix due to the generic nature of the "img" name.
> >
> > Adds both host and target variants. fuse-overlayfs can be used as an
> > unprivileged and rootless overlay filesystem backend.
> >
> > https://github.com/genuinetools/img
> 
> The intent here is to eventually add some kind of "download" target to
> Buildroot for downloading & verifying container images as .tar.gz
> files from container registries using the genuinetools-img tool - it
> can "pull" and "save" using an unprivileged cache directory.
> 
> I'm not sure the best way to do this / if there is any appetite for
> adding a pkg helper for this, thoughts?

Im not usre I understood that, but basically one would write:

    HELLO_WORLD_VERSION = 1.2.3
    HELLO_WORLD_SOURCE = hello-world:1.2.3
    HELLO_WORLD_SITE = dockerhub.com/u/hello

    $(eval $(oci-image-package))

And that would download the hello-world:1.2.3 image from dockerhub and
install that as a OCI image in the target filesystem, so that at runtime
one could do (on the CLI, in an init script, in a systemd unit, etc...):
    docker run hello-world:1.2.3 /bin/hello-world

Something like that?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
