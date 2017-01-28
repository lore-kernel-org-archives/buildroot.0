From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Fri, 27 Jan 2017 19:59:45 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-01-26
In-Reply-To: <20170128151701.52fb05ed@free-electrons.com>
References: <20170127073003.CA12320D83@mail.free-electrons.com>
 <20170127215534.GC3430@free.fr> <87y3xw9mr5.fsf@dell.be.48ers.dk>
 <20170128151701.52fb05ed@free-electrons.com>
Message-ID: <CAGrGpJA063YzCXrDBwjs+MB4XXCUxekhVci7iXL2CpDKpO+EEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just got a note from Sam Lantinga and he says SDL_ttf should now work.
Below is the essence of the gmail chat explaining what Sam is doing to
SDL_ttf.

Hopefully we are done!

Peter



Do you have a minute to chat?

Hi Sam - Peter Thompson here

Hi
Got a sec?

yep - I'm available

So I remember why it's set up the way it is....
SDL_opengl.h is a cross-platform way to include OpenGL headers.
Regardless of whether SDL itself is built with OpenGL
So, currently, SDL_ttf will always think there's OpenGL support available.

Can SDL_ttf  work without OpenGL?

Yes
This is just for building the examples. One of them is an OpenGL example.
I think I just need to add an OpenGL function in there, and that will fail
to compile if OpenGL libraries aren't avaialble.

Just a suggestion... remove the OpenGL requirement and document the
examples as needing OpenGL libraries.... very simple idea...

It's already that way.
There's just no way to build without also building the examples right now.
That's fine, we just need configure to be smarter about detecting OpenGL.
If it's not available, we don't want to build the OpenGL example.

If we add  the OpenGL function, you suggest,will SDL2_ttf still compile and
link ok?

Yes
My original question was going to be what happens in the buildroot, but I
see your e-mail includes build logs, so I'm all set there.
I'll let you know when it's pushed, thanks!

Great - thanks so much Sam.    I am not a real expert in Buildroot.
Thomas is the best contact for that.

No worries. ?
Fixed!
https://hg.libsdl.org/SDL_ttf/rev/3b93536d291a
<https://www.google.com/url?q=https%3A%2F%2Fhg.libsdl.org%2FSDL_ttf%2Frev%2F3b93536d291a&sa=D&sntz=1&usg=AFQjCNGTNheAAz4ngLVwnW90fgaKmD3OWQ>


Thanks so much for such a fast response.



On Fri, Jan 27, 2017 at 7:17 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Fri, 27 Jan 2017 23:11:26 +0100, Peter Korsgaard wrote:
>
> > I don't really know much about SDL2, but how about deleting SDL_opengl.h
> > as a sdl2 post-target-install step? (or rather, get upstream to fix it
> > so it doesn't get installed in the first place, but this can be a
> > solution for now).
>
> Romain already had a look at this issue, and proposed a patch for
> SDL2_ttf: https://patchwork.ozlabs.org/patch/709443/.
>
> However, reviewing Romain's proposal, I wondered if it really made
> sense for SDL2 to install SDL_opengl.h when OpenGL support is not
> enabled. This is what SDL2 used to do in the past, and upstream changed
> this for some reason.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170127/67ba2f12/attachment.html>
