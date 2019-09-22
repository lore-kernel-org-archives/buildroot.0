From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Sep 2019 20:22:42 +0200
Subject: [Buildroot] [All Systems Go!] Buildroot : Using embedded tools
 to build container images
In-Reply-To: <f8bc8621-31de-e542-657e-575fbaa2d48c@mind.be> (Arnout
 Vandecappelle's message of "Sun, 22 Sep 2019 16:58:26 +0200")
References: <8c2d3dbb-8f85-7f1d-c82b-65f0573a7c76@smile.fr>
 <CAB0FRstSC9J9t90KH=NUA54Z9Ob=HysDUjNpvaE_-KSEmQtCYw@mail.gmail.com>
 <f8bc8621-31de-e542-657e-575fbaa2d48c@mind.be>
Message-ID: <87y2ygw5ql.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Does this also work if the tarball is cross-compiled for a different
 > architecture? Probably it does, and it just SIGILLs when you try to run the
 > container...

Yes. Even easier is just

docker import output/images/rootfs.tar <myproject:mytag>

 >  Yeah, except unfortunately docker security sucks, so on most distros you need
 > sudo to run any docker command, even 'docker build'.

 >  So, it would be nice if we could generate the OCI image without docker.

I believe you can do similar with E.G. buildah:

https://github.com/containers/buildah

But you anyway need buildah/docker/.. to then finally do something with
the docker image afterwards, so perhaps just documenting the 'docker
import' oneliner is enough and not try to do it Buildroot.

-- 
Bye, Peter Korsgaard
