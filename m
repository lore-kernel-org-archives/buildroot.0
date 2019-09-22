From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 22 Sep 2019 15:13:35 +0200
Subject: [Buildroot] [All Systems Go!] Buildroot : Using embedded tools
 to build container images
In-Reply-To: <8c2d3dbb-8f85-7f1d-c82b-65f0573a7c76@smile.fr>
References: <8c2d3dbb-8f85-7f1d-c82b-65f0573a7c76@smile.fr>
Message-ID: <CAB0FRstSC9J9t90KH=NUA54Z9Ob=HysDUjNpvaE_-KSEmQtCYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 21 sept. 2019 ? 21:53, Romain Naour <romain.naour@smile.fr> a
?crit :

> Hello,
>
> My colleague Jeremy Rosen did a presentation at All Systems Go conferences
> about
> building container images using Buildroot:
>
> https://www.youtube.com/watch?v=-CVuBLDpulo
>
> It would be interesting to discuss with the community about building such
> container images like light container or systemd's portable services.
>
> It's probably a topic for the next Buildroot Meeting :)
>
>
It seems easy to create a Docker image artifact from a rootfs created by
Buildroot

    $ cat Dockerfile
    FROM scratch
    ADD rootfs.tar /

    $ docker build --tag br:my_proj .
    Sending build context to Docker daemon  4.233MB
    Step 1/2 : FROM scratch
     --->
    Step 2/2 : ADD rootfs.tar /
     ---> 60cb2207066c
    Successfully built 60cb2207066c
    Successfully tagged br:my_proj

    $ docker images
    REPOSITORY          TAG                 IMAGE ID            CREATED
        SIZE
    br                  my_proj             60cb2207066c         2 minutes
ago      1.74MB

    $ docker save -o br_my_proj.tar br:my_proj
    $ ls -1
    br_my_proj.tar
    Dockerfile
    rootfs.tar

But, it could be nice to add "Docker image" as an option in "Filesystem
images" choice.

Fran?ois


> Best regards,
> Romain
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190922/2eac69fa/attachment.html>
