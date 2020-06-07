From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Jun 2020 10:53:15 +0200
Subject: [Buildroot] [PATCH] package/libxml-parser-perl: make host build
 use correct compiler
In-Reply-To: <CADYdroM-KRu5foedcafU8WogfgEJCmMQbk5XYgMv2dDrkf2y7g@mail.gmail.com>
References: <20200605225812.13944-1-nolange79@gmail.com>
 <20200606220456.12fed0b1@windsurf>
 <CADYdroM-KRu5foedcafU8WogfgEJCmMQbk5XYgMv2dDrkf2y7g@mail.gmail.com>
Message-ID: <20200607105315.5488ddf4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 7 Jun 2020 00:29:59 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> > How is it possible for the host and target compilers to have the same
> > file name ?  
> 
> I use crosstool for a x86_64 target compiler, same architecture as my
> desktop pc.

That is still weird: the native compiler on your system is normally
called "gcc", while the compiler in your toolchain is generally named
x86_64-linux-gcc or some variation on that.

Even though your patch is definitely correct, I'd like to understand
how you fall into this situation. Indeed, I'm pretty sure several other
host packages might be affected, and if this is a valid situation, we
should see if there's a way to test it in our autobuilders.

> On an not entirely unrelated note, I got troubles getting into patchwork,
> did reset my PW 2-3 time, still can't log in. Is there some hidden 8
> letter limit or similar?

I don't think there is such a limitation. This patchwork instance is
not always super stable, yesterday we had 500 errors for a few moments
for example. If you have issues, we can contact the admins of the
instance and see if they can have a look.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
