From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Feb 2018 11:04:44 +0100
Subject: [Buildroot] [PATCH] support/dockerfile: add directives to run
 as non-root
In-Reply-To: <87bmh521a5.fsf@dell.be.48ers.dk>
References: <20180106152833.10111-1-yann.morin.1998@free.fr>
 <87bmh521a5.fsf@dell.be.48ers.dk>
Message-ID: <20180204100444.GB2411@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-02-03 22:47 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
[--SNIP--]
>  > diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
>  > index d45b23dc23..ebb471f7e5 100644
>  > --- a/support/docker/Dockerfile
>  > +++ b/support/docker/Dockerfile
>  > @@ -28,3 +28,10 @@ RUN apt-get -q -y clean
>  >  RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
>  >  RUN /usr/sbin/locale-gen
>  
>  > +RUN useradd -ms /bin/bash br-user
>  > +RUN chown -R br-user:br-user /home/br-user
> 
> I don't know much about Docker, but I was of the understanding that each
> run statement creates a new layer and the number of layers should be
> minimized, which is why you normally see stuff like:
> 
> RUN foo && \
>     bar && \
>     foz && \
>     baz

Well, I am no docker expert either, and I just mimicked whatever the
file already looked like, as you can see for the previous two lines...

> E.G. from the official documentation:
> https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#minimize-the-number-of-layers

It's always time for a docker expert to send a fixup patch, eh! ;-)
Or I can have a look if I again get bored not to be in BRU... ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
