From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 23 Oct 2019 22:20:20 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-docker: bump to version
 4.1.0
In-Reply-To: <87d0en79n7.fsf@dell.be.48ers.dk>
References: <20191021134031.20586-1-asafka7@gmail.com>
 <20191021134031.20586-3-asafka7@gmail.com>
 <87d0en79n7.fsf@dell.be.48ers.dk>
Message-ID: <CALFsTFXWkm00V-btf=o8GDjqxV7r-4pNzTH6xP91AqkNDSVUWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Oct 23, 2019 at 6:40 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:
>
>  > python-docker-pycreds is no longer needed as a dependency.
>  > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>  > ---
>  >  package/python-docker/Config.in          | 1 -
>  >  package/python-docker/python-docker.hash | 7 ++++---
>  >  package/python-docker/python-docker.mk   | 4 ++--
>  >  3 files changed, 6 insertions(+), 6 deletions(-)
>
>  > diff --git a/package/python-docker/Config.in b/package/python-docker/Config.in
>  > index 35f7666f19..df5e4887f4 100644
>  > --- a/package/python-docker/Config.in
>  > +++ b/package/python-docker/Config.in
>  > @@ -8,7 +8,6 @@ config BR2_PACKAGE_PYTHON_DOCKER
>  >      select BR2_PACKAGE_PYTHON_REQUESTS # runtime
>  >      select BR2_PACKAGE_PYTHON_SIX # runtime
>  >      select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
>  > -    select BR2_PACKAGE_PYTHON_DOCKER_PYCREDS # runtime
>  >      help
>  >        A Python library for the Docker Engine API.
>
>  > diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
>  > index 37fda94f0b..0006a8a7da 100644
>  > --- a/package/python-docker/python-docker.hash
>  > +++ b/package/python-docker/python-docker.hash
>  > @@ -1,4 +1,5 @@
>  > -# md5 and sha256 from https://pypi.python.org/pypi/docker/json
>  > -md5 496237b9e0826eff8436b1a786943a86  docker-3.5.1.tar.gz
>  > -sha256      fbe82af9b94ccced752527c8de07fa20267f9634b48674ba478a0bb4000a0b1e  docker-3.5.1.tar.gz
>  > +# md5, sha256 from https://pypi.org/pypi/docker/json
>  > +md5 e1e8dc73e3220fe9eec1faf80b0290de  docker-4.1.0.tar.gz
>  > +sha256      6e06c5e70ba4fad73e35f00c55a895a448398f3ada7faae072e2bb01348bafc1  docker-4.1.0.tar.gz
>  > +# Locally computed sha256 checksums
>  >  sha256      f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
>  > diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
>  > index 01ae2da9be..67cb150b48 100644
>  > --- a/package/python-docker/python-docker.mk
>  > +++ b/package/python-docker/python-docker.mk
>  > @@ -4,9 +4,9 @@
>  >  #
>  >  ################################################################################
>
>  > -PYTHON_DOCKER_VERSION = 3.5.1
>  > +PYTHON_DOCKER_VERSION = 4.1.0
>
> This will require a corresponding bump of docker-compose, as it is quite
> strict about its dependencies. From setup.py:
>
> install_requires = [
>     ..
>     'docker >= 3.1.4, < 4.0',
>
> Will you send a version bump for docker-compose as well? We have a
> runtime test for it.

Actually, now I see the even the latest docker-compose version (1.24.1) requires
docker < 4.0...
Maybe we should take an rc-version that support it (1.25.0-rc2)?

>
> --
> Bye, Peter Korsgaard

Regards,
Asaf.
