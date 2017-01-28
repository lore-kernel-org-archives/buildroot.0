From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Fri, 27 Jan 2017 18:20:32 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-01-26
In-Reply-To: <87y3xw9mr5.fsf@dell.be.48ers.dk>
References: <20170127073003.CA12320D83@mail.free-electrons.com>
 <20170127215534.GC3430@free.fr> <87y3xw9mr5.fsf@dell.be.48ers.dk>
Message-ID: <CAGrGpJAGqD1zOJYUcPqGGjt6rEgO-XttKh3XjtU5eb1oikvbbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I forwarded the issue to Sam Lantinga, author of SDL, and just got this
note back.   Assuming he is reasonably prompt, I suggest waiting till he
fixes SDL_ttf.

Peter

Sam Lantinga
6:06 PM (13 minutes ago)
to me
I'll fix SDL_ttf so it's smarter about OpenGL detection




On Fri, Jan 27, 2017 at 3:11 PM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
> Hi,
>
>  > So... Those are due to a stupdity in both the sdl2 install procedure and
>  > the sdl2_ttf configure:
>
>  >   - sdl2 will always install all its headers, even those for features
>  >     that are disabled, like SDL_opengl.h et al.;
>
>  >   - sdl_ttf will try to compile (not link) a program that includes
>  >     SDL_opengl.h and concludes that GL support is enabled;
>
>  >   - sdl2_ttf will then build and try to link with -lGL.
>
>  > Bummer.
>
>  > Cc-ing Guillaume and Peter. Any idea? ;-)
>
> I don't really know much about SDL2, but how about deleting SDL_opengl.h
> as a sdl2 post-target-install step? (or rather, get upstream to fix it
> so it doesn't get installed in the first place, but this can be a
> solution for now).
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170127/8a1fd566/attachment.html>
